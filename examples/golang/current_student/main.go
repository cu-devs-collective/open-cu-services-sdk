package main

import (
	"context"
	"encoding/json"
	"log"
	"net/http"

	"github.com/cu-devs-collective/open-cu-services-sdk/golang/lmsapi"
)

func main() {
	// Loads bffCookie from env variable CU_LMS_BFF_COOKIE
	client, err := lmsapi.NewDefaultClientFromEnv()
	if err != nil {
		log.Fatalf("lmsapi.NewDefaultClientFromEnv error: %v", err)
	}

	var statusCode int
	res, err := client.CurrentStudent(context.Background(),
		// This option is used here only to capture the raw HTTP response status code.
		// It is made here for parity with examples in other languages.
		// This is usually unnecessary, as the response is already strongly typed.
		lmsapi.WithEditResponse(func(resp *http.Response) error {
			statusCode = resp.StatusCode
			return nil
		}))
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
