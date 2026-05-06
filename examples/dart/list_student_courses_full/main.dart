// This example fetches the courses in which the authenticated student is
// enrolled from the CU LMS API, prints the total count, and prints the
// course ID and name for each of the first 3 returned courses.

import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:open_cu_services_lmsapi/open_cu_services_lmsapi.dart' as lmsapi;

Future<void> main() async {
  exitCode = await run();
  exit(exitCode);
}

Future<int> run() async {
  final bffCookie = Platform.environment["CU_LMS_BFF_COOKIE"] ?? "";
  if (bffCookie.isEmpty) {
    throw ArgumentError("CU_LMS_BFF_COOKIE is not set in env");
  }

  final httpClient = http.Client();
  final client = lmsapi.createLmsApiClient(
    bffCookie: bffCookie,
    httpClient: httpClient,
  );

  try {
    const coursesLimit = 3;
    const futureTimeout = Duration(seconds: 10);
    final response = await client
        .listStudentCourses(limit: coursesLimit)
        .timeout(futureTimeout);

    if (response.error case final error?) {
      return handleListStudentCoursesError(response.statusCode, error);
    }

    if (response.body == null) {
      throw StateError(
        "listStudentCourses succeeded but response body is null",
      );
    }
    final body = response.body!;

    print(
      "Total courses the student is enrolled in: ${body.paging.totalCount}",
    );
    print("\nFirst $coursesLimit courses returned by API:");
    print("${"ID".padRight(5)} Name");
    print("${"-----".padRight(5)} ----");
    for (final course in body.items) {
      print("${course.id.toString().padRight(5)} ${course.name}");
    }

    return 0;
  } on lmsapi.DebugResponseError catch (error) {
    // The server response did not match the SDK response schema.
    // This usually means the SDK is outdated or the API returned an
    // unexpected response. If you are using the latest available SDK
    // version, report it so the SDK can be fixed in the next update.
    // See https://github.com/cu-devs-collective/open-cu-services-sdk#reporting-issues-for-codegen-clients.
    stderr.writeln("client.listStudentCourses specification error:");
    stderr.writeln(error);
    return 1;
  } on TimeoutException catch (error) {
    // Call did not complete in time before the Future timeout.
    // This usually happens when using VPN/proxy or using an IP
    // outside the RU region.
    // This can also happen because of an unstable network or
    // a temporarily unavailable API.
    //
    // Note: this only catches the timeout and stops waiting for the result.
    // It does not cancel the HTTP request that the Future is waiting on.
    // Cancel or abort the request where needed to prevent resource leaks.
    stderr.writeln("client.listStudentCourses future timeout: $error");
    return 1;
  } catch (error) {
    // Any remaining error.
    stderr.writeln("client.listStudentCourses failed: $error");
    return 1;
  } finally {
    httpClient.close();
  }
}

int handleListStudentCoursesError(int statusCode, Object error) {
  if (error is lmsapi.BaseUnauthorizedError) {
    // The cookie is set, but it appears to be invalid or expired.
    stderr.writeln("student is unauthorized");
    return 1;
  }

  if (error is lmsapi.BaseProblemError) {
    // The API returned an error response with a status code that is
    // represented as BaseProblemError.
    stderr.writeln(
      "client.listStudentCourses unexpected statusCode=$statusCode:",
    );
    stderr.writeln(error);
    return 1;
  }

  if (error is lmsapi.LmsApiUnhandledError) {
    // The API returned an error response the SDK could not decode as a known
    // problem JSON schema.
    stderr.writeln("client.listStudentCourses unhandled API error:");
    stderr.writeln(error);
    return 1;
  }

  // This should not happen in this example because all documented
  // response types for this operation are handled above.
  stderr.writeln(
    "client.listStudentCourses unexpected response error with"
    " statusCode=$statusCode, runtimeType=${error.runtimeType}:",
  );
  stderr.writeln(error);
  return 1;
}
