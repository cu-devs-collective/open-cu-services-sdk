package main

import (
	"context"
	"log"
	"sort"
	"strings"
	"time"
	"unicode"

	"github.com/cu-devs-collective/open-cu-services-sdk/golang/lmsapi"
)

func listStudentCourses(ctx context.Context, client *lmsapi.Client, limiter *rpsLimiter,
	pageLimit int32,
) []lmsapi.CourseSummaryItem {
	const operation = "client.ListStudentCourses"

	var courses []lmsapi.CourseSummaryItem

	for offset := int32(0); ; offset += pageLimit {
		if !limiter.wait() {
			handleRequestLimiterClosed(operation)
		}
		res, err := client.ListStudentCourses(ctx, lmsapi.ListStudentCoursesParams{
			Limit:  lmsapi.NewOptInt32(pageLimit),
			Offset: lmsapi.NewOptInt32(offset),
			// NOTE(zguydev): archived courses are also allowed.
		})
		if err != nil {
			handleAPIError(operation, err)
		}

		switch r := res.(type) {
		case *lmsapi.ListStudentCoursesResponse:
			courses = append(courses, r.GetItems()...)
			if len(r.GetItems()) < int(pageLimit) {
				return courses
			}
		case *lmsapi.BaseUnauthorizedError:
			handleStudentUnauthorized()
		default:
			handleDefaultRes(operation, r)
		}
	}
}

func getCourseOverview(ctx context.Context, client *lmsapi.Client, limiter *rpsLimiter,
	courseID lmsapi.CourseId,
) *lmsapi.CourseOverviewByIdResponse {
	const operation = "client.CourseOverviewById"

	if !limiter.wait() {
		handleRequestLimiterClosed(operation)
	}
	res, err := client.CourseOverviewById(ctx, lmsapi.CourseOverviewByIdParams{
		CourseId: courseID,
	})
	if err != nil {
		handleAPIError(operation, err)
	}

	switch r := res.(type) {
	case *lmsapi.CourseOverviewByIdResponse:
		return r
	case *lmsapi.BaseUnauthorizedError:
		handleStudentUnauthorized()
	case *lmsapi.BaseNotFoundError:
		log.Fatalf("SDK call %q: course ID=%d not found", operation, courseID)
	default:
		handleDefaultRes(operation, r)
	}
	return nil
}

func matchCourse(courses []lmsapi.CourseSummaryItem, query string) (lmsapi.CourseSummaryItem, bool) {
	query = normalizeCourseName(query)

	var exact []lmsapi.CourseSummaryItem
	var partial []lmsapi.CourseSummaryItem
	for _, course := range courses {
		name := normalizeCourseName(string(course.GetName()))
		switch {
		case name == query:
			exact = append(exact, course)
		case strings.HasPrefix(name, query):
			partial = append(partial, course)
		}
	}

	// A full lower-case name match wins over publication date. This avoids
	// selecting a newer sibling course when the user entered the complete name.
	if len(exact) > 0 {
		return latestPublishedCourse(exact), true
	}
	if len(partial) > 0 {
		return latestPublishedCourse(partial), true
	}

	return lmsapi.CourseSummaryItem{}, false
}

// normalizeCourseName prepares a course name for search by converting it to
// lowercase, removing punctuation and symbols, and collapsing whitespace.
func normalizeCourseName(name string) string {
	var b strings.Builder
	lastWasSpace := true

	for _, r := range strings.ToLower(strings.TrimSpace(name)) {
		switch {
		case unicode.IsLetter(r) || unicode.IsDigit(r):
			b.WriteRune(r)
			lastWasSpace = false
		case unicode.IsSpace(r):
			if !lastWasSpace {
				b.WriteByte(' ')
				lastWasSpace = true
			}
		}
	}

	return strings.TrimSpace(b.String())
}

func latestPublishedCourse(courses []lmsapi.CourseSummaryItem) lmsapi.CourseSummaryItem {
	sort.SliceStable(courses, func(i, j int) bool {
		return publishedAt(courses[i]).After(publishedAt(courses[j]))
	})
	return courses[0]
}

func publishedAt(course lmsapi.CourseSummaryItem) time.Time {
	if v, ok := course.GetPublishedAt().Get(); ok {
		return time.Time(v)
	}
	if v, ok := course.GetPublishDate().Get(); ok {
		return time.Time(v)
	}
	return time.Time{}
}
