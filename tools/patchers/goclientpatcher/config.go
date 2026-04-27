package main

import (
	"errors"
	"fmt"
	"go/ast"
	"go/format"
	"go/parser"
	"go/token"
	"os"
)

func patchConfig(path string) error {
	src, err := os.ReadFile(path)
	if err != nil {
		return err
	}
	fset, file, err := parseFileBytes(path, src, parser.ParseComments)
	if err != nil {
		return err
	}

	var clientEnd token.Pos
	var found bool
	var hasOptions, hasDisable bool
	for _, decl := range file.Decls {
		gen, ok := decl.(*ast.GenDecl)
		if !ok || gen.Tok != token.TYPE {
			continue
		}
		for _, spec := range gen.Specs {
			ts, ok := spec.(*ast.TypeSpec)
			if !ok || ts.Name.Name != "clientConfig" {
				continue
			}
			st, ok := ts.Type.(*ast.StructType)
			if !ok {
				return errors.New("clientConfig is not a struct")
			}
			found = true
			for _, field := range st.Fields.List {
				for _, name := range field.Names {
					switch name.Name {
					case "Client":
						clientEnd = field.End()
					case "DebugResponseOptions":
						hasOptions = true
					case "DisableDebugResponses":
						hasDisable = true
					}
				}
			}
		}
	}
	if !found {
		return errors.New("clientConfig struct not found")
	}
	if hasOptions && hasDisable {
		return nil
	}
	if !clientEnd.IsValid() {
		return errors.New("clientConfig.Client field not found")
	}

	offset := fset.Position(clientEnd).Offset
	insert := "\n"
	if !hasOptions {
		insert += "\tDebugResponseOptions  []DebugResponseOption\n"
	}
	if !hasDisable {
		insert += "\tDisableDebugResponses bool\n"
	}

	patched := make([]byte, 0, len(src)+len(insert))
	patched = append(patched, src[:offset]...)
	patched = append(patched, insert...)
	patched = append(patched, src[offset:]...)
	formatted, err := format.Source(patched)
	if err != nil {
		return fmt.Errorf("format patched config: %w", err)
	}
	return os.WriteFile(path, formatted, 0o644)
}

func patchRequestConfig(file *ast.File) bool {
	for _, decl := range file.Decls {
		gen, ok := decl.(*ast.GenDecl)
		if !ok || gen.Tok != token.TYPE {
			continue
		}
		for _, spec := range gen.Specs {
			ts, ok := spec.(*ast.TypeSpec)
			if !ok || ts.Name.Name != "requestConfig" {
				continue
			}
			st, ok := ts.Type.(*ast.StructType)
			if !ok || hasStructField(st, "DebugResponse") {
				return false
			}
			st.Fields.List = append(st.Fields.List, &ast.Field{
				Names: []*ast.Ident{ast.NewIdent("DebugResponse")},
				Type:  star("DebugResponse"),
			})
			return true
		}
	}
	return false
}

func hasStructField(st *ast.StructType, name string) bool {
	for _, field := range st.Fields.List {
		for _, fieldName := range field.Names {
			if fieldName.Name == name {
				return true
			}
		}
	}
	return false
}
