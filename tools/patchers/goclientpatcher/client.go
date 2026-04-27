package main

import (
	"go/ast"
	"go/token"
)

func patchClient(path string) (int, error) {
	fset, file, err := parseFile(path)
	if err != nil {
		return 0, err
	}

	var count, already int
	var changed bool
	if patchRequestConfig(file) {
		changed = true
	}
	for _, decl := range file.Decls {
		fn, ok := decl.(*ast.FuncDecl)
		if !ok || !isClientMethod(fn) || !isExported(fn.Name.Name) {
			continue
		}
		if patchClientMethod(fn) {
			count++
			changed = true
			continue
		}
		if isAlreadyPatchedClientMethod(fn) {
			already++
		}
	}
	if patchDecodeResponseCalls(file) {
		changed = true
	}

	if count == 0 && already == 0 {
		return 0, nil
	}
	if !changed {
		return already, nil
	}
	return count + already, writeFile(path, fset, file)
}

func patchDecodeResponseCalls(file *ast.File) bool {
	var changed bool
	ast.Inspect(file, func(node ast.Node) bool {
		call, ok := node.(*ast.CallExpr)
		if !ok || len(call.Args) != 1 || !isIdent(call.Args[0], "resp") {
			return true
		}
		id, ok := call.Fun.(*ast.Ident)
		if !ok || !isDecodeResponseFuncName(id.Name) {
			return true
		}
		call.Args = append(call.Args, &ast.SelectorExpr{
			X:   ast.NewIdent("reqCfg"),
			Sel: ast.NewIdent("DebugResponse"),
		})
		changed = true
		return true
	})
	return changed
}

func patchClientMethod(fn *ast.FuncDecl) bool {
	if fn.Body == nil || len(fn.Body.List) != 2 {
		return false
	}

	assign, ok := fn.Body.List[0].(*ast.AssignStmt)
	if !ok || assign.Tok != token.DEFINE || len(assign.Lhs) != 2 || len(assign.Rhs) != 1 {
		return false
	}
	if !isIdent(assign.Lhs[0], "res") || !isIdent(assign.Lhs[1], "err") {
		return false
	}

	sendCall, ok := assign.Rhs[0].(*ast.CallExpr)
	if !ok || !isClientSendCall(sendCall, fn.Name.Name) {
		return false
	}
	if !hasVariadicOptionsArg(sendCall) {
		return false
	}

	ret, ok := fn.Body.List[1].(*ast.ReturnStmt)
	if !ok || len(ret.Results) != 2 || !isIdent(ret.Results[0], "res") || !isIdent(ret.Results[1], "err") {
		return false
	}

	fn.Body.List = []ast.Stmt{&ast.ReturnStmt{
		Results: []ast.Expr{
			&ast.CallExpr{
				Fun: ast.NewIdent("callClientDebugResponse"),
				Args: []ast.Expr{
					ast.NewIdent("c"),
					debugResponseFuncLit(fn, sendCall),
				},
			},
		},
	}}
	return true
}

func isAlreadyPatchedClientMethod(fn *ast.FuncDecl) bool {
	if fn.Body == nil || len(fn.Body.List) != 1 {
		return false
	}
	ret, ok := fn.Body.List[0].(*ast.ReturnStmt)
	if !ok || len(ret.Results) != 1 {
		return false
	}
	call, ok := ret.Results[0].(*ast.CallExpr)
	if !ok {
		return false
	}
	return isIdent(call.Fun, "callClientDebugResponse")
}

func debugResponseFuncLit(fn *ast.FuncDecl, sendCall *ast.CallExpr) *ast.FuncLit {
	return &ast.FuncLit{
		Type: &ast.FuncType{
			Params: &ast.FieldList{
				List: []*ast.Field{{
					Names: []*ast.Ident{ast.NewIdent("debugResponse")},
					Type:  star("DebugResponse"),
				}},
			},
			Results: cloneFieldList(fn.Type.Results),
		},
		Body: &ast.BlockStmt{
			List: []ast.Stmt{&ast.ReturnStmt{
				Results: []ast.Expr{cloneSendCallWithDebugOption(sendCall)},
			}},
		},
	}
}

func cloneSendCallWithDebugOption(call *ast.CallExpr) ast.Expr {
	args := make([]ast.Expr, len(call.Args))
	copy(args, call.Args)
	if hasVariadicOptionsArg(call) {
		args[len(args)-1] = &ast.CallExpr{
			Fun: ast.NewIdent("appendDebugResponseRequestOption"),
			Args: []ast.Expr{
				ast.NewIdent("options"),
				ast.NewIdent("debugResponse"),
			},
		}
	}

	return &ast.CallExpr{
		Fun:      cloneExpr(call.Fun),
		Args:     args,
		Ellipsis: call.Ellipsis,
	}
}

func hasVariadicOptionsArg(call *ast.CallExpr) bool {
	return len(call.Args) > 0 && call.Ellipsis.IsValid() && isIdent(call.Args[len(call.Args)-1], "options")
}

func isClientSendCall(call *ast.CallExpr, method string) bool {
	sel, ok := call.Fun.(*ast.SelectorExpr)
	if !ok || !isIdent(sel.X, "c") {
		return false
	}
	return sel.Sel.Name == "send"+method
}
