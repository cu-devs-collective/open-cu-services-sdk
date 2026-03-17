package main

import (
	"context"
	"encoding/json"
	"log"
	"net/http"

	"github.com/cu-devs-collective/open-cu-services-openapi/golang/lmsapi"
)

func main() {
	var statusCode int
	client, err := lmsapi.NewDefaultClientFromEnv(
		lmsapi.WithResponseEditor(
			func(_ context.Context, resp *http.Response) error {
				statusCode = resp.StatusCode
				return nil
			}),
	)
	if err != nil {
		log.Fatalf("lmsapi.NewDefaultClientFromEnv error: %v", err)
	}

	res, err := client.CurrentStudent(context.Background())
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
