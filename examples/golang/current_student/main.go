package main

import (
	"context"
	"encoding/json"
	"log"

	"github.com/cu-devs-collective/open-cu-services-openapi/golang/lmsapi"
)

func main() {
	// Loads bffCookie from env variable CU_LMS_BFF_COOKIE
	client, err := lmsapi.NewDefaultEnvClient()
	if err != nil {
		log.Fatalf("lmsapi.NewDefaultEnvClient error: %v", err)
	}

	res, err := client.CurrentStudent(context.Background())
	if err != nil {
		log.Fatalf("client.CurrentStudent error: %v", err)
	}

	out, err := json.MarshalIndent(res, " ", " ")
	if err != nil {
		log.Fatalf("json.MarshalIndent error: %v", err)
	}

	log.Printf("client.CurrentStudent response of type %T:\n%s", res, string(out))
}
