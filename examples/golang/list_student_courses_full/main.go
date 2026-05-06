// This example fetches the courses in which the authenticated student is
// enrolled from the CU LMS API, prints the total count, and prints the
// course ID and name for each of the first 3 returned courses.
package main

import (
	"context"
	"errors"
	"fmt"
	"log"
	"net"

	"github.com/cu-devs-collective/open-cu-services-sdk/golang/lmsapi"
)

func main() {
	// Loads bffCookie from env variable CU_LMS_BFF_COOKIE
	client, err := lmsapi.NewDefaultClientFromEnv()
	if err != nil {
		log.Fatalf("lmsapi.NewDefaultClientFromEnv error: %v", err)
	}

	const coursesLimit = 3
	res, err := client.ListStudentCourses(context.Background(), lmsapi.ListStudentCoursesParams{
		Limit: lmsapi.NewOptInt32(coursesLimit),
	})
	if err != nil {
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
			log.Fatalf("client.ListStudentCourses specification error: %v", err)
		} else if errors.As(err, &netErr) && netErr.Timeout() {
			// Network timeout while calling the API.
			// This usually happens when using VPN/proxy or using an IP
			// outside the RU region.
			// This can also happen because of an unstable network or
			// a temporarily unavailable API.
			log.Fatalf("client.ListStudentCourses request timeout: %v", err)
		} else if errors.As(err, &defaultProblemErr) {
			// The API returned an error response with a status code that is
			// represented as BaseProblemError.
			log.Fatalf("client.ListStudentCourses unexpected statusCode=%d: %v",
				defaultProblemErr.GetStatusCode(), defaultProblemErr.GetResponse())
		}

		// Any remaining error.
		log.Fatalf("client.ListStudentCourses error: %v", err)
	}

	switch r := res.(type) {
	case *lmsapi.ListStudentCoursesResponse:
		// Successful response.
		fmt.Printf("Total courses the student is enrolled in: %d\n", r.Paging.GetTotalCount())
		fmt.Printf("\nFirst %d courses returned by API:\n", coursesLimit)
		fmt.Printf("%-5s %s\n", "ID", "Name")
		fmt.Printf("%-5s %s\n", "-----", "----")
		for _, course := range r.GetItems() {
			fmt.Printf("%-5d %s\n", course.GetID(), course.GetName())
		}
	case *lmsapi.BaseUnauthorizedError:
		// The cookie is set, but it appears to be invalid or expired.
		log.Fatalln("student is unauthorized")
	default:
		// This should not happen in this example because all documented
		// response types for this operation are handled above.
		log.Fatalf("client.ListStudentCourses unexpected response type=%T", r)
	}
}
