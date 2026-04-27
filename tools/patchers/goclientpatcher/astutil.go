package main

import (
	"bytes"
	"go/ast"
	"go/format"
	"go/parser"
	"go/printer"
	"go/token"
	"os"
	"strings"
	"unicode"
	"unicode/utf8"
)

func isDecodeResponseFuncName(name string) bool {
	return strings.HasPrefix(name, "decode") && strings.HasSuffix(name, "Response")
}

func isClientMethod(fn *ast.FuncDecl) bool {
	if fn.Recv == nil || len(fn.Recv.List) != 1 {
		return false
	}
	typ := fn.Recv.List[0].Type
	ptr, ok := typ.(*ast.StarExpr)
	if !ok {
		return false
	}
	return isIdent(ptr.X, "Client")
}

func isExported(name string) bool {
	if name == "" {
		return false
	}
	r, _ := utf8.DecodeRuneInString(name)
	return unicode.IsUpper(r)
}

func isIdent(expr ast.Expr, name string) bool {
	id, ok := expr.(*ast.Ident)
	return ok && id.Name == name
}

func star(name string) ast.Expr {
	return &ast.StarExpr{X: ast.NewIdent(name)}
}

func cloneFieldList(in *ast.FieldList) *ast.FieldList {
	if in == nil {
		return nil
	}
	out := &ast.FieldList{List: make([]*ast.Field, 0, len(in.List))}
	for _, field := range in.List {
		out.List = append(out.List, &ast.Field{
			Names: cloneIdents(field.Names),
			Type:  cloneExpr(field.Type),
			Tag:   field.Tag,
		})
	}
	return out
}

func cloneIdents(in []*ast.Ident) []*ast.Ident {
	if len(in) == 0 {
		return nil
	}
	out := make([]*ast.Ident, 0, len(in))
	for _, ident := range in {
		out = append(out, ast.NewIdent(ident.Name))
	}
	return out
}

func cloneExpr(expr ast.Expr) ast.Expr {
	var buf bytes.Buffer
	if err := printer.Fprint(&buf, token.NewFileSet(), expr); err != nil {
		panic(err)
	}
	parsed, err := parser.ParseExpr(buf.String())
	if err != nil {
		panic(err)
	}
	return parsed
}

func parseFile(path string) (*token.FileSet, *ast.File, error) {
	return parseFileMode(path, parser.ParseComments)
}

func parseFileMode(path string, mode parser.Mode) (*token.FileSet, *ast.File, error) {
	src, err := os.ReadFile(path)
	if err != nil {
		return nil, nil, err
	}
	return parseFileBytes(path, src, mode)
}

func parseFileBytes(path string, src []byte, mode parser.Mode) (*token.FileSet, *ast.File, error) {
	fset := token.NewFileSet()
	file, err := parser.ParseFile(fset, path, src, mode)
	if err != nil {
		return nil, nil, err
	}
	return fset, file, nil
}

func writeFile(path string, fset *token.FileSet, file *ast.File) error {
	var buf bytes.Buffer
	if err := format.Node(&buf, fset, file); err != nil {
		return err
	}
	return os.WriteFile(path, buf.Bytes(), 0o644)
}
