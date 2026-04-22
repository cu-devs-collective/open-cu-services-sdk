package main

import (
	"context"
	"encoding/json"
	"log"
	"net/http"

	"github.com/cu-devs-collective/open-cu-services-sdk/golang/lmsapi"
)

func main() {
	client, err := lmsapi.NewDefaultClientFromEnv()
	if err != nil {
		log.Fatalf("lmsapi.NewDefaultClientFromEnv error: %v", err)
	}

	var statusCode int
	res, err := lmsapi.Call(func(scope *lmsapi.DebugResponse) (lmsapi.CurrentStudentRes, error) {
		return client.CurrentStudent(context.Background(),
			scope.RequestOptionWith(func(resp *http.Response) error {
				statusCode = resp.StatusCode
				return nil
			}))
	})
	if err != nil {
		log.Fatalf("client.CurrentStudent error: %v", err)
	}

	out, err := json.MarshalIndent(res, " ", " ")
	if err != nil {
		log.Fatalf("json.MarshalIndent error: %v", err)
	}

	log.Printf("client.CurrentStudent response with statusCode=%d, type=%T:\n",
		statusCode, res)
	log.Println(string(out))
}
