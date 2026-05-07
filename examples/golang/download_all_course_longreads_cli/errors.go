package main

import (
	"errors"
	"log"
	"net"

	"github.com/cu-devs-collective/open-cu-services-sdk/golang/lmsapi"
)

const (
	netErrFormat = "SDK call %q failed: network timeout while calling the API.\n\n" +
		"This usually happens when using a VPN/proxy or an IP outside the RU region.\n" +
		"It can also happen because of an unstable network or a temporarily unavailable API.\n\n" +
		"Error:\n%v"
	unexpectedErrFormat = "SDK call %q failed unexpectedly.\n\n" +
		"Error:\n%v"
)

func handleAPIError(operation string, err error) {
	var (
		netErr            net.Error
		defaultProblemErr *lmsapi.DefaultErrorStatusCode
	)
	if _, ok := lmsapi.AsResponseSpecError(err); ok {
		// The server response did not match the SDK response schema.
		// This usually means the SDK is outdated or the API returned an
		// unexpected response. If you are using the latest available SDK
		// version, report it so the SDK can be fixed in the next update.
		// See https://github.com/cu-devs-collective/open-cu-services-sdk#reporting-issues-for-codegen-clients.
		log.Fatalf("SDK call %q failed: server response did not match the SDK response schema.\n\n"+
			"This usually means the SDK is outdated or the API returned an unexpected response.\n"+
			"Check that this program uses the latest available SDK release:\n"+
			"https://github.com/cu-devs-collective/open-cu-services-sdk/blob/master/golang/README.md#cu-lms-api-lmsapi"+
			"\n\nCurrent SDK version: %s\n\n"+
			"If this is the latest available SDK version, report the issue so the SDK can be fixed.\n\n"+
			"Error:\n%v",
			operation, lmsapi.SDKVersion(), err)
	} else if errors.As(err, &netErr) && netErr.Timeout() {
		// Network timeout while calling the API.
		// This usually happens when using VPN/proxy or using an IP outside
		// the RU region. It can also happen because of an unstable network or
		// a temporarily unavailable API.
		log.Fatalf(netErrFormat, operation, err)
	} else if errors.As(err, &defaultProblemErr) {
		// The API returned an error response represented as BaseProblemError.
		// This means the SDK did not expect this response status code,
		// so this program does not handle it separately.
		// If you are using the latest available SDK version, report it so the
		// SDK can be updated in a future release.
		log.Fatalf("SDK call %q failed: unexpected status code %d.\n\n"+
			"Response:\n%v",
			operation, defaultProblemErr.GetStatusCode(), defaultProblemErr.GetResponse())
	}

	log.Fatalf(unexpectedErrFormat, operation, err)
}

func handleNetworkError(operation string, err error) {
	var netErr net.Error
	if errors.As(err, &netErr) && netErr.Timeout() {
		log.Fatalf(netErrFormat, operation, err)
	}
	log.Fatalf(unexpectedErrFormat, operation, err)
}

func handleStudentUnauthorized() {
	log.Fatalln("Cookie appears to be invalid or expired, student is unauthorized")
}

func handleDefaultRes(operation string, r any) {
	log.Fatalf("SDK call %q: unexpected response type=%T", operation, r)
}

func handleRequestLimiterClosed(operation string) {
	log.Fatalf("SDK call %q: request limiter closed", operation)
}
