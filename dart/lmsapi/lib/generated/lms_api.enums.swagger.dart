// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

enum XRePropertyIncompleteOnlyNullObserved {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('null')
  $null('null');

  final String? value;

  const XRePropertyIncompleteOnlyNullObserved(this.value);
}

enum NullOnly {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('null')
  $null('null');

  final String? value;

  const NullOnly(this.value);
}

enum PublicationState {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('published')
  published('published'),
  @JsonValue('archived')
  archived('archived'),
  @JsonValue('draft')
  draft('draft');

  final String? value;

  const PublicationState(this.value);
}

enum CourseSkillLevel {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none');

  final String? value;

  const CourseSkillLevel(this.value);
}

enum CourseCategory {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('withoutCategory')
  withoutcategory('withoutCategory'),
  @JsonValue('general')
  general('general'),
  @JsonValue('mathematics')
  mathematics('mathematics'),
  @JsonValue('business')
  business('business'),
  @JsonValue('development')
  development('development'),
  @JsonValue('stem')
  stem('stem'),
  @JsonValue('softSkills')
  softskills('softSkills'),
  @JsonValue('ml')
  ml('ml'),
  @JsonValue('design')
  design('design'),
  @JsonValue('analytics')
  analytics('analytics'),
  @JsonValue('career')
  career('career'),
  @JsonValue('management')
  management('management');

  final String? value;

  const CourseCategory(this.value);
}

enum CourseCategoryCover {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('sineWave')
  sinewave('sineWave'),
  @JsonValue('curvesGrid')
  curvesgrid('curvesGrid'),
  @JsonValue('ellipsesOverlap')
  ellipsesoverlap('ellipsesOverlap'),
  @JsonValue('geometricTriangle')
  geometrictriangle('geometricTriangle'),
  @JsonValue('verticalLines')
  verticallines('verticalLines'),
  @JsonValue('gridPlanes')
  gridplanes('gridPlanes'),
  @JsonValue('spiralLoops')
  spiralloops('spiralLoops'),
  @JsonValue('symmetricCircles')
  symmetriccircles('symmetricCircles');

  final String? value;

  const CourseCategoryCover(this.value);
}

enum StudyLevel {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('bachelor')
  bachelor('bachelor'),
  @JsonValue('master')
  master('master'),
  @JsonValue('dpo')
  dpo('dpo'),
  @JsonValue('dpoMaster')
  dpomaster('dpoMaster');

  final String? value;

  const StudyLevel(this.value);
}

enum LongreadType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('common')
  common('common'),
  @JsonValue('handout')
  handout('handout');

  final String? value;

  const LongreadType(this.value);
}

enum LongreadMaterialType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('markdown')
  markdown('markdown'),
  @JsonValue('content')
  content('content'),
  @JsonValue('coding')
  coding('coding'),
  @JsonValue('image')
  image('image'),
  @JsonValue('questions')
  questions('questions'),
  @JsonValue('videoPlatform')
  videoplatform('videoPlatform');

  final String? value;

  const LongreadMaterialType(this.value);
}

enum LongreadMaterialDiscriminator {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('markdown')
  markdown('markdown'),
  @JsonValue('file')
  file('file'),
  @JsonValue('coding')
  coding('coding'),
  @JsonValue('image')
  image('image'),
  @JsonValue('questions')
  questions('questions'),
  @JsonValue('videoPlatform')
  videoplatform('videoPlatform'),
  @JsonValue('video')
  video('video'),
  @JsonValue('audio')
  audio('audio');

  final String? value;

  const LongreadMaterialDiscriminator(this.value);
}

enum LongreadMaterialViewType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ngxMarkdown')
  ngxmarkdown('ngxMarkdown'),
  @JsonValue('file')
  file('file'),
  @JsonValue('exerciseCoding')
  exercisecoding('exerciseCoding'),
  @JsonValue('image')
  image('image'),
  @JsonValue('exerciseQuestions')
  exercisequestions('exerciseQuestions'),
  @JsonValue('videoPlatform')
  videoplatform('videoPlatform'),
  @JsonValue('video')
  video('video'),
  @JsonValue('audio')
  audio('audio');

  final String? value;

  const LongreadMaterialViewType(this.value);
}

