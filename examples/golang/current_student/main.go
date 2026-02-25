package main

import (
	"context"
	"encoding/json"
	"fmt"
	"log"
	"os"

	"github.com/cu-devs-collective/open-cu-services-openapi/golang/lmsapi"
)

type EnvSource struct{ bffCookie string }

var _ lmsapi.SecuritySource = (*EnvSource)(nil)

func (e *EnvSource) BffCookie(_ context.Context, _ lmsapi.OperationName,
) (lmsapi.BffCookie, error) {
	return lmsapi.BffCookie{APIKey: e.bffCookie}, nil
}

func NewEnvSource() (*EnvSource, error) {
	const envKey = "CU_LMS_BFF_COOKIE"
	bffCookie := os.Getenv(envKey)
	if bffCookie == "" {
		return nil, fmt.Errorf("%s is not set in env", envKey)
	}
	return &EnvSource{bffCookie: bffCookie}, nil
}

func main() {
	sec, err := NewEnvSource()
	if err != nil {
		log.Fatalf("NewEnvSource: %v", err)
	}

	client, err := lmsapi.NewClient(lmsapi.DefaultBaseURL, sec)
	if err != nil {
		log.Fatalf("lmsapi.NewClient: %v", err)
	}

	res, err := client.CurrentStudent(context.Background())
	if err != nil {
		log.Fatalf("client.CurrentStudent: %v", err)
	}

	out, err := json.MarshalIndent(res, " ", " ")
	if err != nil {
		log.Fatalf("json.MarshalIndent: %v", err)
	}

	log.Printf("client.CurrentStudent response: \n%s", string(out))
}
