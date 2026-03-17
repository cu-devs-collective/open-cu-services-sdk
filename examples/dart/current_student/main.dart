import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:open_cu_services_lmsapi/open_cu_services_lmsapi.dart' as lmsapi;

Future<int> main() async {
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
    final response = await client.currentStudent().timeout(
      const Duration(seconds: 30),
    );

    if (response.error case final error?) {
      if (error is Error) {
        stderr.writeln("currentStudent unexpected error:");
        stderr.writeln(error);
      } else {
        print(
          "currentStudent response with"
          " statusCode=${response.statusCode},"
          " runtimeType=${response.error.runtimeType}:",
        );
        print(
          const JsonEncoder.withIndent(
            "  ",
          ).convert((error as dynamic).toJson()),
        );
      }
      return 1;
    }

    if (response.body == null) {
      throw StateError("currentStudent succeeded but response body is null");
    }
    final body = response.body!;

    print("currentStudent response:");
    print(const JsonEncoder.withIndent("  ").convert(body.toJson()));
    return 0;
  } catch (error, stackTrace) {
    stderr.writeln("client.currentStudent failed: $error");
    Error.throwWithStackTrace(error, stackTrace);
  } finally {
    httpClient.close();
  }
}
