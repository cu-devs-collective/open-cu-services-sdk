//go:build tools

package lmsapi

import _ "github.com/ogen-go/ogen"

//go:generate go run github.com/ogen-go/ogen/cmd/ogen@v1.20.3 --config=../.ogen.yaml --target . --package lmsapi --clean ../../spec/lmsapi/lmsapi.re.openapi.yaml
