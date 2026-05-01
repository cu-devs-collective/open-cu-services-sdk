// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'lms_api.enums.swagger.dart' as enums;

part 'lms_api.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class BaseProblemError {
  const BaseProblemError({
    this.type,
    required this.title,
    required this.status,
    this.traceId,
  });

  factory BaseProblemError.fromJson(Map<String, dynamic> json) =>
      _$BaseProblemErrorFromJson(json);

  static const toJsonFactory = _$BaseProblemErrorToJson;
  Map<String, dynamic> toJson() => _$BaseProblemErrorToJson(this);

  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'traceId')
  final String? traceId;
  static const fromJsonFactory = _$BaseProblemErrorFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BaseProblemError &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.traceId, traceId) ||
                const DeepCollectionEquality().equals(other.traceId, traceId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(traceId) ^
      runtimeType.hashCode;
}

extension $BaseProblemErrorExtension on BaseProblemError {
  BaseProblemError copyWith({
    String? type,
    String? title,
    int? status,
    String? traceId,
  }) {
    return BaseProblemError(
      type: type ?? this.type,
      title: title ?? this.title,
      status: status ?? this.status,
      traceId: traceId ?? this.traceId,
    );
  }

  BaseProblemError copyWithWrapped({
    Wrapped<String?>? type,
    Wrapped<String>? title,
    Wrapped<int>? status,
    Wrapped<String?>? traceId,
  }) {
    return BaseProblemError(
      type: (type != null ? type.value : this.type),
      title: (title != null ? title.value : this.title),
      status: (status != null ? status.value : this.status),
      traceId: (traceId != null ? traceId.value : this.traceId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class BaseBadRequestError {
  const BaseBadRequestError({
    required this.title,
    required this.status,
    required this.errors,
  });

  factory BaseBadRequestError.fromJson(Map<String, dynamic> json) =>
      _$BaseBadRequestErrorFromJson(json);

  static const toJsonFactory = _$BaseBadRequestErrorToJson;
  Map<String, dynamic> toJson() => _$BaseBadRequestErrorToJson(this);

  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'errors')
  final Map<String, dynamic> errors;
  static const fromJsonFactory = _$BaseBadRequestErrorFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BaseBadRequestError &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(errors) ^
      runtimeType.hashCode;
}

extension $BaseBadRequestErrorExtension on BaseBadRequestError {
  BaseBadRequestError copyWith({
    String? title,
    int? status,
    Map<String, dynamic>? errors,
  }) {
    return BaseBadRequestError(
      title: title ?? this.title,
      status: status ?? this.status,
      errors: errors ?? this.errors,
    );
  }

  BaseBadRequestError copyWithWrapped({
    Wrapped<String>? title,
    Wrapped<int>? status,
    Wrapped<Map<String, dynamic>>? errors,
  }) {
    return BaseBadRequestError(
      title: (title != null ? title.value : this.title),
      status: (status != null ? status.value : this.status),
      errors: (errors != null ? errors.value : this.errors),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class BaseUnauthorizedError {
  const BaseUnauthorizedError({
    this.type,
    required this.title,
    required this.status,
    required this.traceId,
  });

  factory BaseUnauthorizedError.fromJson(Map<String, dynamic> json) =>
      _$BaseUnauthorizedErrorFromJson(json);

  static const toJsonFactory = _$BaseUnauthorizedErrorToJson;
  Map<String, dynamic> toJson() => _$BaseUnauthorizedErrorToJson(this);

  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'traceId')
  final String traceId;
  static const fromJsonFactory = _$BaseUnauthorizedErrorFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BaseUnauthorizedError &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.traceId, traceId) ||
                const DeepCollectionEquality().equals(other.traceId, traceId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(traceId) ^
      runtimeType.hashCode;
}

extension $BaseUnauthorizedErrorExtension on BaseUnauthorizedError {
  BaseUnauthorizedError copyWith({
    String? type,
    String? title,
    int? status,
    String? traceId,
  }) {
    return BaseUnauthorizedError(
      type: type ?? this.type,
      title: title ?? this.title,
      status: status ?? this.status,
      traceId: traceId ?? this.traceId,
    );
  }

  BaseUnauthorizedError copyWithWrapped({
    Wrapped<String?>? type,
    Wrapped<String>? title,
    Wrapped<int>? status,
    Wrapped<String>? traceId,
  }) {
    return BaseUnauthorizedError(
      type: (type != null ? type.value : this.type),
      title: (title != null ? title.value : this.title),
      status: (status != null ? status.value : this.status),
      traceId: (traceId != null ? traceId.value : this.traceId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class BaseForbiddenError {
  const BaseForbiddenError({
    this.type,
    required this.title,
    required this.status,
    this.detail,
    this.instance,
    required this.traceId,
  });

  factory BaseForbiddenError.fromJson(Map<String, dynamic> json) =>
      _$BaseForbiddenErrorFromJson(json);

  static const toJsonFactory = _$BaseForbiddenErrorToJson;
  Map<String, dynamic> toJson() => _$BaseForbiddenErrorToJson(this);

  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'detail')
  final String? detail;
  @JsonKey(name: 'instance')
  final String? instance;
  @JsonKey(name: 'traceId')
  final String traceId;
  static const fromJsonFactory = _$BaseForbiddenErrorFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BaseForbiddenError &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.detail, detail) ||
                const DeepCollectionEquality().equals(other.detail, detail)) &&
            (identical(other.instance, instance) ||
                const DeepCollectionEquality().equals(
                  other.instance,
                  instance,
                )) &&
            (identical(other.traceId, traceId) ||
                const DeepCollectionEquality().equals(other.traceId, traceId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(detail) ^
      const DeepCollectionEquality().hash(instance) ^
      const DeepCollectionEquality().hash(traceId) ^
      runtimeType.hashCode;
}

extension $BaseForbiddenErrorExtension on BaseForbiddenError {
  BaseForbiddenError copyWith({
    String? type,
    String? title,
    int? status,
    String? detail,
    String? instance,
    String? traceId,
  }) {
    return BaseForbiddenError(
      type: type ?? this.type,
      title: title ?? this.title,
      status: status ?? this.status,
      detail: detail ?? this.detail,
      instance: instance ?? this.instance,
      traceId: traceId ?? this.traceId,
    );
  }

  BaseForbiddenError copyWithWrapped({
    Wrapped<String?>? type,
    Wrapped<String>? title,
    Wrapped<int>? status,
    Wrapped<String?>? detail,
    Wrapped<String?>? instance,
    Wrapped<String>? traceId,
  }) {
    return BaseForbiddenError(
      type: (type != null ? type.value : this.type),
      title: (title != null ? title.value : this.title),
      status: (status != null ? status.value : this.status),
      detail: (detail != null ? detail.value : this.detail),
      instance: (instance != null ? instance.value : this.instance),
      traceId: (traceId != null ? traceId.value : this.traceId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class BaseNotFoundError {
  const BaseNotFoundError({
    required this.title,
    required this.status,
    this.detail,
    this.instance,
    this.entityId,
    required this.traceId,
  });

  factory BaseNotFoundError.fromJson(Map<String, dynamic> json) =>
      _$BaseNotFoundErrorFromJson(json);

  static const toJsonFactory = _$BaseNotFoundErrorToJson;
  Map<String, dynamic> toJson() => _$BaseNotFoundErrorToJson(this);

  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'detail')
  final String? detail;
  @JsonKey(name: 'instance')
  final String? instance;
  @JsonKey(name: 'entityId')
  final int? entityId;
  @JsonKey(name: 'traceId')
  final String traceId;
  static const fromJsonFactory = _$BaseNotFoundErrorFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BaseNotFoundError &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.detail, detail) ||
                const DeepCollectionEquality().equals(other.detail, detail)) &&
            (identical(other.instance, instance) ||
                const DeepCollectionEquality().equals(
                  other.instance,
                  instance,
                )) &&
            (identical(other.entityId, entityId) ||
                const DeepCollectionEquality().equals(
                  other.entityId,
                  entityId,
                )) &&
            (identical(other.traceId, traceId) ||
                const DeepCollectionEquality().equals(other.traceId, traceId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(detail) ^
      const DeepCollectionEquality().hash(instance) ^
      const DeepCollectionEquality().hash(entityId) ^
      const DeepCollectionEquality().hash(traceId) ^
      runtimeType.hashCode;
}

extension $BaseNotFoundErrorExtension on BaseNotFoundError {
  BaseNotFoundError copyWith({
    String? title,
    int? status,
    String? detail,
    String? instance,
    int? entityId,
    String? traceId,
  }) {
    return BaseNotFoundError(
      title: title ?? this.title,
      status: status ?? this.status,
      detail: detail ?? this.detail,
      instance: instance ?? this.instance,
      entityId: entityId ?? this.entityId,
      traceId: traceId ?? this.traceId,
    );
  }

  BaseNotFoundError copyWithWrapped({
    Wrapped<String>? title,
    Wrapped<int>? status,
    Wrapped<String?>? detail,
    Wrapped<String?>? instance,
    Wrapped<int?>? entityId,
    Wrapped<String>? traceId,
  }) {
    return BaseNotFoundError(
      title: (title != null ? title.value : this.title),
      status: (status != null ? status.value : this.status),
      detail: (detail != null ? detail.value : this.detail),
      instance: (instance != null ? instance.value : this.instance),
      entityId: (entityId != null ? entityId.value : this.entityId),
      traceId: (traceId != null ? traceId.value : this.traceId),
    );
  }
}

typedef XRePropertyIncompleteOnlyEmptyArrayObserved =
    List<XRePropertyIncompleteOnlyEmptyArrayObserved$Item>;

@JsonSerializable(explicitToJson: true)
class XRePropertyIncompleteOnlyEmptyArrayObserved$Item {
  const XRePropertyIncompleteOnlyEmptyArrayObserved$Item();

  factory XRePropertyIncompleteOnlyEmptyArrayObserved$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$XRePropertyIncompleteOnlyEmptyArrayObserved$ItemFromJson(json);

  static const toJsonFactory =
      _$XRePropertyIncompleteOnlyEmptyArrayObserved$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$XRePropertyIncompleteOnlyEmptyArrayObserved$ItemToJson(this);

  static const fromJsonFactory =
      _$XRePropertyIncompleteOnlyEmptyArrayObserved$ItemFromJson;

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class CourseSettings {
  const CourseSettings({
    required this.skillLevel,
    required this.isSkillLevelEnabled,
    required this.syllabusUrl,
    required this.timeChannelUrl,
  });

  factory CourseSettings.fromJson(Map<String, dynamic> json) =>
      _$CourseSettingsFromJson(json);

  static const toJsonFactory = _$CourseSettingsToJson;
  Map<String, dynamic> toJson() => _$CourseSettingsToJson(this);

  @JsonKey(
    name: 'skillLevel',
    toJson: courseSkillLevelToJson,
    fromJson: courseSkillLevelFromJson,
  )
  final enums.CourseSkillLevel skillLevel;
  @JsonKey(name: 'isSkillLevelEnabled')
  final bool isSkillLevelEnabled;
  @JsonKey(name: 'syllabusUrl')
  final String? syllabusUrl;
  @JsonKey(name: 'timeChannelUrl')
  final String? timeChannelUrl;
  static const fromJsonFactory = _$CourseSettingsFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CourseSettings &&
            (identical(other.skillLevel, skillLevel) ||
                const DeepCollectionEquality().equals(
                  other.skillLevel,
                  skillLevel,
                )) &&
            (identical(other.isSkillLevelEnabled, isSkillLevelEnabled) ||
                const DeepCollectionEquality().equals(
                  other.isSkillLevelEnabled,
                  isSkillLevelEnabled,
                )) &&
            (identical(other.syllabusUrl, syllabusUrl) ||
                const DeepCollectionEquality().equals(
                  other.syllabusUrl,
                  syllabusUrl,
                )) &&
            (identical(other.timeChannelUrl, timeChannelUrl) ||
                const DeepCollectionEquality().equals(
                  other.timeChannelUrl,
                  timeChannelUrl,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(skillLevel) ^
      const DeepCollectionEquality().hash(isSkillLevelEnabled) ^
      const DeepCollectionEquality().hash(syllabusUrl) ^
      const DeepCollectionEquality().hash(timeChannelUrl) ^
      runtimeType.hashCode;
}

extension $CourseSettingsExtension on CourseSettings {
  CourseSettings copyWith({
    enums.CourseSkillLevel? skillLevel,
    bool? isSkillLevelEnabled,
    String? syllabusUrl,
    String? timeChannelUrl,
  }) {
    return CourseSettings(
      skillLevel: skillLevel ?? this.skillLevel,
      isSkillLevelEnabled: isSkillLevelEnabled ?? this.isSkillLevelEnabled,
      syllabusUrl: syllabusUrl ?? this.syllabusUrl,
      timeChannelUrl: timeChannelUrl ?? this.timeChannelUrl,
    );
  }

  CourseSettings copyWithWrapped({
    Wrapped<enums.CourseSkillLevel>? skillLevel,
    Wrapped<bool>? isSkillLevelEnabled,
    Wrapped<String?>? syllabusUrl,
    Wrapped<String?>? timeChannelUrl,
  }) {
    return CourseSettings(
      skillLevel: (skillLevel != null ? skillLevel.value : this.skillLevel),
      isSkillLevelEnabled: (isSkillLevelEnabled != null
          ? isSkillLevelEnabled.value
          : this.isSkillLevelEnabled),
      syllabusUrl: (syllabusUrl != null ? syllabusUrl.value : this.syllabusUrl),
      timeChannelUrl: (timeChannelUrl != null
          ? timeChannelUrl.value
          : this.timeChannelUrl),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class CourseSummaryItem {
  const CourseSummaryItem({
    required this.id,
    required this.name,
    required this.state,
    required this.publishDate,
    required this.publishedAt,
    required this.settings,
    required this.subjectId,
    required this.isArchived,
    required this.category,
    required this.categoryCover,
  });

  factory CourseSummaryItem.fromJson(Map<String, dynamic> json) =>
      _$CourseSummaryItemFromJson(json);

  static const toJsonFactory = _$CourseSummaryItemToJson;
  Map<String, dynamic> toJson() => _$CourseSummaryItemToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(
    name: 'state',
    toJson: publicationStateToJson,
    fromJson: publicationStateFromJson,
  )
  final enums.PublicationState state;
  @JsonKey(name: 'publishDate')
  final String? publishDate;
  @JsonKey(name: 'publishedAt')
  final String? publishedAt;
  @JsonKey(name: 'settings')
  final CourseSettings settings;
  @JsonKey(name: 'subjectId')
  final int? subjectId;
  @JsonKey(name: 'isArchived')
  final bool isArchived;
  @JsonKey(
    name: 'category',
    toJson: courseCategoryToJson,
    fromJson: courseCategoryFromJson,
  )
  final enums.CourseCategory category;
  @JsonKey(
    name: 'categoryCover',
    toJson: courseCategoryCoverToJson,
    fromJson: courseCategoryCoverFromJson,
  )
  final enums.CourseCategoryCover categoryCover;
  static const fromJsonFactory = _$CourseSummaryItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CourseSummaryItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.publishDate, publishDate) ||
                const DeepCollectionEquality().equals(
                  other.publishDate,
                  publishDate,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.settings, settings) ||
                const DeepCollectionEquality().equals(
                  other.settings,
                  settings,
                )) &&
            (identical(other.subjectId, subjectId) ||
                const DeepCollectionEquality().equals(
                  other.subjectId,
                  subjectId,
                )) &&
            (identical(other.isArchived, isArchived) ||
                const DeepCollectionEquality().equals(
                  other.isArchived,
                  isArchived,
                )) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality().equals(
                  other.category,
                  category,
                )) &&
            (identical(other.categoryCover, categoryCover) ||
                const DeepCollectionEquality().equals(
                  other.categoryCover,
                  categoryCover,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(publishDate) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(settings) ^
      const DeepCollectionEquality().hash(subjectId) ^
      const DeepCollectionEquality().hash(isArchived) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(categoryCover) ^
      runtimeType.hashCode;
}

extension $CourseSummaryItemExtension on CourseSummaryItem {
  CourseSummaryItem copyWith({
    int? id,
    String? name,
    enums.PublicationState? state,
    String? publishDate,
    String? publishedAt,
    CourseSettings? settings,
    int? subjectId,
    bool? isArchived,
    enums.CourseCategory? category,
    enums.CourseCategoryCover? categoryCover,
  }) {
    return CourseSummaryItem(
      id: id ?? this.id,
      name: name ?? this.name,
      state: state ?? this.state,
      publishDate: publishDate ?? this.publishDate,
      publishedAt: publishedAt ?? this.publishedAt,
      settings: settings ?? this.settings,
      subjectId: subjectId ?? this.subjectId,
      isArchived: isArchived ?? this.isArchived,
      category: category ?? this.category,
      categoryCover: categoryCover ?? this.categoryCover,
    );
  }

  CourseSummaryItem copyWithWrapped({
    Wrapped<int>? id,
    Wrapped<String>? name,
    Wrapped<enums.PublicationState>? state,
    Wrapped<String?>? publishDate,
    Wrapped<String?>? publishedAt,
    Wrapped<CourseSettings>? settings,
    Wrapped<int?>? subjectId,
    Wrapped<bool>? isArchived,
    Wrapped<enums.CourseCategory>? category,
    Wrapped<enums.CourseCategoryCover>? categoryCover,
  }) {
    return CourseSummaryItem(
      id: (id != null ? id.value : this.id),
      name: (name != null ? name.value : this.name),
      state: (state != null ? state.value : this.state),
      publishDate: (publishDate != null ? publishDate.value : this.publishDate),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      settings: (settings != null ? settings.value : this.settings),
      subjectId: (subjectId != null ? subjectId.value : this.subjectId),
      isArchived: (isArchived != null ? isArchived.value : this.isArchived),
      category: (category != null ? category.value : this.category),
      categoryCover: (categoryCover != null
          ? categoryCover.value
          : this.categoryCover),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Paging {
  const Paging({
    required this.limit,
    required this.offset,
    required this.totalCount,
  });

  factory Paging.fromJson(Map<String, dynamic> json) => _$PagingFromJson(json);

  static const toJsonFactory = _$PagingToJson;
  Map<String, dynamic> toJson() => _$PagingToJson(this);

  @JsonKey(name: 'limit')
  final int limit;
  @JsonKey(name: 'offset')
  final int offset;
  @JsonKey(name: 'totalCount')
  final int totalCount;
  static const fromJsonFactory = _$PagingFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Paging &&
            (identical(other.limit, limit) ||
                const DeepCollectionEquality().equals(other.limit, limit)) &&
            (identical(other.offset, offset) ||
                const DeepCollectionEquality().equals(other.offset, offset)) &&
            (identical(other.totalCount, totalCount) ||
                const DeepCollectionEquality().equals(
                  other.totalCount,
                  totalCount,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(limit) ^
      const DeepCollectionEquality().hash(offset) ^
      const DeepCollectionEquality().hash(totalCount) ^
      runtimeType.hashCode;
}

extension $PagingExtension on Paging {
  Paging copyWith({int? limit, int? offset, int? totalCount}) {
    return Paging(
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
      totalCount: totalCount ?? this.totalCount,
    );
  }

  Paging copyWithWrapped({
    Wrapped<int>? limit,
    Wrapped<int>? offset,
    Wrapped<int>? totalCount,
  }) {
    return Paging(
      limit: (limit != null ? limit.value : this.limit),
      offset: (offset != null ? offset.value : this.offset),
      totalCount: (totalCount != null ? totalCount.value : this.totalCount),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class ListStudentCoursesResponse {
  const ListStudentCoursesResponse({required this.items, required this.paging});

  factory ListStudentCoursesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListStudentCoursesResponseFromJson(json);

  static const toJsonFactory = _$ListStudentCoursesResponseToJson;
  Map<String, dynamic> toJson() => _$ListStudentCoursesResponseToJson(this);

  @JsonKey(name: 'items', defaultValue: <CourseSummaryItem>[])
  final List<CourseSummaryItem> items;
  @JsonKey(name: 'paging')
  final Paging paging;
  static const fromJsonFactory = _$ListStudentCoursesResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ListStudentCoursesResponse &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.paging, paging) ||
                const DeepCollectionEquality().equals(other.paging, paging)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(paging) ^
      runtimeType.hashCode;
}

extension $ListStudentCoursesResponseExtension on ListStudentCoursesResponse {
  ListStudentCoursesResponse copyWith({
    List<CourseSummaryItem>? items,
    Paging? paging,
  }) {
    return ListStudentCoursesResponse(
      items: items ?? this.items,
      paging: paging ?? this.paging,
    );
  }

  ListStudentCoursesResponse copyWithWrapped({
    Wrapped<List<CourseSummaryItem>>? items,
    Wrapped<Paging>? paging,
  }) {
    return ListStudentCoursesResponse(
      items: (items != null ? items.value : this.items),
      paging: (paging != null ? paging.value : this.paging),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class CurrentStudentResponse {
  const CurrentStudentResponse({
    required this.id,
    required this.lastName,
    required this.firstName,
    this.middleName,
    required this.universityEmail,
    required this.timeAccount,
    this.studyStartYear,
    required this.studyLevel,
    required this.lateDaysBalance,
  });

  factory CurrentStudentResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrentStudentResponseFromJson(json);

  static const toJsonFactory = _$CurrentStudentResponseToJson;
  Map<String, dynamic> toJson() => _$CurrentStudentResponseToJson(this);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'lastName')
  final String lastName;
  @JsonKey(name: 'firstName')
  final String firstName;
  @JsonKey(name: 'middleName')
  final String? middleName;
  @JsonKey(name: 'universityEmail')
  final String universityEmail;
  @JsonKey(name: 'timeAccount')
  final String timeAccount;
  @JsonKey(name: 'studyStartYear')
  final int? studyStartYear;
  @JsonKey(
    name: 'studyLevel',
    toJson: studyLevelToJson,
    fromJson: studyLevelFromJson,
  )
  final enums.StudyLevel studyLevel;
  @JsonKey(name: 'lateDaysBalance')
  final int lateDaysBalance;
  static const fromJsonFactory = _$CurrentStudentResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CurrentStudentResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality().equals(
                  other.lastName,
                  lastName,
                )) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality().equals(
                  other.firstName,
                  firstName,
                )) &&
            (identical(other.middleName, middleName) ||
                const DeepCollectionEquality().equals(
                  other.middleName,
                  middleName,
                )) &&
            (identical(other.universityEmail, universityEmail) ||
                const DeepCollectionEquality().equals(
                  other.universityEmail,
                  universityEmail,
                )) &&
            (identical(other.timeAccount, timeAccount) ||
                const DeepCollectionEquality().equals(
                  other.timeAccount,
                  timeAccount,
                )) &&
            (identical(other.studyStartYear, studyStartYear) ||
                const DeepCollectionEquality().equals(
                  other.studyStartYear,
                  studyStartYear,
                )) &&
            (identical(other.studyLevel, studyLevel) ||
                const DeepCollectionEquality().equals(
                  other.studyLevel,
                  studyLevel,
                )) &&
            (identical(other.lateDaysBalance, lateDaysBalance) ||
                const DeepCollectionEquality().equals(
                  other.lateDaysBalance,
                  lateDaysBalance,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(middleName) ^
      const DeepCollectionEquality().hash(universityEmail) ^
      const DeepCollectionEquality().hash(timeAccount) ^
      const DeepCollectionEquality().hash(studyStartYear) ^
      const DeepCollectionEquality().hash(studyLevel) ^
      const DeepCollectionEquality().hash(lateDaysBalance) ^
      runtimeType.hashCode;
}

extension $CurrentStudentResponseExtension on CurrentStudentResponse {
  CurrentStudentResponse copyWith({
    String? id,
    String? lastName,
    String? firstName,
    String? middleName,
    String? universityEmail,
    String? timeAccount,
    int? studyStartYear,
    enums.StudyLevel? studyLevel,
    int? lateDaysBalance,
  }) {
    return CurrentStudentResponse(
      id: id ?? this.id,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      universityEmail: universityEmail ?? this.universityEmail,
      timeAccount: timeAccount ?? this.timeAccount,
      studyStartYear: studyStartYear ?? this.studyStartYear,
      studyLevel: studyLevel ?? this.studyLevel,
      lateDaysBalance: lateDaysBalance ?? this.lateDaysBalance,
    );
  }

  CurrentStudentResponse copyWithWrapped({
    Wrapped<String>? id,
    Wrapped<String>? lastName,
    Wrapped<String>? firstName,
    Wrapped<String?>? middleName,
    Wrapped<String>? universityEmail,
    Wrapped<String>? timeAccount,
    Wrapped<int?>? studyStartYear,
    Wrapped<enums.StudyLevel>? studyLevel,
    Wrapped<int>? lateDaysBalance,
  }) {
    return CurrentStudentResponse(
      id: (id != null ? id.value : this.id),
      lastName: (lastName != null ? lastName.value : this.lastName),
      firstName: (firstName != null ? firstName.value : this.firstName),
      middleName: (middleName != null ? middleName.value : this.middleName),
      universityEmail: (universityEmail != null
          ? universityEmail.value
          : this.universityEmail),
      timeAccount: (timeAccount != null ? timeAccount.value : this.timeAccount),
      studyStartYear: (studyStartYear != null
          ? studyStartYear.value
          : this.studyStartYear),
      studyLevel: (studyLevel != null ? studyLevel.value : this.studyLevel),
      lateDaysBalance: (lateDaysBalance != null
          ? lateDaysBalance.value
          : this.lateDaysBalance),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class CourseSummaryByIdResponse {
  const CourseSummaryByIdResponse({
    required this.id,
    required this.name,
    required this.state,
    required this.publishDate,
    required this.publishedAt,
    required this.settings,
    required this.subjectId,
    required this.isArchived,
    required this.category,
    required this.categoryCover,
  });

  factory CourseSummaryByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseSummaryByIdResponseFromJson(json);

  static const toJsonFactory = _$CourseSummaryByIdResponseToJson;
  Map<String, dynamic> toJson() => _$CourseSummaryByIdResponseToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(
    name: 'state',
    toJson: publicationStateToJson,
    fromJson: publicationStateFromJson,
  )
  final enums.PublicationState state;
  @JsonKey(name: 'publishDate')
  final String? publishDate;
  @JsonKey(name: 'publishedAt')
  final String? publishedAt;
  @JsonKey(name: 'settings')
  final CourseSettings settings;
  @JsonKey(name: 'subjectId')
  final int? subjectId;
  @JsonKey(name: 'isArchived')
  final bool isArchived;
  @JsonKey(
    name: 'category',
    toJson: courseCategoryToJson,
    fromJson: courseCategoryFromJson,
  )
  final enums.CourseCategory category;
  @JsonKey(
    name: 'categoryCover',
    toJson: courseCategoryCoverToJson,
    fromJson: courseCategoryCoverFromJson,
  )
  final enums.CourseCategoryCover categoryCover;
  static const fromJsonFactory = _$CourseSummaryByIdResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CourseSummaryByIdResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.publishDate, publishDate) ||
                const DeepCollectionEquality().equals(
                  other.publishDate,
                  publishDate,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.settings, settings) ||
                const DeepCollectionEquality().equals(
                  other.settings,
                  settings,
                )) &&
            (identical(other.subjectId, subjectId) ||
                const DeepCollectionEquality().equals(
                  other.subjectId,
                  subjectId,
                )) &&
            (identical(other.isArchived, isArchived) ||
                const DeepCollectionEquality().equals(
                  other.isArchived,
                  isArchived,
                )) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality().equals(
                  other.category,
                  category,
                )) &&
            (identical(other.categoryCover, categoryCover) ||
                const DeepCollectionEquality().equals(
                  other.categoryCover,
                  categoryCover,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(publishDate) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(settings) ^
      const DeepCollectionEquality().hash(subjectId) ^
      const DeepCollectionEquality().hash(isArchived) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(categoryCover) ^
      runtimeType.hashCode;
}

extension $CourseSummaryByIdResponseExtension on CourseSummaryByIdResponse {
  CourseSummaryByIdResponse copyWith({
    int? id,
    String? name,
    enums.PublicationState? state,
    String? publishDate,
    String? publishedAt,
    CourseSettings? settings,
    int? subjectId,
    bool? isArchived,
    enums.CourseCategory? category,
    enums.CourseCategoryCover? categoryCover,
  }) {
    return CourseSummaryByIdResponse(
      id: id ?? this.id,
      name: name ?? this.name,
      state: state ?? this.state,
      publishDate: publishDate ?? this.publishDate,
      publishedAt: publishedAt ?? this.publishedAt,
      settings: settings ?? this.settings,
      subjectId: subjectId ?? this.subjectId,
      isArchived: isArchived ?? this.isArchived,
      category: category ?? this.category,
      categoryCover: categoryCover ?? this.categoryCover,
    );
  }

  CourseSummaryByIdResponse copyWithWrapped({
    Wrapped<int>? id,
    Wrapped<String>? name,
    Wrapped<enums.PublicationState>? state,
    Wrapped<String?>? publishDate,
    Wrapped<String?>? publishedAt,
    Wrapped<CourseSettings>? settings,
    Wrapped<int?>? subjectId,
    Wrapped<bool>? isArchived,
    Wrapped<enums.CourseCategory>? category,
    Wrapped<enums.CourseCategoryCover>? categoryCover,
  }) {
    return CourseSummaryByIdResponse(
      id: (id != null ? id.value : this.id),
      name: (name != null ? name.value : this.name),
      state: (state != null ? state.value : this.state),
      publishDate: (publishDate != null ? publishDate.value : this.publishDate),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      settings: (settings != null ? settings.value : this.settings),
      subjectId: (subjectId != null ? subjectId.value : this.subjectId),
      isArchived: (isArchived != null ? isArchived.value : this.isArchived),
      category: (category != null ? category.value : this.category),
      categoryCover: (categoryCover != null
          ? categoryCover.value
          : this.categoryCover),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class ActivityDefinition {
  const ActivityDefinition({
    required this.id,
    required this.name,
    required this.weight,
  });

  factory ActivityDefinition.fromJson(Map<String, dynamic> json) =>
      _$ActivityDefinitionFromJson(json);

  static const toJsonFactory = _$ActivityDefinitionToJson;
  Map<String, dynamic> toJson() => _$ActivityDefinitionToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'weight')
  final num weight;
  static const fromJsonFactory = _$ActivityDefinitionFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ActivityDefinition &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.weight, weight) ||
                const DeepCollectionEquality().equals(other.weight, weight)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(weight) ^
      runtimeType.hashCode;
}

extension $ActivityDefinitionExtension on ActivityDefinition {
  ActivityDefinition copyWith({int? id, String? name, num? weight}) {
    return ActivityDefinition(
      id: id ?? this.id,
      name: name ?? this.name,
      weight: weight ?? this.weight,
    );
  }

  ActivityDefinition copyWithWrapped({
    Wrapped<int>? id,
    Wrapped<String>? name,
    Wrapped<num>? weight,
  }) {
    return ActivityDefinition(
      id: (id != null ? id.value : this.id),
      name: (name != null ? name.value : this.name),
      weight: (weight != null ? weight.value : this.weight),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class ExerciseItem {
  const ExerciseItem({
    required this.id,
    required this.name,
    required this.maxScore,
    required this.activity,
    required this.deadline,
  });

  factory ExerciseItem.fromJson(Map<String, dynamic> json) =>
      _$ExerciseItemFromJson(json);

  static const toJsonFactory = _$ExerciseItemToJson;
  Map<String, dynamic> toJson() => _$ExerciseItemToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'maxScore')
  final num maxScore;
  @JsonKey(name: 'activity')
  final ActivityDefinition activity;
  @JsonKey(name: 'deadline')
  final String deadline;
  static const fromJsonFactory = _$ExerciseItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ExerciseItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.maxScore, maxScore) ||
                const DeepCollectionEquality().equals(
                  other.maxScore,
                  maxScore,
                )) &&
            (identical(other.activity, activity) ||
                const DeepCollectionEquality().equals(
                  other.activity,
                  activity,
                )) &&
            (identical(other.deadline, deadline) ||
                const DeepCollectionEquality().equals(
                  other.deadline,
                  deadline,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(maxScore) ^
      const DeepCollectionEquality().hash(activity) ^
      const DeepCollectionEquality().hash(deadline) ^
      runtimeType.hashCode;
}

extension $ExerciseItemExtension on ExerciseItem {
  ExerciseItem copyWith({
    int? id,
    String? name,
    num? maxScore,
    ActivityDefinition? activity,
    String? deadline,
  }) {
    return ExerciseItem(
      id: id ?? this.id,
      name: name ?? this.name,
      maxScore: maxScore ?? this.maxScore,
      activity: activity ?? this.activity,
      deadline: deadline ?? this.deadline,
    );
  }

  ExerciseItem copyWithWrapped({
    Wrapped<int>? id,
    Wrapped<String>? name,
    Wrapped<num>? maxScore,
    Wrapped<ActivityDefinition>? activity,
    Wrapped<String>? deadline,
  }) {
    return ExerciseItem(
      id: (id != null ? id.value : this.id),
      name: (name != null ? name.value : this.name),
      maxScore: (maxScore != null ? maxScore.value : this.maxScore),
      activity: (activity != null ? activity.value : this.activity),
      deadline: (deadline != null ? deadline.value : this.deadline),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class LongreadItem {
  const LongreadItem({
    required this.id,
    required this.type,
    required this.name,
    required this.state,
    required this.publishDate,
    required this.publishedAt,
    required this.exercises,
  });

  factory LongreadItem.fromJson(Map<String, dynamic> json) =>
      _$LongreadItemFromJson(json);

  static const toJsonFactory = _$LongreadItemToJson;
  Map<String, dynamic> toJson() => _$LongreadItemToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(
    name: 'type',
    toJson: longreadTypeToJson,
    fromJson: longreadTypeFromJson,
  )
  final enums.LongreadType type;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(
    name: 'state',
    toJson: publicationStateToJson,
    fromJson: publicationStateFromJson,
  )
  final enums.PublicationState state;
  @JsonKey(name: 'publishDate')
  final String? publishDate;
  @JsonKey(name: 'publishedAt')
  final String? publishedAt;
  @JsonKey(name: 'exercises', defaultValue: <ExerciseItem>[])
  final List<ExerciseItem> exercises;
  static const fromJsonFactory = _$LongreadItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LongreadItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.publishDate, publishDate) ||
                const DeepCollectionEquality().equals(
                  other.publishDate,
                  publishDate,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.exercises, exercises) ||
                const DeepCollectionEquality().equals(
                  other.exercises,
                  exercises,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(publishDate) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(exercises) ^
      runtimeType.hashCode;
}

extension $LongreadItemExtension on LongreadItem {
  LongreadItem copyWith({
    int? id,
    enums.LongreadType? type,
    String? name,
    enums.PublicationState? state,
    String? publishDate,
    String? publishedAt,
    List<ExerciseItem>? exercises,
  }) {
    return LongreadItem(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      state: state ?? this.state,
      publishDate: publishDate ?? this.publishDate,
      publishedAt: publishedAt ?? this.publishedAt,
      exercises: exercises ?? this.exercises,
    );
  }

  LongreadItem copyWithWrapped({
    Wrapped<int>? id,
    Wrapped<enums.LongreadType>? type,
    Wrapped<String>? name,
    Wrapped<enums.PublicationState>? state,
    Wrapped<String?>? publishDate,
    Wrapped<String?>? publishedAt,
    Wrapped<List<ExerciseItem>>? exercises,
  }) {
    return LongreadItem(
      id: (id != null ? id.value : this.id),
      type: (type != null ? type.value : this.type),
      name: (name != null ? name.value : this.name),
      state: (state != null ? state.value : this.state),
      publishDate: (publishDate != null ? publishDate.value : this.publishDate),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      exercises: (exercises != null ? exercises.value : this.exercises),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class CourseThemeItem {
  const CourseThemeItem({
    required this.id,
    required this.name,
    required this.order,
    required this.state,
    required this.publishDate,
    required this.publishedAt,
    required this.longreads,
  });

  factory CourseThemeItem.fromJson(Map<String, dynamic> json) =>
      _$CourseThemeItemFromJson(json);

  static const toJsonFactory = _$CourseThemeItemToJson;
  Map<String, dynamic> toJson() => _$CourseThemeItemToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'order')
  final int order;
  @JsonKey(
    name: 'state',
    toJson: publicationStateToJson,
    fromJson: publicationStateFromJson,
  )
  final enums.PublicationState state;
  @JsonKey(name: 'publishDate')
  final String? publishDate;
  @JsonKey(name: 'publishedAt')
  final String? publishedAt;
  @JsonKey(name: 'longreads', defaultValue: <LongreadItem>[])
  final List<LongreadItem> longreads;
  static const fromJsonFactory = _$CourseThemeItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CourseThemeItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.publishDate, publishDate) ||
                const DeepCollectionEquality().equals(
                  other.publishDate,
                  publishDate,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.longreads, longreads) ||
                const DeepCollectionEquality().equals(
                  other.longreads,
                  longreads,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(publishDate) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(longreads) ^
      runtimeType.hashCode;
}

extension $CourseThemeItemExtension on CourseThemeItem {
  CourseThemeItem copyWith({
    int? id,
    String? name,
    int? order,
    enums.PublicationState? state,
    String? publishDate,
    String? publishedAt,
    List<LongreadItem>? longreads,
  }) {
    return CourseThemeItem(
      id: id ?? this.id,
      name: name ?? this.name,
      order: order ?? this.order,
      state: state ?? this.state,
      publishDate: publishDate ?? this.publishDate,
      publishedAt: publishedAt ?? this.publishedAt,
      longreads: longreads ?? this.longreads,
    );
  }

  CourseThemeItem copyWithWrapped({
    Wrapped<int>? id,
    Wrapped<String>? name,
    Wrapped<int>? order,
    Wrapped<enums.PublicationState>? state,
    Wrapped<String?>? publishDate,
    Wrapped<String?>? publishedAt,
    Wrapped<List<LongreadItem>>? longreads,
  }) {
    return CourseThemeItem(
      id: (id != null ? id.value : this.id),
      name: (name != null ? name.value : this.name),
      order: (order != null ? order.value : this.order),
      state: (state != null ? state.value : this.state),
      publishDate: (publishDate != null ? publishDate.value : this.publishDate),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      longreads: (longreads != null ? longreads.value : this.longreads),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class CourseOverviewByIdResponse {
  const CourseOverviewByIdResponse({
    required this.id,
    required this.name,
    required this.isArchived,
    required this.state,
    required this.publishDate,
    required this.publishedAt,
    required this.settings,
    required this.themes,
  });

  factory CourseOverviewByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseOverviewByIdResponseFromJson(json);

  static const toJsonFactory = _$CourseOverviewByIdResponseToJson;
  Map<String, dynamic> toJson() => _$CourseOverviewByIdResponseToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'isArchived')
  final bool isArchived;
  @JsonKey(
    name: 'state',
    toJson: publicationStateToJson,
    fromJson: publicationStateFromJson,
  )
  final enums.PublicationState state;
  @JsonKey(name: 'publishDate')
  final String? publishDate;
  @JsonKey(name: 'publishedAt')
  final String? publishedAt;
  @JsonKey(name: 'settings')
  final CourseSettings settings;
  @JsonKey(name: 'themes', defaultValue: <CourseThemeItem>[])
  final List<CourseThemeItem> themes;
  static const fromJsonFactory = _$CourseOverviewByIdResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CourseOverviewByIdResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.isArchived, isArchived) ||
                const DeepCollectionEquality().equals(
                  other.isArchived,
                  isArchived,
                )) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.publishDate, publishDate) ||
                const DeepCollectionEquality().equals(
                  other.publishDate,
                  publishDate,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.settings, settings) ||
                const DeepCollectionEquality().equals(
                  other.settings,
                  settings,
                )) &&
            (identical(other.themes, themes) ||
                const DeepCollectionEquality().equals(other.themes, themes)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(isArchived) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(publishDate) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(settings) ^
      const DeepCollectionEquality().hash(themes) ^
      runtimeType.hashCode;
}

extension $CourseOverviewByIdResponseExtension on CourseOverviewByIdResponse {
  CourseOverviewByIdResponse copyWith({
    int? id,
    String? name,
    bool? isArchived,
    enums.PublicationState? state,
    String? publishDate,
    String? publishedAt,
    CourseSettings? settings,
    List<CourseThemeItem>? themes,
  }) {
    return CourseOverviewByIdResponse(
      id: id ?? this.id,
      name: name ?? this.name,
      isArchived: isArchived ?? this.isArchived,
      state: state ?? this.state,
      publishDate: publishDate ?? this.publishDate,
      publishedAt: publishedAt ?? this.publishedAt,
      settings: settings ?? this.settings,
      themes: themes ?? this.themes,
    );
  }

  CourseOverviewByIdResponse copyWithWrapped({
    Wrapped<int>? id,
    Wrapped<String>? name,
    Wrapped<bool>? isArchived,
    Wrapped<enums.PublicationState>? state,
    Wrapped<String?>? publishDate,
    Wrapped<String?>? publishedAt,
    Wrapped<CourseSettings>? settings,
    Wrapped<List<CourseThemeItem>>? themes,
  }) {
    return CourseOverviewByIdResponse(
      id: (id != null ? id.value : this.id),
      name: (name != null ? name.value : this.name),
      isArchived: (isArchived != null ? isArchived.value : this.isArchived),
      state: (state != null ? state.value : this.state),
      publishDate: (publishDate != null ? publishDate.value : this.publishDate),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      settings: (settings != null ? settings.value : this.settings),
      themes: (themes != null ? themes.value : this.themes),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class CourseThemeSummaryByIdResponse {
  const CourseThemeSummaryByIdResponse({
    required this.id,
    required this.name,
    required this.state,
    required this.publishDate,
    required this.publishedAt,
    required this.order,
    required this.category,
    required this.categoryCover,
  });

  factory CourseThemeSummaryByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseThemeSummaryByIdResponseFromJson(json);

  static const toJsonFactory = _$CourseThemeSummaryByIdResponseToJson;
  Map<String, dynamic> toJson() => _$CourseThemeSummaryByIdResponseToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(
    name: 'state',
    toJson: publicationStateToJson,
    fromJson: publicationStateFromJson,
  )
  final enums.PublicationState state;
  @JsonKey(name: 'publishDate')
  final String? publishDate;
  @JsonKey(name: 'publishedAt')
  final String? publishedAt;
  @JsonKey(name: 'order')
  final int order;
  @JsonKey(
    name: 'category',
    toJson: courseCategoryToJson,
    fromJson: courseCategoryFromJson,
  )
  final enums.CourseCategory category;
  @JsonKey(name: 'categoryCover')
  final int categoryCover;
  static const fromJsonFactory = _$CourseThemeSummaryByIdResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CourseThemeSummaryByIdResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.publishDate, publishDate) ||
                const DeepCollectionEquality().equals(
                  other.publishDate,
                  publishDate,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality().equals(
                  other.category,
                  category,
                )) &&
            (identical(other.categoryCover, categoryCover) ||
                const DeepCollectionEquality().equals(
                  other.categoryCover,
                  categoryCover,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(publishDate) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(categoryCover) ^
      runtimeType.hashCode;
}

extension $CourseThemeSummaryByIdResponseExtension
    on CourseThemeSummaryByIdResponse {
  CourseThemeSummaryByIdResponse copyWith({
    int? id,
    String? name,
    enums.PublicationState? state,
    String? publishDate,
    String? publishedAt,
    int? order,
    enums.CourseCategory? category,
    int? categoryCover,
  }) {
    return CourseThemeSummaryByIdResponse(
      id: id ?? this.id,
      name: name ?? this.name,
      state: state ?? this.state,
      publishDate: publishDate ?? this.publishDate,
      publishedAt: publishedAt ?? this.publishedAt,
      order: order ?? this.order,
      category: category ?? this.category,
      categoryCover: categoryCover ?? this.categoryCover,
    );
  }

  CourseThemeSummaryByIdResponse copyWithWrapped({
    Wrapped<int>? id,
    Wrapped<String>? name,
    Wrapped<enums.PublicationState>? state,
    Wrapped<String?>? publishDate,
    Wrapped<String?>? publishedAt,
    Wrapped<int>? order,
    Wrapped<enums.CourseCategory>? category,
    Wrapped<int>? categoryCover,
  }) {
    return CourseThemeSummaryByIdResponse(
      id: (id != null ? id.value : this.id),
      name: (name != null ? name.value : this.name),
      state: (state != null ? state.value : this.state),
      publishDate: (publishDate != null ? publishDate.value : this.publishDate),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      order: (order != null ? order.value : this.order),
      category: (category != null ? category.value : this.category),
      categoryCover: (categoryCover != null
          ? categoryCover.value
          : this.categoryCover),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class LongreadSummaryByIdResponse {
  const LongreadSummaryByIdResponse({
    required this.id,
    required this.type,
    required this.name,
    required this.order,
    required this.state,
    required this.publishDate,
    required this.publishedAt,
  });

  factory LongreadSummaryByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$LongreadSummaryByIdResponseFromJson(json);

  static const toJsonFactory = _$LongreadSummaryByIdResponseToJson;
  Map<String, dynamic> toJson() => _$LongreadSummaryByIdResponseToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(
    name: 'type',
    toJson: longreadTypeToJson,
    fromJson: longreadTypeFromJson,
  )
  final enums.LongreadType type;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'order')
  final int order;
  @JsonKey(
    name: 'state',
    toJson: publicationStateToJson,
    fromJson: publicationStateFromJson,
  )
  final enums.PublicationState state;
  @JsonKey(name: 'publishDate')
  final String? publishDate;
  @JsonKey(name: 'publishedAt')
  final String? publishedAt;
  static const fromJsonFactory = _$LongreadSummaryByIdResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LongreadSummaryByIdResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.publishDate, publishDate) ||
                const DeepCollectionEquality().equals(
                  other.publishDate,
                  publishDate,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(publishDate) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      runtimeType.hashCode;
}

extension $LongreadSummaryByIdResponseExtension on LongreadSummaryByIdResponse {
  LongreadSummaryByIdResponse copyWith({
    int? id,
    enums.LongreadType? type,
    String? name,
    int? order,
    enums.PublicationState? state,
    String? publishDate,
    String? publishedAt,
  }) {
    return LongreadSummaryByIdResponse(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      order: order ?? this.order,
      state: state ?? this.state,
      publishDate: publishDate ?? this.publishDate,
      publishedAt: publishedAt ?? this.publishedAt,
    );
  }

  LongreadSummaryByIdResponse copyWithWrapped({
    Wrapped<int>? id,
    Wrapped<enums.LongreadType>? type,
    Wrapped<String>? name,
    Wrapped<int>? order,
    Wrapped<enums.PublicationState>? state,
    Wrapped<String?>? publishDate,
    Wrapped<String?>? publishedAt,
  }) {
    return LongreadSummaryByIdResponse(
      id: (id != null ? id.value : this.id),
      type: (type != null ? type.value : this.type),
      name: (name != null ? name.value : this.name),
      order: (order != null ? order.value : this.order),
      state: (state != null ? state.value : this.state),
      publishDate: (publishDate != null ? publishDate.value : this.publishDate),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class LongreadMaterialContent {
  const LongreadMaterialContent({
    required this.name,
    required this.filename,
    required this.mediaType,
    required this.version,
    required this.length,
  });

  factory LongreadMaterialContent.fromJson(Map<String, dynamic> json) =>
      _$LongreadMaterialContentFromJson(json);

  static const toJsonFactory = _$LongreadMaterialContentToJson;
  Map<String, dynamic> toJson() => _$LongreadMaterialContentToJson(this);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'filename')
  final String filename;
  @JsonKey(
    name: 'mediaType',
    toJson: longreadMaterialMediaTypeUpperToJson,
    fromJson: longreadMaterialMediaTypeUpperFromJson,
  )
  final enums.LongreadMaterialMediaTypeUpper mediaType;
  @JsonKey(name: 'version')
  final String? version;
  @JsonKey(name: 'length')
  final int length;
  static const fromJsonFactory = _$LongreadMaterialContentFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LongreadMaterialContent &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.filename, filename) ||
                const DeepCollectionEquality().equals(
                  other.filename,
                  filename,
                )) &&
            (identical(other.mediaType, mediaType) ||
                const DeepCollectionEquality().equals(
                  other.mediaType,
                  mediaType,
                )) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality().equals(
                  other.version,
                  version,
                )) &&
            (identical(other.length, length) ||
                const DeepCollectionEquality().equals(other.length, length)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(filename) ^
      const DeepCollectionEquality().hash(mediaType) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(length) ^
      runtimeType.hashCode;
}

extension $LongreadMaterialContentExtension on LongreadMaterialContent {
  LongreadMaterialContent copyWith({
    String? name,
    String? filename,
    enums.LongreadMaterialMediaTypeUpper? mediaType,
    String? version,
    int? length,
  }) {
    return LongreadMaterialContent(
      name: name ?? this.name,
      filename: filename ?? this.filename,
      mediaType: mediaType ?? this.mediaType,
      version: version ?? this.version,
      length: length ?? this.length,
    );
  }

  LongreadMaterialContent copyWithWrapped({
    Wrapped<String>? name,
    Wrapped<String>? filename,
    Wrapped<enums.LongreadMaterialMediaTypeUpper>? mediaType,
    Wrapped<String?>? version,
    Wrapped<int>? length,
  }) {
    return LongreadMaterialContent(
      name: (name != null ? name.value : this.name),
      filename: (filename != null ? filename.value : this.filename),
      mediaType: (mediaType != null ? mediaType.value : this.mediaType),
      version: (version != null ? version.value : this.version),
      length: (length != null ? length.value : this.length),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class LongreadMaterialAttachmentItem {
  const LongreadMaterialAttachmentItem({
    required this.name,
    required this.filename,
    required this.mediaType,
    required this.length,
    required this.version,
  });

  factory LongreadMaterialAttachmentItem.fromJson(Map<String, dynamic> json) =>
      _$LongreadMaterialAttachmentItemFromJson(json);

  static const toJsonFactory = _$LongreadMaterialAttachmentItemToJson;
  Map<String, dynamic> toJson() => _$LongreadMaterialAttachmentItemToJson(this);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'filename')
  final String filename;
  @JsonKey(
    name: 'mediaType',
    toJson: fileMediaTypeToJson,
    fromJson: fileMediaTypeFromJson,
  )
  final enums.FileMediaType mediaType;
  @JsonKey(name: 'length')
  final int length;
  @JsonKey(name: 'version')
  final String? version;
  static const fromJsonFactory = _$LongreadMaterialAttachmentItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LongreadMaterialAttachmentItem &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.filename, filename) ||
                const DeepCollectionEquality().equals(
                  other.filename,
                  filename,
                )) &&
            (identical(other.mediaType, mediaType) ||
                const DeepCollectionEquality().equals(
                  other.mediaType,
                  mediaType,
                )) &&
            (identical(other.length, length) ||
                const DeepCollectionEquality().equals(other.length, length)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality().equals(other.version, version)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(filename) ^
      const DeepCollectionEquality().hash(mediaType) ^
      const DeepCollectionEquality().hash(length) ^
      const DeepCollectionEquality().hash(version) ^
      runtimeType.hashCode;
}

extension $LongreadMaterialAttachmentItemExtension
    on LongreadMaterialAttachmentItem {
  LongreadMaterialAttachmentItem copyWith({
    String? name,
    String? filename,
    enums.FileMediaType? mediaType,
    int? length,
    String? version,
  }) {
    return LongreadMaterialAttachmentItem(
      name: name ?? this.name,
      filename: filename ?? this.filename,
      mediaType: mediaType ?? this.mediaType,
      length: length ?? this.length,
      version: version ?? this.version,
    );
  }

  LongreadMaterialAttachmentItem copyWithWrapped({
    Wrapped<String>? name,
    Wrapped<String>? filename,
    Wrapped<enums.FileMediaType>? mediaType,
    Wrapped<int>? length,
    Wrapped<String?>? version,
  }) {
    return LongreadMaterialAttachmentItem(
      name: (name != null ? name.value : this.name),
      filename: (filename != null ? filename.value : this.filename),
      mediaType: (mediaType != null ? mediaType.value : this.mediaType),
      length: (length != null ? length.value : this.length),
      version: (version != null ? version.value : this.version),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class LongreadMaterialCoding {
  const LongreadMaterialCoding({required this.exerciseUrl});

  factory LongreadMaterialCoding.fromJson(Map<String, dynamic> json) =>
      _$LongreadMaterialCodingFromJson(json);

  static const toJsonFactory = _$LongreadMaterialCodingToJson;
  Map<String, dynamic> toJson() => _$LongreadMaterialCodingToJson(this);

  @JsonKey(name: 'exerciseUrl')
  final String? exerciseUrl;
  static const fromJsonFactory = _$LongreadMaterialCodingFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LongreadMaterialCoding &&
            (identical(other.exerciseUrl, exerciseUrl) ||
                const DeepCollectionEquality().equals(
                  other.exerciseUrl,
                  exerciseUrl,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(exerciseUrl) ^ runtimeType.hashCode;
}

extension $LongreadMaterialCodingExtension on LongreadMaterialCoding {
  LongreadMaterialCoding copyWith({String? exerciseUrl}) {
    return LongreadMaterialCoding(exerciseUrl: exerciseUrl ?? this.exerciseUrl);
  }

  LongreadMaterialCoding copyWithWrapped({Wrapped<String?>? exerciseUrl}) {
    return LongreadMaterialCoding(
      exerciseUrl: (exerciseUrl != null ? exerciseUrl.value : this.exerciseUrl),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class LongreadMaterialActivity {
  const LongreadMaterialActivity({
    required this.id,
    required this.name,
    required this.weight,
    required this.maxExercisesCount,
    this.averageScoreThreshold,
    required this.isLateDaysEnabled,
  });

  factory LongreadMaterialActivity.fromJson(Map<String, dynamic> json) =>
      _$LongreadMaterialActivityFromJson(json);

  static const toJsonFactory = _$LongreadMaterialActivityToJson;
  Map<String, dynamic> toJson() => _$LongreadMaterialActivityToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'weight')
  final num weight;
  @JsonKey(name: 'maxExercisesCount')
  final double maxExercisesCount;
  @JsonKey(name: 'averageScoreThreshold')
  final double? averageScoreThreshold;
  @JsonKey(name: 'isLateDaysEnabled')
  final bool isLateDaysEnabled;
  static const fromJsonFactory = _$LongreadMaterialActivityFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LongreadMaterialActivity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.weight, weight) ||
                const DeepCollectionEquality().equals(other.weight, weight)) &&
            (identical(other.maxExercisesCount, maxExercisesCount) ||
                const DeepCollectionEquality().equals(
                  other.maxExercisesCount,
                  maxExercisesCount,
                )) &&
            (identical(other.averageScoreThreshold, averageScoreThreshold) ||
                const DeepCollectionEquality().equals(
                  other.averageScoreThreshold,
                  averageScoreThreshold,
                )) &&
            (identical(other.isLateDaysEnabled, isLateDaysEnabled) ||
                const DeepCollectionEquality().equals(
                  other.isLateDaysEnabled,
                  isLateDaysEnabled,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(weight) ^
      const DeepCollectionEquality().hash(maxExercisesCount) ^
      const DeepCollectionEquality().hash(averageScoreThreshold) ^
      const DeepCollectionEquality().hash(isLateDaysEnabled) ^
      runtimeType.hashCode;
}

extension $LongreadMaterialActivityExtension on LongreadMaterialActivity {
  LongreadMaterialActivity copyWith({
    int? id,
    String? name,
    num? weight,
    double? maxExercisesCount,
    double? averageScoreThreshold,
    bool? isLateDaysEnabled,
  }) {
    return LongreadMaterialActivity(
      id: id ?? this.id,
      name: name ?? this.name,
      weight: weight ?? this.weight,
      maxExercisesCount: maxExercisesCount ?? this.maxExercisesCount,
      averageScoreThreshold:
          averageScoreThreshold ?? this.averageScoreThreshold,
      isLateDaysEnabled: isLateDaysEnabled ?? this.isLateDaysEnabled,
    );
  }

  LongreadMaterialActivity copyWithWrapped({
    Wrapped<int>? id,
    Wrapped<String>? name,
    Wrapped<num>? weight,
    Wrapped<double>? maxExercisesCount,
    Wrapped<double?>? averageScoreThreshold,
    Wrapped<bool>? isLateDaysEnabled,
  }) {
    return LongreadMaterialActivity(
      id: (id != null ? id.value : this.id),
      name: (name != null ? name.value : this.name),
      weight: (weight != null ? weight.value : this.weight),
      maxExercisesCount: (maxExercisesCount != null
          ? maxExercisesCount.value
          : this.maxExercisesCount),
      averageScoreThreshold: (averageScoreThreshold != null
          ? averageScoreThreshold.value
          : this.averageScoreThreshold),
      isLateDaysEnabled: (isLateDaysEnabled != null
          ? isLateDaysEnabled.value
          : this.isLateDaysEnabled),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class LongreadMaterialEstimation {
  const LongreadMaterialEstimation({
    required this.startDate,
    required this.timer,
    this.maxScore,
    this.deadline,
    this.activity,
  });

  factory LongreadMaterialEstimation.fromJson(Map<String, dynamic> json) =>
      _$LongreadMaterialEstimationFromJson(json);

  static const toJsonFactory = _$LongreadMaterialEstimationToJson;
  Map<String, dynamic> toJson() => _$LongreadMaterialEstimationToJson(this);

  @JsonKey(name: 'startDate')
  final String startDate;
  @JsonKey(name: 'timer')
  final String? timer;
  @JsonKey(name: 'maxScore')
  final double? maxScore;
  @JsonKey(name: 'deadline')
  final DateTime? deadline;
  @JsonKey(name: 'activity')
  final LongreadMaterialActivity? activity;
  static const fromJsonFactory = _$LongreadMaterialEstimationFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LongreadMaterialEstimation &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality().equals(
                  other.startDate,
                  startDate,
                )) &&
            (identical(other.timer, timer) ||
                const DeepCollectionEquality().equals(other.timer, timer)) &&
            (identical(other.maxScore, maxScore) ||
                const DeepCollectionEquality().equals(
                  other.maxScore,
                  maxScore,
                )) &&
            (identical(other.deadline, deadline) ||
                const DeepCollectionEquality().equals(
                  other.deadline,
                  deadline,
                )) &&
            (identical(other.activity, activity) ||
                const DeepCollectionEquality().equals(
                  other.activity,
                  activity,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(timer) ^
      const DeepCollectionEquality().hash(maxScore) ^
      const DeepCollectionEquality().hash(deadline) ^
      const DeepCollectionEquality().hash(activity) ^
      runtimeType.hashCode;
}

extension $LongreadMaterialEstimationExtension on LongreadMaterialEstimation {
  LongreadMaterialEstimation copyWith({
    String? startDate,
    String? timer,
    double? maxScore,
    DateTime? deadline,
    LongreadMaterialActivity? activity,
  }) {
    return LongreadMaterialEstimation(
      startDate: startDate ?? this.startDate,
      timer: timer ?? this.timer,
      maxScore: maxScore ?? this.maxScore,
      deadline: deadline ?? this.deadline,
      activity: activity ?? this.activity,
    );
  }

  LongreadMaterialEstimation copyWithWrapped({
    Wrapped<String>? startDate,
    Wrapped<String?>? timer,
    Wrapped<double?>? maxScore,
    Wrapped<DateTime?>? deadline,
    Wrapped<LongreadMaterialActivity?>? activity,
  }) {
    return LongreadMaterialEstimation(
      startDate: (startDate != null ? startDate.value : this.startDate),
      timer: (timer != null ? timer.value : this.timer),
      maxScore: (maxScore != null ? maxScore.value : this.maxScore),
      deadline: (deadline != null ? deadline.value : this.deadline),
      activity: (activity != null ? activity.value : this.activity),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class ExerciseQuestionsSettings {
  const ExerciseQuestionsSettings({
    this.questionsPerAttempt,
    required this.attemptsLimit,
    required this.evaluationStrategy,
  });

  factory ExerciseQuestionsSettings.fromJson(Map<String, dynamic> json) =>
      _$ExerciseQuestionsSettingsFromJson(json);

  static const toJsonFactory = _$ExerciseQuestionsSettingsToJson;
  Map<String, dynamic> toJson() => _$ExerciseQuestionsSettingsToJson(this);

  @JsonKey(name: 'questionsPerAttempt')
  final String? questionsPerAttempt;
  @JsonKey(name: 'attemptsLimit')
  final int attemptsLimit;
  @JsonKey(
    name: 'evaluationStrategy',
    toJson: questionsSettingsEvalStrategyToJson,
    fromJson: questionsSettingsEvalStrategyFromJson,
  )
  final enums.QuestionsSettingsEvalStrategy evaluationStrategy;
  static const fromJsonFactory = _$ExerciseQuestionsSettingsFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ExerciseQuestionsSettings &&
            (identical(other.questionsPerAttempt, questionsPerAttempt) ||
                const DeepCollectionEquality().equals(
                  other.questionsPerAttempt,
                  questionsPerAttempt,
                )) &&
            (identical(other.attemptsLimit, attemptsLimit) ||
                const DeepCollectionEquality().equals(
                  other.attemptsLimit,
                  attemptsLimit,
                )) &&
            (identical(other.evaluationStrategy, evaluationStrategy) ||
                const DeepCollectionEquality().equals(
                  other.evaluationStrategy,
                  evaluationStrategy,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(questionsPerAttempt) ^
      const DeepCollectionEquality().hash(attemptsLimit) ^
      const DeepCollectionEquality().hash(evaluationStrategy) ^
      runtimeType.hashCode;
}

extension $ExerciseQuestionsSettingsExtension on ExerciseQuestionsSettings {
  ExerciseQuestionsSettings copyWith({
    String? questionsPerAttempt,
    int? attemptsLimit,
    enums.QuestionsSettingsEvalStrategy? evaluationStrategy,
  }) {
    return ExerciseQuestionsSettings(
      questionsPerAttempt: questionsPerAttempt ?? this.questionsPerAttempt,
      attemptsLimit: attemptsLimit ?? this.attemptsLimit,
      evaluationStrategy: evaluationStrategy ?? this.evaluationStrategy,
    );
  }

  ExerciseQuestionsSettings copyWithWrapped({
    Wrapped<String?>? questionsPerAttempt,
    Wrapped<int>? attemptsLimit,
    Wrapped<enums.QuestionsSettingsEvalStrategy>? evaluationStrategy,
  }) {
    return ExerciseQuestionsSettings(
      questionsPerAttempt: (questionsPerAttempt != null
          ? questionsPerAttempt.value
          : this.questionsPerAttempt),
      attemptsLimit: (attemptsLimit != null
          ? attemptsLimit.value
          : this.attemptsLimit),
      evaluationStrategy: (evaluationStrategy != null
          ? evaluationStrategy.value
          : this.evaluationStrategy),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionItemEvaluationBlock {
  const QuestionItemEvaluationBlock({
    required this.correctAnswer,
    required this.autoEvaluation,
    required this.recommendation,
  });

  factory QuestionItemEvaluationBlock.fromJson(Map<String, dynamic> json) =>
      _$QuestionItemEvaluationBlockFromJson(json);

  static const toJsonFactory = _$QuestionItemEvaluationBlockToJson;
  Map<String, dynamic> toJson() => _$QuestionItemEvaluationBlockToJson(this);

  @JsonKey(name: 'correctAnswer')
  final QuestionItemCorrectAnswer? correctAnswer;
  @JsonKey(name: 'autoEvaluation')
  final bool autoEvaluation;
  @JsonKey(name: 'recommendation')
  final String recommendation;
  static const fromJsonFactory = _$QuestionItemEvaluationBlockFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is QuestionItemEvaluationBlock &&
            (identical(other.correctAnswer, correctAnswer) ||
                const DeepCollectionEquality().equals(
                  other.correctAnswer,
                  correctAnswer,
                )) &&
            (identical(other.autoEvaluation, autoEvaluation) ||
                const DeepCollectionEquality().equals(
                  other.autoEvaluation,
                  autoEvaluation,
                )) &&
            (identical(other.recommendation, recommendation) ||
                const DeepCollectionEquality().equals(
                  other.recommendation,
                  recommendation,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(correctAnswer) ^
      const DeepCollectionEquality().hash(autoEvaluation) ^
      const DeepCollectionEquality().hash(recommendation) ^
      runtimeType.hashCode;
}

extension $QuestionItemEvaluationBlockExtension on QuestionItemEvaluationBlock {
  QuestionItemEvaluationBlock copyWith({
    QuestionItemCorrectAnswer? correctAnswer,
    bool? autoEvaluation,
    String? recommendation,
  }) {
    return QuestionItemEvaluationBlock(
      correctAnswer: correctAnswer ?? this.correctAnswer,
      autoEvaluation: autoEvaluation ?? this.autoEvaluation,
      recommendation: recommendation ?? this.recommendation,
    );
  }

  QuestionItemEvaluationBlock copyWithWrapped({
    Wrapped<QuestionItemCorrectAnswer?>? correctAnswer,
    Wrapped<bool>? autoEvaluation,
    Wrapped<String>? recommendation,
  }) {
    return QuestionItemEvaluationBlock(
      correctAnswer: (correctAnswer != null
          ? correctAnswer.value
          : this.correctAnswer),
      autoEvaluation: (autoEvaluation != null
          ? autoEvaluation.value
          : this.autoEvaluation),
      recommendation: (recommendation != null
          ? recommendation.value
          : this.recommendation),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionItemOption {
  const QuestionItemOption({
    required this.id,
    required this.value,
    required this.order,
    required this.isCorrect,
    required this.recommendation,
  });

  factory QuestionItemOption.fromJson(Map<String, dynamic> json) =>
      _$QuestionItemOptionFromJson(json);

  static const toJsonFactory = _$QuestionItemOptionToJson;
  Map<String, dynamic> toJson() => _$QuestionItemOptionToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'value')
  final String value;
  @JsonKey(name: 'order')
  final int order;
  @JsonKey(name: 'isCorrect')
  final bool isCorrect;
  @JsonKey(name: 'recommendation')
  final String? recommendation;
  static const fromJsonFactory = _$QuestionItemOptionFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is QuestionItemOption &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.isCorrect, isCorrect) ||
                const DeepCollectionEquality().equals(
                  other.isCorrect,
                  isCorrect,
                )) &&
            (identical(other.recommendation, recommendation) ||
                const DeepCollectionEquality().equals(
                  other.recommendation,
                  recommendation,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(isCorrect) ^
      const DeepCollectionEquality().hash(recommendation) ^
      runtimeType.hashCode;
}

extension $QuestionItemOptionExtension on QuestionItemOption {
  QuestionItemOption copyWith({
    int? id,
    String? value,
    int? order,
    bool? isCorrect,
    String? recommendation,
  }) {
    return QuestionItemOption(
      id: id ?? this.id,
      value: value ?? this.value,
      order: order ?? this.order,
      isCorrect: isCorrect ?? this.isCorrect,
      recommendation: recommendation ?? this.recommendation,
    );
  }

  QuestionItemOption copyWithWrapped({
    Wrapped<int>? id,
    Wrapped<String>? value,
    Wrapped<int>? order,
    Wrapped<bool>? isCorrect,
    Wrapped<String?>? recommendation,
  }) {
    return QuestionItemOption(
      id: (id != null ? id.value : this.id),
      value: (value != null ? value.value : this.value),
      order: (order != null ? order.value : this.order),
      isCorrect: (isCorrect != null ? isCorrect.value : this.isCorrect),
      recommendation: (recommendation != null
          ? recommendation.value
          : this.recommendation),
    );
  }
}

typedef QuestionItemOptions = List<QuestionItemOption>;

@JsonSerializable(explicitToJson: true)
class QuestionItemCorrectAnswerInputStringCorrectAnswer {
  const QuestionItemCorrectAnswerInputStringCorrectAnswer({
    required this.type,
    required this.variants,
  });

  factory QuestionItemCorrectAnswerInputStringCorrectAnswer.fromJson(
    Map<String, dynamic> json,
  ) => _$QuestionItemCorrectAnswerInputStringCorrectAnswerFromJson(json);

  static const toJsonFactory =
      _$QuestionItemCorrectAnswerInputStringCorrectAnswerToJson;
  Map<String, dynamic> toJson() =>
      _$QuestionItemCorrectAnswerInputStringCorrectAnswerToJson(this);

  @JsonKey(
    name: 'type',
    toJson: questionItemCorrectAnswerInputStringCorrectAnswerTypeToJson,
    fromJson: questionItemCorrectAnswerInputStringCorrectAnswerTypeFromJson,
  )
  final enums.QuestionItemCorrectAnswerInputStringCorrectAnswerType type;
  @JsonKey(name: 'variants', defaultValue: <String>[])
  final List<String> variants;
  static const fromJsonFactory =
      _$QuestionItemCorrectAnswerInputStringCorrectAnswerFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is QuestionItemCorrectAnswerInputStringCorrectAnswer &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.variants, variants) ||
                const DeepCollectionEquality().equals(
                  other.variants,
                  variants,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(variants) ^
      runtimeType.hashCode;
}

extension $QuestionItemCorrectAnswerInputStringCorrectAnswerExtension
    on QuestionItemCorrectAnswerInputStringCorrectAnswer {
  QuestionItemCorrectAnswerInputStringCorrectAnswer copyWith({
    enums.QuestionItemCorrectAnswerInputStringCorrectAnswerType? type,
    List<String>? variants,
  }) {
    return QuestionItemCorrectAnswerInputStringCorrectAnswer(
      type: type ?? this.type,
      variants: variants ?? this.variants,
    );
  }

  QuestionItemCorrectAnswerInputStringCorrectAnswer copyWithWrapped({
    Wrapped<enums.QuestionItemCorrectAnswerInputStringCorrectAnswerType>? type,
    Wrapped<List<String>>? variants,
  }) {
    return QuestionItemCorrectAnswerInputStringCorrectAnswer(
      type: (type != null ? type.value : this.type),
      variants: (variants != null ? variants.value : this.variants),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionItemCorrectAnswerInputNumberCorrectAnswer {
  const QuestionItemCorrectAnswerInputNumberCorrectAnswer({
    required this.type,
    required this.variants,
    required this.showPrecisionHint,
    this.autoEvaluationPrecision,
    this.precision,
  });

  factory QuestionItemCorrectAnswerInputNumberCorrectAnswer.fromJson(
    Map<String, dynamic> json,
  ) => _$QuestionItemCorrectAnswerInputNumberCorrectAnswerFromJson(json);

  static const toJsonFactory =
      _$QuestionItemCorrectAnswerInputNumberCorrectAnswerToJson;
  Map<String, dynamic> toJson() =>
      _$QuestionItemCorrectAnswerInputNumberCorrectAnswerToJson(this);

  @JsonKey(
    name: 'type',
    toJson: questionItemCorrectAnswerInputNumberCorrectAnswerTypeToJson,
    fromJson: questionItemCorrectAnswerInputNumberCorrectAnswerTypeFromJson,
  )
  final enums.QuestionItemCorrectAnswerInputNumberCorrectAnswerType type;
  @JsonKey(name: 'variants', defaultValue: <double>[])
  final List<double> variants;
  @JsonKey(name: 'showPrecisionHint')
  final bool showPrecisionHint;
  @JsonKey(name: 'autoEvaluationPrecision')
  final String? autoEvaluationPrecision;
  @JsonKey(name: 'precision')
  final int? precision;
  static const fromJsonFactory =
      _$QuestionItemCorrectAnswerInputNumberCorrectAnswerFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is QuestionItemCorrectAnswerInputNumberCorrectAnswer &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.variants, variants) ||
                const DeepCollectionEquality().equals(
                  other.variants,
                  variants,
                )) &&
            (identical(other.showPrecisionHint, showPrecisionHint) ||
                const DeepCollectionEquality().equals(
                  other.showPrecisionHint,
                  showPrecisionHint,
                )) &&
            (identical(
                  other.autoEvaluationPrecision,
                  autoEvaluationPrecision,
                ) ||
                const DeepCollectionEquality().equals(
                  other.autoEvaluationPrecision,
                  autoEvaluationPrecision,
                )) &&
            (identical(other.precision, precision) ||
                const DeepCollectionEquality().equals(
                  other.precision,
                  precision,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(variants) ^
      const DeepCollectionEquality().hash(showPrecisionHint) ^
      const DeepCollectionEquality().hash(autoEvaluationPrecision) ^
      const DeepCollectionEquality().hash(precision) ^
      runtimeType.hashCode;
}

extension $QuestionItemCorrectAnswerInputNumberCorrectAnswerExtension
    on QuestionItemCorrectAnswerInputNumberCorrectAnswer {
  QuestionItemCorrectAnswerInputNumberCorrectAnswer copyWith({
    enums.QuestionItemCorrectAnswerInputNumberCorrectAnswerType? type,
    List<double>? variants,
    bool? showPrecisionHint,
    String? autoEvaluationPrecision,
    int? precision,
  }) {
    return QuestionItemCorrectAnswerInputNumberCorrectAnswer(
      type: type ?? this.type,
      variants: variants ?? this.variants,
      showPrecisionHint: showPrecisionHint ?? this.showPrecisionHint,
      autoEvaluationPrecision:
          autoEvaluationPrecision ?? this.autoEvaluationPrecision,
      precision: precision ?? this.precision,
    );
  }

  QuestionItemCorrectAnswerInputNumberCorrectAnswer copyWithWrapped({
    Wrapped<enums.QuestionItemCorrectAnswerInputNumberCorrectAnswerType>? type,
    Wrapped<List<double>>? variants,
    Wrapped<bool>? showPrecisionHint,
    Wrapped<String?>? autoEvaluationPrecision,
    Wrapped<int?>? precision,
  }) {
    return QuestionItemCorrectAnswerInputNumberCorrectAnswer(
      type: (type != null ? type.value : this.type),
      variants: (variants != null ? variants.value : this.variants),
      showPrecisionHint: (showPrecisionHint != null
          ? showPrecisionHint.value
          : this.showPrecisionHint),
      autoEvaluationPrecision: (autoEvaluationPrecision != null
          ? autoEvaluationPrecision.value
          : this.autoEvaluationPrecision),
      precision: (precision != null ? precision.value : this.precision),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class QuestionItemCorrectAnswer {
  const QuestionItemCorrectAnswer();

  factory QuestionItemCorrectAnswer.fromJson(Map<String, dynamic> json) =>
      _$QuestionItemCorrectAnswerFromJson(json);

  static const toJsonFactory = _$QuestionItemCorrectAnswerToJson;
  Map<String, dynamic> toJson() => _$QuestionItemCorrectAnswerToJson(this);

  static const fromJsonFactory = _$QuestionItemCorrectAnswerFromJson;

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class LongreadExerciseInputQuestionItem {
  const LongreadExerciseInputQuestionItem({
    required this.type,
    required this.id,
    required this.order,
    required this.content,
    required this.score,
    required this.attachments,
    required this.correctAnswer,
    required this.autoEvaluation,
    required this.recommendation,
    required this.input,
  });

  factory LongreadExerciseInputQuestionItem.fromJson(
    Map<String, dynamic> json,
  ) => _$LongreadExerciseInputQuestionItemFromJson(json);

  static const toJsonFactory = _$LongreadExerciseInputQuestionItemToJson;
  Map<String, dynamic> toJson() =>
      _$LongreadExerciseInputQuestionItemToJson(this);

  @JsonKey(
    name: 'type',
    toJson: longreadExerciseInputQuestionItemTypeToJson,
    fromJson: longreadExerciseInputQuestionItemTypeFromJson,
  )
  final enums.LongreadExerciseInputQuestionItemType type;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'order')
  final int order;
  @JsonKey(name: 'content')
  final String content;
  @JsonKey(name: 'score')
  final num score;
  @JsonKey(
    name: 'attachments',
    defaultValue: <LongreadMaterialAttachmentItem>[],
  )
  final List<LongreadMaterialAttachmentItem> attachments;
  @JsonKey(name: 'correctAnswer')
  final QuestionItemCorrectAnswer? correctAnswer;
  @JsonKey(name: 'autoEvaluation')
  final bool autoEvaluation;
  @JsonKey(name: 'recommendation')
  final String? recommendation;
  @JsonKey(name: 'input')
  final QuestionItemEvaluationBlock input;
  static const fromJsonFactory = _$LongreadExerciseInputQuestionItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LongreadExerciseInputQuestionItem &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(
                  other.content,
                  content,
                )) &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)) &&
            (identical(other.attachments, attachments) ||
                const DeepCollectionEquality().equals(
                  other.attachments,
                  attachments,
                )) &&
            (identical(other.correctAnswer, correctAnswer) ||
                const DeepCollectionEquality().equals(
                  other.correctAnswer,
                  correctAnswer,
                )) &&
            (identical(other.autoEvaluation, autoEvaluation) ||
                const DeepCollectionEquality().equals(
                  other.autoEvaluation,
                  autoEvaluation,
                )) &&
            (identical(other.recommendation, recommendation) ||
                const DeepCollectionEquality().equals(
                  other.recommendation,
                  recommendation,
                )) &&
            (identical(other.input, input) ||
                const DeepCollectionEquality().equals(other.input, input)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(score) ^
      const DeepCollectionEquality().hash(attachments) ^
      const DeepCollectionEquality().hash(correctAnswer) ^
      const DeepCollectionEquality().hash(autoEvaluation) ^
      const DeepCollectionEquality().hash(recommendation) ^
      const DeepCollectionEquality().hash(input) ^
      runtimeType.hashCode;
}

extension $LongreadExerciseInputQuestionItemExtension
    on LongreadExerciseInputQuestionItem {
  LongreadExerciseInputQuestionItem copyWith({
    enums.LongreadExerciseInputQuestionItemType? type,
    int? id,
    int? order,
    String? content,
    num? score,
    List<LongreadMaterialAttachmentItem>? attachments,
    QuestionItemCorrectAnswer? correctAnswer,
    bool? autoEvaluation,
    String? recommendation,
    QuestionItemEvaluationBlock? input,
  }) {
    return LongreadExerciseInputQuestionItem(
      type: type ?? this.type,
      id: id ?? this.id,
      order: order ?? this.order,
      content: content ?? this.content,
      score: score ?? this.score,
      attachments: attachments ?? this.attachments,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      autoEvaluation: autoEvaluation ?? this.autoEvaluation,
      recommendation: recommendation ?? this.recommendation,
      input: input ?? this.input,
    );
  }

  LongreadExerciseInputQuestionItem copyWithWrapped({
    Wrapped<enums.LongreadExerciseInputQuestionItemType>? type,
    Wrapped<int>? id,
    Wrapped<int>? order,
    Wrapped<String>? content,
    Wrapped<num>? score,
    Wrapped<List<LongreadMaterialAttachmentItem>>? attachments,
    Wrapped<QuestionItemCorrectAnswer?>? correctAnswer,
    Wrapped<bool>? autoEvaluation,
    Wrapped<String?>? recommendation,
    Wrapped<QuestionItemEvaluationBlock>? input,
  }) {
    return LongreadExerciseInputQuestionItem(
      type: (type != null ? type.value : this.type),
      id: (id != null ? id.value : this.id),
      order: (order != null ? order.value : this.order),
      content: (content != null ? content.value : this.content),
      score: (score != null ? score.value : this.score),
      attachments: (attachments != null ? attachments.value : this.attachments),
      correctAnswer: (correctAnswer != null
          ? correctAnswer.value
          : this.correctAnswer),
      autoEvaluation: (autoEvaluation != null
          ? autoEvaluation.value
          : this.autoEvaluation),
      recommendation: (recommendation != null
          ? recommendation.value
          : this.recommendation),
      input: (input != null ? input.value : this.input),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class LongreadExerciseSingleChoiceQuestionitem {
  const LongreadExerciseSingleChoiceQuestionitem({
    required this.type,
    required this.id,
    required this.order,
    required this.content,
    required this.score,
    required this.attachments,
    required this.options,
    required this.areOptionsShuffled,
    required this.singleChoice,
  });

  factory LongreadExerciseSingleChoiceQuestionitem.fromJson(
    Map<String, dynamic> json,
  ) => _$LongreadExerciseSingleChoiceQuestionitemFromJson(json);

  static const toJsonFactory = _$LongreadExerciseSingleChoiceQuestionitemToJson;
  Map<String, dynamic> toJson() =>
      _$LongreadExerciseSingleChoiceQuestionitemToJson(this);

  @JsonKey(
    name: 'type',
    toJson: longreadExerciseSingleChoiceQuestionitemTypeToJson,
    fromJson: longreadExerciseSingleChoiceQuestionitemTypeFromJson,
  )
  final enums.LongreadExerciseSingleChoiceQuestionitemType type;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'order')
  final int order;
  @JsonKey(name: 'content')
  final String content;
  @JsonKey(name: 'score')
  final num score;
  @JsonKey(
    name: 'attachments',
    defaultValue: <LongreadMaterialAttachmentItem>[],
  )
  final List<LongreadMaterialAttachmentItem> attachments;
  @JsonKey(name: 'options')
  final List<QuestionItemOption> options;
  @JsonKey(name: 'areOptionsShuffled')
  final bool areOptionsShuffled;
  @JsonKey(name: 'singleChoice')
  final LongreadExerciseSingleChoiceQuestionitem$SingleChoice singleChoice;
  static const fromJsonFactory =
      _$LongreadExerciseSingleChoiceQuestionitemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LongreadExerciseSingleChoiceQuestionitem &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(
                  other.content,
                  content,
                )) &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)) &&
            (identical(other.attachments, attachments) ||
                const DeepCollectionEquality().equals(
                  other.attachments,
                  attachments,
                )) &&
            (identical(other.options, options) ||
                const DeepCollectionEquality().equals(
                  other.options,
                  options,
                )) &&
            (identical(other.areOptionsShuffled, areOptionsShuffled) ||
                const DeepCollectionEquality().equals(
                  other.areOptionsShuffled,
                  areOptionsShuffled,
                )) &&
            (identical(other.singleChoice, singleChoice) ||
                const DeepCollectionEquality().equals(
                  other.singleChoice,
                  singleChoice,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(score) ^
      const DeepCollectionEquality().hash(attachments) ^
      const DeepCollectionEquality().hash(options) ^
      const DeepCollectionEquality().hash(areOptionsShuffled) ^
      const DeepCollectionEquality().hash(singleChoice) ^
      runtimeType.hashCode;
}

extension $LongreadExerciseSingleChoiceQuestionitemExtension
    on LongreadExerciseSingleChoiceQuestionitem {
  LongreadExerciseSingleChoiceQuestionitem copyWith({
    enums.LongreadExerciseSingleChoiceQuestionitemType? type,
    int? id,
    int? order,
    String? content,
    num? score,
    List<LongreadMaterialAttachmentItem>? attachments,
    List<QuestionItemOption>? options,
    bool? areOptionsShuffled,
    LongreadExerciseSingleChoiceQuestionitem$SingleChoice? singleChoice,
  }) {
    return LongreadExerciseSingleChoiceQuestionitem(
      type: type ?? this.type,
      id: id ?? this.id,
      order: order ?? this.order,
      content: content ?? this.content,
      score: score ?? this.score,
      attachments: attachments ?? this.attachments,
      options: options ?? this.options,
      areOptionsShuffled: areOptionsShuffled ?? this.areOptionsShuffled,
      singleChoice: singleChoice ?? this.singleChoice,
    );
  }

  LongreadExerciseSingleChoiceQuestionitem copyWithWrapped({
    Wrapped<enums.LongreadExerciseSingleChoiceQuestionitemType>? type,
    Wrapped<int>? id,
    Wrapped<int>? order,
    Wrapped<String>? content,
    Wrapped<num>? score,
    Wrapped<List<LongreadMaterialAttachmentItem>>? attachments,
    Wrapped<List<QuestionItemOption>>? options,
    Wrapped<bool>? areOptionsShuffled,
    Wrapped<LongreadExerciseSingleChoiceQuestionitem$SingleChoice>?
    singleChoice,
  }) {
    return LongreadExerciseSingleChoiceQuestionitem(
      type: (type != null ? type.value : this.type),
      id: (id != null ? id.value : this.id),
      order: (order != null ? order.value : this.order),
      content: (content != null ? content.value : this.content),
      score: (score != null ? score.value : this.score),
      attachments: (attachments != null ? attachments.value : this.attachments),
      options: (options != null ? options.value : this.options),
      areOptionsShuffled: (areOptionsShuffled != null
          ? areOptionsShuffled.value
          : this.areOptionsShuffled),
      singleChoice: (singleChoice != null
          ? singleChoice.value
          : this.singleChoice),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class LongreadExerciseMultipleChoiceQuestionItem {
  const LongreadExerciseMultipleChoiceQuestionItem({
    required this.type,
    required this.id,
    required this.order,
    required this.content,
    required this.score,
    required this.attachments,
    required this.options,
    required this.areOptionsShuffled,
    required this.multipleChoice,
  });

  factory LongreadExerciseMultipleChoiceQuestionItem.fromJson(
    Map<String, dynamic> json,
  ) => _$LongreadExerciseMultipleChoiceQuestionItemFromJson(json);

  static const toJsonFactory =
      _$LongreadExerciseMultipleChoiceQuestionItemToJson;
  Map<String, dynamic> toJson() =>
      _$LongreadExerciseMultipleChoiceQuestionItemToJson(this);

  @JsonKey(
    name: 'type',
    toJson: longreadExerciseMultipleChoiceQuestionItemTypeToJson,
    fromJson: longreadExerciseMultipleChoiceQuestionItemTypeFromJson,
  )
  final enums.LongreadExerciseMultipleChoiceQuestionItemType type;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'order')
  final int order;
  @JsonKey(name: 'content')
  final String content;
  @JsonKey(name: 'score')
  final num score;
  @JsonKey(
    name: 'attachments',
    defaultValue: <LongreadMaterialAttachmentItem>[],
  )
  final List<LongreadMaterialAttachmentItem> attachments;
  @JsonKey(name: 'options')
  final List<QuestionItemOption> options;
  @JsonKey(name: 'areOptionsShuffled')
  final bool areOptionsShuffled;
  @JsonKey(name: 'multipleChoice')
  final LongreadExerciseMultipleChoiceQuestionItem$MultipleChoice
  multipleChoice;
  static const fromJsonFactory =
      _$LongreadExerciseMultipleChoiceQuestionItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LongreadExerciseMultipleChoiceQuestionItem &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(
                  other.content,
                  content,
                )) &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)) &&
            (identical(other.attachments, attachments) ||
                const DeepCollectionEquality().equals(
                  other.attachments,
                  attachments,
                )) &&
            (identical(other.options, options) ||
                const DeepCollectionEquality().equals(
                  other.options,
                  options,
                )) &&
            (identical(other.areOptionsShuffled, areOptionsShuffled) ||
                const DeepCollectionEquality().equals(
                  other.areOptionsShuffled,
                  areOptionsShuffled,
                )) &&
            (identical(other.multipleChoice, multipleChoice) ||
                const DeepCollectionEquality().equals(
                  other.multipleChoice,
                  multipleChoice,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(score) ^
      const DeepCollectionEquality().hash(attachments) ^
      const DeepCollectionEquality().hash(options) ^
      const DeepCollectionEquality().hash(areOptionsShuffled) ^
      const DeepCollectionEquality().hash(multipleChoice) ^
      runtimeType.hashCode;
}

extension $LongreadExerciseMultipleChoiceQuestionItemExtension
    on LongreadExerciseMultipleChoiceQuestionItem {
  LongreadExerciseMultipleChoiceQuestionItem copyWith({
    enums.LongreadExerciseMultipleChoiceQuestionItemType? type,
    int? id,
    int? order,
    String? content,
    num? score,
    List<LongreadMaterialAttachmentItem>? attachments,
    List<QuestionItemOption>? options,
    bool? areOptionsShuffled,
    LongreadExerciseMultipleChoiceQuestionItem$MultipleChoice? multipleChoice,
  }) {
    return LongreadExerciseMultipleChoiceQuestionItem(
      type: type ?? this.type,
      id: id ?? this.id,
      order: order ?? this.order,
      content: content ?? this.content,
      score: score ?? this.score,
      attachments: attachments ?? this.attachments,
      options: options ?? this.options,
      areOptionsShuffled: areOptionsShuffled ?? this.areOptionsShuffled,
      multipleChoice: multipleChoice ?? this.multipleChoice,
    );
  }

  LongreadExerciseMultipleChoiceQuestionItem copyWithWrapped({
    Wrapped<enums.LongreadExerciseMultipleChoiceQuestionItemType>? type,
    Wrapped<int>? id,
    Wrapped<int>? order,
    Wrapped<String>? content,
    Wrapped<num>? score,
    Wrapped<List<LongreadMaterialAttachmentItem>>? attachments,
    Wrapped<List<QuestionItemOption>>? options,
    Wrapped<bool>? areOptionsShuffled,
    Wrapped<LongreadExerciseMultipleChoiceQuestionItem$MultipleChoice>?
    multipleChoice,
  }) {
    return LongreadExerciseMultipleChoiceQuestionItem(
      type: (type != null ? type.value : this.type),
      id: (id != null ? id.value : this.id),
      order: (order != null ? order.value : this.order),
      content: (content != null ? content.value : this.content),
      score: (score != null ? score.value : this.score),
      attachments: (attachments != null ? attachments.value : this.attachments),
      options: (options != null ? options.value : this.options),
      areOptionsShuffled: (areOptionsShuffled != null
          ? areOptionsShuffled.value
          : this.areOptionsShuffled),
      multipleChoice: (multipleChoice != null
          ? multipleChoice.value
          : this.multipleChoice),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class LongreadExerciseQuestionItem {
  const LongreadExerciseQuestionItem();

  factory LongreadExerciseQuestionItem.fromJson(Map<String, dynamic> json) =>
      _$LongreadExerciseQuestionItemFromJson(json);

  static const toJsonFactory = _$LongreadExerciseQuestionItemToJson;
  Map<String, dynamic> toJson() => _$LongreadExerciseQuestionItemToJson(this);

  static const fromJsonFactory = _$LongreadExerciseQuestionItemFromJson;

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

typedef LongreadExerciseMaterialReviewers = List<String>;
typedef LongreadExerciseMaterialAssignees = List<String>;

@JsonSerializable(explicitToJson: true)
class LongreadMarkdownMaterialItem {
  const LongreadMarkdownMaterialItem({
    required this.discriminator,
    required this.state,
    required this.viewType,
    required this.type,
    required this.id,
    required this.order,
    required this.viewContent,
    required this.publishDate,
    required this.publishedAt,
  });

  factory LongreadMarkdownMaterialItem.fromJson(Map<String, dynamic> json) =>
      _$LongreadMarkdownMaterialItemFromJson(json);

  static const toJsonFactory = _$LongreadMarkdownMaterialItemToJson;
  Map<String, dynamic> toJson() => _$LongreadMarkdownMaterialItemToJson(this);

  @JsonKey(
    name: 'discriminator',
    toJson: longreadMaterialDiscriminatorToJson,
    fromJson: longreadMaterialDiscriminatorFromJson,
  )
  final enums.LongreadMaterialDiscriminator discriminator;
  @JsonKey(
    name: 'state',
    toJson: publicationStateToJson,
    fromJson: publicationStateFromJson,
  )
  final enums.PublicationState state;
  @JsonKey(
    name: 'viewType',
    toJson: longreadMaterialViewTypeToJson,
    fromJson: longreadMaterialViewTypeFromJson,
  )
  final enums.LongreadMaterialViewType viewType;
  @JsonKey(
    name: 'type',
    toJson: longreadMaterialTypeToJson,
    fromJson: longreadMaterialTypeFromJson,
  )
  final enums.LongreadMaterialType type;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'order')
  final int order;
  @JsonKey(name: 'viewContent')
  final String viewContent;
  @JsonKey(name: 'publishDate')
  final String? publishDate;
  @JsonKey(name: 'publishedAt')
  final String? publishedAt;
  static const fromJsonFactory = _$LongreadMarkdownMaterialItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LongreadMarkdownMaterialItem &&
            (identical(other.discriminator, discriminator) ||
                const DeepCollectionEquality().equals(
                  other.discriminator,
                  discriminator,
                )) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.viewType, viewType) ||
                const DeepCollectionEquality().equals(
                  other.viewType,
                  viewType,
                )) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.viewContent, viewContent) ||
                const DeepCollectionEquality().equals(
                  other.viewContent,
                  viewContent,
                )) &&
            (identical(other.publishDate, publishDate) ||
                const DeepCollectionEquality().equals(
                  other.publishDate,
                  publishDate,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(discriminator) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(viewType) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(viewContent) ^
      const DeepCollectionEquality().hash(publishDate) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      runtimeType.hashCode;
}

extension $LongreadMarkdownMaterialItemExtension
    on LongreadMarkdownMaterialItem {
  LongreadMarkdownMaterialItem copyWith({
    enums.LongreadMaterialDiscriminator? discriminator,
    enums.PublicationState? state,
    enums.LongreadMaterialViewType? viewType,
    enums.LongreadMaterialType? type,
    int? id,
    int? order,
    String? viewContent,
    String? publishDate,
    String? publishedAt,
  }) {
    return LongreadMarkdownMaterialItem(
      discriminator: discriminator ?? this.discriminator,
      state: state ?? this.state,
      viewType: viewType ?? this.viewType,
      type: type ?? this.type,
      id: id ?? this.id,
      order: order ?? this.order,
      viewContent: viewContent ?? this.viewContent,
      publishDate: publishDate ?? this.publishDate,
      publishedAt: publishedAt ?? this.publishedAt,
    );
  }

  LongreadMarkdownMaterialItem copyWithWrapped({
    Wrapped<enums.LongreadMaterialDiscriminator>? discriminator,
    Wrapped<enums.PublicationState>? state,
    Wrapped<enums.LongreadMaterialViewType>? viewType,
    Wrapped<enums.LongreadMaterialType>? type,
    Wrapped<int>? id,
    Wrapped<int>? order,
    Wrapped<String>? viewContent,
    Wrapped<String?>? publishDate,
    Wrapped<String?>? publishedAt,
  }) {
    return LongreadMarkdownMaterialItem(
      discriminator: (discriminator != null
          ? discriminator.value
          : this.discriminator),
      state: (state != null ? state.value : this.state),
      viewType: (viewType != null ? viewType.value : this.viewType),
      type: (type != null ? type.value : this.type),
      id: (id != null ? id.value : this.id),
      order: (order != null ? order.value : this.order),
      viewContent: (viewContent != null ? viewContent.value : this.viewContent),
      publishDate: (publishDate != null ? publishDate.value : this.publishDate),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class LongreadFileMaterialItem {
  const LongreadFileMaterialItem({
    required this.discriminator,
    required this.state,
    required this.viewType,
    required this.type,
    required this.id,
    required this.order,
    required this.mediaType,
    required this.filename,
    required this.version,
    required this.length,
    required this.publishDate,
    required this.publishedAt,
    required this.content,
  });

  factory LongreadFileMaterialItem.fromJson(Map<String, dynamic> json) =>
      _$LongreadFileMaterialItemFromJson(json);

  static const toJsonFactory = _$LongreadFileMaterialItemToJson;
  Map<String, dynamic> toJson() => _$LongreadFileMaterialItemToJson(this);

  @JsonKey(
    name: 'discriminator',
    toJson: longreadMaterialDiscriminatorToJson,
    fromJson: longreadMaterialDiscriminatorFromJson,
  )
  final enums.LongreadMaterialDiscriminator discriminator;
  @JsonKey(
    name: 'state',
    toJson: publicationStateToJson,
    fromJson: publicationStateFromJson,
  )
  final enums.PublicationState state;
  @JsonKey(
    name: 'viewType',
    toJson: longreadMaterialViewTypeToJson,
    fromJson: longreadMaterialViewTypeFromJson,
  )
  final enums.LongreadMaterialViewType viewType;
  @JsonKey(
    name: 'type',
    toJson: longreadMaterialTypeToJson,
    fromJson: longreadMaterialTypeFromJson,
  )
  final enums.LongreadMaterialType type;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'order')
  final int order;
  @JsonKey(
    name: 'mediaType',
    toJson: fileMediaTypeToJson,
    fromJson: fileMediaTypeFromJson,
  )
  final enums.FileMediaType mediaType;
  @JsonKey(name: 'filename')
  final String filename;
  @JsonKey(name: 'version')
  final String? version;
  @JsonKey(name: 'length')
  final int length;
  @JsonKey(name: 'publishDate')
  final String? publishDate;
  @JsonKey(name: 'publishedAt')
  final String? publishedAt;
  @JsonKey(name: 'content')
  final LongreadMaterialContent content;
  static const fromJsonFactory = _$LongreadFileMaterialItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LongreadFileMaterialItem &&
            (identical(other.discriminator, discriminator) ||
                const DeepCollectionEquality().equals(
                  other.discriminator,
                  discriminator,
                )) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.viewType, viewType) ||
                const DeepCollectionEquality().equals(
                  other.viewType,
                  viewType,
                )) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.mediaType, mediaType) ||
                const DeepCollectionEquality().equals(
                  other.mediaType,
                  mediaType,
                )) &&
            (identical(other.filename, filename) ||
                const DeepCollectionEquality().equals(
                  other.filename,
                  filename,
                )) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality().equals(
                  other.version,
                  version,
                )) &&
            (identical(other.length, length) ||
                const DeepCollectionEquality().equals(other.length, length)) &&
            (identical(other.publishDate, publishDate) ||
                const DeepCollectionEquality().equals(
                  other.publishDate,
                  publishDate,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(discriminator) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(viewType) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(mediaType) ^
      const DeepCollectionEquality().hash(filename) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(length) ^
      const DeepCollectionEquality().hash(publishDate) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(content) ^
      runtimeType.hashCode;
}

extension $LongreadFileMaterialItemExtension on LongreadFileMaterialItem {
  LongreadFileMaterialItem copyWith({
    enums.LongreadMaterialDiscriminator? discriminator,
    enums.PublicationState? state,
    enums.LongreadMaterialViewType? viewType,
    enums.LongreadMaterialType? type,
    int? id,
    int? order,
    enums.FileMediaType? mediaType,
    String? filename,
    String? version,
    int? length,
    String? publishDate,
    String? publishedAt,
    LongreadMaterialContent? content,
  }) {
    return LongreadFileMaterialItem(
      discriminator: discriminator ?? this.discriminator,
      state: state ?? this.state,
      viewType: viewType ?? this.viewType,
      type: type ?? this.type,
      id: id ?? this.id,
      order: order ?? this.order,
      mediaType: mediaType ?? this.mediaType,
      filename: filename ?? this.filename,
      version: version ?? this.version,
      length: length ?? this.length,
      publishDate: publishDate ?? this.publishDate,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
    );
  }

  LongreadFileMaterialItem copyWithWrapped({
    Wrapped<enums.LongreadMaterialDiscriminator>? discriminator,
    Wrapped<enums.PublicationState>? state,
    Wrapped<enums.LongreadMaterialViewType>? viewType,
    Wrapped<enums.LongreadMaterialType>? type,
    Wrapped<int>? id,
    Wrapped<int>? order,
    Wrapped<enums.FileMediaType>? mediaType,
    Wrapped<String>? filename,
    Wrapped<String?>? version,
    Wrapped<int>? length,
    Wrapped<String?>? publishDate,
    Wrapped<String?>? publishedAt,
    Wrapped<LongreadMaterialContent>? content,
  }) {
    return LongreadFileMaterialItem(
      discriminator: (discriminator != null
          ? discriminator.value
          : this.discriminator),
      state: (state != null ? state.value : this.state),
      viewType: (viewType != null ? viewType.value : this.viewType),
      type: (type != null ? type.value : this.type),
      id: (id != null ? id.value : this.id),
      order: (order != null ? order.value : this.order),
      mediaType: (mediaType != null ? mediaType.value : this.mediaType),
      filename: (filename != null ? filename.value : this.filename),
      version: (version != null ? version.value : this.version),
      length: (length != null ? length.value : this.length),
      publishDate: (publishDate != null ? publishDate.value : this.publishDate),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      content: (content != null ? content.value : this.content),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class LongreadExerciseCodingMaterialItem {
  const LongreadExerciseCodingMaterialItem({
    required this.discriminator,
    required this.state,
    required this.viewType,
    required this.type,
    required this.id,
    required this.order,
    required this.name,
    required this.viewContent,
    required this.estimation,
    required this.reviewers,
    required this.assignees,
    required this.attachments,
    required this.backloggedAt,
    required this.taskId,
    required this.isTrackingStudents,
    required this.exerciseUrl,
    required this.coding,
  });

  factory LongreadExerciseCodingMaterialItem.fromJson(
    Map<String, dynamic> json,
  ) => _$LongreadExerciseCodingMaterialItemFromJson(json);

  static const toJsonFactory = _$LongreadExerciseCodingMaterialItemToJson;
  Map<String, dynamic> toJson() =>
      _$LongreadExerciseCodingMaterialItemToJson(this);

  @JsonKey(
    name: 'discriminator',
    toJson: longreadMaterialDiscriminatorToJson,
    fromJson: longreadMaterialDiscriminatorFromJson,
  )
  final enums.LongreadMaterialDiscriminator discriminator;
  @JsonKey(
    name: 'state',
    toJson: publicationStateToJson,
    fromJson: publicationStateFromJson,
  )
  final enums.PublicationState state;
  @JsonKey(
    name: 'viewType',
    toJson: longreadMaterialViewTypeToJson,
    fromJson: longreadMaterialViewTypeFromJson,
  )
  final enums.LongreadMaterialViewType viewType;
  @JsonKey(
    name: 'type',
    toJson: longreadMaterialTypeToJson,
    fromJson: longreadMaterialTypeFromJson,
  )
  final enums.LongreadMaterialType type;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'order')
  final int order;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'viewContent')
  final String? viewContent;
  @JsonKey(name: 'estimation')
  final LongreadMaterialEstimation estimation;
  @JsonKey(name: 'reviewers')
  final List<String> reviewers;
  @JsonKey(name: 'assignees')
  final List<String> assignees;
  @JsonKey(
    name: 'attachments',
    defaultValue: <LongreadMaterialAttachmentItem>[],
  )
  final List<LongreadMaterialAttachmentItem> attachments;
  @JsonKey(name: 'backloggedAt')
  final String? backloggedAt;
  @JsonKey(name: 'taskId')
  final int taskId;
  @JsonKey(name: 'isTrackingStudents')
  final bool isTrackingStudents;
  @JsonKey(name: 'exerciseUrl')
  final String? exerciseUrl;
  @JsonKey(name: 'coding')
  final LongreadMaterialCoding coding;
  static const fromJsonFactory = _$LongreadExerciseCodingMaterialItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LongreadExerciseCodingMaterialItem &&
            (identical(other.discriminator, discriminator) ||
                const DeepCollectionEquality().equals(
                  other.discriminator,
                  discriminator,
                )) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.viewType, viewType) ||
                const DeepCollectionEquality().equals(
                  other.viewType,
                  viewType,
                )) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.viewContent, viewContent) ||
                const DeepCollectionEquality().equals(
                  other.viewContent,
                  viewContent,
                )) &&
            (identical(other.estimation, estimation) ||
                const DeepCollectionEquality().equals(
                  other.estimation,
                  estimation,
                )) &&
            (identical(other.reviewers, reviewers) ||
                const DeepCollectionEquality().equals(
                  other.reviewers,
                  reviewers,
                )) &&
            (identical(other.assignees, assignees) ||
                const DeepCollectionEquality().equals(
                  other.assignees,
                  assignees,
                )) &&
            (identical(other.attachments, attachments) ||
                const DeepCollectionEquality().equals(
                  other.attachments,
                  attachments,
                )) &&
            (identical(other.backloggedAt, backloggedAt) ||
                const DeepCollectionEquality().equals(
                  other.backloggedAt,
                  backloggedAt,
                )) &&
            (identical(other.taskId, taskId) ||
                const DeepCollectionEquality().equals(other.taskId, taskId)) &&
            (identical(other.isTrackingStudents, isTrackingStudents) ||
                const DeepCollectionEquality().equals(
                  other.isTrackingStudents,
                  isTrackingStudents,
                )) &&
            (identical(other.exerciseUrl, exerciseUrl) ||
                const DeepCollectionEquality().equals(
                  other.exerciseUrl,
                  exerciseUrl,
                )) &&
            (identical(other.coding, coding) ||
                const DeepCollectionEquality().equals(other.coding, coding)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(discriminator) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(viewType) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(viewContent) ^
      const DeepCollectionEquality().hash(estimation) ^
      const DeepCollectionEquality().hash(reviewers) ^
      const DeepCollectionEquality().hash(assignees) ^
      const DeepCollectionEquality().hash(attachments) ^
      const DeepCollectionEquality().hash(backloggedAt) ^
      const DeepCollectionEquality().hash(taskId) ^
      const DeepCollectionEquality().hash(isTrackingStudents) ^
      const DeepCollectionEquality().hash(exerciseUrl) ^
      const DeepCollectionEquality().hash(coding) ^
      runtimeType.hashCode;
}

extension $LongreadExerciseCodingMaterialItemExtension
    on LongreadExerciseCodingMaterialItem {
  LongreadExerciseCodingMaterialItem copyWith({
    enums.LongreadMaterialDiscriminator? discriminator,
    enums.PublicationState? state,
    enums.LongreadMaterialViewType? viewType,
    enums.LongreadMaterialType? type,
    int? id,
    int? order,
    String? name,
    String? viewContent,
    LongreadMaterialEstimation? estimation,
    List<String>? reviewers,
    List<String>? assignees,
    List<LongreadMaterialAttachmentItem>? attachments,
    String? backloggedAt,
    int? taskId,
    bool? isTrackingStudents,
    String? exerciseUrl,
    LongreadMaterialCoding? coding,
  }) {
    return LongreadExerciseCodingMaterialItem(
      discriminator: discriminator ?? this.discriminator,
      state: state ?? this.state,
      viewType: viewType ?? this.viewType,
      type: type ?? this.type,
      id: id ?? this.id,
      order: order ?? this.order,
      name: name ?? this.name,
      viewContent: viewContent ?? this.viewContent,
      estimation: estimation ?? this.estimation,
      reviewers: reviewers ?? this.reviewers,
      assignees: assignees ?? this.assignees,
      attachments: attachments ?? this.attachments,
      backloggedAt: backloggedAt ?? this.backloggedAt,
      taskId: taskId ?? this.taskId,
      isTrackingStudents: isTrackingStudents ?? this.isTrackingStudents,
      exerciseUrl: exerciseUrl ?? this.exerciseUrl,
      coding: coding ?? this.coding,
    );
  }

  LongreadExerciseCodingMaterialItem copyWithWrapped({
    Wrapped<enums.LongreadMaterialDiscriminator>? discriminator,
    Wrapped<enums.PublicationState>? state,
    Wrapped<enums.LongreadMaterialViewType>? viewType,
    Wrapped<enums.LongreadMaterialType>? type,
    Wrapped<int>? id,
    Wrapped<int>? order,
    Wrapped<String>? name,
    Wrapped<String?>? viewContent,
    Wrapped<LongreadMaterialEstimation>? estimation,
    Wrapped<List<String>>? reviewers,
    Wrapped<List<String>>? assignees,
    Wrapped<List<LongreadMaterialAttachmentItem>>? attachments,
    Wrapped<String?>? backloggedAt,
    Wrapped<int>? taskId,
    Wrapped<bool>? isTrackingStudents,
    Wrapped<String?>? exerciseUrl,
    Wrapped<LongreadMaterialCoding>? coding,
  }) {
    return LongreadExerciseCodingMaterialItem(
      discriminator: (discriminator != null
          ? discriminator.value
          : this.discriminator),
      state: (state != null ? state.value : this.state),
      viewType: (viewType != null ? viewType.value : this.viewType),
      type: (type != null ? type.value : this.type),
      id: (id != null ? id.value : this.id),
      order: (order != null ? order.value : this.order),
      name: (name != null ? name.value : this.name),
      viewContent: (viewContent != null ? viewContent.value : this.viewContent),
      estimation: (estimation != null ? estimation.value : this.estimation),
      reviewers: (reviewers != null ? reviewers.value : this.reviewers),
      assignees: (assignees != null ? assignees.value : this.assignees),
      attachments: (attachments != null ? attachments.value : this.attachments),
      backloggedAt: (backloggedAt != null
          ? backloggedAt.value
          : this.backloggedAt),
      taskId: (taskId != null ? taskId.value : this.taskId),
      isTrackingStudents: (isTrackingStudents != null
          ? isTrackingStudents.value
          : this.isTrackingStudents),
      exerciseUrl: (exerciseUrl != null ? exerciseUrl.value : this.exerciseUrl),
      coding: (coding != null ? coding.value : this.coding),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class LongreadImageMaterialItem {
  const LongreadImageMaterialItem({
    required this.discriminator,
    required this.state,
    required this.viewType,
    required this.type,
    required this.id,
    required this.order,
    this.imageScale,
    required this.mediaType,
    required this.filename,
    required this.version,
    required this.length,
    required this.publishDate,
    required this.publishedAt,
    required this.content,
  });

  factory LongreadImageMaterialItem.fromJson(Map<String, dynamic> json) =>
      _$LongreadImageMaterialItemFromJson(json);

  static const toJsonFactory = _$LongreadImageMaterialItemToJson;
  Map<String, dynamic> toJson() => _$LongreadImageMaterialItemToJson(this);

  @JsonKey(
    name: 'discriminator',
    toJson: longreadMaterialDiscriminatorToJson,
    fromJson: longreadMaterialDiscriminatorFromJson,
  )
  final enums.LongreadMaterialDiscriminator discriminator;
  @JsonKey(
    name: 'state',
    toJson: publicationStateToJson,
    fromJson: publicationStateFromJson,
  )
  final enums.PublicationState state;
  @JsonKey(
    name: 'viewType',
    toJson: longreadMaterialViewTypeToJson,
    fromJson: longreadMaterialViewTypeFromJson,
  )
  final enums.LongreadMaterialViewType viewType;
  @JsonKey(
    name: 'type',
    toJson: longreadMaterialTypeToJson,
    fromJson: longreadMaterialTypeFromJson,
  )
  final enums.LongreadMaterialType type;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'order')
  final int order;
  @JsonKey(name: 'imageScale')
  final int? imageScale;
  @JsonKey(
    name: 'mediaType',
    toJson: fileMediaTypeToJson,
    fromJson: fileMediaTypeFromJson,
  )
  final enums.FileMediaType mediaType;
  @JsonKey(name: 'filename')
  final String filename;
  @JsonKey(name: 'version')
  final String? version;
  @JsonKey(name: 'length')
  final int length;
  @JsonKey(name: 'publishDate')
  final String? publishDate;
  @JsonKey(name: 'publishedAt')
  final String? publishedAt;
  @JsonKey(name: 'content')
  final LongreadMaterialContent content;
  static const fromJsonFactory = _$LongreadImageMaterialItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LongreadImageMaterialItem &&
            (identical(other.discriminator, discriminator) ||
                const DeepCollectionEquality().equals(
                  other.discriminator,
                  discriminator,
                )) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.viewType, viewType) ||
                const DeepCollectionEquality().equals(
                  other.viewType,
                  viewType,
                )) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.imageScale, imageScale) ||
                const DeepCollectionEquality().equals(
                  other.imageScale,
                  imageScale,
                )) &&
            (identical(other.mediaType, mediaType) ||
                const DeepCollectionEquality().equals(
                  other.mediaType,
                  mediaType,
                )) &&
            (identical(other.filename, filename) ||
                const DeepCollectionEquality().equals(
                  other.filename,
                  filename,
                )) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality().equals(
                  other.version,
                  version,
                )) &&
            (identical(other.length, length) ||
                const DeepCollectionEquality().equals(other.length, length)) &&
            (identical(other.publishDate, publishDate) ||
                const DeepCollectionEquality().equals(
                  other.publishDate,
                  publishDate,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(discriminator) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(viewType) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(imageScale) ^
      const DeepCollectionEquality().hash(mediaType) ^
      const DeepCollectionEquality().hash(filename) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(length) ^
      const DeepCollectionEquality().hash(publishDate) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(content) ^
      runtimeType.hashCode;
}

extension $LongreadImageMaterialItemExtension on LongreadImageMaterialItem {
  LongreadImageMaterialItem copyWith({
    enums.LongreadMaterialDiscriminator? discriminator,
    enums.PublicationState? state,
    enums.LongreadMaterialViewType? viewType,
    enums.LongreadMaterialType? type,
    int? id,
    int? order,
    int? imageScale,
    enums.FileMediaType? mediaType,
    String? filename,
    String? version,
    int? length,
    String? publishDate,
    String? publishedAt,
    LongreadMaterialContent? content,
  }) {
    return LongreadImageMaterialItem(
      discriminator: discriminator ?? this.discriminator,
      state: state ?? this.state,
      viewType: viewType ?? this.viewType,
      type: type ?? this.type,
      id: id ?? this.id,
      order: order ?? this.order,
      imageScale: imageScale ?? this.imageScale,
      mediaType: mediaType ?? this.mediaType,
      filename: filename ?? this.filename,
      version: version ?? this.version,
      length: length ?? this.length,
      publishDate: publishDate ?? this.publishDate,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
    );
  }

  LongreadImageMaterialItem copyWithWrapped({
    Wrapped<enums.LongreadMaterialDiscriminator>? discriminator,
    Wrapped<enums.PublicationState>? state,
    Wrapped<enums.LongreadMaterialViewType>? viewType,
    Wrapped<enums.LongreadMaterialType>? type,
    Wrapped<int>? id,
    Wrapped<int>? order,
    Wrapped<int?>? imageScale,
    Wrapped<enums.FileMediaType>? mediaType,
    Wrapped<String>? filename,
    Wrapped<String?>? version,
    Wrapped<int>? length,
    Wrapped<String?>? publishDate,
    Wrapped<String?>? publishedAt,
    Wrapped<LongreadMaterialContent>? content,
  }) {
    return LongreadImageMaterialItem(
      discriminator: (discriminator != null
          ? discriminator.value
          : this.discriminator),
      state: (state != null ? state.value : this.state),
      viewType: (viewType != null ? viewType.value : this.viewType),
      type: (type != null ? type.value : this.type),
      id: (id != null ? id.value : this.id),
      order: (order != null ? order.value : this.order),
      imageScale: (imageScale != null ? imageScale.value : this.imageScale),
      mediaType: (mediaType != null ? mediaType.value : this.mediaType),
      filename: (filename != null ? filename.value : this.filename),
      version: (version != null ? version.value : this.version),
      length: (length != null ? length.value : this.length),
      publishDate: (publishDate != null ? publishDate.value : this.publishDate),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      content: (content != null ? content.value : this.content),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class LongreadExerciseQuestionsMaterialItem {
  const LongreadExerciseQuestionsMaterialItem({
    required this.discriminator,
    required this.state,
    required this.viewType,
    required this.type,
    required this.id,
    required this.order,
    required this.name,
    required this.viewContent,
    required this.estimation,
    required this.reviewers,
    required this.assignees,
    required this.attachments,
    required this.backloggedAt,
    required this.taskId,
    required this.isTrackingStudents,
    required this.mode,
    required this.areQuestionsShuffled,
    required this.settings,
    required this.quizId,
    required this.questions,
  });

  factory LongreadExerciseQuestionsMaterialItem.fromJson(
    Map<String, dynamic> json,
  ) => _$LongreadExerciseQuestionsMaterialItemFromJson(json);

  static const toJsonFactory = _$LongreadExerciseQuestionsMaterialItemToJson;
  Map<String, dynamic> toJson() =>
      _$LongreadExerciseQuestionsMaterialItemToJson(this);

  @JsonKey(
    name: 'discriminator',
    toJson: longreadMaterialDiscriminatorToJson,
    fromJson: longreadMaterialDiscriminatorFromJson,
  )
  final enums.LongreadMaterialDiscriminator discriminator;
  @JsonKey(
    name: 'state',
    toJson: publicationStateToJson,
    fromJson: publicationStateFromJson,
  )
  final enums.PublicationState state;
  @JsonKey(
    name: 'viewType',
    toJson: longreadMaterialViewTypeToJson,
    fromJson: longreadMaterialViewTypeFromJson,
  )
  final enums.LongreadMaterialViewType viewType;
  @JsonKey(
    name: 'type',
    toJson: longreadMaterialTypeToJson,
    fromJson: longreadMaterialTypeFromJson,
  )
  final enums.LongreadMaterialType type;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'order')
  final int order;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'viewContent')
  final String? viewContent;
  @JsonKey(name: 'estimation')
  final LongreadMaterialEstimation estimation;
  @JsonKey(name: 'reviewers')
  final List<String> reviewers;
  @JsonKey(name: 'assignees')
  final List<String> assignees;
  @JsonKey(
    name: 'attachments',
    defaultValue: <LongreadMaterialAttachmentItem>[],
  )
  final List<LongreadMaterialAttachmentItem> attachments;
  @JsonKey(name: 'backloggedAt')
  final String? backloggedAt;
  @JsonKey(name: 'taskId')
  final int taskId;
  @JsonKey(name: 'isTrackingStudents')
  final bool isTrackingStudents;
  @JsonKey(
    name: 'mode',
    toJson: longreadExerciseQuestionsModeToJson,
    fromJson: longreadExerciseQuestionsModeFromJson,
  )
  final enums.LongreadExerciseQuestionsMode mode;
  @JsonKey(name: 'areQuestionsShuffled')
  final bool areQuestionsShuffled;
  @JsonKey(name: 'settings')
  final ExerciseQuestionsSettings settings;
  @JsonKey(name: 'quizId')
  final int quizId;
  @JsonKey(name: 'questions', defaultValue: <LongreadExerciseQuestionItem>[])
  final List<LongreadExerciseQuestionItem> questions;
  static const fromJsonFactory =
      _$LongreadExerciseQuestionsMaterialItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LongreadExerciseQuestionsMaterialItem &&
            (identical(other.discriminator, discriminator) ||
                const DeepCollectionEquality().equals(
                  other.discriminator,
                  discriminator,
                )) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.viewType, viewType) ||
                const DeepCollectionEquality().equals(
                  other.viewType,
                  viewType,
                )) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.viewContent, viewContent) ||
                const DeepCollectionEquality().equals(
                  other.viewContent,
                  viewContent,
                )) &&
            (identical(other.estimation, estimation) ||
                const DeepCollectionEquality().equals(
                  other.estimation,
                  estimation,
                )) &&
            (identical(other.reviewers, reviewers) ||
                const DeepCollectionEquality().equals(
                  other.reviewers,
                  reviewers,
                )) &&
            (identical(other.assignees, assignees) ||
                const DeepCollectionEquality().equals(
                  other.assignees,
                  assignees,
                )) &&
            (identical(other.attachments, attachments) ||
                const DeepCollectionEquality().equals(
                  other.attachments,
                  attachments,
                )) &&
            (identical(other.backloggedAt, backloggedAt) ||
                const DeepCollectionEquality().equals(
                  other.backloggedAt,
                  backloggedAt,
                )) &&
            (identical(other.taskId, taskId) ||
                const DeepCollectionEquality().equals(other.taskId, taskId)) &&
            (identical(other.isTrackingStudents, isTrackingStudents) ||
                const DeepCollectionEquality().equals(
                  other.isTrackingStudents,
                  isTrackingStudents,
                )) &&
            (identical(other.mode, mode) ||
                const DeepCollectionEquality().equals(other.mode, mode)) &&
            (identical(other.areQuestionsShuffled, areQuestionsShuffled) ||
                const DeepCollectionEquality().equals(
                  other.areQuestionsShuffled,
                  areQuestionsShuffled,
                )) &&
            (identical(other.settings, settings) ||
                const DeepCollectionEquality().equals(
                  other.settings,
                  settings,
                )) &&
            (identical(other.quizId, quizId) ||
                const DeepCollectionEquality().equals(other.quizId, quizId)) &&
            (identical(other.questions, questions) ||
                const DeepCollectionEquality().equals(
                  other.questions,
                  questions,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(discriminator) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(viewType) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(viewContent) ^
      const DeepCollectionEquality().hash(estimation) ^
      const DeepCollectionEquality().hash(reviewers) ^
      const DeepCollectionEquality().hash(assignees) ^
      const DeepCollectionEquality().hash(attachments) ^
      const DeepCollectionEquality().hash(backloggedAt) ^
      const DeepCollectionEquality().hash(taskId) ^
      const DeepCollectionEquality().hash(isTrackingStudents) ^
      const DeepCollectionEquality().hash(mode) ^
      const DeepCollectionEquality().hash(areQuestionsShuffled) ^
      const DeepCollectionEquality().hash(settings) ^
      const DeepCollectionEquality().hash(quizId) ^
      const DeepCollectionEquality().hash(questions) ^
      runtimeType.hashCode;
}

extension $LongreadExerciseQuestionsMaterialItemExtension
    on LongreadExerciseQuestionsMaterialItem {
  LongreadExerciseQuestionsMaterialItem copyWith({
    enums.LongreadMaterialDiscriminator? discriminator,
    enums.PublicationState? state,
    enums.LongreadMaterialViewType? viewType,
    enums.LongreadMaterialType? type,
    int? id,
    int? order,
    String? name,
    String? viewContent,
    LongreadMaterialEstimation? estimation,
    List<String>? reviewers,
    List<String>? assignees,
    List<LongreadMaterialAttachmentItem>? attachments,
    String? backloggedAt,
    int? taskId,
    bool? isTrackingStudents,
    enums.LongreadExerciseQuestionsMode? mode,
    bool? areQuestionsShuffled,
    ExerciseQuestionsSettings? settings,
    int? quizId,
    List<LongreadExerciseQuestionItem>? questions,
  }) {
    return LongreadExerciseQuestionsMaterialItem(
      discriminator: discriminator ?? this.discriminator,
      state: state ?? this.state,
      viewType: viewType ?? this.viewType,
      type: type ?? this.type,
      id: id ?? this.id,
      order: order ?? this.order,
      name: name ?? this.name,
      viewContent: viewContent ?? this.viewContent,
      estimation: estimation ?? this.estimation,
      reviewers: reviewers ?? this.reviewers,
      assignees: assignees ?? this.assignees,
      attachments: attachments ?? this.attachments,
      backloggedAt: backloggedAt ?? this.backloggedAt,
      taskId: taskId ?? this.taskId,
      isTrackingStudents: isTrackingStudents ?? this.isTrackingStudents,
      mode: mode ?? this.mode,
      areQuestionsShuffled: areQuestionsShuffled ?? this.areQuestionsShuffled,
      settings: settings ?? this.settings,
      quizId: quizId ?? this.quizId,
      questions: questions ?? this.questions,
    );
  }

  LongreadExerciseQuestionsMaterialItem copyWithWrapped({
    Wrapped<enums.LongreadMaterialDiscriminator>? discriminator,
    Wrapped<enums.PublicationState>? state,
    Wrapped<enums.LongreadMaterialViewType>? viewType,
    Wrapped<enums.LongreadMaterialType>? type,
    Wrapped<int>? id,
    Wrapped<int>? order,
    Wrapped<String>? name,
    Wrapped<String?>? viewContent,
    Wrapped<LongreadMaterialEstimation>? estimation,
    Wrapped<List<String>>? reviewers,
    Wrapped<List<String>>? assignees,
    Wrapped<List<LongreadMaterialAttachmentItem>>? attachments,
    Wrapped<String?>? backloggedAt,
    Wrapped<int>? taskId,
    Wrapped<bool>? isTrackingStudents,
    Wrapped<enums.LongreadExerciseQuestionsMode>? mode,
    Wrapped<bool>? areQuestionsShuffled,
    Wrapped<ExerciseQuestionsSettings>? settings,
    Wrapped<int>? quizId,
    Wrapped<List<LongreadExerciseQuestionItem>>? questions,
  }) {
    return LongreadExerciseQuestionsMaterialItem(
      discriminator: (discriminator != null
          ? discriminator.value
          : this.discriminator),
      state: (state != null ? state.value : this.state),
      viewType: (viewType != null ? viewType.value : this.viewType),
      type: (type != null ? type.value : this.type),
      id: (id != null ? id.value : this.id),
      order: (order != null ? order.value : this.order),
      name: (name != null ? name.value : this.name),
      viewContent: (viewContent != null ? viewContent.value : this.viewContent),
      estimation: (estimation != null ? estimation.value : this.estimation),
      reviewers: (reviewers != null ? reviewers.value : this.reviewers),
      assignees: (assignees != null ? assignees.value : this.assignees),
      attachments: (attachments != null ? attachments.value : this.attachments),
      backloggedAt: (backloggedAt != null
          ? backloggedAt.value
          : this.backloggedAt),
      taskId: (taskId != null ? taskId.value : this.taskId),
      isTrackingStudents: (isTrackingStudents != null
          ? isTrackingStudents.value
          : this.isTrackingStudents),
      mode: (mode != null ? mode.value : this.mode),
      areQuestionsShuffled: (areQuestionsShuffled != null
          ? areQuestionsShuffled.value
          : this.areQuestionsShuffled),
      settings: (settings != null ? settings.value : this.settings),
      quizId: (quizId != null ? quizId.value : this.quizId),
      questions: (questions != null ? questions.value : this.questions),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class LongreadVideoPlatformMaterialItem {
  const LongreadVideoPlatformMaterialItem({
    required this.discriminator,
    required this.state,
    required this.viewType,
    required this.type,
    required this.id,
    required this.order,
    required this.name,
    required this.description,
    required this.videoId,
    required this.timecodes,
    required this.publishDate,
    required this.videoState,
    required this.url,
  });

  factory LongreadVideoPlatformMaterialItem.fromJson(
    Map<String, dynamic> json,
  ) => _$LongreadVideoPlatformMaterialItemFromJson(json);

  static const toJsonFactory = _$LongreadVideoPlatformMaterialItemToJson;
  Map<String, dynamic> toJson() =>
      _$LongreadVideoPlatformMaterialItemToJson(this);

  @JsonKey(
    name: 'discriminator',
    toJson: longreadMaterialDiscriminatorToJson,
    fromJson: longreadMaterialDiscriminatorFromJson,
  )
  final enums.LongreadMaterialDiscriminator discriminator;
  @JsonKey(
    name: 'state',
    toJson: publicationStateToJson,
    fromJson: publicationStateFromJson,
  )
  final enums.PublicationState state;
  @JsonKey(
    name: 'viewType',
    toJson: longreadMaterialViewTypeToJson,
    fromJson: longreadMaterialViewTypeFromJson,
  )
  final enums.LongreadMaterialViewType viewType;
  @JsonKey(
    name: 'type',
    toJson: longreadMaterialTypeToJson,
    fromJson: longreadMaterialTypeFromJson,
  )
  final enums.LongreadMaterialType type;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'order')
  final int order;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'videoId')
  final String videoId;
  @JsonKey(name: 'timecodes')
  final XRePropertyIncompleteOnlyEmptyArrayObserved timecodes;
  @JsonKey(name: 'publishDate')
  final String? publishDate;
  @JsonKey(
    name: 'videoState',
    toJson: videoPlatformStateToJson,
    fromJson: videoPlatformStateFromJson,
  )
  final enums.VideoPlatformState videoState;
  @JsonKey(name: 'url')
  final String url;
  static const fromJsonFactory = _$LongreadVideoPlatformMaterialItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LongreadVideoPlatformMaterialItem &&
            (identical(other.discriminator, discriminator) ||
                const DeepCollectionEquality().equals(
                  other.discriminator,
                  discriminator,
                )) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.viewType, viewType) ||
                const DeepCollectionEquality().equals(
                  other.viewType,
                  viewType,
                )) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality().equals(
                  other.description,
                  description,
                )) &&
            (identical(other.videoId, videoId) ||
                const DeepCollectionEquality().equals(
                  other.videoId,
                  videoId,
                )) &&
            (identical(other.timecodes, timecodes) ||
                const DeepCollectionEquality().equals(
                  other.timecodes,
                  timecodes,
                )) &&
            (identical(other.publishDate, publishDate) ||
                const DeepCollectionEquality().equals(
                  other.publishDate,
                  publishDate,
                )) &&
            (identical(other.videoState, videoState) ||
                const DeepCollectionEquality().equals(
                  other.videoState,
                  videoState,
                )) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(discriminator) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(viewType) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(videoId) ^
      const DeepCollectionEquality().hash(timecodes) ^
      const DeepCollectionEquality().hash(publishDate) ^
      const DeepCollectionEquality().hash(videoState) ^
      const DeepCollectionEquality().hash(url) ^
      runtimeType.hashCode;
}

extension $LongreadVideoPlatformMaterialItemExtension
    on LongreadVideoPlatformMaterialItem {
  LongreadVideoPlatformMaterialItem copyWith({
    enums.LongreadMaterialDiscriminator? discriminator,
    enums.PublicationState? state,
    enums.LongreadMaterialViewType? viewType,
    enums.LongreadMaterialType? type,
    int? id,
    int? order,
    String? name,
    String? description,
    String? videoId,
    XRePropertyIncompleteOnlyEmptyArrayObserved? timecodes,
    String? publishDate,
    enums.VideoPlatformState? videoState,
    String? url,
  }) {
    return LongreadVideoPlatformMaterialItem(
      discriminator: discriminator ?? this.discriminator,
      state: state ?? this.state,
      viewType: viewType ?? this.viewType,
      type: type ?? this.type,
      id: id ?? this.id,
      order: order ?? this.order,
      name: name ?? this.name,
      description: description ?? this.description,
      videoId: videoId ?? this.videoId,
      timecodes: timecodes ?? this.timecodes,
      publishDate: publishDate ?? this.publishDate,
      videoState: videoState ?? this.videoState,
      url: url ?? this.url,
    );
  }

  LongreadVideoPlatformMaterialItem copyWithWrapped({
    Wrapped<enums.LongreadMaterialDiscriminator>? discriminator,
    Wrapped<enums.PublicationState>? state,
    Wrapped<enums.LongreadMaterialViewType>? viewType,
    Wrapped<enums.LongreadMaterialType>? type,
    Wrapped<int>? id,
    Wrapped<int>? order,
    Wrapped<String>? name,
    Wrapped<String>? description,
    Wrapped<String>? videoId,
    Wrapped<XRePropertyIncompleteOnlyEmptyArrayObserved>? timecodes,
    Wrapped<String?>? publishDate,
    Wrapped<enums.VideoPlatformState>? videoState,
    Wrapped<String>? url,
  }) {
    return LongreadVideoPlatformMaterialItem(
      discriminator: (discriminator != null
          ? discriminator.value
          : this.discriminator),
      state: (state != null ? state.value : this.state),
      viewType: (viewType != null ? viewType.value : this.viewType),
      type: (type != null ? type.value : this.type),
      id: (id != null ? id.value : this.id),
      order: (order != null ? order.value : this.order),
      name: (name != null ? name.value : this.name),
      description: (description != null ? description.value : this.description),
      videoId: (videoId != null ? videoId.value : this.videoId),
      timecodes: (timecodes != null ? timecodes.value : this.timecodes),
      publishDate: (publishDate != null ? publishDate.value : this.publishDate),
      videoState: (videoState != null ? videoState.value : this.videoState),
      url: (url != null ? url.value : this.url),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class LongreadVideoMaterialItem {
  const LongreadVideoMaterialItem({
    required this.discriminator,
    required this.state,
    required this.viewType,
    required this.type,
    required this.id,
    required this.order,
    required this.mediaType,
    required this.filename,
    required this.version,
    required this.length,
    required this.publishDate,
    required this.publishedAt,
    required this.content,
  });

  factory LongreadVideoMaterialItem.fromJson(Map<String, dynamic> json) =>
      _$LongreadVideoMaterialItemFromJson(json);

  static const toJsonFactory = _$LongreadVideoMaterialItemToJson;
  Map<String, dynamic> toJson() => _$LongreadVideoMaterialItemToJson(this);

  @JsonKey(
    name: 'discriminator',
    toJson: longreadMaterialDiscriminatorToJson,
    fromJson: longreadMaterialDiscriminatorFromJson,
  )
  final enums.LongreadMaterialDiscriminator discriminator;
  @JsonKey(
    name: 'state',
    toJson: publicationStateToJson,
    fromJson: publicationStateFromJson,
  )
  final enums.PublicationState state;
  @JsonKey(
    name: 'viewType',
    toJson: longreadMaterialViewTypeToJson,
    fromJson: longreadMaterialViewTypeFromJson,
  )
  final enums.LongreadMaterialViewType viewType;
  @JsonKey(
    name: 'type',
    toJson: longreadMaterialTypeToJson,
    fromJson: longreadMaterialTypeFromJson,
  )
  final enums.LongreadMaterialType type;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'order')
  final int order;
  @JsonKey(
    name: 'mediaType',
    toJson: fileMediaTypeToJson,
    fromJson: fileMediaTypeFromJson,
  )
  final enums.FileMediaType mediaType;
  @JsonKey(name: 'filename')
  final String filename;
  @JsonKey(name: 'version')
  final String? version;
  @JsonKey(name: 'length')
  final int length;
  @JsonKey(name: 'publishDate')
  final String? publishDate;
  @JsonKey(name: 'publishedAt')
  final String? publishedAt;
  @JsonKey(name: 'content')
  final LongreadMaterialContent content;
  static const fromJsonFactory = _$LongreadVideoMaterialItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LongreadVideoMaterialItem &&
            (identical(other.discriminator, discriminator) ||
                const DeepCollectionEquality().equals(
                  other.discriminator,
                  discriminator,
                )) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.viewType, viewType) ||
                const DeepCollectionEquality().equals(
                  other.viewType,
                  viewType,
                )) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.mediaType, mediaType) ||
                const DeepCollectionEquality().equals(
                  other.mediaType,
                  mediaType,
                )) &&
            (identical(other.filename, filename) ||
                const DeepCollectionEquality().equals(
                  other.filename,
                  filename,
                )) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality().equals(
                  other.version,
                  version,
                )) &&
            (identical(other.length, length) ||
                const DeepCollectionEquality().equals(other.length, length)) &&
            (identical(other.publishDate, publishDate) ||
                const DeepCollectionEquality().equals(
                  other.publishDate,
                  publishDate,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(discriminator) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(viewType) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(mediaType) ^
      const DeepCollectionEquality().hash(filename) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(length) ^
      const DeepCollectionEquality().hash(publishDate) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(content) ^
      runtimeType.hashCode;
}

extension $LongreadVideoMaterialItemExtension on LongreadVideoMaterialItem {
  LongreadVideoMaterialItem copyWith({
    enums.LongreadMaterialDiscriminator? discriminator,
    enums.PublicationState? state,
    enums.LongreadMaterialViewType? viewType,
    enums.LongreadMaterialType? type,
    int? id,
    int? order,
    enums.FileMediaType? mediaType,
    String? filename,
    String? version,
    int? length,
    String? publishDate,
    String? publishedAt,
    LongreadMaterialContent? content,
  }) {
    return LongreadVideoMaterialItem(
      discriminator: discriminator ?? this.discriminator,
      state: state ?? this.state,
      viewType: viewType ?? this.viewType,
      type: type ?? this.type,
      id: id ?? this.id,
      order: order ?? this.order,
      mediaType: mediaType ?? this.mediaType,
      filename: filename ?? this.filename,
      version: version ?? this.version,
      length: length ?? this.length,
      publishDate: publishDate ?? this.publishDate,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
    );
  }

  LongreadVideoMaterialItem copyWithWrapped({
    Wrapped<enums.LongreadMaterialDiscriminator>? discriminator,
    Wrapped<enums.PublicationState>? state,
    Wrapped<enums.LongreadMaterialViewType>? viewType,
    Wrapped<enums.LongreadMaterialType>? type,
    Wrapped<int>? id,
    Wrapped<int>? order,
    Wrapped<enums.FileMediaType>? mediaType,
    Wrapped<String>? filename,
    Wrapped<String?>? version,
    Wrapped<int>? length,
    Wrapped<String?>? publishDate,
    Wrapped<String?>? publishedAt,
    Wrapped<LongreadMaterialContent>? content,
  }) {
    return LongreadVideoMaterialItem(
      discriminator: (discriminator != null
          ? discriminator.value
          : this.discriminator),
      state: (state != null ? state.value : this.state),
      viewType: (viewType != null ? viewType.value : this.viewType),
      type: (type != null ? type.value : this.type),
      id: (id != null ? id.value : this.id),
      order: (order != null ? order.value : this.order),
      mediaType: (mediaType != null ? mediaType.value : this.mediaType),
      filename: (filename != null ? filename.value : this.filename),
      version: (version != null ? version.value : this.version),
      length: (length != null ? length.value : this.length),
      publishDate: (publishDate != null ? publishDate.value : this.publishDate),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      content: (content != null ? content.value : this.content),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class LongreadAudioMaterialItem {
  const LongreadAudioMaterialItem({
    required this.discriminator,
    required this.state,
    required this.viewType,
    required this.type,
    required this.id,
    required this.order,
    required this.mediaType,
    required this.filename,
    required this.version,
    required this.length,
    required this.publishDate,
    required this.publishedAt,
    required this.content,
  });

  factory LongreadAudioMaterialItem.fromJson(Map<String, dynamic> json) =>
      _$LongreadAudioMaterialItemFromJson(json);

  static const toJsonFactory = _$LongreadAudioMaterialItemToJson;
  Map<String, dynamic> toJson() => _$LongreadAudioMaterialItemToJson(this);

  @JsonKey(
    name: 'discriminator',
    toJson: longreadMaterialDiscriminatorToJson,
    fromJson: longreadMaterialDiscriminatorFromJson,
  )
  final enums.LongreadMaterialDiscriminator discriminator;
  @JsonKey(
    name: 'state',
    toJson: publicationStateToJson,
    fromJson: publicationStateFromJson,
  )
  final enums.PublicationState state;
  @JsonKey(
    name: 'viewType',
    toJson: longreadMaterialViewTypeToJson,
    fromJson: longreadMaterialViewTypeFromJson,
  )
  final enums.LongreadMaterialViewType viewType;
  @JsonKey(
    name: 'type',
    toJson: longreadMaterialTypeToJson,
    fromJson: longreadMaterialTypeFromJson,
  )
  final enums.LongreadMaterialType type;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'order')
  final int order;
  @JsonKey(
    name: 'mediaType',
    toJson: fileMediaTypeToJson,
    fromJson: fileMediaTypeFromJson,
  )
  final enums.FileMediaType mediaType;
  @JsonKey(name: 'filename')
  final String filename;
  @JsonKey(name: 'version')
  final String? version;
  @JsonKey(name: 'length')
  final int length;
  @JsonKey(name: 'publishDate')
  final String? publishDate;
  @JsonKey(name: 'publishedAt')
  final String? publishedAt;
  @JsonKey(name: 'content')
  final LongreadMaterialContent content;
  static const fromJsonFactory = _$LongreadAudioMaterialItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LongreadAudioMaterialItem &&
            (identical(other.discriminator, discriminator) ||
                const DeepCollectionEquality().equals(
                  other.discriminator,
                  discriminator,
                )) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.viewType, viewType) ||
                const DeepCollectionEquality().equals(
                  other.viewType,
                  viewType,
                )) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.mediaType, mediaType) ||
                const DeepCollectionEquality().equals(
                  other.mediaType,
                  mediaType,
                )) &&
            (identical(other.filename, filename) ||
                const DeepCollectionEquality().equals(
                  other.filename,
                  filename,
                )) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality().equals(
                  other.version,
                  version,
                )) &&
            (identical(other.length, length) ||
                const DeepCollectionEquality().equals(other.length, length)) &&
            (identical(other.publishDate, publishDate) ||
                const DeepCollectionEquality().equals(
                  other.publishDate,
                  publishDate,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(discriminator) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(viewType) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(mediaType) ^
      const DeepCollectionEquality().hash(filename) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(length) ^
      const DeepCollectionEquality().hash(publishDate) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(content) ^
      runtimeType.hashCode;
}

extension $LongreadAudioMaterialItemExtension on LongreadAudioMaterialItem {
  LongreadAudioMaterialItem copyWith({
    enums.LongreadMaterialDiscriminator? discriminator,
    enums.PublicationState? state,
    enums.LongreadMaterialViewType? viewType,
    enums.LongreadMaterialType? type,
    int? id,
    int? order,
    enums.FileMediaType? mediaType,
    String? filename,
    String? version,
    int? length,
    String? publishDate,
    String? publishedAt,
    LongreadMaterialContent? content,
  }) {
    return LongreadAudioMaterialItem(
      discriminator: discriminator ?? this.discriminator,
      state: state ?? this.state,
      viewType: viewType ?? this.viewType,
      type: type ?? this.type,
      id: id ?? this.id,
      order: order ?? this.order,
      mediaType: mediaType ?? this.mediaType,
      filename: filename ?? this.filename,
      version: version ?? this.version,
      length: length ?? this.length,
      publishDate: publishDate ?? this.publishDate,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
    );
  }

  LongreadAudioMaterialItem copyWithWrapped({
    Wrapped<enums.LongreadMaterialDiscriminator>? discriminator,
    Wrapped<enums.PublicationState>? state,
    Wrapped<enums.LongreadMaterialViewType>? viewType,
    Wrapped<enums.LongreadMaterialType>? type,
    Wrapped<int>? id,
    Wrapped<int>? order,
    Wrapped<enums.FileMediaType>? mediaType,
    Wrapped<String>? filename,
    Wrapped<String?>? version,
    Wrapped<int>? length,
    Wrapped<String?>? publishDate,
    Wrapped<String?>? publishedAt,
    Wrapped<LongreadMaterialContent>? content,
  }) {
    return LongreadAudioMaterialItem(
      discriminator: (discriminator != null
          ? discriminator.value
          : this.discriminator),
      state: (state != null ? state.value : this.state),
      viewType: (viewType != null ? viewType.value : this.viewType),
      type: (type != null ? type.value : this.type),
      id: (id != null ? id.value : this.id),
      order: (order != null ? order.value : this.order),
      mediaType: (mediaType != null ? mediaType.value : this.mediaType),
      filename: (filename != null ? filename.value : this.filename),
      version: (version != null ? version.value : this.version),
      length: (length != null ? length.value : this.length),
      publishDate: (publishDate != null ? publishDate.value : this.publishDate),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      content: (content != null ? content.value : this.content),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class LongreadMaterialItem {
  const LongreadMaterialItem();

  factory LongreadMaterialItem.fromJson(Map<String, dynamic> json) =>
      _$LongreadMaterialItemFromJson(json);

  static const toJsonFactory = _$LongreadMaterialItemToJson;
  Map<String, dynamic> toJson() => _$LongreadMaterialItemToJson(this);

  static const fromJsonFactory = _$LongreadMaterialItemFromJson;

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class LongreadMaterialsByIdResponse {
  const LongreadMaterialsByIdResponse({
    required this.items,
    required this.paging,
  });

  factory LongreadMaterialsByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$LongreadMaterialsByIdResponseFromJson(json);

  static const toJsonFactory = _$LongreadMaterialsByIdResponseToJson;
  Map<String, dynamic> toJson() => _$LongreadMaterialsByIdResponseToJson(this);

  @JsonKey(name: 'items', defaultValue: <LongreadMaterialItem>[])
  final List<LongreadMaterialItem> items;
  @JsonKey(name: 'paging')
  final Paging paging;
  static const fromJsonFactory = _$LongreadMaterialsByIdResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LongreadMaterialsByIdResponse &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.paging, paging) ||
                const DeepCollectionEquality().equals(other.paging, paging)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(paging) ^
      runtimeType.hashCode;
}

extension $LongreadMaterialsByIdResponseExtension
    on LongreadMaterialsByIdResponse {
  LongreadMaterialsByIdResponse copyWith({
    List<LongreadMaterialItem>? items,
    Paging? paging,
  }) {
    return LongreadMaterialsByIdResponse(
      items: items ?? this.items,
      paging: paging ?? this.paging,
    );
  }

  LongreadMaterialsByIdResponse copyWithWrapped({
    Wrapped<List<LongreadMaterialItem>>? items,
    Wrapped<Paging>? paging,
  }) {
    return LongreadMaterialsByIdResponse(
      items: (items != null ? items.value : this.items),
      paging: (paging != null ? paging.value : this.paging),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class TaskExerciseActivity {
  const TaskExerciseActivity({
    required this.id,
    required this.name,
    required this.weight,
    required this.isLateDaysEnabled,
  });

  factory TaskExerciseActivity.fromJson(Map<String, dynamic> json) =>
      _$TaskExerciseActivityFromJson(json);

  static const toJsonFactory = _$TaskExerciseActivityToJson;
  Map<String, dynamic> toJson() => _$TaskExerciseActivityToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'weight')
  final num weight;
  @JsonKey(name: 'isLateDaysEnabled')
  final bool isLateDaysEnabled;
  static const fromJsonFactory = _$TaskExerciseActivityFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskExerciseActivity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.weight, weight) ||
                const DeepCollectionEquality().equals(other.weight, weight)) &&
            (identical(other.isLateDaysEnabled, isLateDaysEnabled) ||
                const DeepCollectionEquality().equals(
                  other.isLateDaysEnabled,
                  isLateDaysEnabled,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(weight) ^
      const DeepCollectionEquality().hash(isLateDaysEnabled) ^
      runtimeType.hashCode;
}

extension $TaskExerciseActivityExtension on TaskExerciseActivity {
  TaskExerciseActivity copyWith({
    int? id,
    String? name,
    num? weight,
    bool? isLateDaysEnabled,
  }) {
    return TaskExerciseActivity(
      id: id ?? this.id,
      name: name ?? this.name,
      weight: weight ?? this.weight,
      isLateDaysEnabled: isLateDaysEnabled ?? this.isLateDaysEnabled,
    );
  }

  TaskExerciseActivity copyWithWrapped({
    Wrapped<int>? id,
    Wrapped<String>? name,
    Wrapped<num>? weight,
    Wrapped<bool>? isLateDaysEnabled,
  }) {
    return TaskExerciseActivity(
      id: (id != null ? id.value : this.id),
      name: (name != null ? name.value : this.name),
      weight: (weight != null ? weight.value : this.weight),
      isLateDaysEnabled: (isLateDaysEnabled != null
          ? isLateDaysEnabled.value
          : this.isLateDaysEnabled),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class TaskAttachment {
  const TaskAttachment({
    required this.name,
    required this.filename,
    required this.mediaType,
    required this.length,
    required this.version,
  });

  factory TaskAttachment.fromJson(Map<String, dynamic> json) =>
      _$TaskAttachmentFromJson(json);

  static const toJsonFactory = _$TaskAttachmentToJson;
  Map<String, dynamic> toJson() => _$TaskAttachmentToJson(this);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'filename')
  final String filename;
  @JsonKey(
    name: 'mediaType',
    toJson: fileMediaTypeToJson,
    fromJson: fileMediaTypeFromJson,
  )
  final enums.FileMediaType mediaType;
  @JsonKey(name: 'length')
  final int length;
  @JsonKey(name: 'version')
  final String? version;
  static const fromJsonFactory = _$TaskAttachmentFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskAttachment &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.filename, filename) ||
                const DeepCollectionEquality().equals(
                  other.filename,
                  filename,
                )) &&
            (identical(other.mediaType, mediaType) ||
                const DeepCollectionEquality().equals(
                  other.mediaType,
                  mediaType,
                )) &&
            (identical(other.length, length) ||
                const DeepCollectionEquality().equals(other.length, length)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality().equals(other.version, version)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(filename) ^
      const DeepCollectionEquality().hash(mediaType) ^
      const DeepCollectionEquality().hash(length) ^
      const DeepCollectionEquality().hash(version) ^
      runtimeType.hashCode;
}

extension $TaskAttachmentExtension on TaskAttachment {
  TaskAttachment copyWith({
    String? name,
    String? filename,
    enums.FileMediaType? mediaType,
    int? length,
    String? version,
  }) {
    return TaskAttachment(
      name: name ?? this.name,
      filename: filename ?? this.filename,
      mediaType: mediaType ?? this.mediaType,
      length: length ?? this.length,
      version: version ?? this.version,
    );
  }

  TaskAttachment copyWithWrapped({
    Wrapped<String>? name,
    Wrapped<String>? filename,
    Wrapped<enums.FileMediaType>? mediaType,
    Wrapped<int>? length,
    Wrapped<String?>? version,
  }) {
    return TaskAttachment(
      name: (name != null ? name.value : this.name),
      filename: (filename != null ? filename.value : this.filename),
      mediaType: (mediaType != null ? mediaType.value : this.mediaType),
      length: (length != null ? length.value : this.length),
      version: (version != null ? version.value : this.version),
    );
  }
}

typedef TaskExerciseQuestionOrders = List<TaskExerciseQuestionOrder>;

@JsonSerializable(explicitToJson: true)
class TaskExerciseQuestionOrder {
  const TaskExerciseQuestionOrder({
    required this.questionId,
    required this.order,
    required this.optionOrders,
  });

  factory TaskExerciseQuestionOrder.fromJson(Map<String, dynamic> json) =>
      _$TaskExerciseQuestionOrderFromJson(json);

  static const toJsonFactory = _$TaskExerciseQuestionOrderToJson;
  Map<String, dynamic> toJson() => _$TaskExerciseQuestionOrderToJson(this);

  @JsonKey(name: 'questionId')
  final int questionId;
  @JsonKey(name: 'order')
  final int order;
  @JsonKey(
    name: 'optionOrders',
    defaultValue: <TaskExerciseQuestionOrderOptionOrder>[],
  )
  final List<TaskExerciseQuestionOrderOptionOrder> optionOrders;
  static const fromJsonFactory = _$TaskExerciseQuestionOrderFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskExerciseQuestionOrder &&
            (identical(other.questionId, questionId) ||
                const DeepCollectionEquality().equals(
                  other.questionId,
                  questionId,
                )) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.optionOrders, optionOrders) ||
                const DeepCollectionEquality().equals(
                  other.optionOrders,
                  optionOrders,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(questionId) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(optionOrders) ^
      runtimeType.hashCode;
}

extension $TaskExerciseQuestionOrderExtension on TaskExerciseQuestionOrder {
  TaskExerciseQuestionOrder copyWith({
    int? questionId,
    int? order,
    List<TaskExerciseQuestionOrderOptionOrder>? optionOrders,
  }) {
    return TaskExerciseQuestionOrder(
      questionId: questionId ?? this.questionId,
      order: order ?? this.order,
      optionOrders: optionOrders ?? this.optionOrders,
    );
  }

  TaskExerciseQuestionOrder copyWithWrapped({
    Wrapped<int>? questionId,
    Wrapped<int>? order,
    Wrapped<List<TaskExerciseQuestionOrderOptionOrder>>? optionOrders,
  }) {
    return TaskExerciseQuestionOrder(
      questionId: (questionId != null ? questionId.value : this.questionId),
      order: (order != null ? order.value : this.order),
      optionOrders: (optionOrders != null
          ? optionOrders.value
          : this.optionOrders),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class TaskExerciseQuestionOrderOptionOrder {
  const TaskExerciseQuestionOrderOptionOrder({
    required this.optionId,
    required this.order,
  });

  factory TaskExerciseQuestionOrderOptionOrder.fromJson(
    Map<String, dynamic> json,
  ) => _$TaskExerciseQuestionOrderOptionOrderFromJson(json);

  static const toJsonFactory = _$TaskExerciseQuestionOrderOptionOrderToJson;
  Map<String, dynamic> toJson() =>
      _$TaskExerciseQuestionOrderOptionOrderToJson(this);

  @JsonKey(name: 'optionId')
  final int optionId;
  @JsonKey(name: 'order')
  final int order;
  static const fromJsonFactory = _$TaskExerciseQuestionOrderOptionOrderFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskExerciseQuestionOrderOptionOrder &&
            (identical(other.optionId, optionId) ||
                const DeepCollectionEquality().equals(
                  other.optionId,
                  optionId,
                )) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(optionId) ^
      const DeepCollectionEquality().hash(order) ^
      runtimeType.hashCode;
}

extension $TaskExerciseQuestionOrderOptionOrderExtension
    on TaskExerciseQuestionOrderOptionOrder {
  TaskExerciseQuestionOrderOptionOrder copyWith({int? optionId, int? order}) {
    return TaskExerciseQuestionOrderOptionOrder(
      optionId: optionId ?? this.optionId,
      order: order ?? this.order,
    );
  }

  TaskExerciseQuestionOrderOptionOrder copyWithWrapped({
    Wrapped<int>? optionId,
    Wrapped<int>? order,
  }) {
    return TaskExerciseQuestionOrderOptionOrder(
      optionId: (optionId != null ? optionId.value : this.optionId),
      order: (order != null ? order.value : this.order),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class TaskExercise {
  const TaskExercise({
    required this.id,
    required this.name,
    required this.type,
    required this.maxScore,
    required this.startDate,
    required this.deadline,
    this.timer,
    required this.activity,
    required this.questionOrders,
    this.areQuestionsShuffled,
    this.quizId,
    this.mode,
    required this.viewContent,
    required this.exerciseUrl,
    this.attachments,
    this.settings,
  });

  factory TaskExercise.fromJson(Map<String, dynamic> json) =>
      _$TaskExerciseFromJson(json);

  static const toJsonFactory = _$TaskExerciseToJson;
  Map<String, dynamic> toJson() => _$TaskExerciseToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'type', toJson: taskTypeToJson, fromJson: taskTypeFromJson)
  final enums.TaskType type;
  @JsonKey(name: 'maxScore')
  final num maxScore;
  @JsonKey(name: 'startDate')
  final String startDate;
  @JsonKey(name: 'deadline')
  final String deadline;
  @JsonKey(name: 'timer')
  final String? timer;
  @JsonKey(name: 'activity')
  final TaskExerciseActivity activity;
  @JsonKey(name: 'questionOrders')
  final List<TaskExerciseQuestionOrder>? questionOrders;
  @JsonKey(name: 'areQuestionsShuffled')
  final bool? areQuestionsShuffled;
  @JsonKey(name: 'quizId')
  final int? quizId;
  @JsonKey(name: 'mode')
  final String? mode;
  @JsonKey(name: 'viewContent')
  final String? viewContent;
  @JsonKey(name: 'exerciseUrl')
  final String? exerciseUrl;
  @JsonKey(name: 'attachments', defaultValue: <TaskAttachment>[])
  final List<TaskAttachment>? attachments;
  @JsonKey(name: 'settings')
  final ExerciseQuestionsSettings? settings;
  static const fromJsonFactory = _$TaskExerciseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskExercise &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.maxScore, maxScore) ||
                const DeepCollectionEquality().equals(
                  other.maxScore,
                  maxScore,
                )) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality().equals(
                  other.startDate,
                  startDate,
                )) &&
            (identical(other.deadline, deadline) ||
                const DeepCollectionEquality().equals(
                  other.deadline,
                  deadline,
                )) &&
            (identical(other.timer, timer) ||
                const DeepCollectionEquality().equals(other.timer, timer)) &&
            (identical(other.activity, activity) ||
                const DeepCollectionEquality().equals(
                  other.activity,
                  activity,
                )) &&
            (identical(other.questionOrders, questionOrders) ||
                const DeepCollectionEquality().equals(
                  other.questionOrders,
                  questionOrders,
                )) &&
            (identical(other.areQuestionsShuffled, areQuestionsShuffled) ||
                const DeepCollectionEquality().equals(
                  other.areQuestionsShuffled,
                  areQuestionsShuffled,
                )) &&
            (identical(other.quizId, quizId) ||
                const DeepCollectionEquality().equals(other.quizId, quizId)) &&
            (identical(other.mode, mode) ||
                const DeepCollectionEquality().equals(other.mode, mode)) &&
            (identical(other.viewContent, viewContent) ||
                const DeepCollectionEquality().equals(
                  other.viewContent,
                  viewContent,
                )) &&
            (identical(other.exerciseUrl, exerciseUrl) ||
                const DeepCollectionEquality().equals(
                  other.exerciseUrl,
                  exerciseUrl,
                )) &&
            (identical(other.attachments, attachments) ||
                const DeepCollectionEquality().equals(
                  other.attachments,
                  attachments,
                )) &&
            (identical(other.settings, settings) ||
                const DeepCollectionEquality().equals(
                  other.settings,
                  settings,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(maxScore) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(deadline) ^
      const DeepCollectionEquality().hash(timer) ^
      const DeepCollectionEquality().hash(activity) ^
      const DeepCollectionEquality().hash(questionOrders) ^
      const DeepCollectionEquality().hash(areQuestionsShuffled) ^
      const DeepCollectionEquality().hash(quizId) ^
      const DeepCollectionEquality().hash(mode) ^
      const DeepCollectionEquality().hash(viewContent) ^
      const DeepCollectionEquality().hash(exerciseUrl) ^
      const DeepCollectionEquality().hash(attachments) ^
      const DeepCollectionEquality().hash(settings) ^
      runtimeType.hashCode;
}

extension $TaskExerciseExtension on TaskExercise {
  TaskExercise copyWith({
    int? id,
    String? name,
    enums.TaskType? type,
    num? maxScore,
    String? startDate,
    String? deadline,
    String? timer,
    TaskExerciseActivity? activity,
    List<TaskExerciseQuestionOrder>? questionOrders,
    bool? areQuestionsShuffled,
    int? quizId,
    String? mode,
    String? viewContent,
    String? exerciseUrl,
    List<TaskAttachment>? attachments,
    ExerciseQuestionsSettings? settings,
  }) {
    return TaskExercise(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      maxScore: maxScore ?? this.maxScore,
      startDate: startDate ?? this.startDate,
      deadline: deadline ?? this.deadline,
      timer: timer ?? this.timer,
      activity: activity ?? this.activity,
      questionOrders: questionOrders ?? this.questionOrders,
      areQuestionsShuffled: areQuestionsShuffled ?? this.areQuestionsShuffled,
      quizId: quizId ?? this.quizId,
      mode: mode ?? this.mode,
      viewContent: viewContent ?? this.viewContent,
      exerciseUrl: exerciseUrl ?? this.exerciseUrl,
      attachments: attachments ?? this.attachments,
      settings: settings ?? this.settings,
    );
  }

  TaskExercise copyWithWrapped({
    Wrapped<int>? id,
    Wrapped<String>? name,
    Wrapped<enums.TaskType>? type,
    Wrapped<num>? maxScore,
    Wrapped<String>? startDate,
    Wrapped<String>? deadline,
    Wrapped<String?>? timer,
    Wrapped<TaskExerciseActivity>? activity,
    Wrapped<List<TaskExerciseQuestionOrder>?>? questionOrders,
    Wrapped<bool?>? areQuestionsShuffled,
    Wrapped<int?>? quizId,
    Wrapped<String?>? mode,
    Wrapped<String?>? viewContent,
    Wrapped<String?>? exerciseUrl,
    Wrapped<List<TaskAttachment>?>? attachments,
    Wrapped<ExerciseQuestionsSettings?>? settings,
  }) {
    return TaskExercise(
      id: (id != null ? id.value : this.id),
      name: (name != null ? name.value : this.name),
      type: (type != null ? type.value : this.type),
      maxScore: (maxScore != null ? maxScore.value : this.maxScore),
      startDate: (startDate != null ? startDate.value : this.startDate),
      deadline: (deadline != null ? deadline.value : this.deadline),
      timer: (timer != null ? timer.value : this.timer),
      activity: (activity != null ? activity.value : this.activity),
      questionOrders: (questionOrders != null
          ? questionOrders.value
          : this.questionOrders),
      areQuestionsShuffled: (areQuestionsShuffled != null
          ? areQuestionsShuffled.value
          : this.areQuestionsShuffled),
      quizId: (quizId != null ? quizId.value : this.quizId),
      mode: (mode != null ? mode.value : this.mode),
      viewContent: (viewContent != null ? viewContent.value : this.viewContent),
      exerciseUrl: (exerciseUrl != null ? exerciseUrl.value : this.exerciseUrl),
      attachments: (attachments != null ? attachments.value : this.attachments),
      settings: (settings != null ? settings.value : this.settings),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class TaskCourse {
  const TaskCourse({
    required this.id,
    required this.name,
    required this.isArchived,
  });

  factory TaskCourse.fromJson(Map<String, dynamic> json) =>
      _$TaskCourseFromJson(json);

  static const toJsonFactory = _$TaskCourseToJson;
  Map<String, dynamic> toJson() => _$TaskCourseToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'isArchived')
  final bool isArchived;
  static const fromJsonFactory = _$TaskCourseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskCourse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.isArchived, isArchived) ||
                const DeepCollectionEquality().equals(
                  other.isArchived,
                  isArchived,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(isArchived) ^
      runtimeType.hashCode;
}

extension $TaskCourseExtension on TaskCourse {
  TaskCourse copyWith({int? id, String? name, bool? isArchived}) {
    return TaskCourse(
      id: id ?? this.id,
      name: name ?? this.name,
      isArchived: isArchived ?? this.isArchived,
    );
  }

  TaskCourse copyWithWrapped({
    Wrapped<int>? id,
    Wrapped<String>? name,
    Wrapped<bool>? isArchived,
  }) {
    return TaskCourse(
      id: (id != null ? id.value : this.id),
      name: (name != null ? name.value : this.name),
      isArchived: (isArchived != null ? isArchived.value : this.isArchived),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class TaskCourseTheme {
  const TaskCourseTheme({required this.id, required this.name});

  factory TaskCourseTheme.fromJson(Map<String, dynamic> json) =>
      _$TaskCourseThemeFromJson(json);

  static const toJsonFactory = _$TaskCourseThemeToJson;
  Map<String, dynamic> toJson() => _$TaskCourseThemeToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  static const fromJsonFactory = _$TaskCourseThemeFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskCourseTheme &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $TaskCourseThemeExtension on TaskCourseTheme {
  TaskCourseTheme copyWith({int? id, String? name}) {
    return TaskCourseTheme(id: id ?? this.id, name: name ?? this.name);
  }

  TaskCourseTheme copyWithWrapped({Wrapped<int>? id, Wrapped<String>? name}) {
    return TaskCourseTheme(
      id: (id != null ? id.value : this.id),
      name: (name != null ? name.value : this.name),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class TaskLongread {
  const TaskLongread({required this.id, required this.name});

  factory TaskLongread.fromJson(Map<String, dynamic> json) =>
      _$TaskLongreadFromJson(json);

  static const toJsonFactory = _$TaskLongreadToJson;
  Map<String, dynamic> toJson() => _$TaskLongreadToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  static const fromJsonFactory = _$TaskLongreadFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskLongread &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $TaskLongreadExtension on TaskLongread {
  TaskLongread copyWith({int? id, String? name}) {
    return TaskLongread(id: id ?? this.id, name: name ?? this.name);
  }

  TaskLongread copyWithWrapped({Wrapped<int>? id, Wrapped<String>? name}) {
    return TaskLongread(
      id: (id != null ? id.value : this.id),
      name: (name != null ? name.value : this.name),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class TaskReviewer {
  const TaskReviewer({
    required this.id,
    required this.name,
    required this.identityEmail,
    required this.email,
    required this.identityIdentifier,
    required this.timeAccount,
    required this.lastName,
    required this.firstName,
    this.middleName,
  });

  factory TaskReviewer.fromJson(Map<String, dynamic> json) =>
      _$TaskReviewerFromJson(json);

  static const toJsonFactory = _$TaskReviewerToJson;
  Map<String, dynamic> toJson() => _$TaskReviewerToJson(this);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'identityEmail')
  final String identityEmail;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'identityIdentifier')
  final String identityIdentifier;
  @JsonKey(name: 'timeAccount')
  final String timeAccount;
  @JsonKey(name: 'lastName')
  final String lastName;
  @JsonKey(name: 'firstName')
  final String firstName;
  @JsonKey(name: 'middleName')
  final String? middleName;
  static const fromJsonFactory = _$TaskReviewerFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskReviewer &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.identityEmail, identityEmail) ||
                const DeepCollectionEquality().equals(
                  other.identityEmail,
                  identityEmail,
                )) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.identityIdentifier, identityIdentifier) ||
                const DeepCollectionEquality().equals(
                  other.identityIdentifier,
                  identityIdentifier,
                )) &&
            (identical(other.timeAccount, timeAccount) ||
                const DeepCollectionEquality().equals(
                  other.timeAccount,
                  timeAccount,
                )) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality().equals(
                  other.lastName,
                  lastName,
                )) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality().equals(
                  other.firstName,
                  firstName,
                )) &&
            (identical(other.middleName, middleName) ||
                const DeepCollectionEquality().equals(
                  other.middleName,
                  middleName,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(identityEmail) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(identityIdentifier) ^
      const DeepCollectionEquality().hash(timeAccount) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(middleName) ^
      runtimeType.hashCode;
}

extension $TaskReviewerExtension on TaskReviewer {
  TaskReviewer copyWith({
    String? id,
    String? name,
    String? identityEmail,
    String? email,
    String? identityIdentifier,
    String? timeAccount,
    String? lastName,
    String? firstName,
    String? middleName,
  }) {
    return TaskReviewer(
      id: id ?? this.id,
      name: name ?? this.name,
      identityEmail: identityEmail ?? this.identityEmail,
      email: email ?? this.email,
      identityIdentifier: identityIdentifier ?? this.identityIdentifier,
      timeAccount: timeAccount ?? this.timeAccount,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
    );
  }

  TaskReviewer copyWithWrapped({
    Wrapped<String>? id,
    Wrapped<String>? name,
    Wrapped<String>? identityEmail,
    Wrapped<String>? email,
    Wrapped<String>? identityIdentifier,
    Wrapped<String>? timeAccount,
    Wrapped<String>? lastName,
    Wrapped<String>? firstName,
    Wrapped<String?>? middleName,
  }) {
    return TaskReviewer(
      id: (id != null ? id.value : this.id),
      name: (name != null ? name.value : this.name),
      identityEmail: (identityEmail != null
          ? identityEmail.value
          : this.identityEmail),
      email: (email != null ? email.value : this.email),
      identityIdentifier: (identityIdentifier != null
          ? identityIdentifier.value
          : this.identityIdentifier),
      timeAccount: (timeAccount != null ? timeAccount.value : this.timeAccount),
      lastName: (lastName != null ? lastName.value : this.lastName),
      firstName: (firstName != null ? firstName.value : this.firstName),
      middleName: (middleName != null ? middleName.value : this.middleName),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class TaskSolutionAnswersQuestionInputAnswerValue {
  const TaskSolutionAnswersQuestionInputAnswerValue();

  factory TaskSolutionAnswersQuestionInputAnswerValue.fromJson(
    Map<String, dynamic> json,
  ) => _$TaskSolutionAnswersQuestionInputAnswerValueFromJson(json);

  static const toJsonFactory =
      _$TaskSolutionAnswersQuestionInputAnswerValueToJson;
  Map<String, dynamic> toJson() =>
      _$TaskSolutionAnswersQuestionInputAnswerValueToJson(this);

  static const fromJsonFactory =
      _$TaskSolutionAnswersQuestionInputAnswerValueFromJson;

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class TaskSolutionAnswersQuestionInputAnswer {
  const TaskSolutionAnswersQuestionInputAnswer({
    required this.values,
    required this.value,
    required this.recommendation,
  });

  factory TaskSolutionAnswersQuestionInputAnswer.fromJson(
    Map<String, dynamic> json,
  ) => _$TaskSolutionAnswersQuestionInputAnswerFromJson(json);

  static const toJsonFactory = _$TaskSolutionAnswersQuestionInputAnswerToJson;
  Map<String, dynamic> toJson() =>
      _$TaskSolutionAnswersQuestionInputAnswerToJson(this);

  @JsonKey(name: 'values', defaultValue: <String>[])
  final List<String> values;
  @JsonKey(name: 'value')
  final TaskSolutionAnswersQuestionInputAnswerValue value;
  @JsonKey(name: 'recommendation')
  final String recommendation;
  static const fromJsonFactory =
      _$TaskSolutionAnswersQuestionInputAnswerFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskSolutionAnswersQuestionInputAnswer &&
            (identical(other.values, values) ||
                const DeepCollectionEquality().equals(other.values, values)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.recommendation, recommendation) ||
                const DeepCollectionEquality().equals(
                  other.recommendation,
                  recommendation,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(values) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(recommendation) ^
      runtimeType.hashCode;
}

extension $TaskSolutionAnswersQuestionInputAnswerExtension
    on TaskSolutionAnswersQuestionInputAnswer {
  TaskSolutionAnswersQuestionInputAnswer copyWith({
    List<String>? values,
    TaskSolutionAnswersQuestionInputAnswerValue? value,
    String? recommendation,
  }) {
    return TaskSolutionAnswersQuestionInputAnswer(
      values: values ?? this.values,
      value: value ?? this.value,
      recommendation: recommendation ?? this.recommendation,
    );
  }

  TaskSolutionAnswersQuestionInputAnswer copyWithWrapped({
    Wrapped<List<String>>? values,
    Wrapped<TaskSolutionAnswersQuestionInputAnswerValue>? value,
    Wrapped<String>? recommendation,
  }) {
    return TaskSolutionAnswersQuestionInputAnswer(
      values: (values != null ? values.value : this.values),
      value: (value != null ? value.value : this.value),
      recommendation: (recommendation != null
          ? recommendation.value
          : this.recommendation),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class TaskSolutionAnswersQuestionInputNumberAnswer {
  const TaskSolutionAnswersQuestionInputNumberAnswer({
    required this.values,
    required this.value,
    required this.recommendation,
  });

  factory TaskSolutionAnswersQuestionInputNumberAnswer.fromJson(
    Map<String, dynamic> json,
  ) => _$TaskSolutionAnswersQuestionInputNumberAnswerFromJson(json);

  static const toJsonFactory =
      _$TaskSolutionAnswersQuestionInputNumberAnswerToJson;
  Map<String, dynamic> toJson() =>
      _$TaskSolutionAnswersQuestionInputNumberAnswerToJson(this);

  @JsonKey(name: 'values', defaultValue: <double>[])
  final List<double> values;
  @JsonKey(name: 'value')
  final TaskSolutionAnswersQuestionInputAnswerValue value;
  @JsonKey(name: 'recommendation')
  final String recommendation;
  static const fromJsonFactory =
      _$TaskSolutionAnswersQuestionInputNumberAnswerFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskSolutionAnswersQuestionInputNumberAnswer &&
            (identical(other.values, values) ||
                const DeepCollectionEquality().equals(other.values, values)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.recommendation, recommendation) ||
                const DeepCollectionEquality().equals(
                  other.recommendation,
                  recommendation,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(values) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(recommendation) ^
      runtimeType.hashCode;
}

extension $TaskSolutionAnswersQuestionInputNumberAnswerExtension
    on TaskSolutionAnswersQuestionInputNumberAnswer {
  TaskSolutionAnswersQuestionInputNumberAnswer copyWith({
    List<double>? values,
    TaskSolutionAnswersQuestionInputAnswerValue? value,
    String? recommendation,
  }) {
    return TaskSolutionAnswersQuestionInputNumberAnswer(
      values: values ?? this.values,
      value: value ?? this.value,
      recommendation: recommendation ?? this.recommendation,
    );
  }

  TaskSolutionAnswersQuestionInputNumberAnswer copyWithWrapped({
    Wrapped<List<double>>? values,
    Wrapped<TaskSolutionAnswersQuestionInputAnswerValue>? value,
    Wrapped<String>? recommendation,
  }) {
    return TaskSolutionAnswersQuestionInputNumberAnswer(
      values: (values != null ? values.value : this.values),
      value: (value != null ? value.value : this.value),
      recommendation: (recommendation != null
          ? recommendation.value
          : this.recommendation),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class TaskSolutionAnswersQuestionOptionsItem {
  const TaskSolutionAnswersQuestionOptionsItem({
    required this.id,
    required this.isCorrect,
    required this.recommendation,
  });

  factory TaskSolutionAnswersQuestionOptionsItem.fromJson(
    Map<String, dynamic> json,
  ) => _$TaskSolutionAnswersQuestionOptionsItemFromJson(json);

  static const toJsonFactory = _$TaskSolutionAnswersQuestionOptionsItemToJson;
  Map<String, dynamic> toJson() =>
      _$TaskSolutionAnswersQuestionOptionsItemToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'isCorrect')
  final bool isCorrect;
  @JsonKey(name: 'recommendation')
  final String? recommendation;
  static const fromJsonFactory =
      _$TaskSolutionAnswersQuestionOptionsItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskSolutionAnswersQuestionOptionsItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.isCorrect, isCorrect) ||
                const DeepCollectionEquality().equals(
                  other.isCorrect,
                  isCorrect,
                )) &&
            (identical(other.recommendation, recommendation) ||
                const DeepCollectionEquality().equals(
                  other.recommendation,
                  recommendation,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(isCorrect) ^
      const DeepCollectionEquality().hash(recommendation) ^
      runtimeType.hashCode;
}

extension $TaskSolutionAnswersQuestionOptionsItemExtension
    on TaskSolutionAnswersQuestionOptionsItem {
  TaskSolutionAnswersQuestionOptionsItem copyWith({
    int? id,
    bool? isCorrect,
    String? recommendation,
  }) {
    return TaskSolutionAnswersQuestionOptionsItem(
      id: id ?? this.id,
      isCorrect: isCorrect ?? this.isCorrect,
      recommendation: recommendation ?? this.recommendation,
    );
  }

  TaskSolutionAnswersQuestionOptionsItem copyWithWrapped({
    Wrapped<int>? id,
    Wrapped<bool>? isCorrect,
    Wrapped<String?>? recommendation,
  }) {
    return TaskSolutionAnswersQuestionOptionsItem(
      id: (id != null ? id.value : this.id),
      isCorrect: (isCorrect != null ? isCorrect.value : this.isCorrect),
      recommendation: (recommendation != null
          ? recommendation.value
          : this.recommendation),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class TaskSolutionAnswersQuestionOptionsQuestionItem {
  const TaskSolutionAnswersQuestionOptionsQuestionItem({
    required this.id,
    required this.type,
    required this.answer,
    required this.options,
  });

  factory TaskSolutionAnswersQuestionOptionsQuestionItem.fromJson(
    Map<String, dynamic> json,
  ) => _$TaskSolutionAnswersQuestionOptionsQuestionItemFromJson(json);

  static const toJsonFactory =
      _$TaskSolutionAnswersQuestionOptionsQuestionItemToJson;
  Map<String, dynamic> toJson() =>
      _$TaskSolutionAnswersQuestionOptionsQuestionItemToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(
    name: 'type',
    toJson: taskSolutionAnswersQuestionOptionsQuestionItemTypeToJson,
    fromJson: taskSolutionAnswersQuestionOptionsQuestionItemTypeFromJson,
  )
  final enums.TaskSolutionAnswersQuestionOptionsQuestionItemType type;
  @JsonKey(
    name: 'answer',
    toJson: nullOnlyNullableToJson,
    fromJson: nullOnlyNullableFromJson,
  )
  final enums.NullOnly? answer;
  @JsonKey(
    name: 'options',
    defaultValue: <TaskSolutionAnswersQuestionOptionsItem>[],
  )
  final List<TaskSolutionAnswersQuestionOptionsItem> options;
  static const fromJsonFactory =
      _$TaskSolutionAnswersQuestionOptionsQuestionItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskSolutionAnswersQuestionOptionsQuestionItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)) &&
            (identical(other.options, options) ||
                const DeepCollectionEquality().equals(other.options, options)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(answer) ^
      const DeepCollectionEquality().hash(options) ^
      runtimeType.hashCode;
}

extension $TaskSolutionAnswersQuestionOptionsQuestionItemExtension
    on TaskSolutionAnswersQuestionOptionsQuestionItem {
  TaskSolutionAnswersQuestionOptionsQuestionItem copyWith({
    int? id,
    enums.TaskSolutionAnswersQuestionOptionsQuestionItemType? type,
    enums.NullOnly? answer,
    List<TaskSolutionAnswersQuestionOptionsItem>? options,
  }) {
    return TaskSolutionAnswersQuestionOptionsQuestionItem(
      id: id ?? this.id,
      type: type ?? this.type,
      answer: answer ?? this.answer,
      options: options ?? this.options,
    );
  }

  TaskSolutionAnswersQuestionOptionsQuestionItem copyWithWrapped({
    Wrapped<int>? id,
    Wrapped<enums.TaskSolutionAnswersQuestionOptionsQuestionItemType>? type,
    Wrapped<enums.NullOnly?>? answer,
    Wrapped<List<TaskSolutionAnswersQuestionOptionsItem>>? options,
  }) {
    return TaskSolutionAnswersQuestionOptionsQuestionItem(
      id: (id != null ? id.value : this.id),
      type: (type != null ? type.value : this.type),
      answer: (answer != null ? answer.value : this.answer),
      options: (options != null ? options.value : this.options),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class TaskSolutionAnswersQuestionInputQuestionItem {
  const TaskSolutionAnswersQuestionInputQuestionItem({
    required this.id,
    required this.type,
    required this.answer,
    required this.options,
  });

  factory TaskSolutionAnswersQuestionInputQuestionItem.fromJson(
    Map<String, dynamic> json,
  ) => _$TaskSolutionAnswersQuestionInputQuestionItemFromJson(json);

  static const toJsonFactory =
      _$TaskSolutionAnswersQuestionInputQuestionItemToJson;
  Map<String, dynamic> toJson() =>
      _$TaskSolutionAnswersQuestionInputQuestionItemToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(
    name: 'type',
    toJson: taskSolutionAnswersQuestionInputQuestionItemTypeToJson,
    fromJson: taskSolutionAnswersQuestionInputQuestionItemTypeFromJson,
  )
  final enums.TaskSolutionAnswersQuestionInputQuestionItemType type;
  @JsonKey(name: 'answer')
  final TaskSolutionAnswersQuestionInputAnswer? answer;
  @JsonKey(
    name: 'options',
    toJson: nullOnlyNullableToJson,
    fromJson: nullOnlyNullableFromJson,
  )
  final enums.NullOnly? options;
  static const fromJsonFactory =
      _$TaskSolutionAnswersQuestionInputQuestionItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskSolutionAnswersQuestionInputQuestionItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)) &&
            (identical(other.options, options) ||
                const DeepCollectionEquality().equals(other.options, options)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(answer) ^
      const DeepCollectionEquality().hash(options) ^
      runtimeType.hashCode;
}

extension $TaskSolutionAnswersQuestionInputQuestionItemExtension
    on TaskSolutionAnswersQuestionInputQuestionItem {
  TaskSolutionAnswersQuestionInputQuestionItem copyWith({
    int? id,
    enums.TaskSolutionAnswersQuestionInputQuestionItemType? type,
    TaskSolutionAnswersQuestionInputAnswer? answer,
    enums.NullOnly? options,
  }) {
    return TaskSolutionAnswersQuestionInputQuestionItem(
      id: id ?? this.id,
      type: type ?? this.type,
      answer: answer ?? this.answer,
      options: options ?? this.options,
    );
  }

  TaskSolutionAnswersQuestionInputQuestionItem copyWithWrapped({
    Wrapped<int>? id,
    Wrapped<enums.TaskSolutionAnswersQuestionInputQuestionItemType>? type,
    Wrapped<TaskSolutionAnswersQuestionInputAnswer?>? answer,
    Wrapped<enums.NullOnly?>? options,
  }) {
    return TaskSolutionAnswersQuestionInputQuestionItem(
      id: (id != null ? id.value : this.id),
      type: (type != null ? type.value : this.type),
      answer: (answer != null ? answer.value : this.answer),
      options: (options != null ? options.value : this.options),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class TaskSolutionAnswersQuestionInputNumberQuestionItem {
  const TaskSolutionAnswersQuestionInputNumberQuestionItem({
    required this.id,
    required this.type,
    required this.answer,
    required this.options,
  });

  factory TaskSolutionAnswersQuestionInputNumberQuestionItem.fromJson(
    Map<String, dynamic> json,
  ) => _$TaskSolutionAnswersQuestionInputNumberQuestionItemFromJson(json);

  static const toJsonFactory =
      _$TaskSolutionAnswersQuestionInputNumberQuestionItemToJson;
  Map<String, dynamic> toJson() =>
      _$TaskSolutionAnswersQuestionInputNumberQuestionItemToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(
    name: 'type',
    toJson: taskSolutionAnswersQuestionInputNumberQuestionItemTypeToJson,
    fromJson: taskSolutionAnswersQuestionInputNumberQuestionItemTypeFromJson,
  )
  final enums.TaskSolutionAnswersQuestionInputNumberQuestionItemType type;
  @JsonKey(name: 'answer')
  final TaskSolutionAnswersQuestionInputNumberAnswer? answer;
  @JsonKey(
    name: 'options',
    toJson: nullOnlyNullableToJson,
    fromJson: nullOnlyNullableFromJson,
  )
  final enums.NullOnly? options;
  static const fromJsonFactory =
      _$TaskSolutionAnswersQuestionInputNumberQuestionItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskSolutionAnswersQuestionInputNumberQuestionItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)) &&
            (identical(other.options, options) ||
                const DeepCollectionEquality().equals(other.options, options)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(answer) ^
      const DeepCollectionEquality().hash(options) ^
      runtimeType.hashCode;
}

extension $TaskSolutionAnswersQuestionInputNumberQuestionItemExtension
    on TaskSolutionAnswersQuestionInputNumberQuestionItem {
  TaskSolutionAnswersQuestionInputNumberQuestionItem copyWith({
    int? id,
    enums.TaskSolutionAnswersQuestionInputNumberQuestionItemType? type,
    TaskSolutionAnswersQuestionInputNumberAnswer? answer,
    enums.NullOnly? options,
  }) {
    return TaskSolutionAnswersQuestionInputNumberQuestionItem(
      id: id ?? this.id,
      type: type ?? this.type,
      answer: answer ?? this.answer,
      options: options ?? this.options,
    );
  }

  TaskSolutionAnswersQuestionInputNumberQuestionItem copyWithWrapped({
    Wrapped<int>? id,
    Wrapped<enums.TaskSolutionAnswersQuestionInputNumberQuestionItemType>? type,
    Wrapped<TaskSolutionAnswersQuestionInputNumberAnswer?>? answer,
    Wrapped<enums.NullOnly?>? options,
  }) {
    return TaskSolutionAnswersQuestionInputNumberQuestionItem(
      id: (id != null ? id.value : this.id),
      type: (type != null ? type.value : this.type),
      answer: (answer != null ? answer.value : this.answer),
      options: (options != null ? options.value : this.options),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class TaskSolutionAnswersQuestion {
  const TaskSolutionAnswersQuestion();

  factory TaskSolutionAnswersQuestion.fromJson(Map<String, dynamic> json) =>
      _$TaskSolutionAnswersQuestionFromJson(json);

  static const toJsonFactory = _$TaskSolutionAnswersQuestionToJson;
  Map<String, dynamic> toJson() => _$TaskSolutionAnswersQuestionToJson(this);

  static const fromJsonFactory = _$TaskSolutionAnswersQuestionFromJson;

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class TaskSolutionAnswersItem {
  const TaskSolutionAnswersItem({required this.answer, required this.question});

  factory TaskSolutionAnswersItem.fromJson(Map<String, dynamic> json) =>
      _$TaskSolutionAnswersItemFromJson(json);

  static const toJsonFactory = _$TaskSolutionAnswersItemToJson;
  Map<String, dynamic> toJson() => _$TaskSolutionAnswersItemToJson(this);

  @JsonKey(name: 'answer')
  final dynamic answer;
  @JsonKey(name: 'question')
  final TaskSolutionAnswersQuestion question;
  static const fromJsonFactory = _$TaskSolutionAnswersItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskSolutionAnswersItem &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)) &&
            (identical(other.question, question) ||
                const DeepCollectionEquality().equals(
                  other.question,
                  question,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(answer) ^
      const DeepCollectionEquality().hash(question) ^
      runtimeType.hashCode;
}

extension $TaskSolutionAnswersItemExtension on TaskSolutionAnswersItem {
  TaskSolutionAnswersItem copyWith({
    dynamic answer,
    TaskSolutionAnswersQuestion? question,
  }) {
    return TaskSolutionAnswersItem(
      answer: answer ?? this.answer,
      question: question ?? this.question,
    );
  }

  TaskSolutionAnswersItem copyWithWrapped({
    Wrapped<dynamic>? answer,
    Wrapped<TaskSolutionAnswersQuestion>? question,
  }) {
    return TaskSolutionAnswersItem(
      answer: (answer != null ? answer.value : this.answer),
      question: (question != null ? question.value : this.question),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class TaskSolution {
  const TaskSolution({
    required this.type,
    this.solutionUrl,
    this.answers,
    this.attachments,
  });

  factory TaskSolution.fromJson(Map<String, dynamic> json) =>
      _$TaskSolutionFromJson(json);

  static const toJsonFactory = _$TaskSolutionToJson;
  Map<String, dynamic> toJson() => _$TaskSolutionToJson(this);

  @JsonKey(name: 'type', toJson: taskTypeToJson, fromJson: taskTypeFromJson)
  final enums.TaskType type;
  @JsonKey(name: 'solutionUrl')
  final String? solutionUrl;
  @JsonKey(name: 'answers', defaultValue: <TaskSolutionAnswersItem>[])
  final List<TaskSolutionAnswersItem>? answers;
  @JsonKey(name: 'attachments', defaultValue: <TaskAttachment>[])
  final List<TaskAttachment>? attachments;
  static const fromJsonFactory = _$TaskSolutionFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskSolution &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.solutionUrl, solutionUrl) ||
                const DeepCollectionEquality().equals(
                  other.solutionUrl,
                  solutionUrl,
                )) &&
            (identical(other.answers, answers) ||
                const DeepCollectionEquality().equals(
                  other.answers,
                  answers,
                )) &&
            (identical(other.attachments, attachments) ||
                const DeepCollectionEquality().equals(
                  other.attachments,
                  attachments,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(solutionUrl) ^
      const DeepCollectionEquality().hash(answers) ^
      const DeepCollectionEquality().hash(attachments) ^
      runtimeType.hashCode;
}

extension $TaskSolutionExtension on TaskSolution {
  TaskSolution copyWith({
    enums.TaskType? type,
    String? solutionUrl,
    List<TaskSolutionAnswersItem>? answers,
    List<TaskAttachment>? attachments,
  }) {
    return TaskSolution(
      type: type ?? this.type,
      solutionUrl: solutionUrl ?? this.solutionUrl,
      answers: answers ?? this.answers,
      attachments: attachments ?? this.attachments,
    );
  }

  TaskSolution copyWithWrapped({
    Wrapped<enums.TaskType>? type,
    Wrapped<String?>? solutionUrl,
    Wrapped<List<TaskSolutionAnswersItem>?>? answers,
    Wrapped<List<TaskAttachment>?>? attachments,
  }) {
    return TaskSolution(
      type: (type != null ? type.value : this.type),
      solutionUrl: (solutionUrl != null ? solutionUrl.value : this.solutionUrl),
      answers: (answers != null ? answers.value : this.answers),
      attachments: (attachments != null ? attachments.value : this.attachments),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class TaskScoresItem {
  const TaskScoresItem({required this.questionId, required this.score});

  factory TaskScoresItem.fromJson(Map<String, dynamic> json) =>
      _$TaskScoresItemFromJson(json);

  static const toJsonFactory = _$TaskScoresItemToJson;
  Map<String, dynamic> toJson() => _$TaskScoresItemToJson(this);

  @JsonKey(name: 'questionId')
  final int questionId;
  @JsonKey(name: 'score')
  final num? score;
  static const fromJsonFactory = _$TaskScoresItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskScoresItem &&
            (identical(other.questionId, questionId) ||
                const DeepCollectionEquality().equals(
                  other.questionId,
                  questionId,
                )) &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(questionId) ^
      const DeepCollectionEquality().hash(score) ^
      runtimeType.hashCode;
}

extension $TaskScoresItemExtension on TaskScoresItem {
  TaskScoresItem copyWith({int? questionId, num? score}) {
    return TaskScoresItem(
      questionId: questionId ?? this.questionId,
      score: score ?? this.score,
    );
  }

  TaskScoresItem copyWithWrapped({
    Wrapped<int>? questionId,
    Wrapped<num?>? score,
  }) {
    return TaskScoresItem(
      questionId: (questionId != null ? questionId.value : this.questionId),
      score: (score != null ? score.value : this.score),
    );
  }
}

typedef TaskScores = List<TaskScoresItem>;

@JsonSerializable(explicitToJson: true)
class QuizSessionId {
  const QuizSessionId();

  factory QuizSessionId.fromJson(Map<String, dynamic> json) =>
      _$QuizSessionIdFromJson(json);

  static const toJsonFactory = _$QuizSessionIdToJson;
  Map<String, dynamic> toJson() => _$QuizSessionIdToJson(this);

  static const fromJsonFactory = _$QuizSessionIdFromJson;

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class TaskEvaluatedAttemptId {
  const TaskEvaluatedAttemptId();

  factory TaskEvaluatedAttemptId.fromJson(Map<String, dynamic> json) =>
      _$TaskEvaluatedAttemptIdFromJson(json);

  static const toJsonFactory = _$TaskEvaluatedAttemptIdToJson;
  Map<String, dynamic> toJson() => _$TaskEvaluatedAttemptIdToJson(this);

  static const fromJsonFactory = _$TaskEvaluatedAttemptIdFromJson;

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class TaskCurrentAttemptId {
  const TaskCurrentAttemptId();

  factory TaskCurrentAttemptId.fromJson(Map<String, dynamic> json) =>
      _$TaskCurrentAttemptIdFromJson(json);

  static const toJsonFactory = _$TaskCurrentAttemptIdToJson;
  Map<String, dynamic> toJson() => _$TaskCurrentAttemptIdToJson(this);

  static const fromJsonFactory = _$TaskCurrentAttemptIdFromJson;

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class TaskLastAttemptId {
  const TaskLastAttemptId();

  factory TaskLastAttemptId.fromJson(Map<String, dynamic> json) =>
      _$TaskLastAttemptIdFromJson(json);

  static const toJsonFactory = _$TaskLastAttemptIdToJson;
  Map<String, dynamic> toJson() => _$TaskLastAttemptIdToJson(this);

  static const fromJsonFactory = _$TaskLastAttemptIdFromJson;

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class TaskByIdResponse {
  const TaskByIdResponse({
    required this.id,
    required this.type,
    required this.state,
    required this.score,
    this.scoreSkillLevel,
    required this.isSkillLevelEnabled,
    required this.isLateDaysEnabled,
    required this.extraScore,
    required this.createdAt,
    required this.startedAt,
    required this.submitAt,
    required this.rejectAt,
    required this.evaluateAt,
    required this.deadline,
    required this.lateDays,
    required this.exercise,
    required this.course,
    required this.theme,
    required this.longread,
    required this.student,
    required this.reviewer,
    required this.solution,
    required this.scores,
    required this.quizSessionId,
    required this.evaluatedAttemptId,
    required this.currentAttemptId,
    required this.lastAttemptId,
  });

  factory TaskByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$TaskByIdResponseFromJson(json);

  static const toJsonFactory = _$TaskByIdResponseToJson;
  Map<String, dynamic> toJson() => _$TaskByIdResponseToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'type', toJson: taskTypeToJson, fromJson: taskTypeFromJson)
  final enums.TaskType type;
  @JsonKey(name: 'state', toJson: taskStateToJson, fromJson: taskStateFromJson)
  final enums.TaskState state;
  @JsonKey(name: 'score')
  final num? score;
  @JsonKey(
    name: 'scoreSkillLevel',
    toJson: taskScoreSkillLevelNullableToJson,
    fromJson: taskScoreSkillLevelNullableFromJson,
  )
  final enums.TaskScoreSkillLevel? scoreSkillLevel;
  @JsonKey(name: 'isSkillLevelEnabled')
  final bool isSkillLevelEnabled;
  @JsonKey(name: 'isLateDaysEnabled')
  final bool isLateDaysEnabled;
  @JsonKey(name: 'extraScore')
  final num? extraScore;
  @JsonKey(name: 'createdAt')
  final String createdAt;
  @JsonKey(name: 'startedAt')
  final String? startedAt;
  @JsonKey(name: 'submitAt')
  final String? submitAt;
  @JsonKey(name: 'rejectAt')
  final String? rejectAt;
  @JsonKey(name: 'evaluateAt')
  final String? evaluateAt;
  @JsonKey(name: 'deadline')
  final String deadline;
  @JsonKey(name: 'lateDays')
  final int? lateDays;
  @JsonKey(name: 'exercise')
  final TaskExercise exercise;
  @JsonKey(name: 'course')
  final TaskCourse course;
  @JsonKey(name: 'theme')
  final TaskCourseTheme theme;
  @JsonKey(name: 'longread')
  final TaskLongread longread;
  @JsonKey(name: 'student')
  final CurrentStudentResponse student;
  @JsonKey(name: 'reviewer')
  final TaskReviewer? reviewer;
  @JsonKey(name: 'solution')
  final TaskSolution? solution;
  @JsonKey(name: 'scores')
  final List<TaskScoresItem>? scores;
  @JsonKey(name: 'quizSessionId')
  final QuizSessionId? quizSessionId;
  @JsonKey(name: 'evaluatedAttemptId')
  final TaskEvaluatedAttemptId? evaluatedAttemptId;
  @JsonKey(name: 'currentAttemptId')
  final TaskCurrentAttemptId? currentAttemptId;
  @JsonKey(name: 'lastAttemptId')
  final TaskLastAttemptId? lastAttemptId;
  static const fromJsonFactory = _$TaskByIdResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskByIdResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)) &&
            (identical(other.scoreSkillLevel, scoreSkillLevel) ||
                const DeepCollectionEquality().equals(
                  other.scoreSkillLevel,
                  scoreSkillLevel,
                )) &&
            (identical(other.isSkillLevelEnabled, isSkillLevelEnabled) ||
                const DeepCollectionEquality().equals(
                  other.isSkillLevelEnabled,
                  isSkillLevelEnabled,
                )) &&
            (identical(other.isLateDaysEnabled, isLateDaysEnabled) ||
                const DeepCollectionEquality().equals(
                  other.isLateDaysEnabled,
                  isLateDaysEnabled,
                )) &&
            (identical(other.extraScore, extraScore) ||
                const DeepCollectionEquality().equals(
                  other.extraScore,
                  extraScore,
                )) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.startedAt, startedAt) ||
                const DeepCollectionEquality().equals(
                  other.startedAt,
                  startedAt,
                )) &&
            (identical(other.submitAt, submitAt) ||
                const DeepCollectionEquality().equals(
                  other.submitAt,
                  submitAt,
                )) &&
            (identical(other.rejectAt, rejectAt) ||
                const DeepCollectionEquality().equals(
                  other.rejectAt,
                  rejectAt,
                )) &&
            (identical(other.evaluateAt, evaluateAt) ||
                const DeepCollectionEquality().equals(
                  other.evaluateAt,
                  evaluateAt,
                )) &&
            (identical(other.deadline, deadline) ||
                const DeepCollectionEquality().equals(
                  other.deadline,
                  deadline,
                )) &&
            (identical(other.lateDays, lateDays) ||
                const DeepCollectionEquality().equals(
                  other.lateDays,
                  lateDays,
                )) &&
            (identical(other.exercise, exercise) ||
                const DeepCollectionEquality().equals(
                  other.exercise,
                  exercise,
                )) &&
            (identical(other.course, course) ||
                const DeepCollectionEquality().equals(other.course, course)) &&
            (identical(other.theme, theme) ||
                const DeepCollectionEquality().equals(other.theme, theme)) &&
            (identical(other.longread, longread) ||
                const DeepCollectionEquality().equals(
                  other.longread,
                  longread,
                )) &&
            (identical(other.student, student) ||
                const DeepCollectionEquality().equals(
                  other.student,
                  student,
                )) &&
            (identical(other.reviewer, reviewer) ||
                const DeepCollectionEquality().equals(
                  other.reviewer,
                  reviewer,
                )) &&
            (identical(other.solution, solution) ||
                const DeepCollectionEquality().equals(
                  other.solution,
                  solution,
                )) &&
            (identical(other.scores, scores) ||
                const DeepCollectionEquality().equals(other.scores, scores)) &&
            (identical(other.quizSessionId, quizSessionId) ||
                const DeepCollectionEquality().equals(
                  other.quizSessionId,
                  quizSessionId,
                )) &&
            (identical(other.evaluatedAttemptId, evaluatedAttemptId) ||
                const DeepCollectionEquality().equals(
                  other.evaluatedAttemptId,
                  evaluatedAttemptId,
                )) &&
            (identical(other.currentAttemptId, currentAttemptId) ||
                const DeepCollectionEquality().equals(
                  other.currentAttemptId,
                  currentAttemptId,
                )) &&
            (identical(other.lastAttemptId, lastAttemptId) ||
                const DeepCollectionEquality().equals(
                  other.lastAttemptId,
                  lastAttemptId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(score) ^
      const DeepCollectionEquality().hash(scoreSkillLevel) ^
      const DeepCollectionEquality().hash(isSkillLevelEnabled) ^
      const DeepCollectionEquality().hash(isLateDaysEnabled) ^
      const DeepCollectionEquality().hash(extraScore) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(startedAt) ^
      const DeepCollectionEquality().hash(submitAt) ^
      const DeepCollectionEquality().hash(rejectAt) ^
      const DeepCollectionEquality().hash(evaluateAt) ^
      const DeepCollectionEquality().hash(deadline) ^
      const DeepCollectionEquality().hash(lateDays) ^
      const DeepCollectionEquality().hash(exercise) ^
      const DeepCollectionEquality().hash(course) ^
      const DeepCollectionEquality().hash(theme) ^
      const DeepCollectionEquality().hash(longread) ^
      const DeepCollectionEquality().hash(student) ^
      const DeepCollectionEquality().hash(reviewer) ^
      const DeepCollectionEquality().hash(solution) ^
      const DeepCollectionEquality().hash(scores) ^
      const DeepCollectionEquality().hash(quizSessionId) ^
      const DeepCollectionEquality().hash(evaluatedAttemptId) ^
      const DeepCollectionEquality().hash(currentAttemptId) ^
      const DeepCollectionEquality().hash(lastAttemptId) ^
      runtimeType.hashCode;
}

extension $TaskByIdResponseExtension on TaskByIdResponse {
  TaskByIdResponse copyWith({
    int? id,
    enums.TaskType? type,
    enums.TaskState? state,
    num? score,
    enums.TaskScoreSkillLevel? scoreSkillLevel,
    bool? isSkillLevelEnabled,
    bool? isLateDaysEnabled,
    num? extraScore,
    String? createdAt,
    String? startedAt,
    String? submitAt,
    String? rejectAt,
    String? evaluateAt,
    String? deadline,
    int? lateDays,
    TaskExercise? exercise,
    TaskCourse? course,
    TaskCourseTheme? theme,
    TaskLongread? longread,
    CurrentStudentResponse? student,
    TaskReviewer? reviewer,
    TaskSolution? solution,
    List<TaskScoresItem>? scores,
    QuizSessionId? quizSessionId,
    TaskEvaluatedAttemptId? evaluatedAttemptId,
    TaskCurrentAttemptId? currentAttemptId,
    TaskLastAttemptId? lastAttemptId,
  }) {
    return TaskByIdResponse(
      id: id ?? this.id,
      type: type ?? this.type,
      state: state ?? this.state,
      score: score ?? this.score,
      scoreSkillLevel: scoreSkillLevel ?? this.scoreSkillLevel,
      isSkillLevelEnabled: isSkillLevelEnabled ?? this.isSkillLevelEnabled,
      isLateDaysEnabled: isLateDaysEnabled ?? this.isLateDaysEnabled,
      extraScore: extraScore ?? this.extraScore,
      createdAt: createdAt ?? this.createdAt,
      startedAt: startedAt ?? this.startedAt,
      submitAt: submitAt ?? this.submitAt,
      rejectAt: rejectAt ?? this.rejectAt,
      evaluateAt: evaluateAt ?? this.evaluateAt,
      deadline: deadline ?? this.deadline,
      lateDays: lateDays ?? this.lateDays,
      exercise: exercise ?? this.exercise,
      course: course ?? this.course,
      theme: theme ?? this.theme,
      longread: longread ?? this.longread,
      student: student ?? this.student,
      reviewer: reviewer ?? this.reviewer,
      solution: solution ?? this.solution,
      scores: scores ?? this.scores,
      quizSessionId: quizSessionId ?? this.quizSessionId,
      evaluatedAttemptId: evaluatedAttemptId ?? this.evaluatedAttemptId,
      currentAttemptId: currentAttemptId ?? this.currentAttemptId,
      lastAttemptId: lastAttemptId ?? this.lastAttemptId,
    );
  }

  TaskByIdResponse copyWithWrapped({
    Wrapped<int>? id,
    Wrapped<enums.TaskType>? type,
    Wrapped<enums.TaskState>? state,
    Wrapped<num?>? score,
    Wrapped<enums.TaskScoreSkillLevel?>? scoreSkillLevel,
    Wrapped<bool>? isSkillLevelEnabled,
    Wrapped<bool>? isLateDaysEnabled,
    Wrapped<num?>? extraScore,
    Wrapped<String>? createdAt,
    Wrapped<String?>? startedAt,
    Wrapped<String?>? submitAt,
    Wrapped<String?>? rejectAt,
    Wrapped<String?>? evaluateAt,
    Wrapped<String>? deadline,
    Wrapped<int?>? lateDays,
    Wrapped<TaskExercise>? exercise,
    Wrapped<TaskCourse>? course,
    Wrapped<TaskCourseTheme>? theme,
    Wrapped<TaskLongread>? longread,
    Wrapped<CurrentStudentResponse>? student,
    Wrapped<TaskReviewer?>? reviewer,
    Wrapped<TaskSolution?>? solution,
    Wrapped<List<TaskScoresItem>?>? scores,
    Wrapped<QuizSessionId?>? quizSessionId,
    Wrapped<TaskEvaluatedAttemptId?>? evaluatedAttemptId,
    Wrapped<TaskCurrentAttemptId?>? currentAttemptId,
    Wrapped<TaskLastAttemptId?>? lastAttemptId,
  }) {
    return TaskByIdResponse(
      id: (id != null ? id.value : this.id),
      type: (type != null ? type.value : this.type),
      state: (state != null ? state.value : this.state),
      score: (score != null ? score.value : this.score),
      scoreSkillLevel: (scoreSkillLevel != null
          ? scoreSkillLevel.value
          : this.scoreSkillLevel),
      isSkillLevelEnabled: (isSkillLevelEnabled != null
          ? isSkillLevelEnabled.value
          : this.isSkillLevelEnabled),
      isLateDaysEnabled: (isLateDaysEnabled != null
          ? isLateDaysEnabled.value
          : this.isLateDaysEnabled),
      extraScore: (extraScore != null ? extraScore.value : this.extraScore),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      startedAt: (startedAt != null ? startedAt.value : this.startedAt),
      submitAt: (submitAt != null ? submitAt.value : this.submitAt),
      rejectAt: (rejectAt != null ? rejectAt.value : this.rejectAt),
      evaluateAt: (evaluateAt != null ? evaluateAt.value : this.evaluateAt),
      deadline: (deadline != null ? deadline.value : this.deadline),
      lateDays: (lateDays != null ? lateDays.value : this.lateDays),
      exercise: (exercise != null ? exercise.value : this.exercise),
      course: (course != null ? course.value : this.course),
      theme: (theme != null ? theme.value : this.theme),
      longread: (longread != null ? longread.value : this.longread),
      student: (student != null ? student.value : this.student),
      reviewer: (reviewer != null ? reviewer.value : this.reviewer),
      solution: (solution != null ? solution.value : this.solution),
      scores: (scores != null ? scores.value : this.scores),
      quizSessionId: (quizSessionId != null
          ? quizSessionId.value
          : this.quizSessionId),
      evaluatedAttemptId: (evaluatedAttemptId != null
          ? evaluatedAttemptId.value
          : this.evaluatedAttemptId),
      currentAttemptId: (currentAttemptId != null
          ? currentAttemptId.value
          : this.currentAttemptId),
      lastAttemptId: (lastAttemptId != null
          ? lastAttemptId.value
          : this.lastAttemptId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class GenerateContentDownloadLinkResponse {
  const GenerateContentDownloadLinkResponse({required this.url});

  factory GenerateContentDownloadLinkResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$GenerateContentDownloadLinkResponseFromJson(json);

  static const toJsonFactory = _$GenerateContentDownloadLinkResponseToJson;
  Map<String, dynamic> toJson() =>
      _$GenerateContentDownloadLinkResponseToJson(this);

  @JsonKey(name: 'url')
  final String url;
  static const fromJsonFactory = _$GenerateContentDownloadLinkResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GenerateContentDownloadLinkResponse &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(url) ^ runtimeType.hashCode;
}

extension $GenerateContentDownloadLinkResponseExtension
    on GenerateContentDownloadLinkResponse {
  GenerateContentDownloadLinkResponse copyWith({String? url}) {
    return GenerateContentDownloadLinkResponse(url: url ?? this.url);
  }

  GenerateContentDownloadLinkResponse copyWithWrapped({Wrapped<String>? url}) {
    return GenerateContentDownloadLinkResponse(
      url: (url != null ? url.value : this.url),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class LongreadExerciseSingleChoiceQuestionitem$SingleChoice {
  const LongreadExerciseSingleChoiceQuestionitem$SingleChoice({
    required this.options,
  });

  factory LongreadExerciseSingleChoiceQuestionitem$SingleChoice.fromJson(
    Map<String, dynamic> json,
  ) => _$LongreadExerciseSingleChoiceQuestionitem$SingleChoiceFromJson(json);

  static const toJsonFactory =
      _$LongreadExerciseSingleChoiceQuestionitem$SingleChoiceToJson;
  Map<String, dynamic> toJson() =>
      _$LongreadExerciseSingleChoiceQuestionitem$SingleChoiceToJson(this);

  @JsonKey(name: 'options')
  final List<QuestionItemOption> options;
  static const fromJsonFactory =
      _$LongreadExerciseSingleChoiceQuestionitem$SingleChoiceFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LongreadExerciseSingleChoiceQuestionitem$SingleChoice &&
            (identical(other.options, options) ||
                const DeepCollectionEquality().equals(other.options, options)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(options) ^ runtimeType.hashCode;
}

extension $LongreadExerciseSingleChoiceQuestionitem$SingleChoiceExtension
    on LongreadExerciseSingleChoiceQuestionitem$SingleChoice {
  LongreadExerciseSingleChoiceQuestionitem$SingleChoice copyWith({
    List<QuestionItemOption>? options,
  }) {
    return LongreadExerciseSingleChoiceQuestionitem$SingleChoice(
      options: options ?? this.options,
    );
  }

  LongreadExerciseSingleChoiceQuestionitem$SingleChoice copyWithWrapped({
    Wrapped<List<QuestionItemOption>>? options,
  }) {
    return LongreadExerciseSingleChoiceQuestionitem$SingleChoice(
      options: (options != null ? options.value : this.options),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class LongreadExerciseMultipleChoiceQuestionItem$MultipleChoice {
  const LongreadExerciseMultipleChoiceQuestionItem$MultipleChoice({
    required this.options,
  });

  factory LongreadExerciseMultipleChoiceQuestionItem$MultipleChoice.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$LongreadExerciseMultipleChoiceQuestionItem$MultipleChoiceFromJson(json);

  static const toJsonFactory =
      _$LongreadExerciseMultipleChoiceQuestionItem$MultipleChoiceToJson;
  Map<String, dynamic> toJson() =>
      _$LongreadExerciseMultipleChoiceQuestionItem$MultipleChoiceToJson(this);

  @JsonKey(name: 'options')
  final List<QuestionItemOption> options;
  static const fromJsonFactory =
      _$LongreadExerciseMultipleChoiceQuestionItem$MultipleChoiceFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LongreadExerciseMultipleChoiceQuestionItem$MultipleChoice &&
            (identical(other.options, options) ||
                const DeepCollectionEquality().equals(other.options, options)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(options) ^ runtimeType.hashCode;
}

extension $LongreadExerciseMultipleChoiceQuestionItem$MultipleChoiceExtension
    on LongreadExerciseMultipleChoiceQuestionItem$MultipleChoice {
  LongreadExerciseMultipleChoiceQuestionItem$MultipleChoice copyWith({
    List<QuestionItemOption>? options,
  }) {
    return LongreadExerciseMultipleChoiceQuestionItem$MultipleChoice(
      options: options ?? this.options,
    );
  }

  LongreadExerciseMultipleChoiceQuestionItem$MultipleChoice copyWithWrapped({
    Wrapped<List<QuestionItemOption>>? options,
  }) {
    return LongreadExerciseMultipleChoiceQuestionItem$MultipleChoice(
      options: (options != null ? options.value : this.options),
    );
  }
}

String? xRePropertyIncompleteOnlyNullObservedNullableToJson(
  enums.XRePropertyIncompleteOnlyNullObserved?
  xRePropertyIncompleteOnlyNullObserved,
) {
  return xRePropertyIncompleteOnlyNullObserved?.value;
}

String? xRePropertyIncompleteOnlyNullObservedToJson(
  enums.XRePropertyIncompleteOnlyNullObserved
  xRePropertyIncompleteOnlyNullObserved,
) {
  return xRePropertyIncompleteOnlyNullObserved.value;
}

enums.XRePropertyIncompleteOnlyNullObserved
xRePropertyIncompleteOnlyNullObservedFromJson(
  Object? xRePropertyIncompleteOnlyNullObserved, [
  enums.XRePropertyIncompleteOnlyNullObserved? defaultValue,
]) {
  return enums.XRePropertyIncompleteOnlyNullObserved.values.firstWhereOrNull(
        (e) => e.value == xRePropertyIncompleteOnlyNullObserved,
      ) ??
      defaultValue ??
      enums.XRePropertyIncompleteOnlyNullObserved.swaggerGeneratedUnknown;
}

enums.XRePropertyIncompleteOnlyNullObserved?
xRePropertyIncompleteOnlyNullObservedNullableFromJson(
  Object? xRePropertyIncompleteOnlyNullObserved, [
  enums.XRePropertyIncompleteOnlyNullObserved? defaultValue,
]) {
  if (xRePropertyIncompleteOnlyNullObserved == null) {
    return null;
  }
  return enums.XRePropertyIncompleteOnlyNullObserved.values.firstWhereOrNull(
        (e) => e.value == xRePropertyIncompleteOnlyNullObserved,
      ) ??
      defaultValue;
}

String xRePropertyIncompleteOnlyNullObservedExplodedListToJson(
  List<enums.XRePropertyIncompleteOnlyNullObserved>?
  xRePropertyIncompleteOnlyNullObserved,
) {
  return xRePropertyIncompleteOnlyNullObserved
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> xRePropertyIncompleteOnlyNullObservedListToJson(
  List<enums.XRePropertyIncompleteOnlyNullObserved>?
  xRePropertyIncompleteOnlyNullObserved,
) {
  if (xRePropertyIncompleteOnlyNullObserved == null) {
    return [];
  }

  return xRePropertyIncompleteOnlyNullObserved.map((e) => e.value!).toList();
}

List<enums.XRePropertyIncompleteOnlyNullObserved>
xRePropertyIncompleteOnlyNullObservedListFromJson(
  List? xRePropertyIncompleteOnlyNullObserved, [
  List<enums.XRePropertyIncompleteOnlyNullObserved>? defaultValue,
]) {
  if (xRePropertyIncompleteOnlyNullObserved == null) {
    return defaultValue ?? [];
  }

  return xRePropertyIncompleteOnlyNullObserved
      .map((e) => xRePropertyIncompleteOnlyNullObservedFromJson(e.toString()))
      .toList();
}

List<enums.XRePropertyIncompleteOnlyNullObserved>?
xRePropertyIncompleteOnlyNullObservedNullableListFromJson(
  List? xRePropertyIncompleteOnlyNullObserved, [
  List<enums.XRePropertyIncompleteOnlyNullObserved>? defaultValue,
]) {
  if (xRePropertyIncompleteOnlyNullObserved == null) {
    return defaultValue;
  }

  return xRePropertyIncompleteOnlyNullObserved
      .map((e) => xRePropertyIncompleteOnlyNullObservedFromJson(e.toString()))
      .toList();
}

String? nullOnlyNullableToJson(enums.NullOnly? nullOnly) {
  return nullOnly?.value;
}

String? nullOnlyToJson(enums.NullOnly nullOnly) {
  return nullOnly.value;
}

enums.NullOnly nullOnlyFromJson(
  Object? nullOnly, [
  enums.NullOnly? defaultValue,
]) {
  return enums.NullOnly.values.firstWhereOrNull((e) => e.value == nullOnly) ??
      defaultValue ??
      enums.NullOnly.swaggerGeneratedUnknown;
}

enums.NullOnly? nullOnlyNullableFromJson(
  Object? nullOnly, [
  enums.NullOnly? defaultValue,
]) {
  if (nullOnly == null) {
    return null;
  }
  return enums.NullOnly.values.firstWhereOrNull((e) => e.value == nullOnly) ??
      defaultValue;
}

String nullOnlyExplodedListToJson(List<enums.NullOnly>? nullOnly) {
  return nullOnly?.map((e) => e.value!).join(',') ?? '';
}

List<String> nullOnlyListToJson(List<enums.NullOnly>? nullOnly) {
  if (nullOnly == null) {
    return [];
  }

  return nullOnly.map((e) => e.value!).toList();
}

List<enums.NullOnly> nullOnlyListFromJson(
  List? nullOnly, [
  List<enums.NullOnly>? defaultValue,
]) {
  if (nullOnly == null) {
    return defaultValue ?? [];
  }

  return nullOnly.map((e) => nullOnlyFromJson(e.toString())).toList();
}

List<enums.NullOnly>? nullOnlyNullableListFromJson(
  List? nullOnly, [
  List<enums.NullOnly>? defaultValue,
]) {
  if (nullOnly == null) {
    return defaultValue;
  }

  return nullOnly.map((e) => nullOnlyFromJson(e.toString())).toList();
}

String? publicationStateNullableToJson(
  enums.PublicationState? publicationState,
) {
  return publicationState?.value;
}

String? publicationStateToJson(enums.PublicationState publicationState) {
  return publicationState.value;
}

enums.PublicationState publicationStateFromJson(
  Object? publicationState, [
  enums.PublicationState? defaultValue,
]) {
  return enums.PublicationState.values.firstWhereOrNull(
        (e) => e.value == publicationState,
      ) ??
      defaultValue ??
      enums.PublicationState.swaggerGeneratedUnknown;
}

enums.PublicationState? publicationStateNullableFromJson(
  Object? publicationState, [
  enums.PublicationState? defaultValue,
]) {
  if (publicationState == null) {
    return null;
  }
  return enums.PublicationState.values.firstWhereOrNull(
        (e) => e.value == publicationState,
      ) ??
      defaultValue;
}

String publicationStateExplodedListToJson(
  List<enums.PublicationState>? publicationState,
) {
  return publicationState?.map((e) => e.value!).join(',') ?? '';
}

List<String> publicationStateListToJson(
  List<enums.PublicationState>? publicationState,
) {
  if (publicationState == null) {
    return [];
  }

  return publicationState.map((e) => e.value!).toList();
}

List<enums.PublicationState> publicationStateListFromJson(
  List? publicationState, [
  List<enums.PublicationState>? defaultValue,
]) {
  if (publicationState == null) {
    return defaultValue ?? [];
  }

  return publicationState
      .map((e) => publicationStateFromJson(e.toString()))
      .toList();
}

List<enums.PublicationState>? publicationStateNullableListFromJson(
  List? publicationState, [
  List<enums.PublicationState>? defaultValue,
]) {
  if (publicationState == null) {
    return defaultValue;
  }

  return publicationState
      .map((e) => publicationStateFromJson(e.toString()))
      .toList();
}

String? courseSkillLevelNullableToJson(
  enums.CourseSkillLevel? courseSkillLevel,
) {
  return courseSkillLevel?.value;
}

String? courseSkillLevelToJson(enums.CourseSkillLevel courseSkillLevel) {
  return courseSkillLevel.value;
}

enums.CourseSkillLevel courseSkillLevelFromJson(
  Object? courseSkillLevel, [
  enums.CourseSkillLevel? defaultValue,
]) {
  return enums.CourseSkillLevel.values.firstWhereOrNull(
        (e) => e.value == courseSkillLevel,
      ) ??
      defaultValue ??
      enums.CourseSkillLevel.swaggerGeneratedUnknown;
}

enums.CourseSkillLevel? courseSkillLevelNullableFromJson(
  Object? courseSkillLevel, [
  enums.CourseSkillLevel? defaultValue,
]) {
  if (courseSkillLevel == null) {
    return null;
  }
  return enums.CourseSkillLevel.values.firstWhereOrNull(
        (e) => e.value == courseSkillLevel,
      ) ??
      defaultValue;
}

String courseSkillLevelExplodedListToJson(
  List<enums.CourseSkillLevel>? courseSkillLevel,
) {
  return courseSkillLevel?.map((e) => e.value!).join(',') ?? '';
}

List<String> courseSkillLevelListToJson(
  List<enums.CourseSkillLevel>? courseSkillLevel,
) {
  if (courseSkillLevel == null) {
    return [];
  }

  return courseSkillLevel.map((e) => e.value!).toList();
}

List<enums.CourseSkillLevel> courseSkillLevelListFromJson(
  List? courseSkillLevel, [
  List<enums.CourseSkillLevel>? defaultValue,
]) {
  if (courseSkillLevel == null) {
    return defaultValue ?? [];
  }

  return courseSkillLevel
      .map((e) => courseSkillLevelFromJson(e.toString()))
      .toList();
}

List<enums.CourseSkillLevel>? courseSkillLevelNullableListFromJson(
  List? courseSkillLevel, [
  List<enums.CourseSkillLevel>? defaultValue,
]) {
  if (courseSkillLevel == null) {
    return defaultValue;
  }

  return courseSkillLevel
      .map((e) => courseSkillLevelFromJson(e.toString()))
      .toList();
}

String? courseCategoryNullableToJson(enums.CourseCategory? courseCategory) {
  return courseCategory?.value;
}

String? courseCategoryToJson(enums.CourseCategory courseCategory) {
  return courseCategory.value;
}

enums.CourseCategory courseCategoryFromJson(
  Object? courseCategory, [
  enums.CourseCategory? defaultValue,
]) {
  return enums.CourseCategory.values.firstWhereOrNull(
        (e) => e.value == courseCategory,
      ) ??
      defaultValue ??
      enums.CourseCategory.swaggerGeneratedUnknown;
}

enums.CourseCategory? courseCategoryNullableFromJson(
  Object? courseCategory, [
  enums.CourseCategory? defaultValue,
]) {
  if (courseCategory == null) {
    return null;
  }
  return enums.CourseCategory.values.firstWhereOrNull(
        (e) => e.value == courseCategory,
      ) ??
      defaultValue;
}

String courseCategoryExplodedListToJson(
  List<enums.CourseCategory>? courseCategory,
) {
  return courseCategory?.map((e) => e.value!).join(',') ?? '';
}

List<String> courseCategoryListToJson(
  List<enums.CourseCategory>? courseCategory,
) {
  if (courseCategory == null) {
    return [];
  }

  return courseCategory.map((e) => e.value!).toList();
}

List<enums.CourseCategory> courseCategoryListFromJson(
  List? courseCategory, [
  List<enums.CourseCategory>? defaultValue,
]) {
  if (courseCategory == null) {
    return defaultValue ?? [];
  }

  return courseCategory
      .map((e) => courseCategoryFromJson(e.toString()))
      .toList();
}

List<enums.CourseCategory>? courseCategoryNullableListFromJson(
  List? courseCategory, [
  List<enums.CourseCategory>? defaultValue,
]) {
  if (courseCategory == null) {
    return defaultValue;
  }

  return courseCategory
      .map((e) => courseCategoryFromJson(e.toString()))
      .toList();
}

String? courseCategoryCoverNullableToJson(
  enums.CourseCategoryCover? courseCategoryCover,
) {
  return courseCategoryCover?.value;
}

String? courseCategoryCoverToJson(
  enums.CourseCategoryCover courseCategoryCover,
) {
  return courseCategoryCover.value;
}

enums.CourseCategoryCover courseCategoryCoverFromJson(
  Object? courseCategoryCover, [
  enums.CourseCategoryCover? defaultValue,
]) {
  return enums.CourseCategoryCover.values.firstWhereOrNull(
        (e) => e.value == courseCategoryCover,
      ) ??
      defaultValue ??
      enums.CourseCategoryCover.swaggerGeneratedUnknown;
}

enums.CourseCategoryCover? courseCategoryCoverNullableFromJson(
  Object? courseCategoryCover, [
  enums.CourseCategoryCover? defaultValue,
]) {
  if (courseCategoryCover == null) {
    return null;
  }
  return enums.CourseCategoryCover.values.firstWhereOrNull(
        (e) => e.value == courseCategoryCover,
      ) ??
      defaultValue;
}

String courseCategoryCoverExplodedListToJson(
  List<enums.CourseCategoryCover>? courseCategoryCover,
) {
  return courseCategoryCover?.map((e) => e.value!).join(',') ?? '';
}

List<String> courseCategoryCoverListToJson(
  List<enums.CourseCategoryCover>? courseCategoryCover,
) {
  if (courseCategoryCover == null) {
    return [];
  }

  return courseCategoryCover.map((e) => e.value!).toList();
}

List<enums.CourseCategoryCover> courseCategoryCoverListFromJson(
  List? courseCategoryCover, [
  List<enums.CourseCategoryCover>? defaultValue,
]) {
  if (courseCategoryCover == null) {
    return defaultValue ?? [];
  }

  return courseCategoryCover
      .map((e) => courseCategoryCoverFromJson(e.toString()))
      .toList();
}

List<enums.CourseCategoryCover>? courseCategoryCoverNullableListFromJson(
  List? courseCategoryCover, [
  List<enums.CourseCategoryCover>? defaultValue,
]) {
  if (courseCategoryCover == null) {
    return defaultValue;
  }

  return courseCategoryCover
      .map((e) => courseCategoryCoverFromJson(e.toString()))
      .toList();
}

String? studyLevelNullableToJson(enums.StudyLevel? studyLevel) {
  return studyLevel?.value;
}

String? studyLevelToJson(enums.StudyLevel studyLevel) {
  return studyLevel.value;
}

enums.StudyLevel studyLevelFromJson(
  Object? studyLevel, [
  enums.StudyLevel? defaultValue,
]) {
  return enums.StudyLevel.values.firstWhereOrNull(
        (e) => e.value == studyLevel,
      ) ??
      defaultValue ??
      enums.StudyLevel.swaggerGeneratedUnknown;
}

enums.StudyLevel? studyLevelNullableFromJson(
  Object? studyLevel, [
  enums.StudyLevel? defaultValue,
]) {
  if (studyLevel == null) {
    return null;
  }
  return enums.StudyLevel.values.firstWhereOrNull(
        (e) => e.value == studyLevel,
      ) ??
      defaultValue;
}

String studyLevelExplodedListToJson(List<enums.StudyLevel>? studyLevel) {
  return studyLevel?.map((e) => e.value!).join(',') ?? '';
}

List<String> studyLevelListToJson(List<enums.StudyLevel>? studyLevel) {
  if (studyLevel == null) {
    return [];
  }

  return studyLevel.map((e) => e.value!).toList();
}

List<enums.StudyLevel> studyLevelListFromJson(
  List? studyLevel, [
  List<enums.StudyLevel>? defaultValue,
]) {
  if (studyLevel == null) {
    return defaultValue ?? [];
  }

  return studyLevel.map((e) => studyLevelFromJson(e.toString())).toList();
}

List<enums.StudyLevel>? studyLevelNullableListFromJson(
  List? studyLevel, [
  List<enums.StudyLevel>? defaultValue,
]) {
  if (studyLevel == null) {
    return defaultValue;
  }

  return studyLevel.map((e) => studyLevelFromJson(e.toString())).toList();
}

String? longreadTypeNullableToJson(enums.LongreadType? longreadType) {
  return longreadType?.value;
}

String? longreadTypeToJson(enums.LongreadType longreadType) {
  return longreadType.value;
}

enums.LongreadType longreadTypeFromJson(
  Object? longreadType, [
  enums.LongreadType? defaultValue,
]) {
  return enums.LongreadType.values.firstWhereOrNull(
        (e) => e.value == longreadType,
      ) ??
      defaultValue ??
      enums.LongreadType.swaggerGeneratedUnknown;
}

enums.LongreadType? longreadTypeNullableFromJson(
  Object? longreadType, [
  enums.LongreadType? defaultValue,
]) {
  if (longreadType == null) {
    return null;
  }
  return enums.LongreadType.values.firstWhereOrNull(
        (e) => e.value == longreadType,
      ) ??
      defaultValue;
}

String longreadTypeExplodedListToJson(List<enums.LongreadType>? longreadType) {
  return longreadType?.map((e) => e.value!).join(',') ?? '';
}

List<String> longreadTypeListToJson(List<enums.LongreadType>? longreadType) {
  if (longreadType == null) {
    return [];
  }

  return longreadType.map((e) => e.value!).toList();
}

List<enums.LongreadType> longreadTypeListFromJson(
  List? longreadType, [
  List<enums.LongreadType>? defaultValue,
]) {
  if (longreadType == null) {
    return defaultValue ?? [];
  }

  return longreadType.map((e) => longreadTypeFromJson(e.toString())).toList();
}

List<enums.LongreadType>? longreadTypeNullableListFromJson(
  List? longreadType, [
  List<enums.LongreadType>? defaultValue,
]) {
  if (longreadType == null) {
    return defaultValue;
  }

  return longreadType.map((e) => longreadTypeFromJson(e.toString())).toList();
}

String? longreadMaterialTypeNullableToJson(
  enums.LongreadMaterialType? longreadMaterialType,
) {
  return longreadMaterialType?.value;
}

String? longreadMaterialTypeToJson(
  enums.LongreadMaterialType longreadMaterialType,
) {
  return longreadMaterialType.value;
}

enums.LongreadMaterialType longreadMaterialTypeFromJson(
  Object? longreadMaterialType, [
  enums.LongreadMaterialType? defaultValue,
]) {
  return enums.LongreadMaterialType.values.firstWhereOrNull(
        (e) => e.value == longreadMaterialType,
      ) ??
      defaultValue ??
      enums.LongreadMaterialType.swaggerGeneratedUnknown;
}

enums.LongreadMaterialType? longreadMaterialTypeNullableFromJson(
  Object? longreadMaterialType, [
  enums.LongreadMaterialType? defaultValue,
]) {
  if (longreadMaterialType == null) {
    return null;
  }
  return enums.LongreadMaterialType.values.firstWhereOrNull(
        (e) => e.value == longreadMaterialType,
      ) ??
      defaultValue;
}

String longreadMaterialTypeExplodedListToJson(
  List<enums.LongreadMaterialType>? longreadMaterialType,
) {
  return longreadMaterialType?.map((e) => e.value!).join(',') ?? '';
}

List<String> longreadMaterialTypeListToJson(
  List<enums.LongreadMaterialType>? longreadMaterialType,
) {
  if (longreadMaterialType == null) {
    return [];
  }

  return longreadMaterialType.map((e) => e.value!).toList();
}

List<enums.LongreadMaterialType> longreadMaterialTypeListFromJson(
  List? longreadMaterialType, [
  List<enums.LongreadMaterialType>? defaultValue,
]) {
  if (longreadMaterialType == null) {
    return defaultValue ?? [];
  }

  return longreadMaterialType
      .map((e) => longreadMaterialTypeFromJson(e.toString()))
      .toList();
}

List<enums.LongreadMaterialType>? longreadMaterialTypeNullableListFromJson(
  List? longreadMaterialType, [
  List<enums.LongreadMaterialType>? defaultValue,
]) {
  if (longreadMaterialType == null) {
    return defaultValue;
  }

  return longreadMaterialType
      .map((e) => longreadMaterialTypeFromJson(e.toString()))
      .toList();
}

String? longreadMaterialDiscriminatorNullableToJson(
  enums.LongreadMaterialDiscriminator? longreadMaterialDiscriminator,
) {
  return longreadMaterialDiscriminator?.value;
}

String? longreadMaterialDiscriminatorToJson(
  enums.LongreadMaterialDiscriminator longreadMaterialDiscriminator,
) {
  return longreadMaterialDiscriminator.value;
}

enums.LongreadMaterialDiscriminator longreadMaterialDiscriminatorFromJson(
  Object? longreadMaterialDiscriminator, [
  enums.LongreadMaterialDiscriminator? defaultValue,
]) {
  return enums.LongreadMaterialDiscriminator.values.firstWhereOrNull(
        (e) => e.value == longreadMaterialDiscriminator,
      ) ??
      defaultValue ??
      enums.LongreadMaterialDiscriminator.swaggerGeneratedUnknown;
}

enums.LongreadMaterialDiscriminator?
longreadMaterialDiscriminatorNullableFromJson(
  Object? longreadMaterialDiscriminator, [
  enums.LongreadMaterialDiscriminator? defaultValue,
]) {
  if (longreadMaterialDiscriminator == null) {
    return null;
  }
  return enums.LongreadMaterialDiscriminator.values.firstWhereOrNull(
        (e) => e.value == longreadMaterialDiscriminator,
      ) ??
      defaultValue;
}

String longreadMaterialDiscriminatorExplodedListToJson(
  List<enums.LongreadMaterialDiscriminator>? longreadMaterialDiscriminator,
) {
  return longreadMaterialDiscriminator?.map((e) => e.value!).join(',') ?? '';
}

List<String> longreadMaterialDiscriminatorListToJson(
  List<enums.LongreadMaterialDiscriminator>? longreadMaterialDiscriminator,
) {
  if (longreadMaterialDiscriminator == null) {
    return [];
  }

  return longreadMaterialDiscriminator.map((e) => e.value!).toList();
}

List<enums.LongreadMaterialDiscriminator>
longreadMaterialDiscriminatorListFromJson(
  List? longreadMaterialDiscriminator, [
  List<enums.LongreadMaterialDiscriminator>? defaultValue,
]) {
  if (longreadMaterialDiscriminator == null) {
    return defaultValue ?? [];
  }

  return longreadMaterialDiscriminator
      .map((e) => longreadMaterialDiscriminatorFromJson(e.toString()))
      .toList();
}

List<enums.LongreadMaterialDiscriminator>?
longreadMaterialDiscriminatorNullableListFromJson(
  List? longreadMaterialDiscriminator, [
  List<enums.LongreadMaterialDiscriminator>? defaultValue,
]) {
  if (longreadMaterialDiscriminator == null) {
    return defaultValue;
  }

  return longreadMaterialDiscriminator
      .map((e) => longreadMaterialDiscriminatorFromJson(e.toString()))
      .toList();
}

String? longreadMaterialViewTypeNullableToJson(
  enums.LongreadMaterialViewType? longreadMaterialViewType,
) {
  return longreadMaterialViewType?.value;
}

String? longreadMaterialViewTypeToJson(
  enums.LongreadMaterialViewType longreadMaterialViewType,
) {
  return longreadMaterialViewType.value;
}

enums.LongreadMaterialViewType longreadMaterialViewTypeFromJson(
  Object? longreadMaterialViewType, [
  enums.LongreadMaterialViewType? defaultValue,
]) {
  return enums.LongreadMaterialViewType.values.firstWhereOrNull(
        (e) => e.value == longreadMaterialViewType,
      ) ??
      defaultValue ??
      enums.LongreadMaterialViewType.swaggerGeneratedUnknown;
}

enums.LongreadMaterialViewType? longreadMaterialViewTypeNullableFromJson(
  Object? longreadMaterialViewType, [
  enums.LongreadMaterialViewType? defaultValue,
]) {
  if (longreadMaterialViewType == null) {
    return null;
  }
  return enums.LongreadMaterialViewType.values.firstWhereOrNull(
        (e) => e.value == longreadMaterialViewType,
      ) ??
      defaultValue;
}

String longreadMaterialViewTypeExplodedListToJson(
  List<enums.LongreadMaterialViewType>? longreadMaterialViewType,
) {
  return longreadMaterialViewType?.map((e) => e.value!).join(',') ?? '';
}

List<String> longreadMaterialViewTypeListToJson(
  List<enums.LongreadMaterialViewType>? longreadMaterialViewType,
) {
  if (longreadMaterialViewType == null) {
    return [];
  }

  return longreadMaterialViewType.map((e) => e.value!).toList();
}

List<enums.LongreadMaterialViewType> longreadMaterialViewTypeListFromJson(
  List? longreadMaterialViewType, [
  List<enums.LongreadMaterialViewType>? defaultValue,
]) {
  if (longreadMaterialViewType == null) {
    return defaultValue ?? [];
  }

  return longreadMaterialViewType
      .map((e) => longreadMaterialViewTypeFromJson(e.toString()))
      .toList();
}

List<enums.LongreadMaterialViewType>?
longreadMaterialViewTypeNullableListFromJson(
  List? longreadMaterialViewType, [
  List<enums.LongreadMaterialViewType>? defaultValue,
]) {
  if (longreadMaterialViewType == null) {
    return defaultValue;
  }

  return longreadMaterialViewType
      .map((e) => longreadMaterialViewTypeFromJson(e.toString()))
      .toList();
}

String? fileMediaTypeNullableToJson(enums.FileMediaType? fileMediaType) {
  return fileMediaType?.value;
}

String? fileMediaTypeToJson(enums.FileMediaType fileMediaType) {
  return fileMediaType.value;
}

enums.FileMediaType fileMediaTypeFromJson(
  Object? fileMediaType, [
  enums.FileMediaType? defaultValue,
]) {
  return enums.FileMediaType.values.firstWhereOrNull(
        (e) => e.value == fileMediaType,
      ) ??
      defaultValue ??
      enums.FileMediaType.swaggerGeneratedUnknown;
}

enums.FileMediaType? fileMediaTypeNullableFromJson(
  Object? fileMediaType, [
  enums.FileMediaType? defaultValue,
]) {
  if (fileMediaType == null) {
    return null;
  }
  return enums.FileMediaType.values.firstWhereOrNull(
        (e) => e.value == fileMediaType,
      ) ??
      defaultValue;
}

String fileMediaTypeExplodedListToJson(
  List<enums.FileMediaType>? fileMediaType,
) {
  return fileMediaType?.map((e) => e.value!).join(',') ?? '';
}

List<String> fileMediaTypeListToJson(List<enums.FileMediaType>? fileMediaType) {
  if (fileMediaType == null) {
    return [];
  }

  return fileMediaType.map((e) => e.value!).toList();
}

List<enums.FileMediaType> fileMediaTypeListFromJson(
  List? fileMediaType, [
  List<enums.FileMediaType>? defaultValue,
]) {
  if (fileMediaType == null) {
    return defaultValue ?? [];
  }

  return fileMediaType.map((e) => fileMediaTypeFromJson(e.toString())).toList();
}

List<enums.FileMediaType>? fileMediaTypeNullableListFromJson(
  List? fileMediaType, [
  List<enums.FileMediaType>? defaultValue,
]) {
  if (fileMediaType == null) {
    return defaultValue;
  }

  return fileMediaType.map((e) => fileMediaTypeFromJson(e.toString())).toList();
}

String? longreadMaterialMediaTypeUpperNullableToJson(
  enums.LongreadMaterialMediaTypeUpper? longreadMaterialMediaTypeUpper,
) {
  return longreadMaterialMediaTypeUpper?.value;
}

String? longreadMaterialMediaTypeUpperToJson(
  enums.LongreadMaterialMediaTypeUpper longreadMaterialMediaTypeUpper,
) {
  return longreadMaterialMediaTypeUpper.value;
}

enums.LongreadMaterialMediaTypeUpper longreadMaterialMediaTypeUpperFromJson(
  Object? longreadMaterialMediaTypeUpper, [
  enums.LongreadMaterialMediaTypeUpper? defaultValue,
]) {
  return enums.LongreadMaterialMediaTypeUpper.values.firstWhereOrNull(
        (e) => e.value == longreadMaterialMediaTypeUpper,
      ) ??
      defaultValue ??
      enums.LongreadMaterialMediaTypeUpper.swaggerGeneratedUnknown;
}

enums.LongreadMaterialMediaTypeUpper?
longreadMaterialMediaTypeUpperNullableFromJson(
  Object? longreadMaterialMediaTypeUpper, [
  enums.LongreadMaterialMediaTypeUpper? defaultValue,
]) {
  if (longreadMaterialMediaTypeUpper == null) {
    return null;
  }
  return enums.LongreadMaterialMediaTypeUpper.values.firstWhereOrNull(
        (e) => e.value == longreadMaterialMediaTypeUpper,
      ) ??
      defaultValue;
}

String longreadMaterialMediaTypeUpperExplodedListToJson(
  List<enums.LongreadMaterialMediaTypeUpper>? longreadMaterialMediaTypeUpper,
) {
  return longreadMaterialMediaTypeUpper?.map((e) => e.value!).join(',') ?? '';
}

List<String> longreadMaterialMediaTypeUpperListToJson(
  List<enums.LongreadMaterialMediaTypeUpper>? longreadMaterialMediaTypeUpper,
) {
  if (longreadMaterialMediaTypeUpper == null) {
    return [];
  }

  return longreadMaterialMediaTypeUpper.map((e) => e.value!).toList();
}

List<enums.LongreadMaterialMediaTypeUpper>
longreadMaterialMediaTypeUpperListFromJson(
  List? longreadMaterialMediaTypeUpper, [
  List<enums.LongreadMaterialMediaTypeUpper>? defaultValue,
]) {
  if (longreadMaterialMediaTypeUpper == null) {
    return defaultValue ?? [];
  }

  return longreadMaterialMediaTypeUpper
      .map((e) => longreadMaterialMediaTypeUpperFromJson(e.toString()))
      .toList();
}

List<enums.LongreadMaterialMediaTypeUpper>?
longreadMaterialMediaTypeUpperNullableListFromJson(
  List? longreadMaterialMediaTypeUpper, [
  List<enums.LongreadMaterialMediaTypeUpper>? defaultValue,
]) {
  if (longreadMaterialMediaTypeUpper == null) {
    return defaultValue;
  }

  return longreadMaterialMediaTypeUpper
      .map((e) => longreadMaterialMediaTypeUpperFromJson(e.toString()))
      .toList();
}

String? longreadExerciseQuestionsModeNullableToJson(
  enums.LongreadExerciseQuestionsMode? longreadExerciseQuestionsMode,
) {
  return longreadExerciseQuestionsMode?.value;
}

String? longreadExerciseQuestionsModeToJson(
  enums.LongreadExerciseQuestionsMode longreadExerciseQuestionsMode,
) {
  return longreadExerciseQuestionsMode.value;
}

enums.LongreadExerciseQuestionsMode longreadExerciseQuestionsModeFromJson(
  Object? longreadExerciseQuestionsMode, [
  enums.LongreadExerciseQuestionsMode? defaultValue,
]) {
  return enums.LongreadExerciseQuestionsMode.values.firstWhereOrNull(
        (e) => e.value == longreadExerciseQuestionsMode,
      ) ??
      defaultValue ??
      enums.LongreadExerciseQuestionsMode.swaggerGeneratedUnknown;
}

enums.LongreadExerciseQuestionsMode?
longreadExerciseQuestionsModeNullableFromJson(
  Object? longreadExerciseQuestionsMode, [
  enums.LongreadExerciseQuestionsMode? defaultValue,
]) {
  if (longreadExerciseQuestionsMode == null) {
    return null;
  }
  return enums.LongreadExerciseQuestionsMode.values.firstWhereOrNull(
        (e) => e.value == longreadExerciseQuestionsMode,
      ) ??
      defaultValue;
}

String longreadExerciseQuestionsModeExplodedListToJson(
  List<enums.LongreadExerciseQuestionsMode>? longreadExerciseQuestionsMode,
) {
  return longreadExerciseQuestionsMode?.map((e) => e.value!).join(',') ?? '';
}

List<String> longreadExerciseQuestionsModeListToJson(
  List<enums.LongreadExerciseQuestionsMode>? longreadExerciseQuestionsMode,
) {
  if (longreadExerciseQuestionsMode == null) {
    return [];
  }

  return longreadExerciseQuestionsMode.map((e) => e.value!).toList();
}

List<enums.LongreadExerciseQuestionsMode>
longreadExerciseQuestionsModeListFromJson(
  List? longreadExerciseQuestionsMode, [
  List<enums.LongreadExerciseQuestionsMode>? defaultValue,
]) {
  if (longreadExerciseQuestionsMode == null) {
    return defaultValue ?? [];
  }

  return longreadExerciseQuestionsMode
      .map((e) => longreadExerciseQuestionsModeFromJson(e.toString()))
      .toList();
}

List<enums.LongreadExerciseQuestionsMode>?
longreadExerciseQuestionsModeNullableListFromJson(
  List? longreadExerciseQuestionsMode, [
  List<enums.LongreadExerciseQuestionsMode>? defaultValue,
]) {
  if (longreadExerciseQuestionsMode == null) {
    return defaultValue;
  }

  return longreadExerciseQuestionsMode
      .map((e) => longreadExerciseQuestionsModeFromJson(e.toString()))
      .toList();
}

String? questionsSettingsEvalStrategyNullableToJson(
  enums.QuestionsSettingsEvalStrategy? questionsSettingsEvalStrategy,
) {
  return questionsSettingsEvalStrategy?.value;
}

String? questionsSettingsEvalStrategyToJson(
  enums.QuestionsSettingsEvalStrategy questionsSettingsEvalStrategy,
) {
  return questionsSettingsEvalStrategy.value;
}

enums.QuestionsSettingsEvalStrategy questionsSettingsEvalStrategyFromJson(
  Object? questionsSettingsEvalStrategy, [
  enums.QuestionsSettingsEvalStrategy? defaultValue,
]) {
  return enums.QuestionsSettingsEvalStrategy.values.firstWhereOrNull(
        (e) => e.value == questionsSettingsEvalStrategy,
      ) ??
      defaultValue ??
      enums.QuestionsSettingsEvalStrategy.swaggerGeneratedUnknown;
}

enums.QuestionsSettingsEvalStrategy?
questionsSettingsEvalStrategyNullableFromJson(
  Object? questionsSettingsEvalStrategy, [
  enums.QuestionsSettingsEvalStrategy? defaultValue,
]) {
  if (questionsSettingsEvalStrategy == null) {
    return null;
  }
  return enums.QuestionsSettingsEvalStrategy.values.firstWhereOrNull(
        (e) => e.value == questionsSettingsEvalStrategy,
      ) ??
      defaultValue;
}

String questionsSettingsEvalStrategyExplodedListToJson(
  List<enums.QuestionsSettingsEvalStrategy>? questionsSettingsEvalStrategy,
) {
  return questionsSettingsEvalStrategy?.map((e) => e.value!).join(',') ?? '';
}

List<String> questionsSettingsEvalStrategyListToJson(
  List<enums.QuestionsSettingsEvalStrategy>? questionsSettingsEvalStrategy,
) {
  if (questionsSettingsEvalStrategy == null) {
    return [];
  }

  return questionsSettingsEvalStrategy.map((e) => e.value!).toList();
}

List<enums.QuestionsSettingsEvalStrategy>
questionsSettingsEvalStrategyListFromJson(
  List? questionsSettingsEvalStrategy, [
  List<enums.QuestionsSettingsEvalStrategy>? defaultValue,
]) {
  if (questionsSettingsEvalStrategy == null) {
    return defaultValue ?? [];
  }

  return questionsSettingsEvalStrategy
      .map((e) => questionsSettingsEvalStrategyFromJson(e.toString()))
      .toList();
}

List<enums.QuestionsSettingsEvalStrategy>?
questionsSettingsEvalStrategyNullableListFromJson(
  List? questionsSettingsEvalStrategy, [
  List<enums.QuestionsSettingsEvalStrategy>? defaultValue,
]) {
  if (questionsSettingsEvalStrategy == null) {
    return defaultValue;
  }

  return questionsSettingsEvalStrategy
      .map((e) => questionsSettingsEvalStrategyFromJson(e.toString()))
      .toList();
}

String? questionItemCorrectAnswerInputStringCorrectAnswerTypeNullableToJson(
  enums.QuestionItemCorrectAnswerInputStringCorrectAnswerType?
  questionItemCorrectAnswerInputStringCorrectAnswerType,
) {
  return questionItemCorrectAnswerInputStringCorrectAnswerType?.value;
}

String? questionItemCorrectAnswerInputStringCorrectAnswerTypeToJson(
  enums.QuestionItemCorrectAnswerInputStringCorrectAnswerType
  questionItemCorrectAnswerInputStringCorrectAnswerType,
) {
  return questionItemCorrectAnswerInputStringCorrectAnswerType.value;
}

enums.QuestionItemCorrectAnswerInputStringCorrectAnswerType
questionItemCorrectAnswerInputStringCorrectAnswerTypeFromJson(
  Object? questionItemCorrectAnswerInputStringCorrectAnswerType, [
  enums.QuestionItemCorrectAnswerInputStringCorrectAnswerType? defaultValue,
]) {
  return enums.QuestionItemCorrectAnswerInputStringCorrectAnswerType.values
          .firstWhereOrNull(
            (e) =>
                e.value ==
                questionItemCorrectAnswerInputStringCorrectAnswerType,
          ) ??
      defaultValue ??
      enums
          .QuestionItemCorrectAnswerInputStringCorrectAnswerType
          .swaggerGeneratedUnknown;
}

enums.QuestionItemCorrectAnswerInputStringCorrectAnswerType?
questionItemCorrectAnswerInputStringCorrectAnswerTypeNullableFromJson(
  Object? questionItemCorrectAnswerInputStringCorrectAnswerType, [
  enums.QuestionItemCorrectAnswerInputStringCorrectAnswerType? defaultValue,
]) {
  if (questionItemCorrectAnswerInputStringCorrectAnswerType == null) {
    return null;
  }
  return enums.QuestionItemCorrectAnswerInputStringCorrectAnswerType.values
          .firstWhereOrNull(
            (e) =>
                e.value ==
                questionItemCorrectAnswerInputStringCorrectAnswerType,
          ) ??
      defaultValue;
}

String questionItemCorrectAnswerInputStringCorrectAnswerTypeExplodedListToJson(
  List<enums.QuestionItemCorrectAnswerInputStringCorrectAnswerType>?
  questionItemCorrectAnswerInputStringCorrectAnswerType,
) {
  return questionItemCorrectAnswerInputStringCorrectAnswerType
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> questionItemCorrectAnswerInputStringCorrectAnswerTypeListToJson(
  List<enums.QuestionItemCorrectAnswerInputStringCorrectAnswerType>?
  questionItemCorrectAnswerInputStringCorrectAnswerType,
) {
  if (questionItemCorrectAnswerInputStringCorrectAnswerType == null) {
    return [];
  }

  return questionItemCorrectAnswerInputStringCorrectAnswerType
      .map((e) => e.value!)
      .toList();
}

List<enums.QuestionItemCorrectAnswerInputStringCorrectAnswerType>
questionItemCorrectAnswerInputStringCorrectAnswerTypeListFromJson(
  List? questionItemCorrectAnswerInputStringCorrectAnswerType, [
  List<enums.QuestionItemCorrectAnswerInputStringCorrectAnswerType>?
  defaultValue,
]) {
  if (questionItemCorrectAnswerInputStringCorrectAnswerType == null) {
    return defaultValue ?? [];
  }

  return questionItemCorrectAnswerInputStringCorrectAnswerType
      .map(
        (e) => questionItemCorrectAnswerInputStringCorrectAnswerTypeFromJson(
          e.toString(),
        ),
      )
      .toList();
}

List<enums.QuestionItemCorrectAnswerInputStringCorrectAnswerType>?
questionItemCorrectAnswerInputStringCorrectAnswerTypeNullableListFromJson(
  List? questionItemCorrectAnswerInputStringCorrectAnswerType, [
  List<enums.QuestionItemCorrectAnswerInputStringCorrectAnswerType>?
  defaultValue,
]) {
  if (questionItemCorrectAnswerInputStringCorrectAnswerType == null) {
    return defaultValue;
  }

  return questionItemCorrectAnswerInputStringCorrectAnswerType
      .map(
        (e) => questionItemCorrectAnswerInputStringCorrectAnswerTypeFromJson(
          e.toString(),
        ),
      )
      .toList();
}

String? questionItemCorrectAnswerInputNumberCorrectAnswerTypeNullableToJson(
  enums.QuestionItemCorrectAnswerInputNumberCorrectAnswerType?
  questionItemCorrectAnswerInputNumberCorrectAnswerType,
) {
  return questionItemCorrectAnswerInputNumberCorrectAnswerType?.value;
}

String? questionItemCorrectAnswerInputNumberCorrectAnswerTypeToJson(
  enums.QuestionItemCorrectAnswerInputNumberCorrectAnswerType
  questionItemCorrectAnswerInputNumberCorrectAnswerType,
) {
  return questionItemCorrectAnswerInputNumberCorrectAnswerType.value;
}

enums.QuestionItemCorrectAnswerInputNumberCorrectAnswerType
questionItemCorrectAnswerInputNumberCorrectAnswerTypeFromJson(
  Object? questionItemCorrectAnswerInputNumberCorrectAnswerType, [
  enums.QuestionItemCorrectAnswerInputNumberCorrectAnswerType? defaultValue,
]) {
  return enums.QuestionItemCorrectAnswerInputNumberCorrectAnswerType.values
          .firstWhereOrNull(
            (e) =>
                e.value ==
                questionItemCorrectAnswerInputNumberCorrectAnswerType,
          ) ??
      defaultValue ??
      enums
          .QuestionItemCorrectAnswerInputNumberCorrectAnswerType
          .swaggerGeneratedUnknown;
}

enums.QuestionItemCorrectAnswerInputNumberCorrectAnswerType?
questionItemCorrectAnswerInputNumberCorrectAnswerTypeNullableFromJson(
  Object? questionItemCorrectAnswerInputNumberCorrectAnswerType, [
  enums.QuestionItemCorrectAnswerInputNumberCorrectAnswerType? defaultValue,
]) {
  if (questionItemCorrectAnswerInputNumberCorrectAnswerType == null) {
    return null;
  }
  return enums.QuestionItemCorrectAnswerInputNumberCorrectAnswerType.values
          .firstWhereOrNull(
            (e) =>
                e.value ==
                questionItemCorrectAnswerInputNumberCorrectAnswerType,
          ) ??
      defaultValue;
}

String questionItemCorrectAnswerInputNumberCorrectAnswerTypeExplodedListToJson(
  List<enums.QuestionItemCorrectAnswerInputNumberCorrectAnswerType>?
  questionItemCorrectAnswerInputNumberCorrectAnswerType,
) {
  return questionItemCorrectAnswerInputNumberCorrectAnswerType
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> questionItemCorrectAnswerInputNumberCorrectAnswerTypeListToJson(
  List<enums.QuestionItemCorrectAnswerInputNumberCorrectAnswerType>?
  questionItemCorrectAnswerInputNumberCorrectAnswerType,
) {
  if (questionItemCorrectAnswerInputNumberCorrectAnswerType == null) {
    return [];
  }

  return questionItemCorrectAnswerInputNumberCorrectAnswerType
      .map((e) => e.value!)
      .toList();
}

List<enums.QuestionItemCorrectAnswerInputNumberCorrectAnswerType>
questionItemCorrectAnswerInputNumberCorrectAnswerTypeListFromJson(
  List? questionItemCorrectAnswerInputNumberCorrectAnswerType, [
  List<enums.QuestionItemCorrectAnswerInputNumberCorrectAnswerType>?
  defaultValue,
]) {
  if (questionItemCorrectAnswerInputNumberCorrectAnswerType == null) {
    return defaultValue ?? [];
  }

  return questionItemCorrectAnswerInputNumberCorrectAnswerType
      .map(
        (e) => questionItemCorrectAnswerInputNumberCorrectAnswerTypeFromJson(
          e.toString(),
        ),
      )
      .toList();
}

List<enums.QuestionItemCorrectAnswerInputNumberCorrectAnswerType>?
questionItemCorrectAnswerInputNumberCorrectAnswerTypeNullableListFromJson(
  List? questionItemCorrectAnswerInputNumberCorrectAnswerType, [
  List<enums.QuestionItemCorrectAnswerInputNumberCorrectAnswerType>?
  defaultValue,
]) {
  if (questionItemCorrectAnswerInputNumberCorrectAnswerType == null) {
    return defaultValue;
  }

  return questionItemCorrectAnswerInputNumberCorrectAnswerType
      .map(
        (e) => questionItemCorrectAnswerInputNumberCorrectAnswerTypeFromJson(
          e.toString(),
        ),
      )
      .toList();
}

String? longreadExerciseInputQuestionItemTypeNullableToJson(
  enums.LongreadExerciseInputQuestionItemType?
  longreadExerciseInputQuestionItemType,
) {
  return longreadExerciseInputQuestionItemType?.value;
}

String? longreadExerciseInputQuestionItemTypeToJson(
  enums.LongreadExerciseInputQuestionItemType
  longreadExerciseInputQuestionItemType,
) {
  return longreadExerciseInputQuestionItemType.value;
}

enums.LongreadExerciseInputQuestionItemType
longreadExerciseInputQuestionItemTypeFromJson(
  Object? longreadExerciseInputQuestionItemType, [
  enums.LongreadExerciseInputQuestionItemType? defaultValue,
]) {
  return enums.LongreadExerciseInputQuestionItemType.values.firstWhereOrNull(
        (e) => e.value == longreadExerciseInputQuestionItemType,
      ) ??
      defaultValue ??
      enums.LongreadExerciseInputQuestionItemType.swaggerGeneratedUnknown;
}

enums.LongreadExerciseInputQuestionItemType?
longreadExerciseInputQuestionItemTypeNullableFromJson(
  Object? longreadExerciseInputQuestionItemType, [
  enums.LongreadExerciseInputQuestionItemType? defaultValue,
]) {
  if (longreadExerciseInputQuestionItemType == null) {
    return null;
  }
  return enums.LongreadExerciseInputQuestionItemType.values.firstWhereOrNull(
        (e) => e.value == longreadExerciseInputQuestionItemType,
      ) ??
      defaultValue;
}

String longreadExerciseInputQuestionItemTypeExplodedListToJson(
  List<enums.LongreadExerciseInputQuestionItemType>?
  longreadExerciseInputQuestionItemType,
) {
  return longreadExerciseInputQuestionItemType
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> longreadExerciseInputQuestionItemTypeListToJson(
  List<enums.LongreadExerciseInputQuestionItemType>?
  longreadExerciseInputQuestionItemType,
) {
  if (longreadExerciseInputQuestionItemType == null) {
    return [];
  }

  return longreadExerciseInputQuestionItemType.map((e) => e.value!).toList();
}

List<enums.LongreadExerciseInputQuestionItemType>
longreadExerciseInputQuestionItemTypeListFromJson(
  List? longreadExerciseInputQuestionItemType, [
  List<enums.LongreadExerciseInputQuestionItemType>? defaultValue,
]) {
  if (longreadExerciseInputQuestionItemType == null) {
    return defaultValue ?? [];
  }

  return longreadExerciseInputQuestionItemType
      .map((e) => longreadExerciseInputQuestionItemTypeFromJson(e.toString()))
      .toList();
}

List<enums.LongreadExerciseInputQuestionItemType>?
longreadExerciseInputQuestionItemTypeNullableListFromJson(
  List? longreadExerciseInputQuestionItemType, [
  List<enums.LongreadExerciseInputQuestionItemType>? defaultValue,
]) {
  if (longreadExerciseInputQuestionItemType == null) {
    return defaultValue;
  }

  return longreadExerciseInputQuestionItemType
      .map((e) => longreadExerciseInputQuestionItemTypeFromJson(e.toString()))
      .toList();
}

String? longreadExerciseSingleChoiceQuestionitemTypeNullableToJson(
  enums.LongreadExerciseSingleChoiceQuestionitemType?
  longreadExerciseSingleChoiceQuestionitemType,
) {
  return longreadExerciseSingleChoiceQuestionitemType?.value;
}

String? longreadExerciseSingleChoiceQuestionitemTypeToJson(
  enums.LongreadExerciseSingleChoiceQuestionitemType
  longreadExerciseSingleChoiceQuestionitemType,
) {
  return longreadExerciseSingleChoiceQuestionitemType.value;
}

enums.LongreadExerciseSingleChoiceQuestionitemType
longreadExerciseSingleChoiceQuestionitemTypeFromJson(
  Object? longreadExerciseSingleChoiceQuestionitemType, [
  enums.LongreadExerciseSingleChoiceQuestionitemType? defaultValue,
]) {
  return enums.LongreadExerciseSingleChoiceQuestionitemType.values
          .firstWhereOrNull(
            (e) => e.value == longreadExerciseSingleChoiceQuestionitemType,
          ) ??
      defaultValue ??
      enums
          .LongreadExerciseSingleChoiceQuestionitemType
          .swaggerGeneratedUnknown;
}

enums.LongreadExerciseSingleChoiceQuestionitemType?
longreadExerciseSingleChoiceQuestionitemTypeNullableFromJson(
  Object? longreadExerciseSingleChoiceQuestionitemType, [
  enums.LongreadExerciseSingleChoiceQuestionitemType? defaultValue,
]) {
  if (longreadExerciseSingleChoiceQuestionitemType == null) {
    return null;
  }
  return enums.LongreadExerciseSingleChoiceQuestionitemType.values
          .firstWhereOrNull(
            (e) => e.value == longreadExerciseSingleChoiceQuestionitemType,
          ) ??
      defaultValue;
}

String longreadExerciseSingleChoiceQuestionitemTypeExplodedListToJson(
  List<enums.LongreadExerciseSingleChoiceQuestionitemType>?
  longreadExerciseSingleChoiceQuestionitemType,
) {
  return longreadExerciseSingleChoiceQuestionitemType
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> longreadExerciseSingleChoiceQuestionitemTypeListToJson(
  List<enums.LongreadExerciseSingleChoiceQuestionitemType>?
  longreadExerciseSingleChoiceQuestionitemType,
) {
  if (longreadExerciseSingleChoiceQuestionitemType == null) {
    return [];
  }

  return longreadExerciseSingleChoiceQuestionitemType
      .map((e) => e.value!)
      .toList();
}

List<enums.LongreadExerciseSingleChoiceQuestionitemType>
longreadExerciseSingleChoiceQuestionitemTypeListFromJson(
  List? longreadExerciseSingleChoiceQuestionitemType, [
  List<enums.LongreadExerciseSingleChoiceQuestionitemType>? defaultValue,
]) {
  if (longreadExerciseSingleChoiceQuestionitemType == null) {
    return defaultValue ?? [];
  }

  return longreadExerciseSingleChoiceQuestionitemType
      .map(
        (e) =>
            longreadExerciseSingleChoiceQuestionitemTypeFromJson(e.toString()),
      )
      .toList();
}

List<enums.LongreadExerciseSingleChoiceQuestionitemType>?
longreadExerciseSingleChoiceQuestionitemTypeNullableListFromJson(
  List? longreadExerciseSingleChoiceQuestionitemType, [
  List<enums.LongreadExerciseSingleChoiceQuestionitemType>? defaultValue,
]) {
  if (longreadExerciseSingleChoiceQuestionitemType == null) {
    return defaultValue;
  }

  return longreadExerciseSingleChoiceQuestionitemType
      .map(
        (e) =>
            longreadExerciseSingleChoiceQuestionitemTypeFromJson(e.toString()),
      )
      .toList();
}

String? longreadExerciseMultipleChoiceQuestionItemTypeNullableToJson(
  enums.LongreadExerciseMultipleChoiceQuestionItemType?
  longreadExerciseMultipleChoiceQuestionItemType,
) {
  return longreadExerciseMultipleChoiceQuestionItemType?.value;
}

String? longreadExerciseMultipleChoiceQuestionItemTypeToJson(
  enums.LongreadExerciseMultipleChoiceQuestionItemType
  longreadExerciseMultipleChoiceQuestionItemType,
) {
  return longreadExerciseMultipleChoiceQuestionItemType.value;
}

enums.LongreadExerciseMultipleChoiceQuestionItemType
longreadExerciseMultipleChoiceQuestionItemTypeFromJson(
  Object? longreadExerciseMultipleChoiceQuestionItemType, [
  enums.LongreadExerciseMultipleChoiceQuestionItemType? defaultValue,
]) {
  return enums.LongreadExerciseMultipleChoiceQuestionItemType.values
          .firstWhereOrNull(
            (e) => e.value == longreadExerciseMultipleChoiceQuestionItemType,
          ) ??
      defaultValue ??
      enums
          .LongreadExerciseMultipleChoiceQuestionItemType
          .swaggerGeneratedUnknown;
}

enums.LongreadExerciseMultipleChoiceQuestionItemType?
longreadExerciseMultipleChoiceQuestionItemTypeNullableFromJson(
  Object? longreadExerciseMultipleChoiceQuestionItemType, [
  enums.LongreadExerciseMultipleChoiceQuestionItemType? defaultValue,
]) {
  if (longreadExerciseMultipleChoiceQuestionItemType == null) {
    return null;
  }
  return enums.LongreadExerciseMultipleChoiceQuestionItemType.values
          .firstWhereOrNull(
            (e) => e.value == longreadExerciseMultipleChoiceQuestionItemType,
          ) ??
      defaultValue;
}

String longreadExerciseMultipleChoiceQuestionItemTypeExplodedListToJson(
  List<enums.LongreadExerciseMultipleChoiceQuestionItemType>?
  longreadExerciseMultipleChoiceQuestionItemType,
) {
  return longreadExerciseMultipleChoiceQuestionItemType
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> longreadExerciseMultipleChoiceQuestionItemTypeListToJson(
  List<enums.LongreadExerciseMultipleChoiceQuestionItemType>?
  longreadExerciseMultipleChoiceQuestionItemType,
) {
  if (longreadExerciseMultipleChoiceQuestionItemType == null) {
    return [];
  }

  return longreadExerciseMultipleChoiceQuestionItemType
      .map((e) => e.value!)
      .toList();
}

List<enums.LongreadExerciseMultipleChoiceQuestionItemType>
longreadExerciseMultipleChoiceQuestionItemTypeListFromJson(
  List? longreadExerciseMultipleChoiceQuestionItemType, [
  List<enums.LongreadExerciseMultipleChoiceQuestionItemType>? defaultValue,
]) {
  if (longreadExerciseMultipleChoiceQuestionItemType == null) {
    return defaultValue ?? [];
  }

  return longreadExerciseMultipleChoiceQuestionItemType
      .map(
        (e) => longreadExerciseMultipleChoiceQuestionItemTypeFromJson(
          e.toString(),
        ),
      )
      .toList();
}

List<enums.LongreadExerciseMultipleChoiceQuestionItemType>?
longreadExerciseMultipleChoiceQuestionItemTypeNullableListFromJson(
  List? longreadExerciseMultipleChoiceQuestionItemType, [
  List<enums.LongreadExerciseMultipleChoiceQuestionItemType>? defaultValue,
]) {
  if (longreadExerciseMultipleChoiceQuestionItemType == null) {
    return defaultValue;
  }

  return longreadExerciseMultipleChoiceQuestionItemType
      .map(
        (e) => longreadExerciseMultipleChoiceQuestionItemTypeFromJson(
          e.toString(),
        ),
      )
      .toList();
}

String? videoPlatformStateNullableToJson(
  enums.VideoPlatformState? videoPlatformState,
) {
  return videoPlatformState?.value;
}

String? videoPlatformStateToJson(enums.VideoPlatformState videoPlatformState) {
  return videoPlatformState.value;
}

enums.VideoPlatformState videoPlatformStateFromJson(
  Object? videoPlatformState, [
  enums.VideoPlatformState? defaultValue,
]) {
  return enums.VideoPlatformState.values.firstWhereOrNull(
        (e) => e.value == videoPlatformState,
      ) ??
      defaultValue ??
      enums.VideoPlatformState.swaggerGeneratedUnknown;
}

enums.VideoPlatformState? videoPlatformStateNullableFromJson(
  Object? videoPlatformState, [
  enums.VideoPlatformState? defaultValue,
]) {
  if (videoPlatformState == null) {
    return null;
  }
  return enums.VideoPlatformState.values.firstWhereOrNull(
        (e) => e.value == videoPlatformState,
      ) ??
      defaultValue;
}

String videoPlatformStateExplodedListToJson(
  List<enums.VideoPlatformState>? videoPlatformState,
) {
  return videoPlatformState?.map((e) => e.value!).join(',') ?? '';
}

List<String> videoPlatformStateListToJson(
  List<enums.VideoPlatformState>? videoPlatformState,
) {
  if (videoPlatformState == null) {
    return [];
  }

  return videoPlatformState.map((e) => e.value!).toList();
}

List<enums.VideoPlatformState> videoPlatformStateListFromJson(
  List? videoPlatformState, [
  List<enums.VideoPlatformState>? defaultValue,
]) {
  if (videoPlatformState == null) {
    return defaultValue ?? [];
  }

  return videoPlatformState
      .map((e) => videoPlatformStateFromJson(e.toString()))
      .toList();
}

List<enums.VideoPlatformState>? videoPlatformStateNullableListFromJson(
  List? videoPlatformState, [
  List<enums.VideoPlatformState>? defaultValue,
]) {
  if (videoPlatformState == null) {
    return defaultValue;
  }

  return videoPlatformState
      .map((e) => videoPlatformStateFromJson(e.toString()))
      .toList();
}

String? taskTypeNullableToJson(enums.TaskType? taskType) {
  return taskType?.value;
}

String? taskTypeToJson(enums.TaskType taskType) {
  return taskType.value;
}

enums.TaskType taskTypeFromJson(
  Object? taskType, [
  enums.TaskType? defaultValue,
]) {
  return enums.TaskType.values.firstWhereOrNull((e) => e.value == taskType) ??
      defaultValue ??
      enums.TaskType.swaggerGeneratedUnknown;
}

enums.TaskType? taskTypeNullableFromJson(
  Object? taskType, [
  enums.TaskType? defaultValue,
]) {
  if (taskType == null) {
    return null;
  }
  return enums.TaskType.values.firstWhereOrNull((e) => e.value == taskType) ??
      defaultValue;
}

String taskTypeExplodedListToJson(List<enums.TaskType>? taskType) {
  return taskType?.map((e) => e.value!).join(',') ?? '';
}

List<String> taskTypeListToJson(List<enums.TaskType>? taskType) {
  if (taskType == null) {
    return [];
  }

  return taskType.map((e) => e.value!).toList();
}

List<enums.TaskType> taskTypeListFromJson(
  List? taskType, [
  List<enums.TaskType>? defaultValue,
]) {
  if (taskType == null) {
    return defaultValue ?? [];
  }

  return taskType.map((e) => taskTypeFromJson(e.toString())).toList();
}

List<enums.TaskType>? taskTypeNullableListFromJson(
  List? taskType, [
  List<enums.TaskType>? defaultValue,
]) {
  if (taskType == null) {
    return defaultValue;
  }

  return taskType.map((e) => taskTypeFromJson(e.toString())).toList();
}

String? taskStateNullableToJson(enums.TaskState? taskState) {
  return taskState?.value;
}

String? taskStateToJson(enums.TaskState taskState) {
  return taskState.value;
}

enums.TaskState taskStateFromJson(
  Object? taskState, [
  enums.TaskState? defaultValue,
]) {
  return enums.TaskState.values.firstWhereOrNull((e) => e.value == taskState) ??
      defaultValue ??
      enums.TaskState.swaggerGeneratedUnknown;
}

enums.TaskState? taskStateNullableFromJson(
  Object? taskState, [
  enums.TaskState? defaultValue,
]) {
  if (taskState == null) {
    return null;
  }
  return enums.TaskState.values.firstWhereOrNull((e) => e.value == taskState) ??
      defaultValue;
}

String taskStateExplodedListToJson(List<enums.TaskState>? taskState) {
  return taskState?.map((e) => e.value!).join(',') ?? '';
}

List<String> taskStateListToJson(List<enums.TaskState>? taskState) {
  if (taskState == null) {
    return [];
  }

  return taskState.map((e) => e.value!).toList();
}

List<enums.TaskState> taskStateListFromJson(
  List? taskState, [
  List<enums.TaskState>? defaultValue,
]) {
  if (taskState == null) {
    return defaultValue ?? [];
  }

  return taskState.map((e) => taskStateFromJson(e.toString())).toList();
}

List<enums.TaskState>? taskStateNullableListFromJson(
  List? taskState, [
  List<enums.TaskState>? defaultValue,
]) {
  if (taskState == null) {
    return defaultValue;
  }

  return taskState.map((e) => taskStateFromJson(e.toString())).toList();
}

String? taskScoreSkillLevelNullableToJson(
  enums.TaskScoreSkillLevel? taskScoreSkillLevel,
) {
  return taskScoreSkillLevel?.value;
}

String? taskScoreSkillLevelToJson(
  enums.TaskScoreSkillLevel taskScoreSkillLevel,
) {
  return taskScoreSkillLevel.value;
}

enums.TaskScoreSkillLevel taskScoreSkillLevelFromJson(
  Object? taskScoreSkillLevel, [
  enums.TaskScoreSkillLevel? defaultValue,
]) {
  return enums.TaskScoreSkillLevel.values.firstWhereOrNull(
        (e) => e.value == taskScoreSkillLevel,
      ) ??
      defaultValue ??
      enums.TaskScoreSkillLevel.swaggerGeneratedUnknown;
}

enums.TaskScoreSkillLevel? taskScoreSkillLevelNullableFromJson(
  Object? taskScoreSkillLevel, [
  enums.TaskScoreSkillLevel? defaultValue,
]) {
  if (taskScoreSkillLevel == null) {
    return null;
  }
  return enums.TaskScoreSkillLevel.values.firstWhereOrNull(
        (e) => e.value == taskScoreSkillLevel,
      ) ??
      defaultValue;
}

String taskScoreSkillLevelExplodedListToJson(
  List<enums.TaskScoreSkillLevel>? taskScoreSkillLevel,
) {
  return taskScoreSkillLevel?.map((e) => e.value!).join(',') ?? '';
}

List<String> taskScoreSkillLevelListToJson(
  List<enums.TaskScoreSkillLevel>? taskScoreSkillLevel,
) {
  if (taskScoreSkillLevel == null) {
    return [];
  }

  return taskScoreSkillLevel.map((e) => e.value!).toList();
}

List<enums.TaskScoreSkillLevel> taskScoreSkillLevelListFromJson(
  List? taskScoreSkillLevel, [
  List<enums.TaskScoreSkillLevel>? defaultValue,
]) {
  if (taskScoreSkillLevel == null) {
    return defaultValue ?? [];
  }

  return taskScoreSkillLevel
      .map((e) => taskScoreSkillLevelFromJson(e.toString()))
      .toList();
}

List<enums.TaskScoreSkillLevel>? taskScoreSkillLevelNullableListFromJson(
  List? taskScoreSkillLevel, [
  List<enums.TaskScoreSkillLevel>? defaultValue,
]) {
  if (taskScoreSkillLevel == null) {
    return defaultValue;
  }

  return taskScoreSkillLevel
      .map((e) => taskScoreSkillLevelFromJson(e.toString()))
      .toList();
}

String? taskSolutionAnswersQuestionOptionsQuestionItemTypeNullableToJson(
  enums.TaskSolutionAnswersQuestionOptionsQuestionItemType?
  taskSolutionAnswersQuestionOptionsQuestionItemType,
) {
  return taskSolutionAnswersQuestionOptionsQuestionItemType?.value;
}

String? taskSolutionAnswersQuestionOptionsQuestionItemTypeToJson(
  enums.TaskSolutionAnswersQuestionOptionsQuestionItemType
  taskSolutionAnswersQuestionOptionsQuestionItemType,
) {
  return taskSolutionAnswersQuestionOptionsQuestionItemType.value;
}

enums.TaskSolutionAnswersQuestionOptionsQuestionItemType
taskSolutionAnswersQuestionOptionsQuestionItemTypeFromJson(
  Object? taskSolutionAnswersQuestionOptionsQuestionItemType, [
  enums.TaskSolutionAnswersQuestionOptionsQuestionItemType? defaultValue,
]) {
  return enums.TaskSolutionAnswersQuestionOptionsQuestionItemType.values
          .firstWhereOrNull(
            (e) =>
                e.value == taskSolutionAnswersQuestionOptionsQuestionItemType,
          ) ??
      defaultValue ??
      enums
          .TaskSolutionAnswersQuestionOptionsQuestionItemType
          .swaggerGeneratedUnknown;
}

enums.TaskSolutionAnswersQuestionOptionsQuestionItemType?
taskSolutionAnswersQuestionOptionsQuestionItemTypeNullableFromJson(
  Object? taskSolutionAnswersQuestionOptionsQuestionItemType, [
  enums.TaskSolutionAnswersQuestionOptionsQuestionItemType? defaultValue,
]) {
  if (taskSolutionAnswersQuestionOptionsQuestionItemType == null) {
    return null;
  }
  return enums.TaskSolutionAnswersQuestionOptionsQuestionItemType.values
          .firstWhereOrNull(
            (e) =>
                e.value == taskSolutionAnswersQuestionOptionsQuestionItemType,
          ) ??
      defaultValue;
}

String taskSolutionAnswersQuestionOptionsQuestionItemTypeExplodedListToJson(
  List<enums.TaskSolutionAnswersQuestionOptionsQuestionItemType>?
  taskSolutionAnswersQuestionOptionsQuestionItemType,
) {
  return taskSolutionAnswersQuestionOptionsQuestionItemType
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> taskSolutionAnswersQuestionOptionsQuestionItemTypeListToJson(
  List<enums.TaskSolutionAnswersQuestionOptionsQuestionItemType>?
  taskSolutionAnswersQuestionOptionsQuestionItemType,
) {
  if (taskSolutionAnswersQuestionOptionsQuestionItemType == null) {
    return [];
  }

  return taskSolutionAnswersQuestionOptionsQuestionItemType
      .map((e) => e.value!)
      .toList();
}

List<enums.TaskSolutionAnswersQuestionOptionsQuestionItemType>
taskSolutionAnswersQuestionOptionsQuestionItemTypeListFromJson(
  List? taskSolutionAnswersQuestionOptionsQuestionItemType, [
  List<enums.TaskSolutionAnswersQuestionOptionsQuestionItemType>? defaultValue,
]) {
  if (taskSolutionAnswersQuestionOptionsQuestionItemType == null) {
    return defaultValue ?? [];
  }

  return taskSolutionAnswersQuestionOptionsQuestionItemType
      .map(
        (e) => taskSolutionAnswersQuestionOptionsQuestionItemTypeFromJson(
          e.toString(),
        ),
      )
      .toList();
}

List<enums.TaskSolutionAnswersQuestionOptionsQuestionItemType>?
taskSolutionAnswersQuestionOptionsQuestionItemTypeNullableListFromJson(
  List? taskSolutionAnswersQuestionOptionsQuestionItemType, [
  List<enums.TaskSolutionAnswersQuestionOptionsQuestionItemType>? defaultValue,
]) {
  if (taskSolutionAnswersQuestionOptionsQuestionItemType == null) {
    return defaultValue;
  }

  return taskSolutionAnswersQuestionOptionsQuestionItemType
      .map(
        (e) => taskSolutionAnswersQuestionOptionsQuestionItemTypeFromJson(
          e.toString(),
        ),
      )
      .toList();
}

String? taskSolutionAnswersQuestionInputQuestionItemTypeNullableToJson(
  enums.TaskSolutionAnswersQuestionInputQuestionItemType?
  taskSolutionAnswersQuestionInputQuestionItemType,
) {
  return taskSolutionAnswersQuestionInputQuestionItemType?.value;
}

String? taskSolutionAnswersQuestionInputQuestionItemTypeToJson(
  enums.TaskSolutionAnswersQuestionInputQuestionItemType
  taskSolutionAnswersQuestionInputQuestionItemType,
) {
  return taskSolutionAnswersQuestionInputQuestionItemType.value;
}

enums.TaskSolutionAnswersQuestionInputQuestionItemType
taskSolutionAnswersQuestionInputQuestionItemTypeFromJson(
  Object? taskSolutionAnswersQuestionInputQuestionItemType, [
  enums.TaskSolutionAnswersQuestionInputQuestionItemType? defaultValue,
]) {
  return enums.TaskSolutionAnswersQuestionInputQuestionItemType.values
          .firstWhereOrNull(
            (e) => e.value == taskSolutionAnswersQuestionInputQuestionItemType,
          ) ??
      defaultValue ??
      enums
          .TaskSolutionAnswersQuestionInputQuestionItemType
          .swaggerGeneratedUnknown;
}

enums.TaskSolutionAnswersQuestionInputQuestionItemType?
taskSolutionAnswersQuestionInputQuestionItemTypeNullableFromJson(
  Object? taskSolutionAnswersQuestionInputQuestionItemType, [
  enums.TaskSolutionAnswersQuestionInputQuestionItemType? defaultValue,
]) {
  if (taskSolutionAnswersQuestionInputQuestionItemType == null) {
    return null;
  }
  return enums.TaskSolutionAnswersQuestionInputQuestionItemType.values
          .firstWhereOrNull(
            (e) => e.value == taskSolutionAnswersQuestionInputQuestionItemType,
          ) ??
      defaultValue;
}

String taskSolutionAnswersQuestionInputQuestionItemTypeExplodedListToJson(
  List<enums.TaskSolutionAnswersQuestionInputQuestionItemType>?
  taskSolutionAnswersQuestionInputQuestionItemType,
) {
  return taskSolutionAnswersQuestionInputQuestionItemType
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> taskSolutionAnswersQuestionInputQuestionItemTypeListToJson(
  List<enums.TaskSolutionAnswersQuestionInputQuestionItemType>?
  taskSolutionAnswersQuestionInputQuestionItemType,
) {
  if (taskSolutionAnswersQuestionInputQuestionItemType == null) {
    return [];
  }

  return taskSolutionAnswersQuestionInputQuestionItemType
      .map((e) => e.value!)
      .toList();
}

List<enums.TaskSolutionAnswersQuestionInputQuestionItemType>
taskSolutionAnswersQuestionInputQuestionItemTypeListFromJson(
  List? taskSolutionAnswersQuestionInputQuestionItemType, [
  List<enums.TaskSolutionAnswersQuestionInputQuestionItemType>? defaultValue,
]) {
  if (taskSolutionAnswersQuestionInputQuestionItemType == null) {
    return defaultValue ?? [];
  }

  return taskSolutionAnswersQuestionInputQuestionItemType
      .map(
        (e) => taskSolutionAnswersQuestionInputQuestionItemTypeFromJson(
          e.toString(),
        ),
      )
      .toList();
}

List<enums.TaskSolutionAnswersQuestionInputQuestionItemType>?
taskSolutionAnswersQuestionInputQuestionItemTypeNullableListFromJson(
  List? taskSolutionAnswersQuestionInputQuestionItemType, [
  List<enums.TaskSolutionAnswersQuestionInputQuestionItemType>? defaultValue,
]) {
  if (taskSolutionAnswersQuestionInputQuestionItemType == null) {
    return defaultValue;
  }

  return taskSolutionAnswersQuestionInputQuestionItemType
      .map(
        (e) => taskSolutionAnswersQuestionInputQuestionItemTypeFromJson(
          e.toString(),
        ),
      )
      .toList();
}

String? taskSolutionAnswersQuestionInputNumberQuestionItemTypeNullableToJson(
  enums.TaskSolutionAnswersQuestionInputNumberQuestionItemType?
  taskSolutionAnswersQuestionInputNumberQuestionItemType,
) {
  return taskSolutionAnswersQuestionInputNumberQuestionItemType?.value;
}

String? taskSolutionAnswersQuestionInputNumberQuestionItemTypeToJson(
  enums.TaskSolutionAnswersQuestionInputNumberQuestionItemType
  taskSolutionAnswersQuestionInputNumberQuestionItemType,
) {
  return taskSolutionAnswersQuestionInputNumberQuestionItemType.value;
}

enums.TaskSolutionAnswersQuestionInputNumberQuestionItemType
taskSolutionAnswersQuestionInputNumberQuestionItemTypeFromJson(
  Object? taskSolutionAnswersQuestionInputNumberQuestionItemType, [
  enums.TaskSolutionAnswersQuestionInputNumberQuestionItemType? defaultValue,
]) {
  return enums.TaskSolutionAnswersQuestionInputNumberQuestionItemType.values
          .firstWhereOrNull(
            (e) =>
                e.value ==
                taskSolutionAnswersQuestionInputNumberQuestionItemType,
          ) ??
      defaultValue ??
      enums
          .TaskSolutionAnswersQuestionInputNumberQuestionItemType
          .swaggerGeneratedUnknown;
}

enums.TaskSolutionAnswersQuestionInputNumberQuestionItemType?
taskSolutionAnswersQuestionInputNumberQuestionItemTypeNullableFromJson(
  Object? taskSolutionAnswersQuestionInputNumberQuestionItemType, [
  enums.TaskSolutionAnswersQuestionInputNumberQuestionItemType? defaultValue,
]) {
  if (taskSolutionAnswersQuestionInputNumberQuestionItemType == null) {
    return null;
  }
  return enums.TaskSolutionAnswersQuestionInputNumberQuestionItemType.values
          .firstWhereOrNull(
            (e) =>
                e.value ==
                taskSolutionAnswersQuestionInputNumberQuestionItemType,
          ) ??
      defaultValue;
}

String taskSolutionAnswersQuestionInputNumberQuestionItemTypeExplodedListToJson(
  List<enums.TaskSolutionAnswersQuestionInputNumberQuestionItemType>?
  taskSolutionAnswersQuestionInputNumberQuestionItemType,
) {
  return taskSolutionAnswersQuestionInputNumberQuestionItemType
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> taskSolutionAnswersQuestionInputNumberQuestionItemTypeListToJson(
  List<enums.TaskSolutionAnswersQuestionInputNumberQuestionItemType>?
  taskSolutionAnswersQuestionInputNumberQuestionItemType,
) {
  if (taskSolutionAnswersQuestionInputNumberQuestionItemType == null) {
    return [];
  }

  return taskSolutionAnswersQuestionInputNumberQuestionItemType
      .map((e) => e.value!)
      .toList();
}

List<enums.TaskSolutionAnswersQuestionInputNumberQuestionItemType>
taskSolutionAnswersQuestionInputNumberQuestionItemTypeListFromJson(
  List? taskSolutionAnswersQuestionInputNumberQuestionItemType, [
  List<enums.TaskSolutionAnswersQuestionInputNumberQuestionItemType>?
  defaultValue,
]) {
  if (taskSolutionAnswersQuestionInputNumberQuestionItemType == null) {
    return defaultValue ?? [];
  }

  return taskSolutionAnswersQuestionInputNumberQuestionItemType
      .map(
        (e) => taskSolutionAnswersQuestionInputNumberQuestionItemTypeFromJson(
          e.toString(),
        ),
      )
      .toList();
}

List<enums.TaskSolutionAnswersQuestionInputNumberQuestionItemType>?
taskSolutionAnswersQuestionInputNumberQuestionItemTypeNullableListFromJson(
  List? taskSolutionAnswersQuestionInputNumberQuestionItemType, [
  List<enums.TaskSolutionAnswersQuestionInputNumberQuestionItemType>?
  defaultValue,
]) {
  if (taskSolutionAnswersQuestionInputNumberQuestionItemType == null) {
    return defaultValue;
  }

  return taskSolutionAnswersQuestionInputNumberQuestionItemType
      .map(
        (e) => taskSolutionAnswersQuestionInputNumberQuestionItemTypeFromJson(
          e.toString(),
        ),
      )
      .toList();
}

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
