// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element_parameter

import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart' as json;
import 'package:collection/collection.dart';
import 'dart:convert';

import 'lms_api.models.swagger.dart';
import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:chopper/chopper.dart' as chopper;
import 'lms_api.enums.swagger.dart' as enums;
import 'lms_api.metadata.swagger.dart';
export 'lms_api.enums.swagger.dart';
export 'lms_api.models.swagger.dart';

part 'lms_api.swagger.chopper.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class LmsApi extends ChopperService {
  static LmsApi create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    List<Interceptor>? interceptors,
  }) {
    if (client != null) {
      return _$LmsApi(client);
    }

    final newClient = ChopperClient(
      services: [_$LmsApi()],
      converter: converter ?? $JsonSerializableConverter(),
      interceptors: interceptors ?? [],
      client: httpClient,
      authenticator: authenticator,
      errorConverter: errorConverter,
      baseUrl: baseUrl,
    );
    return _$LmsApi(newClient);
  }

  ///Get current student.
  Future<chopper.Response<CurrentStudentResponse>> currentStudent() {
    generatedMapping.putIfAbsent(
      CurrentStudentResponse,
      () => CurrentStudentResponse.fromJsonFactory,
    );

    return _currentStudent();
  }

  ///Get current student.
  @GET(path: '/micro-lms/students/me')
  Future<chopper.Response<CurrentStudentResponse>> _currentStudent({
    @chopper.Tag()
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
  });

  ///List courses for the current student.
  ///@param limit Maximum number of items to return.
  ///@param offset Number of items to skip before collecting result items.
  ///@param state Include only courses whose state matches any of the specified values.
  Future<chopper.Response<ListStudentCoursesResponse>> listStudentCourses({
    int? limit,
    int? offset,
    List<enums.PublicationState>? state,
  }) {
    generatedMapping.putIfAbsent(
      ListStudentCoursesResponse,
      () => ListStudentCoursesResponse.fromJsonFactory,
    );

    return _listStudentCourses(
      limit: limit,
      offset: offset,
      state: publicationStateListToJson(state),
    );
  }

  ///List courses for the current student.
  ///@param limit Maximum number of items to return.
  ///@param offset Number of items to skip before collecting result items.
  ///@param state Include only courses whose state matches any of the specified values.
  @GET(path: '/micro-lms/courses/student')
  Future<chopper.Response<ListStudentCoursesResponse>> _listStudentCourses({
    @Query('limit') int? limit,
    @Query('offset') int? offset,
    @Query('state') List<Object?>? state,
    @chopper.Tag()
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
  });

  ///Get course summary by its ID.
  ///@param courseId Numeric identifier of the course specified in URL path.
  Future<chopper.Response<CourseSummaryByIdResponse>> courseSummaryById({
    required int? courseId,
  }) {
    generatedMapping.putIfAbsent(
      CourseSummaryByIdResponse,
      () => CourseSummaryByIdResponse.fromJsonFactory,
    );

    return _courseSummaryById(courseId: courseId);
  }

  ///Get course summary by its ID.
  ///@param courseId Numeric identifier of the course specified in URL path.
  @GET(path: '/micro-lms/courses/{courseId}')
  Future<chopper.Response<CourseSummaryByIdResponse>> _courseSummaryById({
    @Path('courseId') required int? courseId,
    @chopper.Tag()
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
  });

  ///Get course overview by its ID.
  ///@param courseId Numeric identifier of the course specified in URL path.
  Future<chopper.Response<CourseOverviewByIdResponse>> courseOverviewById({
    required int? courseId,
  }) {
    generatedMapping.putIfAbsent(
      CourseOverviewByIdResponse,
      () => CourseOverviewByIdResponse.fromJsonFactory,
    );

    return _courseOverviewById(courseId: courseId);
  }

  ///Get course overview by its ID.
  ///@param courseId Numeric identifier of the course specified in URL path.
  @GET(path: '/micro-lms/courses/{courseId}/overview')
  Future<chopper.Response<CourseOverviewByIdResponse>> _courseOverviewById({
    @Path('courseId') required int? courseId,
    @chopper.Tag()
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
  });

  ///Get course theme summary by its ID.
  ///@param themeId Numeric identifier of the course theme specified in URL path.
  Future<chopper.Response<CourseThemeSummaryByIdResponse>>
  courseThemeSummaryById({required int? themeId}) {
    generatedMapping.putIfAbsent(
      CourseThemeSummaryByIdResponse,
      () => CourseThemeSummaryByIdResponse.fromJsonFactory,
    );

    return _courseThemeSummaryById(themeId: themeId);
  }

  ///Get course theme summary by its ID.
  ///@param themeId Numeric identifier of the course theme specified in URL path.
  @GET(path: '/micro-lms/themes/{themeId}')
  Future<chopper.Response<CourseThemeSummaryByIdResponse>>
  _courseThemeSummaryById({
    @Path('themeId') required int? themeId,
    @chopper.Tag()
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
  });

  ///Get longread summary by its ID.
  ///@param longreadId Numeric identifier of the longread item specified in URL path.
  Future<chopper.Response<LongreadSummaryByIdResponse>> longreadSummaryById({
    required int? longreadId,
  }) {
    generatedMapping.putIfAbsent(
      LongreadSummaryByIdResponse,
      () => LongreadSummaryByIdResponse.fromJsonFactory,
    );

    return _longreadSummaryById(longreadId: longreadId);
  }

  ///Get longread summary by its ID.
  ///@param longreadId Numeric identifier of the longread item specified in URL path.
  @GET(path: '/micro-lms/longreads/{longreadId}')
  Future<chopper.Response<LongreadSummaryByIdResponse>> _longreadSummaryById({
    @Path('longreadId') required int? longreadId,
    @chopper.Tag()
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
  });

  ///Get longread materials by its ID.
  ///@param longreadId Numeric identifier of the longread item specified in URL path.
  ///@param limit Maximum number of items to return.
  ///@param offset Number of items to skip before collecting result items.
  Future<chopper.Response<LongreadMaterialsByIdResponse>>
  longreadMaterialsById({required int? longreadId, int? limit, int? offset}) {
    generatedMapping.putIfAbsent(
      LongreadMaterialsByIdResponse,
      () => LongreadMaterialsByIdResponse.fromJsonFactory,
    );

    return _longreadMaterialsById(
      longreadId: longreadId,
      limit: limit,
      offset: offset,
    );
  }

  ///Get longread materials by its ID.
  ///@param longreadId Numeric identifier of the longread item specified in URL path.
  ///@param limit Maximum number of items to return.
  ///@param offset Number of items to skip before collecting result items.
  @GET(path: '/micro-lms/longreads/{longreadId}/materials')
  Future<chopper.Response<LongreadMaterialsByIdResponse>>
  _longreadMaterialsById({
    @Path('longreadId') required int? longreadId,
    @Query('limit') int? limit,
    @Query('offset') int? offset,
    @chopper.Tag()
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
  });

  ///Get task by its ID.
  ///@param taskId Numeric identifier of the task item specified in URL path.
  Future<chopper.Response<TaskByIdResponse>> taskById({required int? taskId}) {
    generatedMapping.putIfAbsent(
      TaskByIdResponse,
      () => TaskByIdResponse.fromJsonFactory,
    );

    return _taskById(taskId: taskId);
  }

  ///Get task by its ID.
  ///@param taskId Numeric identifier of the task item specified in URL path.
  @GET(path: '/micro-lms/tasks/{taskId}')
  Future<chopper.Response<TaskByIdResponse>> _taskById({
    @Path('taskId') required int? taskId,
    @chopper.Tag()
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
  });

  ///Generate content download link.
  ///@param filename File object path in storage specified in URL query.
  ///@param version Material content revision identifier specified in URL query.
  Future<chopper.Response<GenerateContentDownloadLinkResponse>>
  generateContentDownloadLink({required String? filename, String? version}) {
    generatedMapping.putIfAbsent(
      GenerateContentDownloadLinkResponse,
      () => GenerateContentDownloadLinkResponse.fromJsonFactory,
    );

    return _generateContentDownloadLink(filename: filename, version: version);
  }

  ///Generate content download link.
  ///@param filename File object path in storage specified in URL query.
  ///@param version Material content revision identifier specified in URL query.
  @GET(path: '/micro-lms/content/download-link')
  Future<chopper.Response<GenerateContentDownloadLinkResponse>>
  _generateContentDownloadLink({
    @Query('filename') required String? filename,
    @Query('version') String? version,
    @chopper.Tag()
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
  });
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
    chopper.Response response,
  ) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
        body:
            DateTime.parse((response.body as String).replaceAll('"', ''))
                as ResultType,
      );
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
      body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType,
    );
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);
