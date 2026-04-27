package main

import (
	"go/ast"
	"go/token"
)

func patchResponseDecoders(path string) error {
	fset, file, err := parseFile(path)
	if err != nil {
		return err
	}

	var changed bool
	for _, decl := range file.Decls {
		fn, ok := decl.(*ast.FuncDecl)
		if !ok || !isDecodeResponseFuncName(fn.Name.Name) {
			continue
		}
		if patchResponseDecoderFunc(fn) {
			changed = true
		}
	}
	if !changed {
		return nil
	}
	return writeFile(path, fset, file)
}

func patchResponseDecoderFunc(fn *ast.FuncDecl) bool {
	changed := false
	if len(fn.Type.Params.List) == 1 {
		fn.Type.Params.List = append(fn.Type.Params.List, &ast.Field{
			Names: []*ast.Ident{ast.NewIdent("debugResponse")},
			Type:  star("DebugResponse"),
		})
		changed = true
	}
	if fn.Body == nil {
		return changed
	}
	insertPos := fn.Body.Lbrace + 1
	if hasDebugResponseBodyRead(fn.Body) {
		if assign, ok := fn.Body.List[0].(*ast.AssignStmt); ok {
			assign.Rhs = []ast.Expr{debugResponseBodyReadCall(assign.Pos())}
			changed = true
		}
	} else {
		fn.Body.List = append([]ast.Stmt{
			debugResponseBodyAssignStmt(insertPos),
			debugResponseBodyErrStmt(insertPos),
		}, fn.Body.List...)
		changed = true
	}
	if patchReadAllStmtList(&fn.Body.List) {
		changed = true
	}
	return changed
}

func hasDebugResponseBodyRead(block *ast.BlockStmt) bool {
	if len(block.List) == 0 {
		return false
	}
	assign, ok := block.List[0].(*ast.AssignStmt)
	if !ok || len(assign.Lhs) != 2 || len(assign.Rhs) != 1 {
		return false
	}
	return isIdent(assign.Lhs[0], "debugResponseBody")
}

func debugResponseBodyAssignStmt(pos token.Pos) ast.Stmt {
	return &ast.AssignStmt{
		Lhs: []ast.Expr{
			&ast.Ident{NamePos: pos, Name: "debugResponseBody"},
			&ast.Ident{NamePos: pos, Name: "err"},
		},
		TokPos: pos,
		Tok:    token.DEFINE,
		Rhs:    []ast.Expr{debugResponseBodyReadCall(pos)},
	}
}

func debugResponseBodyReadCall(pos token.Pos) ast.Expr {
	return &ast.CallExpr{
		Fun:    &ast.Ident{NamePos: pos, Name: "readDebugResponseBody"},
		Lparen: pos,
		Args: []ast.Expr{
			&ast.Ident{NamePos: pos, Name: "resp"},
			&ast.Ident{NamePos: pos, Name: "debugResponse"},
		},
		Rparen: pos,
	}
}

func debugResponseBodyErrStmt(pos token.Pos) ast.Stmt {
	return &ast.IfStmt{
		If: pos,
		Cond: &ast.BinaryExpr{
			X:  &ast.Ident{NamePos: pos, Name: "err"},
			Op: token.NEQ,
			Y:  &ast.Ident{NamePos: pos, Name: "nil"},
		},
		Body: &ast.BlockStmt{List: []ast.Stmt{&ast.ReturnStmt{
			Return:  pos,
			Results: []ast.Expr{&ast.Ident{NamePos: pos, Name: "res"}, &ast.Ident{NamePos: pos, Name: "err"}},
		}}},
	}
}

