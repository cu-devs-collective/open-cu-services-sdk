// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'lms_api.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$LmsApi extends LmsApi {
  _$LmsApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = LmsApi;

  @override
  Future<Response<CurrentStudentResponse>> _currentStudent({
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: 'Returns authenticated student data.',
      summary: 'Get current student.',
      operationId: 'currentStudent',
      consumes: [],
      produces: [],
      security: ["BffCookie"],
      tags: ["student"],
      deprecated: false,
    ),
  }) {
    final Uri $url = Uri.parse('/micro-lms/students/me');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      tag: swaggerMetaData,
    );
    return client.send<CurrentStudentResponse, CurrentStudentResponse>(
      $request,
    );
  }

  @override
  Future<Response<ListStudentCoursesResponse>> _listStudentCourses({
    int? limit,
    int? offset,
    List<Object?>? state,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          '''Returns courses summary the authenticated student is enrolled in.
''',
      summary: 'List courses for the current student.',
      operationId: 'listStudentCourses',
      consumes: [],
      produces: [],
      security: ["BffCookie"],
      tags: ["courses"],
      deprecated: false,
    ),
  }) {
    final Uri $url = Uri.parse('/micro-lms/courses/student');
    final Map<String, dynamic> $params = <String, dynamic>{
      'limit': limit,
      'offset': offset,
      'state': state,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ListStudentCoursesResponse, ListStudentCoursesResponse>(
      $request,
    );
  }

  @override
  Future<Response<CourseSummaryByIdResponse>> _courseSummaryById({
    required int? courseId,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: 'Returns summary information about a course by courseId.',
      summary: 'Get course summary by its ID.',
      operationId: 'courseSummaryById',
      consumes: [],
      produces: [],
      security: ["BffCookie"],
      tags: ["courses"],
      deprecated: false,
    ),
  }) {
    final Uri $url = Uri.parse('/micro-lms/courses/${courseId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      tag: swaggerMetaData,
    );
    return client.send<CourseSummaryByIdResponse, CourseSummaryByIdResponse>(
      $request,
    );
  }

  @override
  Future<Response<CourseOverviewByIdResponse>> _courseOverviewById({
    required int? courseId,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          '''Returns course overview by courseId. Overview consists of unit items called as themes, which are typically weekly modules of longread IDs and exercise items.
''',
      summary: 'Get course overview by its ID.',
      operationId: 'courseOverviewById',
      consumes: [],
      produces: [],
      security: ["BffCookie"],
      tags: ["courses"],
      deprecated: false,
    ),
  }) {
    final Uri $url = Uri.parse('/micro-lms/courses/${courseId}/overview');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      tag: swaggerMetaData,
    );
    return client.send<CourseOverviewByIdResponse, CourseOverviewByIdResponse>(
      $request,
    );
  }

  @override
  Future<Response<CourseThemeSummaryByIdResponse>> _courseThemeSummaryById({
    required int? themeId,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns summary information about a course theme by themeId.',
      summary: 'Get course theme summary by its ID.',
      operationId: 'courseThemeSummaryById',
      consumes: [],
      produces: [],
      security: ["BffCookie"],
      tags: ["courses"],
      deprecated: false,
    ),
  }) {
    final Uri $url = Uri.parse('/micro-lms/themes/${themeId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      tag: swaggerMetaData,
    );
    return client
        .send<CourseThemeSummaryByIdResponse, CourseThemeSummaryByIdResponse>(
          $request,
        );
  }

  @override
  Future<Response<LongreadSummaryByIdResponse>> _longreadSummaryById({
    required int? longreadId,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          '''Returns summary information about a longread item by longreadId.
''',
      summary: 'Get longread summary by its ID.',
      operationId: 'longreadSummaryById',
      consumes: [],
      produces: [],
      security: ["BffCookie"],
      tags: ["courses"],
      deprecated: false,
    ),
  }) {
    final Uri $url = Uri.parse('/micro-lms/longreads/${longreadId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      tag: swaggerMetaData,
    );
    return client
        .send<LongreadSummaryByIdResponse, LongreadSummaryByIdResponse>(
          $request,
        );
  }

  @override
  Future<Response<LongreadMaterialsByIdResponse>> _longreadMaterialsById({
    required int? longreadId,
    int? limit,
    int? offset,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          '''Returns longread materials by longreadId. Materials are blocks like markdown, files and exercises. Blocks are declared for each longread.
''',
      summary: 'Get longread materials by its ID.',
      operationId: 'longreadMaterialsById',
      consumes: [],
      produces: [],
      security: ["BffCookie"],
      tags: ["courses"],
      deprecated: false,
    ),
  }) {
    final Uri $url = Uri.parse('/micro-lms/longreads/${longreadId}/materials');
    final Map<String, dynamic> $params = <String, dynamic>{
      'limit': limit,
      'offset': offset,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client
        .send<LongreadMaterialsByIdResponse, LongreadMaterialsByIdResponse>(
          $request,
        );
  }

  @override
  Future<Response<TaskByIdResponse>> _taskById({
    required int? taskId,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: 'Returns task by taskId.',
      summary: 'Get task by its ID.',
      operationId: 'taskById',
      consumes: [],
      produces: [],
      security: ["BffCookie"],
      tags: ["tasks"],
      deprecated: false,
    ),
  }) {
    final Uri $url = Uri.parse('/micro-lms/tasks/${taskId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      tag: swaggerMetaData,
    );
    return client.send<TaskByIdResponse, TaskByIdResponse>($request);
  }

  @override
  Future<Response<GenerateContentDownloadLinkResponse>>
  _generateContentDownloadLink({
    required String? filename,
    String? version,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: 'Returns generated content download link by filename.',
      summary: 'Generate content download link.',
      operationId: 'generateContentDownloadLink',
      consumes: [],
      produces: [],
      security: ["BffCookie"],
      tags: ["tasks"],
      deprecated: false,
    ),
  }) {
    final Uri $url = Uri.parse('/micro-lms/content/download-link');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filename': filename,
      'version': version,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<
      GenerateContentDownloadLinkResponse,
      GenerateContentDownloadLinkResponse
    >($request);
  }
}