enum FileMediaType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('file')
  file('file'),
  @JsonValue('image')
  image('image'),
  @JsonValue('video')
  video('video'),
  @JsonValue('audio')
  audio('audio');

  final String? value;

  const FileMediaType(this.value);
}

enum LongreadMaterialMediaTypeUpper {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('File')
  file('File'),
  @JsonValue('Image')
  image('Image'),
  @JsonValue('Video')
  video('Video'),
  @JsonValue('Audio')
  audio('Audio');

  final String? value;

  const LongreadMaterialMediaTypeUpper(this.value);
}

enum LongreadExerciseQuestionsMode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('atMoment')
  atmoment('atMoment'),
  @JsonValue('byDeadline')
  bydeadline('byDeadline');

  final String? value;

  const LongreadExerciseQuestionsMode(this.value);
}

enum QuestionsSettingsEvalStrategy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('last')
  last('last'),
  @JsonValue('best')
  best('best');

  final String? value;

  const QuestionsSettingsEvalStrategy(this.value);
}

enum QuestionItemCorrectAnswerInputStringCorrectAnswerType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('inputStringCorrectAnswer')
  inputstringcorrectanswer('inputStringCorrectAnswer');

  final String? value;

  const QuestionItemCorrectAnswerInputStringCorrectAnswerType(this.value);
}

enum QuestionItemCorrectAnswerInputNumberCorrectAnswerType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('inputNumberCorrectAnswer')
  inputnumbercorrectanswer('inputNumberCorrectAnswer');

  final String? value;

  const QuestionItemCorrectAnswerInputNumberCorrectAnswerType(this.value);
}

enum LongreadExerciseInputQuestionItemType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('input')
  input('input');

  final String? value;

  const LongreadExerciseInputQuestionItemType(this.value);
}

enum LongreadExerciseSingleChoiceQuestionitemType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('singleChoice')
  singlechoice('singleChoice');

  final String? value;

  const LongreadExerciseSingleChoiceQuestionitemType(this.value);
}

enum LongreadExerciseMultipleChoiceQuestionItemType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('multipleChoice')
  multiplechoice('multipleChoice');

  final String? value;

  const LongreadExerciseMultipleChoiceQuestionItemType(this.value);
}

enum VideoPlatformState {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('unspecified')
  unspecified('unspecified'),
  @JsonValue('empty')
  empty('empty'),
  @JsonValue('uploaded')
  uploaded('uploaded'),
  @JsonValue('transcoding')
  transcoding('transcoding'),
  @JsonValue('viewable')
  viewable('viewable'),
  @JsonValue('ready')
  ready('ready'),
  @JsonValue('partiallyReady')
  partiallyready('partiallyReady'),
  @JsonValue('error')
  error('error');

  final String? value;

  const VideoPlatformState(this.value);
}

enum TaskType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('coding')
  coding('coding'),
  @JsonValue('questions')
  questions('questions');

  final String? value;

  const TaskType(this.value);
}

enum TaskState {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('backlog')
  backlog('backlog'),
  @JsonValue('inProgress')
  inprogress('inProgress'),
  @JsonValue('submitted')
  submitted('submitted'),
  @JsonValue('review')
  review('review'),
  @JsonValue('evaluated')
  evaluated('evaluated'),
  @JsonValue('failed')
  failed('failed');

  final String? value;

  const TaskState(this.value);
}

enum TaskScoreSkillLevel {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('basic')
  basic('basic'),
  @JsonValue('intermediate')
  intermediate('intermediate'),
  @JsonValue('advanced')
  advanced('advanced');

  final String? value;

  const TaskScoreSkillLevel(this.value);
}

enum TaskSolutionAnswersQuestionOptionsQuestionItemType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('singleChoice')
  singlechoice('singleChoice'),
  @JsonValue('multipleChoice')
  multiplechoice('multipleChoice');

  final String? value;

  const TaskSolutionAnswersQuestionOptionsQuestionItemType(this.value);
}

enum TaskSolutionAnswersQuestionInputQuestionItemType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('input')
  input('input');

  final String? value;

  const TaskSolutionAnswersQuestionInputQuestionItemType(this.value);
}

enum TaskSolutionAnswersQuestionInputNumberQuestionItemType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('inputNumber')
  inputnumber('inputNumber');

  final String? value;

  const TaskSolutionAnswersQuestionInputNumberQuestionItemType(this.value);
}
