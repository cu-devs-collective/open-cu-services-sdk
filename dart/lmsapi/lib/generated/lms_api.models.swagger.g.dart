// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lms_api.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseProblemError _$BaseProblemErrorFromJson(Map<String, dynamic> json) =>
    BaseProblemError(
      type: json['type'] as String?,
      title: json['title'] as String,
      status: (json['status'] as num).toInt(),
      traceId: json['traceId'] as String?,
    );

Map<String, dynamic> _$BaseProblemErrorToJson(BaseProblemError instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'status': instance.status,
      'traceId': instance.traceId,
    };

BaseBadRequestError _$BaseBadRequestErrorFromJson(Map<String, dynamic> json) =>
    BaseBadRequestError(
      title: json['title'] as String,
      status: (json['status'] as num).toInt(),
      errors: json['errors'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$BaseBadRequestErrorToJson(
  BaseBadRequestError instance,
) => <String, dynamic>{
  'title': instance.title,
  'status': instance.status,
  'errors': instance.errors,
};

BaseUnauthorizedError _$BaseUnauthorizedErrorFromJson(
  Map<String, dynamic> json,
) => BaseUnauthorizedError(
  type: json['type'] as String?,
  title: json['title'] as String,
  status: (json['status'] as num).toInt(),
  traceId: json['traceId'] as String,
);

Map<String, dynamic> _$BaseUnauthorizedErrorToJson(
  BaseUnauthorizedError instance,
) => <String, dynamic>{
  'type': instance.type,
  'title': instance.title,
  'status': instance.status,
  'traceId': instance.traceId,
};

BaseForbiddenError _$BaseForbiddenErrorFromJson(Map<String, dynamic> json) =>
    BaseForbiddenError(
      type: json['type'] as String?,
      title: json['title'] as String,
      status: (json['status'] as num).toInt(),
      detail: json['detail'] as String?,
      instance: json['instance'] as String?,
      traceId: json['traceId'] as String,
    );

Map<String, dynamic> _$BaseForbiddenErrorToJson(BaseForbiddenError instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'status': instance.status,
      'detail': instance.detail,
      'instance': instance.instance,
      'traceId': instance.traceId,
    };

BaseNotFoundError _$BaseNotFoundErrorFromJson(Map<String, dynamic> json) =>
    BaseNotFoundError(
      title: json['title'] as String,
      status: (json['status'] as num).toInt(),
      detail: json['detail'] as String?,
      instance: json['instance'] as String?,
      entityId: (json['entityId'] as num?)?.toInt(),
      traceId: json['traceId'] as String,
    );

Map<String, dynamic> _$BaseNotFoundErrorToJson(BaseNotFoundError instance) =>
    <String, dynamic>{
      'title': instance.title,
      'status': instance.status,
      'detail': instance.detail,
      'instance': instance.instance,
      'entityId': instance.entityId,
      'traceId': instance.traceId,
    };

XRePropertyIncompleteOnlyEmptyArrayObserved$Item
_$XRePropertyIncompleteOnlyEmptyArrayObserved$ItemFromJson(
  Map<String, dynamic> json,
) => XRePropertyIncompleteOnlyEmptyArrayObserved$Item();

Map<String, dynamic> _$XRePropertyIncompleteOnlyEmptyArrayObserved$ItemToJson(
  XRePropertyIncompleteOnlyEmptyArrayObserved$Item instance,
) => <String, dynamic>{};

CourseSettings _$CourseSettingsFromJson(Map<String, dynamic> json) =>
    CourseSettings(
      skillLevel: courseSkillLevelFromJson(json['skillLevel']),
      isSkillLevelEnabled: json['isSkillLevelEnabled'] as bool,
      syllabusUrl: json['syllabusUrl'] as String?,
      timeChannelUrl: json['timeChannelUrl'] as String?,
    );

Map<String, dynamic> _$CourseSettingsToJson(CourseSettings instance) =>
    <String, dynamic>{
      'skillLevel': courseSkillLevelToJson(instance.skillLevel),
      'isSkillLevelEnabled': instance.isSkillLevelEnabled,
      'syllabusUrl': instance.syllabusUrl,
      'timeChannelUrl': instance.timeChannelUrl,
    };

CourseSummaryItem _$CourseSummaryItemFromJson(Map<String, dynamic> json) =>
    CourseSummaryItem(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      state: publicationStateFromJson(json['state']),
      publishDate: json['publishDate'] as String?,
      publishedAt: json['publishedAt'] as String?,
      settings: CourseSettings.fromJson(
        json['settings'] as Map<String, dynamic>,
      ),
      subjectId: (json['subjectId'] as num?)?.toInt(),
      isArchived: json['isArchived'] as bool,
      category: courseCategoryFromJson(json['category']),
      categoryCover: courseCategoryCoverFromJson(json['categoryCover']),
    );

Map<String, dynamic> _$CourseSummaryItemToJson(CourseSummaryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'state': publicationStateToJson(instance.state),
      'publishDate': instance.publishDate,
      'publishedAt': instance.publishedAt,
      'settings': instance.settings.toJson(),
      'subjectId': instance.subjectId,
      'isArchived': instance.isArchived,
      'category': courseCategoryToJson(instance.category),
      'categoryCover': courseCategoryCoverToJson(instance.categoryCover),
    };

Paging _$PagingFromJson(Map<String, dynamic> json) => Paging(
  limit: (json['limit'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
  totalCount: (json['totalCount'] as num).toInt(),
);

Map<String, dynamic> _$PagingToJson(Paging instance) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'totalCount': instance.totalCount,
};

ListStudentCoursesResponse _$ListStudentCoursesResponseFromJson(
  Map<String, dynamic> json,
) => ListStudentCoursesResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => CourseSummaryItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  paging: Paging.fromJson(json['paging'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ListStudentCoursesResponseToJson(
  ListStudentCoursesResponse instance,
) => <String, dynamic>{
  'items': instance.items.map((e) => e.toJson()).toList(),
  'paging': instance.paging.toJson(),
};

CurrentStudentResponse _$CurrentStudentResponseFromJson(
  Map<String, dynamic> json,
) => CurrentStudentResponse(
  id: json['id'] as String,
  lastName: json['lastName'] as String,
  firstName: json['firstName'] as String,
  middleName: json['middleName'] as String?,
  universityEmail: json['universityEmail'] as String,
  timeAccount: json['timeAccount'] as String,
  studyStartYear: (json['studyStartYear'] as num?)?.toInt(),
  studyLevel: studyLevelFromJson(json['studyLevel']),
  lateDaysBalance: (json['lateDaysBalance'] as num).toInt(),
);

Map<String, dynamic> _$CurrentStudentResponseToJson(
  CurrentStudentResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'lastName': instance.lastName,
  'firstName': instance.firstName,
  'middleName': instance.middleName,
  'universityEmail': instance.universityEmail,
  'timeAccount': instance.timeAccount,
  'studyStartYear': instance.studyStartYear,
  'studyLevel': studyLevelToJson(instance.studyLevel),
  'lateDaysBalance': instance.lateDaysBalance,
};

CourseSummaryByIdResponse _$CourseSummaryByIdResponseFromJson(
  Map<String, dynamic> json,
) => CourseSummaryByIdResponse(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  state: publicationStateFromJson(json['state']),
  publishDate: json['publishDate'] as String?,
  publishedAt: json['publishedAt'] as String?,
  settings: CourseSettings.fromJson(json['settings'] as Map<String, dynamic>),
  subjectId: (json['subjectId'] as num?)?.toInt(),
  isArchived: json['isArchived'] as bool,
  category: courseCategoryFromJson(json['category']),
  categoryCover: courseCategoryCoverFromJson(json['categoryCover']),
);

Map<String, dynamic> _$CourseSummaryByIdResponseToJson(
  CourseSummaryByIdResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'state': publicationStateToJson(instance.state),
  'publishDate': instance.publishDate,
  'publishedAt': instance.publishedAt,
  'settings': instance.settings.toJson(),
  'subjectId': instance.subjectId,
  'isArchived': instance.isArchived,
  'category': courseCategoryToJson(instance.category),
  'categoryCover': courseCategoryCoverToJson(instance.categoryCover),
};

ActivityDefinition _$ActivityDefinitionFromJson(Map<String, dynamic> json) =>
    ActivityDefinition(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      weight: json['weight'] as num,
    );

Map<String, dynamic> _$ActivityDefinitionToJson(ActivityDefinition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
    };

ExerciseItem _$ExerciseItemFromJson(Map<String, dynamic> json) => ExerciseItem(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  maxScore: json['maxScore'] as num,
  activity: ActivityDefinition.fromJson(
    json['activity'] as Map<String, dynamic>,
  ),
  deadline: json['deadline'] as String,
);

Map<String, dynamic> _$ExerciseItemToJson(ExerciseItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'maxScore': instance.maxScore,
      'activity': instance.activity.toJson(),
      'deadline': instance.deadline,
    };

LongreadItem _$LongreadItemFromJson(Map<String, dynamic> json) => LongreadItem(
  id: (json['id'] as num).toInt(),
  type: longreadTypeFromJson(json['type']),
  name: json['name'] as String,
  state: publicationStateFromJson(json['state']),
  publishDate: json['publishDate'] as String?,
  publishedAt: json['publishedAt'] as String?,
  exercises:
      (json['exercises'] as List<dynamic>?)
          ?.map((e) => ExerciseItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$LongreadItemToJson(LongreadItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': longreadTypeToJson(instance.type),
      'name': instance.name,
      'state': publicationStateToJson(instance.state),
      'publishDate': instance.publishDate,
      'publishedAt': instance.publishedAt,
      'exercises': instance.exercises.map((e) => e.toJson()).toList(),
    };

CourseThemeItem _$CourseThemeItemFromJson(Map<String, dynamic> json) =>
    CourseThemeItem(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      order: (json['order'] as num).toInt(),
      state: publicationStateFromJson(json['state']),
      publishDate: json['publishDate'] as String?,
      publishedAt: json['publishedAt'] as String?,
      longreads:
          (json['longreads'] as List<dynamic>?)
              ?.map((e) => LongreadItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CourseThemeItemToJson(CourseThemeItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'state': publicationStateToJson(instance.state),
      'publishDate': instance.publishDate,
      'publishedAt': instance.publishedAt,
      'longreads': instance.longreads.map((e) => e.toJson()).toList(),
    };

CourseOverviewByIdResponse _$CourseOverviewByIdResponseFromJson(
  Map<String, dynamic> json,
) => CourseOverviewByIdResponse(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  isArchived: json['isArchived'] as bool,
  state: publicationStateFromJson(json['state']),
  publishDate: json['publishDate'] as String?,
  publishedAt: json['publishedAt'] as String?,
  settings: CourseSettings.fromJson(json['settings'] as Map<String, dynamic>),
  themes:
      (json['themes'] as List<dynamic>?)
          ?.map((e) => CourseThemeItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$CourseOverviewByIdResponseToJson(
  CourseOverviewByIdResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'isArchived': instance.isArchived,
  'state': publicationStateToJson(instance.state),
  'publishDate': instance.publishDate,
  'publishedAt': instance.publishedAt,
  'settings': instance.settings.toJson(),
  'themes': instance.themes.map((e) => e.toJson()).toList(),
};

CourseThemeSummaryByIdResponse _$CourseThemeSummaryByIdResponseFromJson(
  Map<String, dynamic> json,
) => CourseThemeSummaryByIdResponse(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  state: publicationStateFromJson(json['state']),
  publishDate: json['publishDate'] as String?,
  publishedAt: json['publishedAt'] as String?,
  order: (json['order'] as num).toInt(),
  category: courseCategoryFromJson(json['category']),
  categoryCover: (json['categoryCover'] as num).toInt(),
);

Map<String, dynamic> _$CourseThemeSummaryByIdResponseToJson(
  CourseThemeSummaryByIdResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'state': publicationStateToJson(instance.state),
  'publishDate': instance.publishDate,
  'publishedAt': instance.publishedAt,
  'order': instance.order,
  'category': courseCategoryToJson(instance.category),
  'categoryCover': instance.categoryCover,
};

LongreadSummaryByIdResponse _$LongreadSummaryByIdResponseFromJson(
  Map<String, dynamic> json,
) => LongreadSummaryByIdResponse(
  id: (json['id'] as num).toInt(),
  type: longreadTypeFromJson(json['type']),
  name: json['name'] as String,
  order: (json['order'] as num).toInt(),
  state: publicationStateFromJson(json['state']),
  publishDate: json['publishDate'] as String?,
  publishedAt: json['publishedAt'] as String?,
);

Map<String, dynamic> _$LongreadSummaryByIdResponseToJson(
  LongreadSummaryByIdResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': longreadTypeToJson(instance.type),
  'name': instance.name,
  'order': instance.order,
  'state': publicationStateToJson(instance.state),
  'publishDate': instance.publishDate,
  'publishedAt': instance.publishedAt,
};

LongreadMaterialContent _$LongreadMaterialContentFromJson(
  Map<String, dynamic> json,
) => LongreadMaterialContent(
  name: json['name'] as String,
  filename: json['filename'] as String,
  mediaType: longreadMaterialMediaTypeUpperFromJson(json['mediaType']),
  version: json['version'] as String?,
  length: (json['length'] as num).toInt(),
);

Map<String, dynamic> _$LongreadMaterialContentToJson(
  LongreadMaterialContent instance,
) => <String, dynamic>{
  'name': instance.name,
  'filename': instance.filename,
  'mediaType': longreadMaterialMediaTypeUpperToJson(instance.mediaType),
  'version': instance.version,
  'length': instance.length,
};

LongreadMaterialAttachmentItem _$LongreadMaterialAttachmentItemFromJson(
  Map<String, dynamic> json,
) => LongreadMaterialAttachmentItem(
  name: json['name'] as String,
  filename: json['filename'] as String,
  mediaType: fileMediaTypeFromJson(json['mediaType']),
  length: (json['length'] as num).toInt(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$LongreadMaterialAttachmentItemToJson(
  LongreadMaterialAttachmentItem instance,
) => <String, dynamic>{
  'name': instance.name,
  'filename': instance.filename,
  'mediaType': fileMediaTypeToJson(instance.mediaType),
  'length': instance.length,
  'version': instance.version,
};

LongreadMaterialCoding _$LongreadMaterialCodingFromJson(
  Map<String, dynamic> json,
) => LongreadMaterialCoding(exerciseUrl: json['exerciseUrl'] as String?);

Map<String, dynamic> _$LongreadMaterialCodingToJson(
  LongreadMaterialCoding instance,
) => <String, dynamic>{'exerciseUrl': instance.exerciseUrl};

LongreadMaterialActivity _$LongreadMaterialActivityFromJson(
  Map<String, dynamic> json,
) => LongreadMaterialActivity(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  weight: json['weight'] as num,
  maxExercisesCount: (json['maxExercisesCount'] as num).toDouble(),
  averageScoreThreshold: (json['averageScoreThreshold'] as num?)?.toDouble(),
  isLateDaysEnabled: json['isLateDaysEnabled'] as bool,
);

Map<String, dynamic> _$LongreadMaterialActivityToJson(
  LongreadMaterialActivity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'weight': instance.weight,
  'maxExercisesCount': instance.maxExercisesCount,
  'averageScoreThreshold': instance.averageScoreThreshold,
  'isLateDaysEnabled': instance.isLateDaysEnabled,
};

LongreadMaterialEstimation _$LongreadMaterialEstimationFromJson(
  Map<String, dynamic> json,
) => LongreadMaterialEstimation(
  startDate: json['startDate'] as String,
  timer: json['timer'] as String?,
  maxScore: (json['maxScore'] as num?)?.toDouble(),
  deadline: json['deadline'] == null
      ? null
      : DateTime.parse(json['deadline'] as String),
  activity: json['activity'] == null
      ? null
      : LongreadMaterialActivity.fromJson(
          json['activity'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$LongreadMaterialEstimationToJson(
  LongreadMaterialEstimation instance,
) => <String, dynamic>{
  'startDate': instance.startDate,
  'timer': instance.timer,
  'maxScore': instance.maxScore,
  'deadline': instance.deadline?.toIso8601String(),
  'activity': instance.activity?.toJson(),
};

ExerciseQuestionsSettings _$ExerciseQuestionsSettingsFromJson(
  Map<String, dynamic> json,
) => ExerciseQuestionsSettings(
  questionsPerAttempt: json['questionsPerAttempt'] as String?,
  attemptsLimit: (json['attemptsLimit'] as num).toInt(),
  evaluationStrategy: questionsSettingsEvalStrategyFromJson(
    json['evaluationStrategy'],
  ),
);

Map<String, dynamic> _$ExerciseQuestionsSettingsToJson(
  ExerciseQuestionsSettings instance,
) => <String, dynamic>{
  'questionsPerAttempt': instance.questionsPerAttempt,
  'attemptsLimit': instance.attemptsLimit,
  'evaluationStrategy': questionsSettingsEvalStrategyToJson(
    instance.evaluationStrategy,
  ),
};

QuestionItemEvaluationBlock _$QuestionItemEvaluationBlockFromJson(
  Map<String, dynamic> json,
) => QuestionItemEvaluationBlock(
  correctAnswer: json['correctAnswer'] == null
      ? null
      : QuestionItemCorrectAnswer.fromJson(
          json['correctAnswer'] as Map<String, dynamic>,
        ),
  autoEvaluation: json['autoEvaluation'] as bool,
  recommendation: json['recommendation'] as String,
);

Map<String, dynamic> _$QuestionItemEvaluationBlockToJson(
  QuestionItemEvaluationBlock instance,
) => <String, dynamic>{
  'correctAnswer': instance.correctAnswer?.toJson(),
  'autoEvaluation': instance.autoEvaluation,
  'recommendation': instance.recommendation,
};

QuestionItemOption _$QuestionItemOptionFromJson(Map<String, dynamic> json) =>
    QuestionItemOption(
      id: (json['id'] as num).toInt(),
      value: json['value'] as String,
      order: (json['order'] as num).toInt(),
      isCorrect: json['isCorrect'] as bool,
      recommendation: json['recommendation'] as String?,
    );

Map<String, dynamic> _$QuestionItemOptionToJson(QuestionItemOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'order': instance.order,
      'isCorrect': instance.isCorrect,
      'recommendation': instance.recommendation,
    };

QuestionItemCorrectAnswerInputStringCorrectAnswer
_$QuestionItemCorrectAnswerInputStringCorrectAnswerFromJson(
  Map<String, dynamic> json,
) => QuestionItemCorrectAnswerInputStringCorrectAnswer(
  type: questionItemCorrectAnswerInputStringCorrectAnswerTypeFromJson(
    json['type'],
  ),
  variants:
      (json['variants'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
);

Map<String, dynamic> _$QuestionItemCorrectAnswerInputStringCorrectAnswerToJson(
  QuestionItemCorrectAnswerInputStringCorrectAnswer instance,
) => <String, dynamic>{
  'type': questionItemCorrectAnswerInputStringCorrectAnswerTypeToJson(
    instance.type,
  ),
  'variants': instance.variants,
};

QuestionItemCorrectAnswerInputNumberCorrectAnswer
_$QuestionItemCorrectAnswerInputNumberCorrectAnswerFromJson(
  Map<String, dynamic> json,
) => QuestionItemCorrectAnswerInputNumberCorrectAnswer(
  type: questionItemCorrectAnswerInputNumberCorrectAnswerTypeFromJson(
    json['type'],
  ),
  variants:
      (json['variants'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList() ??
      [],
  showPrecisionHint: json['showPrecisionHint'] as bool,
  autoEvaluationPrecision: json['autoEvaluationPrecision'] as String?,
  precision: (json['precision'] as num?)?.toInt(),
);

Map<String, dynamic> _$QuestionItemCorrectAnswerInputNumberCorrectAnswerToJson(
  QuestionItemCorrectAnswerInputNumberCorrectAnswer instance,
) => <String, dynamic>{
  'type': questionItemCorrectAnswerInputNumberCorrectAnswerTypeToJson(
    instance.type,
  ),
  'variants': instance.variants,
  'showPrecisionHint': instance.showPrecisionHint,
  'autoEvaluationPrecision': instance.autoEvaluationPrecision,
  'precision': instance.precision,
};

QuestionItemCorrectAnswer _$QuestionItemCorrectAnswerFromJson(
  Map<String, dynamic> json,
) => QuestionItemCorrectAnswer();

Map<String, dynamic> _$QuestionItemCorrectAnswerToJson(
  QuestionItemCorrectAnswer instance,
) => <String, dynamic>{};

LongreadExerciseInputQuestionItem _$LongreadExerciseInputQuestionItemFromJson(
  Map<String, dynamic> json,
) => LongreadExerciseInputQuestionItem(
  type: longreadExerciseInputQuestionItemTypeFromJson(json['type']),
  id: (json['id'] as num).toInt(),
  order: (json['order'] as num).toInt(),
  content: json['content'] as String,
  score: json['score'] as num,
  attachments:
      (json['attachments'] as List<dynamic>?)
          ?.map(
            (e) => LongreadMaterialAttachmentItem.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
  correctAnswer: json['correctAnswer'] == null
      ? null
      : QuestionItemCorrectAnswer.fromJson(
          json['correctAnswer'] as Map<String, dynamic>,
        ),
  autoEvaluation: json['autoEvaluation'] as bool,
  recommendation: json['recommendation'] as String?,
  input: QuestionItemEvaluationBlock.fromJson(
    json['input'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$LongreadExerciseInputQuestionItemToJson(
  LongreadExerciseInputQuestionItem instance,
) => <String, dynamic>{
  'type': longreadExerciseInputQuestionItemTypeToJson(instance.type),
  'id': instance.id,
  'order': instance.order,
  'content': instance.content,
  'score': instance.score,
  'attachments': instance.attachments.map((e) => e.toJson()).toList(),
  'correctAnswer': instance.correctAnswer?.toJson(),
  'autoEvaluation': instance.autoEvaluation,
  'recommendation': instance.recommendation,
  'input': instance.input.toJson(),
};

LongreadExerciseSingleChoiceQuestionitem
_$LongreadExerciseSingleChoiceQuestionitemFromJson(Map<String, dynamic> json) =>
    LongreadExerciseSingleChoiceQuestionitem(
      type: longreadExerciseSingleChoiceQuestionitemTypeFromJson(json['type']),
      id: (json['id'] as num).toInt(),
      order: (json['order'] as num).toInt(),
      content: json['content'] as String,
      score: json['score'] as num,
      attachments:
          (json['attachments'] as List<dynamic>?)
              ?.map(
                (e) => LongreadMaterialAttachmentItem.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
      options: (json['options'] as List<dynamic>)
          .map((e) => QuestionItemOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      areOptionsShuffled: json['areOptionsShuffled'] as bool,
      singleChoice:
          LongreadExerciseSingleChoiceQuestionitem$SingleChoice.fromJson(
            json['singleChoice'] as Map<String, dynamic>,
          ),
    );

Map<String, dynamic> _$LongreadExerciseSingleChoiceQuestionitemToJson(
  LongreadExerciseSingleChoiceQuestionitem instance,
) => <String, dynamic>{
  'type': longreadExerciseSingleChoiceQuestionitemTypeToJson(instance.type),
  'id': instance.id,
  'order': instance.order,
  'content': instance.content,
  'score': instance.score,
  'attachments': instance.attachments.map((e) => e.toJson()).toList(),
  'options': instance.options.map((e) => e.toJson()).toList(),
  'areOptionsShuffled': instance.areOptionsShuffled,
  'singleChoice': instance.singleChoice.toJson(),
};

LongreadExerciseMultipleChoiceQuestionItem
_$LongreadExerciseMultipleChoiceQuestionItemFromJson(
  Map<String, dynamic> json,
) => LongreadExerciseMultipleChoiceQuestionItem(
  type: longreadExerciseMultipleChoiceQuestionItemTypeFromJson(json['type']),
  id: (json['id'] as num).toInt(),
  order: (json['order'] as num).toInt(),
  content: json['content'] as String,
  score: json['score'] as num,
  attachments:
      (json['attachments'] as List<dynamic>?)
          ?.map(
            (e) => LongreadMaterialAttachmentItem.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
  options: (json['options'] as List<dynamic>)
      .map((e) => QuestionItemOption.fromJson(e as Map<String, dynamic>))
      .toList(),
  areOptionsShuffled: json['areOptionsShuffled'] as bool,
  multipleChoice:
      LongreadExerciseMultipleChoiceQuestionItem$MultipleChoice.fromJson(
        json['multipleChoice'] as Map<String, dynamic>,
      ),
);

Map<String, dynamic> _$LongreadExerciseMultipleChoiceQuestionItemToJson(
  LongreadExerciseMultipleChoiceQuestionItem instance,
) => <String, dynamic>{
  'type': longreadExerciseMultipleChoiceQuestionItemTypeToJson(instance.type),
  'id': instance.id,
  'order': instance.order,
  'content': instance.content,
  'score': instance.score,
  'attachments': instance.attachments.map((e) => e.toJson()).toList(),
  'options': instance.options.map((e) => e.toJson()).toList(),
  'areOptionsShuffled': instance.areOptionsShuffled,
  'multipleChoice': instance.multipleChoice.toJson(),
};

LongreadExerciseQuestionItem _$LongreadExerciseQuestionItemFromJson(
  Map<String, dynamic> json,
) => LongreadExerciseQuestionItem();

Map<String, dynamic> _$LongreadExerciseQuestionItemToJson(
  LongreadExerciseQuestionItem instance,
) => <String, dynamic>{};

LongreadMarkdownMaterialItem _$LongreadMarkdownMaterialItemFromJson(
  Map<String, dynamic> json,
) => LongreadMarkdownMaterialItem(
  discriminator: longreadMaterialDiscriminatorFromJson(json['discriminator']),
  state: publicationStateFromJson(json['state']),
  viewType: longreadMaterialViewTypeFromJson(json['viewType']),
  type: longreadMaterialTypeFromJson(json['type']),
  id: (json['id'] as num).toInt(),
  order: (json['order'] as num).toInt(),
  viewContent: json['viewContent'] as String,
  publishDate: json['publishDate'] as String?,
  publishedAt: json['publishedAt'] as String?,
);

Map<String, dynamic> _$LongreadMarkdownMaterialItemToJson(
  LongreadMarkdownMaterialItem instance,
) => <String, dynamic>{
  'discriminator': longreadMaterialDiscriminatorToJson(instance.discriminator),
  'state': publicationStateToJson(instance.state),
  'viewType': longreadMaterialViewTypeToJson(instance.viewType),
  'type': longreadMaterialTypeToJson(instance.type),
  'id': instance.id,
  'order': instance.order,
  'viewContent': instance.viewContent,
  'publishDate': instance.publishDate,
  'publishedAt': instance.publishedAt,
};

LongreadFileMaterialItem _$LongreadFileMaterialItemFromJson(
  Map<String, dynamic> json,
) => LongreadFileMaterialItem(
  discriminator: longreadMaterialDiscriminatorFromJson(json['discriminator']),
  state: publicationStateFromJson(json['state']),
  viewType: longreadMaterialViewTypeFromJson(json['viewType']),
  type: longreadMaterialTypeFromJson(json['type']),
  id: (json['id'] as num).toInt(),
  order: (json['order'] as num).toInt(),
  mediaType: fileMediaTypeFromJson(json['mediaType']),
  filename: json['filename'] as String,
  version: json['version'] as String?,
  length: (json['length'] as num).toInt(),
  publishDate: json['publishDate'] as String?,
  publishedAt: json['publishedAt'] as String?,
  content: LongreadMaterialContent.fromJson(
    json['content'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$LongreadFileMaterialItemToJson(
  LongreadFileMaterialItem instance,
) => <String, dynamic>{
  'discriminator': longreadMaterialDiscriminatorToJson(instance.discriminator),
  'state': publicationStateToJson(instance.state),
  'viewType': longreadMaterialViewTypeToJson(instance.viewType),
  'type': longreadMaterialTypeToJson(instance.type),
  'id': instance.id,
  'order': instance.order,
  'mediaType': fileMediaTypeToJson(instance.mediaType),
  'filename': instance.filename,
  'version': instance.version,
  'length': instance.length,
  'publishDate': instance.publishDate,
  'publishedAt': instance.publishedAt,
  'content': instance.content.toJson(),
};

LongreadExerciseCodingMaterialItem _$LongreadExerciseCodingMaterialItemFromJson(
  Map<String, dynamic> json,
) => LongreadExerciseCodingMaterialItem(
  discriminator: longreadMaterialDiscriminatorFromJson(json['discriminator']),
  state: publicationStateFromJson(json['state']),
  viewType: longreadMaterialViewTypeFromJson(json['viewType']),
  type: longreadMaterialTypeFromJson(json['type']),
  id: (json['id'] as num).toInt(),
  order: (json['order'] as num).toInt(),
  name: json['name'] as String,
  viewContent: json['viewContent'] as String?,
  estimation: LongreadMaterialEstimation.fromJson(
    json['estimation'] as Map<String, dynamic>,
  ),
  reviewers: (json['reviewers'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  assignees: (json['assignees'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  attachments:
      (json['attachments'] as List<dynamic>?)
          ?.map(
            (e) => LongreadMaterialAttachmentItem.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
  backloggedAt: json['backloggedAt'] as String?,
  taskId: (json['taskId'] as num).toInt(),
  isTrackingStudents: json['isTrackingStudents'] as bool,
  exerciseUrl: json['exerciseUrl'] as String?,
  coding: LongreadMaterialCoding.fromJson(
    json['coding'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$LongreadExerciseCodingMaterialItemToJson(
  LongreadExerciseCodingMaterialItem instance,
) => <String, dynamic>{
  'discriminator': longreadMaterialDiscriminatorToJson(instance.discriminator),
  'state': publicationStateToJson(instance.state),
  'viewType': longreadMaterialViewTypeToJson(instance.viewType),
  'type': longreadMaterialTypeToJson(instance.type),
  'id': instance.id,
  'order': instance.order,
  'name': instance.name,
  'viewContent': instance.viewContent,
  'estimation': instance.estimation.toJson(),
  'reviewers': instance.reviewers,
  'assignees': instance.assignees,
  'attachments': instance.attachments.map((e) => e.toJson()).toList(),
  'backloggedAt': instance.backloggedAt,
  'taskId': instance.taskId,
  'isTrackingStudents': instance.isTrackingStudents,
  'exerciseUrl': instance.exerciseUrl,
  'coding': instance.coding.toJson(),
};

LongreadImageMaterialItem _$LongreadImageMaterialItemFromJson(
  Map<String, dynamic> json,
) => LongreadImageMaterialItem(
  discriminator: longreadMaterialDiscriminatorFromJson(json['discriminator']),
  state: publicationStateFromJson(json['state']),
  viewType: longreadMaterialViewTypeFromJson(json['viewType']),
  type: longreadMaterialTypeFromJson(json['type']),
  id: (json['id'] as num).toInt(),
  order: (json['order'] as num).toInt(),
  imageScale: (json['imageScale'] as num?)?.toInt(),
  mediaType: fileMediaTypeFromJson(json['mediaType']),
  filename: json['filename'] as String,
  version: json['version'] as String?,
  length: (json['length'] as num).toInt(),
  publishDate: json['publishDate'] as String?,
  publishedAt: json['publishedAt'] as String?,
  content: LongreadMaterialContent.fromJson(
    json['content'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$LongreadImageMaterialItemToJson(
  LongreadImageMaterialItem instance,
) => <String, dynamic>{
  'discriminator': longreadMaterialDiscriminatorToJson(instance.discriminator),
  'state': publicationStateToJson(instance.state),
  'viewType': longreadMaterialViewTypeToJson(instance.viewType),
  'type': longreadMaterialTypeToJson(instance.type),
  'id': instance.id,
  'order': instance.order,
  'imageScale': instance.imageScale,
  'mediaType': fileMediaTypeToJson(instance.mediaType),
  'filename': instance.filename,
  'version': instance.version,
  'length': instance.length,
  'publishDate': instance.publishDate,
  'publishedAt': instance.publishedAt,
  'content': instance.content.toJson(),
};

LongreadExerciseQuestionsMaterialItem
_$LongreadExerciseQuestionsMaterialItemFromJson(Map<String, dynamic> json) =>
    LongreadExerciseQuestionsMaterialItem(
      discriminator: longreadMaterialDiscriminatorFromJson(
        json['discriminator'],
      ),
      state: publicationStateFromJson(json['state']),
      viewType: longreadMaterialViewTypeFromJson(json['viewType']),
      type: longreadMaterialTypeFromJson(json['type']),
      id: (json['id'] as num).toInt(),
      order: (json['order'] as num).toInt(),
      name: json['name'] as String,
      viewContent: json['viewContent'] as String?,
      estimation: LongreadMaterialEstimation.fromJson(
        json['estimation'] as Map<String, dynamic>,
      ),
      reviewers: (json['reviewers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      assignees: (json['assignees'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      attachments:
          (json['attachments'] as List<dynamic>?)
              ?.map(
                (e) => LongreadMaterialAttachmentItem.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
      backloggedAt: json['backloggedAt'] as String?,
      taskId: (json['taskId'] as num).toInt(),
      isTrackingStudents: json['isTrackingStudents'] as bool,
      mode: longreadExerciseQuestionsModeFromJson(json['mode']),
      areQuestionsShuffled: json['areQuestionsShuffled'] as bool,
      settings: ExerciseQuestionsSettings.fromJson(
        json['settings'] as Map<String, dynamic>,
      ),
      quizId: (json['quizId'] as num).toInt(),
      questions:
          (json['questions'] as List<dynamic>?)
              ?.map(
                (e) => LongreadExerciseQuestionItem.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
    );

Map<String, dynamic> _$LongreadExerciseQuestionsMaterialItemToJson(
  LongreadExerciseQuestionsMaterialItem instance,
) => <String, dynamic>{
  'discriminator': longreadMaterialDiscriminatorToJson(instance.discriminator),
  'state': publicationStateToJson(instance.state),
  'viewType': longreadMaterialViewTypeToJson(instance.viewType),
  'type': longreadMaterialTypeToJson(instance.type),
  'id': instance.id,
  'order': instance.order,
  'name': instance.name,
  'viewContent': instance.viewContent,
  'estimation': instance.estimation.toJson(),
  'reviewers': instance.reviewers,
  'assignees': instance.assignees,
  'attachments': instance.attachments.map((e) => e.toJson()).toList(),
  'backloggedAt': instance.backloggedAt,
  'taskId': instance.taskId,
  'isTrackingStudents': instance.isTrackingStudents,
  'mode': longreadExerciseQuestionsModeToJson(instance.mode),
  'areQuestionsShuffled': instance.areQuestionsShuffled,
  'settings': instance.settings.toJson(),
  'quizId': instance.quizId,
  'questions': instance.questions.map((e) => e.toJson()).toList(),
};

LongreadVideoPlatformMaterialItem _$LongreadVideoPlatformMaterialItemFromJson(
  Map<String, dynamic> json,
) => LongreadVideoPlatformMaterialItem(
  discriminator: longreadMaterialDiscriminatorFromJson(json['discriminator']),
  state: publicationStateFromJson(json['state']),
  viewType: longreadMaterialViewTypeFromJson(json['viewType']),
  type: longreadMaterialTypeFromJson(json['type']),
  id: (json['id'] as num).toInt(),
  order: (json['order'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  videoId: json['videoId'] as String,
  timecodes: (json['timecodes'] as List<dynamic>)
      .map(
        (e) => XRePropertyIncompleteOnlyEmptyArrayObserved$Item.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  publishDate: json['publishDate'] as String?,
  videoState: videoPlatformStateFromJson(json['videoState']),
  url: json['url'] as String,
);

Map<String, dynamic> _$LongreadVideoPlatformMaterialItemToJson(
  LongreadVideoPlatformMaterialItem instance,
) => <String, dynamic>{
  'discriminator': longreadMaterialDiscriminatorToJson(instance.discriminator),
  'state': publicationStateToJson(instance.state),
  'viewType': longreadMaterialViewTypeToJson(instance.viewType),
  'type': longreadMaterialTypeToJson(instance.type),
  'id': instance.id,
  'order': instance.order,
  'name': instance.name,
  'description': instance.description,
  'videoId': instance.videoId,
  'timecodes': instance.timecodes.map((e) => e.toJson()).toList(),
  'publishDate': instance.publishDate,
  'videoState': videoPlatformStateToJson(instance.videoState),
  'url': instance.url,
};

LongreadVideoMaterialItem _$LongreadVideoMaterialItemFromJson(
  Map<String, dynamic> json,
) => LongreadVideoMaterialItem(
  discriminator: longreadMaterialDiscriminatorFromJson(json['discriminator']),
  state: publicationStateFromJson(json['state']),
  viewType: longreadMaterialViewTypeFromJson(json['viewType']),
  type: longreadMaterialTypeFromJson(json['type']),
  id: (json['id'] as num).toInt(),
  order: (json['order'] as num).toInt(),
  mediaType: fileMediaTypeFromJson(json['mediaType']),
  filename: json['filename'] as String,
  version: json['version'] as String?,
  length: (json['length'] as num).toInt(),
  publishDate: json['publishDate'] as String?,
  publishedAt: json['publishedAt'] as String?,
  content: LongreadMaterialContent.fromJson(
    json['content'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$LongreadVideoMaterialItemToJson(
  LongreadVideoMaterialItem instance,
) => <String, dynamic>{
  'discriminator': longreadMaterialDiscriminatorToJson(instance.discriminator),
  'state': publicationStateToJson(instance.state),
  'viewType': longreadMaterialViewTypeToJson(instance.viewType),
  'type': longreadMaterialTypeToJson(instance.type),
  'id': instance.id,
  'order': instance.order,
  'mediaType': fileMediaTypeToJson(instance.mediaType),
  'filename': instance.filename,
  'version': instance.version,
  'length': instance.length,
  'publishDate': instance.publishDate,
  'publishedAt': instance.publishedAt,
  'content': instance.content.toJson(),
};

LongreadAudioMaterialItem _$LongreadAudioMaterialItemFromJson(
  Map<String, dynamic> json,
) => LongreadAudioMaterialItem(
  discriminator: longreadMaterialDiscriminatorFromJson(json['discriminator']),
  state: publicationStateFromJson(json['state']),
  viewType: longreadMaterialViewTypeFromJson(json['viewType']),
  type: longreadMaterialTypeFromJson(json['type']),
  id: (json['id'] as num).toInt(),
  order: (json['order'] as num).toInt(),
  mediaType: fileMediaTypeFromJson(json['mediaType']),
  filename: json['filename'] as String,
  version: json['version'] as String?,
  length: (json['length'] as num).toInt(),
  publishDate: json['publishDate'] as String?,
  publishedAt: json['publishedAt'] as String?,
  content: LongreadMaterialContent.fromJson(
    json['content'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$LongreadAudioMaterialItemToJson(
  LongreadAudioMaterialItem instance,
) => <String, dynamic>{
  'discriminator': longreadMaterialDiscriminatorToJson(instance.discriminator),
  'state': publicationStateToJson(instance.state),
  'viewType': longreadMaterialViewTypeToJson(instance.viewType),
  'type': longreadMaterialTypeToJson(instance.type),
  'id': instance.id,
  'order': instance.order,
  'mediaType': fileMediaTypeToJson(instance.mediaType),
  'filename': instance.filename,
  'version': instance.version,
  'length': instance.length,
  'publishDate': instance.publishDate,
  'publishedAt': instance.publishedAt,
  'content': instance.content.toJson(),
};

LongreadMaterialItem _$LongreadMaterialItemFromJson(
  Map<String, dynamic> json,
) => LongreadMaterialItem();

Map<String, dynamic> _$LongreadMaterialItemToJson(
  LongreadMaterialItem instance,
) => <String, dynamic>{};

LongreadMaterialsByIdResponse _$LongreadMaterialsByIdResponseFromJson(
  Map<String, dynamic> json,
) => LongreadMaterialsByIdResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => LongreadMaterialItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  paging: Paging.fromJson(json['paging'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LongreadMaterialsByIdResponseToJson(
  LongreadMaterialsByIdResponse instance,
) => <String, dynamic>{
  'items': instance.items.map((e) => e.toJson()).toList(),
  'paging': instance.paging.toJson(),
};

TaskExerciseActivity _$TaskExerciseActivityFromJson(
  Map<String, dynamic> json,
) => TaskExerciseActivity(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  weight: json['weight'] as num,
  isLateDaysEnabled: json['isLateDaysEnabled'] as bool,
);

Map<String, dynamic> _$TaskExerciseActivityToJson(
  TaskExerciseActivity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'weight': instance.weight,
  'isLateDaysEnabled': instance.isLateDaysEnabled,
};

TaskAttachment _$TaskAttachmentFromJson(Map<String, dynamic> json) =>
    TaskAttachment(
      name: json['name'] as String,
      filename: json['filename'] as String,
      mediaType: fileMediaTypeFromJson(json['mediaType']),
      length: (json['length'] as num).toInt(),
      version: json['version'] as String?,
    );

Map<String, dynamic> _$TaskAttachmentToJson(TaskAttachment instance) =>
    <String, dynamic>{
      'name': instance.name,
      'filename': instance.filename,
      'mediaType': fileMediaTypeToJson(instance.mediaType),
      'length': instance.length,
      'version': instance.version,
    };

TaskExerciseQuestionOrder _$TaskExerciseQuestionOrderFromJson(
  Map<String, dynamic> json,
) => TaskExerciseQuestionOrder(
  questionId: (json['questionId'] as num).toInt(),
  order: (json['order'] as num).toInt(),
  optionOrders:
      (json['optionOrders'] as List<dynamic>?)
          ?.map(
            (e) => TaskExerciseQuestionOrderOptionOrder.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
);

Map<String, dynamic> _$TaskExerciseQuestionOrderToJson(
  TaskExerciseQuestionOrder instance,
) => <String, dynamic>{
  'questionId': instance.questionId,
  'order': instance.order,
  'optionOrders': instance.optionOrders.map((e) => e.toJson()).toList(),
};

TaskExerciseQuestionOrderOptionOrder
_$TaskExerciseQuestionOrderOptionOrderFromJson(Map<String, dynamic> json) =>
    TaskExerciseQuestionOrderOptionOrder(
      optionId: (json['optionId'] as num).toInt(),
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$TaskExerciseQuestionOrderOptionOrderToJson(
  TaskExerciseQuestionOrderOptionOrder instance,
) => <String, dynamic>{'optionId': instance.optionId, 'order': instance.order};

TaskExercise _$TaskExerciseFromJson(Map<String, dynamic> json) => TaskExercise(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  type: taskTypeFromJson(json['type']),
  maxScore: json['maxScore'] as num,
  startDate: json['startDate'] as String,
  deadline: json['deadline'] as String,
  timer: json['timer'] as String?,
  activity: TaskExerciseActivity.fromJson(
    json['activity'] as Map<String, dynamic>,
  ),
  questionOrders: (json['questionOrders'] as List<dynamic>?)
      ?.map(
        (e) => TaskExerciseQuestionOrder.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  areQuestionsShuffled: json['areQuestionsShuffled'] as bool?,
  quizId: (json['quizId'] as num?)?.toInt(),
  mode: json['mode'] as String?,
  viewContent: json['viewContent'] as String?,
  exerciseUrl: json['exerciseUrl'] as String?,
  attachments:
      (json['attachments'] as List<dynamic>?)
          ?.map((e) => TaskAttachment.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  settings: json['settings'] == null
      ? null
      : ExerciseQuestionsSettings.fromJson(
          json['settings'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$TaskExerciseToJson(
  TaskExercise instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': taskTypeToJson(instance.type),
  'maxScore': instance.maxScore,
  'startDate': instance.startDate,
  'deadline': instance.deadline,
  'timer': instance.timer,
  'activity': instance.activity.toJson(),
  'questionOrders': instance.questionOrders?.map((e) => e.toJson()).toList(),
  'areQuestionsShuffled': instance.areQuestionsShuffled,
  'quizId': instance.quizId,
  'mode': instance.mode,
  'viewContent': instance.viewContent,
  'exerciseUrl': instance.exerciseUrl,
  'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
  'settings': instance.settings?.toJson(),
};

TaskCourse _$TaskCourseFromJson(Map<String, dynamic> json) => TaskCourse(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  isArchived: json['isArchived'] as bool,
);

Map<String, dynamic> _$TaskCourseToJson(TaskCourse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isArchived': instance.isArchived,
    };

TaskCourseTheme _$TaskCourseThemeFromJson(Map<String, dynamic> json) =>
    TaskCourseTheme(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$TaskCourseThemeToJson(TaskCourseTheme instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

TaskLongread _$TaskLongreadFromJson(Map<String, dynamic> json) =>
    TaskLongread(id: (json['id'] as num).toInt(), name: json['name'] as String);

Map<String, dynamic> _$TaskLongreadToJson(TaskLongread instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

TaskReviewer _$TaskReviewerFromJson(Map<String, dynamic> json) => TaskReviewer(
  id: json['id'] as String,
  name: json['name'] as String,
  identityEmail: json['identityEmail'] as String,
  email: json['email'] as String,
  identityIdentifier: json['identityIdentifier'] as String,
  timeAccount: json['timeAccount'] as String,
  lastName: json['lastName'] as String,
  firstName: json['firstName'] as String,
  middleName: json['middleName'] as String?,
);

Map<String, dynamic> _$TaskReviewerToJson(TaskReviewer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'identityEmail': instance.identityEmail,
      'email': instance.email,
      'identityIdentifier': instance.identityIdentifier,
      'timeAccount': instance.timeAccount,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
    };

TaskSolutionAnswersQuestionInputAnswerValue
_$TaskSolutionAnswersQuestionInputAnswerValueFromJson(
  Map<String, dynamic> json,
) => TaskSolutionAnswersQuestionInputAnswerValue();

Map<String, dynamic> _$TaskSolutionAnswersQuestionInputAnswerValueToJson(
  TaskSolutionAnswersQuestionInputAnswerValue instance,
) => <String, dynamic>{};

TaskSolutionAnswersQuestionInputAnswer
_$TaskSolutionAnswersQuestionInputAnswerFromJson(Map<String, dynamic> json) =>
    TaskSolutionAnswersQuestionInputAnswer(
      values:
          (json['values'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      value: TaskSolutionAnswersQuestionInputAnswerValue.fromJson(
        json['value'] as Map<String, dynamic>,
      ),
      recommendation: json['recommendation'] as String,
    );

Map<String, dynamic> _$TaskSolutionAnswersQuestionInputAnswerToJson(
  TaskSolutionAnswersQuestionInputAnswer instance,
) => <String, dynamic>{
  'values': instance.values,
  'value': instance.value.toJson(),
  'recommendation': instance.recommendation,
};

TaskSolutionAnswersQuestionInputNumberAnswer
_$TaskSolutionAnswersQuestionInputNumberAnswerFromJson(
  Map<String, dynamic> json,
) => TaskSolutionAnswersQuestionInputNumberAnswer(
  values:
      (json['values'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList() ??
      [],
  value: TaskSolutionAnswersQuestionInputAnswerValue.fromJson(
    json['value'] as Map<String, dynamic>,
  ),
  recommendation: json['recommendation'] as String,
);

Map<String, dynamic> _$TaskSolutionAnswersQuestionInputNumberAnswerToJson(
  TaskSolutionAnswersQuestionInputNumberAnswer instance,
) => <String, dynamic>{
  'values': instance.values,
  'value': instance.value.toJson(),
  'recommendation': instance.recommendation,
};

TaskSolutionAnswersQuestionOptionsItem
_$TaskSolutionAnswersQuestionOptionsItemFromJson(Map<String, dynamic> json) =>
    TaskSolutionAnswersQuestionOptionsItem(
      id: (json['id'] as num).toInt(),
      isCorrect: json['isCorrect'] as bool,
      recommendation: json['recommendation'] as String?,
    );

Map<String, dynamic> _$TaskSolutionAnswersQuestionOptionsItemToJson(
  TaskSolutionAnswersQuestionOptionsItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'isCorrect': instance.isCorrect,
  'recommendation': instance.recommendation,
};

TaskSolutionAnswersQuestionOptionsQuestionItem
_$TaskSolutionAnswersQuestionOptionsQuestionItemFromJson(
  Map<String, dynamic> json,
) => TaskSolutionAnswersQuestionOptionsQuestionItem(
  id: (json['id'] as num).toInt(),
  type: taskSolutionAnswersQuestionOptionsQuestionItemTypeFromJson(
    json['type'],
  ),
  answer: nullOnlyNullableFromJson(json['answer']),
  options:
      (json['options'] as List<dynamic>?)
          ?.map(
            (e) => TaskSolutionAnswersQuestionOptionsItem.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
);

Map<String, dynamic> _$TaskSolutionAnswersQuestionOptionsQuestionItemToJson(
  TaskSolutionAnswersQuestionOptionsQuestionItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': taskSolutionAnswersQuestionOptionsQuestionItemTypeToJson(
    instance.type,
  ),
  'answer': nullOnlyNullableToJson(instance.answer),
  'options': instance.options.map((e) => e.toJson()).toList(),
};

TaskSolutionAnswersQuestionInputQuestionItem
_$TaskSolutionAnswersQuestionInputQuestionItemFromJson(
  Map<String, dynamic> json,
) => TaskSolutionAnswersQuestionInputQuestionItem(
  id: (json['id'] as num).toInt(),
  type: taskSolutionAnswersQuestionInputQuestionItemTypeFromJson(json['type']),
  answer: json['answer'] == null
      ? null
      : TaskSolutionAnswersQuestionInputAnswer.fromJson(
          json['answer'] as Map<String, dynamic>,
        ),
  options: nullOnlyNullableFromJson(json['options']),
);

Map<String, dynamic> _$TaskSolutionAnswersQuestionInputQuestionItemToJson(
  TaskSolutionAnswersQuestionInputQuestionItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': taskSolutionAnswersQuestionInputQuestionItemTypeToJson(instance.type),
  'answer': instance.answer?.toJson(),
  'options': nullOnlyNullableToJson(instance.options),
};

TaskSolutionAnswersQuestionInputNumberQuestionItem
_$TaskSolutionAnswersQuestionInputNumberQuestionItemFromJson(
  Map<String, dynamic> json,
) => TaskSolutionAnswersQuestionInputNumberQuestionItem(
  id: (json['id'] as num).toInt(),
  type: taskSolutionAnswersQuestionInputNumberQuestionItemTypeFromJson(
    json['type'],
  ),
  answer: json['answer'] == null
      ? null
      : TaskSolutionAnswersQuestionInputNumberAnswer.fromJson(
          json['answer'] as Map<String, dynamic>,
        ),
  options: nullOnlyNullableFromJson(json['options']),
);

Map<String, dynamic> _$TaskSolutionAnswersQuestionInputNumberQuestionItemToJson(
  TaskSolutionAnswersQuestionInputNumberQuestionItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': taskSolutionAnswersQuestionInputNumberQuestionItemTypeToJson(
    instance.type,
  ),
  'answer': instance.answer?.toJson(),
  'options': nullOnlyNullableToJson(instance.options),
};

TaskSolutionAnswersQuestion _$TaskSolutionAnswersQuestionFromJson(
  Map<String, dynamic> json,
) => TaskSolutionAnswersQuestion();

Map<String, dynamic> _$TaskSolutionAnswersQuestionToJson(
  TaskSolutionAnswersQuestion instance,
) => <String, dynamic>{};

TaskSolutionAnswersItem _$TaskSolutionAnswersItemFromJson(
  Map<String, dynamic> json,
) => TaskSolutionAnswersItem(
  answer: json['answer'],
  question: TaskSolutionAnswersQuestion.fromJson(
    json['question'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$TaskSolutionAnswersItemToJson(
  TaskSolutionAnswersItem instance,
) => <String, dynamic>{
  'answer': instance.answer,
  'question': instance.question.toJson(),
};

TaskSolution _$TaskSolutionFromJson(Map<String, dynamic> json) => TaskSolution(
  type: taskTypeFromJson(json['type']),
  solutionUrl: json['solutionUrl'] as String?,
  answers:
      (json['answers'] as List<dynamic>?)
          ?.map(
            (e) => TaskSolutionAnswersItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  attachments:
      (json['attachments'] as List<dynamic>?)
          ?.map((e) => TaskAttachment.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$TaskSolutionToJson(TaskSolution instance) =>
    <String, dynamic>{
      'type': taskTypeToJson(instance.type),
      'solutionUrl': instance.solutionUrl,
      'answers': instance.answers?.map((e) => e.toJson()).toList(),
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
    };

TaskScoresItem _$TaskScoresItemFromJson(Map<String, dynamic> json) =>
    TaskScoresItem(
      questionId: (json['questionId'] as num).toInt(),
      score: json['score'] as num?,
    );

Map<String, dynamic> _$TaskScoresItemToJson(TaskScoresItem instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'score': instance.score,
    };

QuizSessionId _$QuizSessionIdFromJson(Map<String, dynamic> json) =>
    QuizSessionId();

Map<String, dynamic> _$QuizSessionIdToJson(QuizSessionId instance) =>
    <String, dynamic>{};

TaskEvaluatedAttemptId _$TaskEvaluatedAttemptIdFromJson(
  Map<String, dynamic> json,
) => TaskEvaluatedAttemptId();

Map<String, dynamic> _$TaskEvaluatedAttemptIdToJson(
  TaskEvaluatedAttemptId instance,
) => <String, dynamic>{};

TaskCurrentAttemptId _$TaskCurrentAttemptIdFromJson(
  Map<String, dynamic> json,
) => TaskCurrentAttemptId();

Map<String, dynamic> _$TaskCurrentAttemptIdToJson(
  TaskCurrentAttemptId instance,
) => <String, dynamic>{};

TaskLastAttemptId _$TaskLastAttemptIdFromJson(Map<String, dynamic> json) =>
    TaskLastAttemptId();

Map<String, dynamic> _$TaskLastAttemptIdToJson(TaskLastAttemptId instance) =>
    <String, dynamic>{};

TaskByIdResponse _$TaskByIdResponseFromJson(
  Map<String, dynamic> json,
) => TaskByIdResponse(
  id: (json['id'] as num).toInt(),
  type: taskTypeFromJson(json['type']),
  state: taskStateFromJson(json['state']),
  score: json['score'] as num?,
  scoreSkillLevel: taskScoreSkillLevelNullableFromJson(json['scoreSkillLevel']),
  isSkillLevelEnabled: json['isSkillLevelEnabled'] as bool,
  isLateDaysEnabled: json['isLateDaysEnabled'] as bool,
  extraScore: json['extraScore'] as num?,
  createdAt: json['createdAt'] as String,
  startedAt: json['startedAt'] as String?,
  submitAt: json['submitAt'] as String?,
  rejectAt: json['rejectAt'] as String?,
  evaluateAt: json['evaluateAt'] as String?,
  deadline: json['deadline'] as String,
  lateDays: (json['lateDays'] as num?)?.toInt(),
  exercise: TaskExercise.fromJson(json['exercise'] as Map<String, dynamic>),
  course: TaskCourse.fromJson(json['course'] as Map<String, dynamic>),
  theme: TaskCourseTheme.fromJson(json['theme'] as Map<String, dynamic>),
  longread: TaskLongread.fromJson(json['longread'] as Map<String, dynamic>),
  student: CurrentStudentResponse.fromJson(
    json['student'] as Map<String, dynamic>,
  ),
  reviewer: json['reviewer'] == null
      ? null
      : TaskReviewer.fromJson(json['reviewer'] as Map<String, dynamic>),
  solution: json['solution'] == null
      ? null
      : TaskSolution.fromJson(json['solution'] as Map<String, dynamic>),
  scores: (json['scores'] as List<dynamic>?)
      ?.map((e) => TaskScoresItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  quizSessionId: json['quizSessionId'] == null
      ? null
      : QuizSessionId.fromJson(json['quizSessionId'] as Map<String, dynamic>),
  evaluatedAttemptId: json['evaluatedAttemptId'] == null
      ? null
      : TaskEvaluatedAttemptId.fromJson(
          json['evaluatedAttemptId'] as Map<String, dynamic>,
        ),
  currentAttemptId: json['currentAttemptId'] == null
      ? null
      : TaskCurrentAttemptId.fromJson(
          json['currentAttemptId'] as Map<String, dynamic>,
        ),
  lastAttemptId: json['lastAttemptId'] == null
      ? null
      : TaskLastAttemptId.fromJson(
          json['lastAttemptId'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$TaskByIdResponseToJson(TaskByIdResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': taskTypeToJson(instance.type),
      'state': taskStateToJson(instance.state),
      'score': instance.score,
      'scoreSkillLevel': taskScoreSkillLevelNullableToJson(
        instance.scoreSkillLevel,
      ),
      'isSkillLevelEnabled': instance.isSkillLevelEnabled,
      'isLateDaysEnabled': instance.isLateDaysEnabled,
      'extraScore': instance.extraScore,
      'createdAt': instance.createdAt,
      'startedAt': instance.startedAt,
      'submitAt': instance.submitAt,
      'rejectAt': instance.rejectAt,
      'evaluateAt': instance.evaluateAt,
      'deadline': instance.deadline,
      'lateDays': instance.lateDays,
      'exercise': instance.exercise.toJson(),
      'course': instance.course.toJson(),
      'theme': instance.theme.toJson(),
      'longread': instance.longread.toJson(),
      'student': instance.student.toJson(),
      'reviewer': instance.reviewer?.toJson(),
      'solution': instance.solution?.toJson(),
      'scores': instance.scores?.map((e) => e.toJson()).toList(),
      'quizSessionId': instance.quizSessionId?.toJson(),
      'evaluatedAttemptId': instance.evaluatedAttemptId?.toJson(),
      'currentAttemptId': instance.currentAttemptId?.toJson(),
      'lastAttemptId': instance.lastAttemptId?.toJson(),
    };

GenerateContentDownloadLinkResponse
_$GenerateContentDownloadLinkResponseFromJson(Map<String, dynamic> json) =>
    GenerateContentDownloadLinkResponse(url: json['url'] as String);

Map<String, dynamic> _$GenerateContentDownloadLinkResponseToJson(
  GenerateContentDownloadLinkResponse instance,
) => <String, dynamic>{'url': instance.url};

LongreadExerciseSingleChoiceQuestionitem$SingleChoice
_$LongreadExerciseSingleChoiceQuestionitem$SingleChoiceFromJson(
  Map<String, dynamic> json,
) => LongreadExerciseSingleChoiceQuestionitem$SingleChoice(
  options: (json['options'] as List<dynamic>)
      .map((e) => QuestionItemOption.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic>
_$LongreadExerciseSingleChoiceQuestionitem$SingleChoiceToJson(
  LongreadExerciseSingleChoiceQuestionitem$SingleChoice instance,
) => <String, dynamic>{
  'options': instance.options.map((e) => e.toJson()).toList(),
};

LongreadExerciseMultipleChoiceQuestionItem$MultipleChoice
_$LongreadExerciseMultipleChoiceQuestionItem$MultipleChoiceFromJson(
  Map<String, dynamic> json,
) => LongreadExerciseMultipleChoiceQuestionItem$MultipleChoice(
  options: (json['options'] as List<dynamic>)
      .map((e) => QuestionItemOption.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic>
_$LongreadExerciseMultipleChoiceQuestionItem$MultipleChoiceToJson(
  LongreadExerciseMultipleChoiceQuestionItem$MultipleChoice instance,
) => <String, dynamic>{
  'options': instance.options.map((e) => e.toJson()).toList(),
};