func patchReadAllStmtList(list *[]ast.Stmt) bool {
	var changed bool
	stmts := *list
	for i := 0; i < len(stmts); i++ {
		if i+1 < len(stmts) && isReadAllAssign(stmts[i]) && isReadAllErrReturn(stmts[i+1]) {
			stmts[i] = &ast.AssignStmt{
				Lhs: []ast.Expr{ast.NewIdent("buf")},
				Tok: token.DEFINE,
				Rhs: []ast.Expr{ast.NewIdent("debugResponseBody")},
			}
			stmts = append(stmts[:i+1], stmts[i+2:]...)
			*list = stmts
			changed = true
			continue
		}

		if patchNestedStmt(stmts[i]) {
			changed = true
		}
	}
	return changed
}

func patchNestedStmt(stmt ast.Stmt) bool {
	switch s := stmt.(type) {
	case *ast.BlockStmt:
		return patchReadAllStmtList(&s.List)
	case *ast.IfStmt:
		changed := patchReadAllStmtList(&s.Body.List)
		if s.Else != nil {
			if elseStmt, ok := s.Else.(ast.Stmt); ok && patchNestedStmt(elseStmt) {
				changed = true
			}
		}
		return changed
	case *ast.ForStmt:
		return patchReadAllStmtList(&s.Body.List)
	case *ast.RangeStmt:
		return patchReadAllStmtList(&s.Body.List)
	case *ast.SwitchStmt:
		return patchCaseClauses(s.Body)
	case *ast.TypeSwitchStmt:
		return patchCaseClauses(s.Body)
	case *ast.SelectStmt:
		return patchCommClauses(s.Body)
	}
	var changed bool
	ast.Inspect(stmt, func(node ast.Node) bool {
		fn, ok := node.(*ast.FuncLit)
		if !ok || fn.Body == nil {
			return true
		}
		if patchReadAllStmtList(&fn.Body.List) {
			changed = true
		}
		return false
	})
	return changed
}

func patchCaseClauses(block *ast.BlockStmt) bool {
	var changed bool
	for _, stmt := range block.List {
		clause, ok := stmt.(*ast.CaseClause)
		if !ok {
			continue
		}
		if patchReadAllStmtList(&clause.Body) {
			changed = true
		}
	}
	return changed
}

func patchCommClauses(block *ast.BlockStmt) bool {
	var changed bool
	for _, stmt := range block.List {
		clause, ok := stmt.(*ast.CommClause)
		if !ok {
			continue
		}
		if patchReadAllStmtList(&clause.Body) {
			changed = true
		}
	}
	return changed
}

func isReadAllAssign(stmt ast.Stmt) bool {
	assign, ok := stmt.(*ast.AssignStmt)
	if !ok || assign.Tok != token.DEFINE || len(assign.Lhs) != 2 || len(assign.Rhs) != 1 {
		return false
	}
	if !isIdent(assign.Lhs[0], "buf") || !isIdent(assign.Lhs[1], "err") {
		return false
	}
	call, ok := assign.Rhs[0].(*ast.CallExpr)
	if !ok || len(call.Args) != 1 {
		return false
	}
	sel, ok := call.Fun.(*ast.SelectorExpr)
	if !ok || !isIdent(sel.X, "io") || sel.Sel.Name != "ReadAll" {
		return false
	}
	bodySel, ok := call.Args[0].(*ast.SelectorExpr)
	return ok && isIdent(bodySel.X, "resp") && bodySel.Sel.Name == "Body"
}

func isReadAllErrReturn(stmt ast.Stmt) bool {
	ifs, ok := stmt.(*ast.IfStmt)
	if !ok {
		return false
	}
	cond, ok := ifs.Cond.(*ast.BinaryExpr)
	if !ok || !isIdent(cond.X, "err") || cond.Op != token.NEQ || !isIdent(cond.Y, "nil") {
		return false
	}
	if len(ifs.Body.List) != 1 {
		return false
	}
	ret, ok := ifs.Body.List[0].(*ast.ReturnStmt)
	return ok && len(ret.Results) == 2 && isIdent(ret.Results[0], "res") && isIdent(ret.Results[1], "err")
}
