export type ClientOptions = {
    baseUrl: 'https://my.centraluniversity.ru/api' | '{proto}://{host}:{port}/api' | (string & {});
};
export type BaseErrorType = string;
/**
 * Short, human-readable summary of the problem type.
 */
export type BaseErrorTitle = string;
/**
 * HTTP status code.
 */
export type BaseErrorStatus = number;
/**
 * Details of the error.
 */
export type BaseErrorDetail = string;
/**
 * Relative request path without service prefix where error occurred.
 *
 */
export type BaseErrorInstance = string;
/**
 * Base problem JSON error based from RFC 9457 with trace ID.
 */
export type BaseProblemError = {
    type?: BaseErrorType;
    title: BaseErrorTitle;
    status: BaseErrorStatus;
    traceId?: BaseErrorTraceId;
    [key: string]: unknown;
};
/**
 * W3C Trace Context traceparent value for backend to correlate requests across services.
 *
 */
export type BaseErrorTraceId = string;
/**
 * Base error for Bad Request status.
 */
export type BaseBadRequestError = {
    title: BaseErrorTitle;
    status: BaseErrorStatus;
    /**
     * Field-level validation errors keyed by property name.
     */
    errors: {
        [key: string]: Array<string>;
    };
};
/**
 * Base error for Unauthorized status.
 */
export type BaseUnauthorizedError = {
    type?: BaseErrorType;
    title: BaseErrorTitle;
    status: BaseErrorStatus;
    traceId: BaseErrorTraceId;
};
/**
 * Base error for Forbidden error.
 */
export type BaseForbiddenError = {
    type?: BaseErrorType;
    title: BaseErrorTitle;
    status: BaseErrorStatus;
    detail?: BaseErrorDetail;
    instance?: BaseErrorInstance;
    traceId: BaseErrorTraceId;
};
/**
 * Base error for Not Found status.
 */
export type BaseNotFoundError = {
    title: BaseErrorTitle;
    status: BaseErrorStatus;
    detail?: BaseErrorDetail;
    instance?: BaseErrorInstance;
    /**
     * ID of the entity that was not found.
     */
    entityId?: number;
    traceId: BaseErrorTraceId;
};
/**
 * Value only seen as null.
 */
export type XRePropertyIncompleteOnlyNullObserved = null;
/**
 * Value only seen as empty array.
 */
export type XRePropertyIncompleteOnlyEmptyArrayObserved = Array<{
    [key: string]: unknown;
}>;
/**
 * Value only expected to be null.
 */
export type NullOnly = null;
/**
 * Publication state of an item.
 */
export type PublicationState = 'published' | 'archived' | 'draft';
/**
 * Numeric identifier of the course.
 */
export type CourseId = number;
/**
 * Skill level label configured for the course.
 */
export type CourseSkillLevel = 'none';
/**
 * Indicates if skill level is enabled for the course.
 */
export type CourseIsSkillLevelEnabled = boolean;
/**
 * External syllabus URL of the course.
 */
export type CourseSyllabusUrl = string | null;
/**
 * TiMe channel of the course.
 */
export type CourseTimeChannelUrl = string | null;
/**
 * Course settings.
 */
export type CourseSettings = {
    skillLevel: CourseSkillLevel;
    isSkillLevelEnabled: CourseIsSkillLevelEnabled;
    syllabusUrl: CourseSyllabusUrl;
    timeChannelUrl: CourseTimeChannelUrl;
};
/**
 * Course name.
 */
export type CourseName = string;
/**
 * Indicates if the course is archived.
 */
export type CourseIsArchived = boolean;
/**
 * Scheduled item publication timestamp, if value is not null.
 */
export type PublishDate = string | null;
/**
 * Actual item publication timestamp.
 */
export type PublishedAt = string | null;
/**
 * Category to which the course belongs to.
 */
export type CourseCategory = 'withoutCategory' | 'general' | 'mathematics' | 'business' | 'development' | 'stem' | 'softSkills' | 'ml' | 'design' | 'analytics' | 'career' | 'management';
/**
 * Course card icon style identifier.
 */
export type CourseCategoryCover = 'sineWave' | 'curvesGrid' | 'ellipsesOverlap' | 'geometricTriangle' | 'verticalLines' | 'gridPlanes' | 'spiralLoops' | 'symmetricCircles';
/**
 * Identifier of the subject this course belongs to, if value is not null.
 *
 */
export type SubjectId = number | null;
/**
 * Summary information about a course, used for course listing.
 */
export type CourseSummaryItem = {
    id: CourseId;
    name: CourseName;
    state: PublicationState;
    publishDate: PublishDate;
    publishedAt: PublishedAt;
    settings: CourseSettings;
    subjectId: SubjectId;
    isArchived: CourseIsArchived;
    category: CourseCategory;
    categoryCover: CourseCategoryCover;
};
export type Paging = {
    limit: number;
    offset: number;
    totalCount: number;
};
export type ListStudentCoursesResponse = {
    items: Array<CourseSummaryItem>;
    paging: Paging;
};
/**
 * Unique identifier of the user.
 */
export type UserId = string;
export type UniversityEmail = string;
/**
 * Username in TiMe messenger (T-Bank's fork of Mattermost).
 */
export type TimeAccount = string;
/**
 * Student’s current education level.
 */
export type StudyLevel = 'none' | 'bachelor' | 'master' | 'dpo' | 'dpoMaster';
export type CurrentStudentResponse = {
    id: UserId;
    lastName: string;
    firstName: string;
    middleName: string | null;
    universityEmail: UniversityEmail;
    timeAccount: TimeAccount;
    /**
     * Year the student enrolled at the university.
     */
    studyStartYear: number | null;
    studyLevel: StudyLevel;
    /**
     * Number of late days remaining for the student.
     */
    lateDaysBalance: number;
};
export type CourseSummaryByIdResponse = CourseSummaryItem;
/**
 * Numeric identifier of the course theme.
 */
export type CourseThemeId = number;
/**
 * Numeric identifier of the longread item.
 */
export type LongreadId = number;
/**
 * Longread item type.
 */
export type LongreadType = 'common' | 'handout';
/**
 * Numeric identifier of the exercise item.
 */
export type ExerciseId = number;
/**
 * Numeric identifier of the activity item.
 */
export type ActivityId = number;
/**
 * Activity name.
 */
export type ActivityName = string;
/**
 * Weight coefficient for every single activity by activity name, used in the course grade formula to calculate the overall semester score.
 *
 */
export type ActivityWeight = number;
/**
 * Activity definition shared across exercises. Multiple exercises reference the same activity definition.
 *
 */
export type ActivityDefinition = {
    id: ActivityId;
    name: ActivityName;
    weight: ActivityWeight;
};
/**
 * Deadline timestamp by which the item must be completed.
 */
export type Deadline = string;
/**
 * Maximum possible score for completing exercise.
 */
export type MaxScore = number;
/**
 * Exercise name shown as the header is LMS.
 */
export type ExerciseName = string;
/**
 * An exercise item within a longread item.
 */
export type ExerciseItem = {
    id: ExerciseId;
    name: ExerciseName;
    maxScore: MaxScore;
    activity: ActivityDefinition;
    deadline: Deadline;
};
/**
 * Longread name shown as the header in LMS.
 */
export type LongreadName = string;
/**
 * A longread list item within a course theme. It may be self-contained content or include one or more associated exercises.
 *
 */
export type LongreadItem = {
    id: LongreadId;
    type: LongreadType;
    name: LongreadName;
    state: PublicationState;
    publishDate: PublishDate;
    publishedAt: PublishedAt;
    /**
     * Exercises associated with this longread.
     */
    exercises: Array<ExerciseItem>;
};
/**
 * Course theme name shown on the course view in LMS.
 *
 */
export type CourseThemeName = string;
/**
 * Listing order determining the item's line position in the LMS, lower values come first.
 *
 */
export type ListingOrder = number;
/**
 * Course theme is a unit, which is typically a weekly module of longread IDs and exercise items.
 *
 */
export type CourseThemeItem = {
    id: CourseThemeId;
    name: CourseThemeName;
    order: ListingOrder;
    state: PublicationState;
    publishDate: PublishDate;
    publishedAt: PublishedAt;
    longreads: Array<LongreadItem>;
};
export type CourseOverviewByIdResponse = {
    id: CourseId;
    name: CourseName;
    isArchived: CourseIsArchived;
    state: PublicationState;
    publishDate: PublishDate;
    publishedAt: PublishedAt;
    settings: CourseSettings;
    themes: Array<CourseThemeItem>;
};
/**
 * Summary information about a course theme by its ID.
 */
export type CourseThemeSummaryByIdResponse = {
    id: CourseThemeId;
    name: CourseThemeName;
    state: PublicationState;
    publishDate: PublishDate;
    publishedAt: PublishedAt;
    order: ListingOrder;
    category: CourseCategory;
    /**
     * Numeric identifier of the category cover.
     */
    categoryCover: number;
};
export type LongreadSummaryByIdResponse = {
    id: LongreadId;
    type: LongreadType;
    name: LongreadName;
    order: ListingOrder;
    state: PublicationState;
    publishDate: PublishDate;
    publishedAt: PublishedAt;
};
/**
 * Numeric identifier of a longread material block.
 */
export type LongreadMaterialId = number;
/**
 * Material block type identifier.
 */
export type LongreadMaterialType = 'markdown' | 'content' | 'coding' | 'image' | 'questions' | 'videoPlatform';
/**
 * Material block discriminator used by LMS frontend.
 */
export type LongreadMaterialDiscriminator = 'markdown' | 'file' | 'coding' | 'image' | 'questions' | 'videoPlatform' | 'video' | 'audio';
/**
 * View renderer type used by LMS frontend.
 */
export type LongreadMaterialViewType = 'ngxMarkdown' | 'file' | 'exerciseCoding' | 'image' | 'exerciseQuestions' | 'videoPlatform' | 'video' | 'audio';
/**
 * Media type attachment identifier.
 */
export type FileMediaType = 'file' | 'image' | 'video' | 'audio';
/**
 * Media type identifier in upper.
 */
export type LongreadMaterialMediaTypeUpper = 'File' | 'Image' | 'Video' | 'Audio';
/**
 * Material content revision identifier.
 */
export type LongreadMaterialVersion = string | null;
/**
 * Material payload size in bytes.
 */
export type LongreadMaterialLength = number;
/**
 * File attachment display name shown in LMS.
 */
export type FileAttachmentName = string;
/**
 * File object path in storage.
 */
export type FileNameObjectPath = string;
export type LongreadMaterialContent = {
    name: FileAttachmentName;
    filename: FileNameObjectPath;
    mediaType: LongreadMaterialMediaTypeUpper;
    version: LongreadMaterialVersion;
    length: LongreadMaterialLength;
};
/**
 * JSON-serialized markdown content rendered in LMS.
 */
export type LongreadMaterialViewContent = string | null;
export type LongreadMaterialAttachmentItem = {
    name: FileAttachmentName;
    filename: FileNameObjectPath;
    mediaType: FileMediaType;
    length: LongreadMaterialLength;
    version: LongreadMaterialVersion;
};
/**
 * Numeric identifier of the task.
 */
export type TaskId = number;
/**
 * URL of coding exercise if configured.
 */
export type ExerciseUrl = string | null;
export type LongreadMaterialCoding = {
    exerciseUrl: ExerciseUrl;
};
/**
 * Indicates if late days can be used for this activity.
 */
export type ActivityIsLateDaysEnabled = boolean;
/**
 * Activity configuration for a longread exercise.
 */
export type LongreadMaterialActivity = {
    id: ActivityId;
    name: ActivityName;
    weight: ActivityWeight;
    /**
     * Max exercises count.
     */
    maxExercisesCount: number;
    /**
     * Average score threshold.
     */
    averageScoreThreshold: number | null;
    isLateDaysEnabled: ActivityIsLateDaysEnabled;
};
/**
 * Timer by which exercise should be completed.
 */
export type LongreadMaterialTimer = string | null;
/**
 * Scheduled item start timestamp.
 */
export type StartDate = string;
/**
 * Estimation and grading constraints for exercise material.
 */
export type LongreadMaterialEstimation = {
    startDate: StartDate;
    timer: LongreadMaterialTimer;
    maxScore: MaxScore | null;
    deadline: Deadline | null;
    activity: LongreadMaterialActivity | null;
};
/**
 * Timestamp when task was moved to backlog.
 */
export type BackloggedAt = string | null;
/**
 * Questions mode.
 */
export type LongreadExerciseQuestionsMode = 'atMoment' | 'byDeadline';
/**
 * Questions exercise evaluation strategy.
 */
export type QuestionsSettingsEvalStrategy = 'last' | 'best';
/**
 * Settings for questions exercise behavior.
 */
export type ExerciseQuestionsSettings = {
    questionsPerAttempt: XRePropertyIncompleteOnlyNullObserved;
    attemptsLimit: number;
    evaluationStrategy: QuestionsSettingsEvalStrategy;
};
/**
 * Numeric identifier of the quiz.
 */
export type QuizId = number;
/**
 * Numeric identifier of the question.
 */
export type QuestionId = number;
/**
 * Text rendered under the options on frontend.
 */
export type QuestionOptionRecommendation = string | null;
/**
 * Indicates if the question is auto evaluated.
 */
export type QuestionItemAutoEvaluation = boolean;
export type QuestionItemEvaluationBlock = {
    correctAnswer: QuestionItemCorrectAnswer;
    autoEvaluation: QuestionItemAutoEvaluation;
    recommendation: QuestionOptionRecommendation;
};
/**
 * JSON-serialized markdown question content rendered in LMS.
 */
export type QuestionItemContent = string;
/**
 * Score (max possible) for answering the question correctly.
 */
export type QuestionItemScore = number;
/**
 * Numeric identifier of the question option.
 */
export type QuestionOptionId = number;
/**
 * Indicates if the option is the correct answer.
 */
export type QuestionOptionIsCorrect = boolean;
/**
 * Option is a possible answer that can be chosen.
 */
export type QuestionItemOption = {
    id: QuestionOptionId;
    /**
     * The option value rendered on frontend.
     */
    value: string;
    order: ListingOrder;
    isCorrect: QuestionOptionIsCorrect;
    recommendation: QuestionOptionRecommendation;
};
export type QuestionItemOptions = Array<QuestionItemOption>;
/**
 * Shows correct string input answers.
 */
export type QuestionItemCorrectAnswerInputStringCorrectAnswer = {
    type: 'inputStringCorrectAnswer';
    variants: Array<string>;
};
/**
 * Shows correct number input answers.
 */
export type QuestionItemCorrectAnswerInputNumberCorrectAnswer = {
    type: 'inputNumberCorrectAnswer';
    variants: Array<number>;
    /**
     * Indicates if precision hint should be shown on frontend.
     */
    showPrecisionHint: boolean;
    autoEvaluationPrecision?: string | null;
    precision: number | null;
};
export type QuestionItemCorrectAnswer = ({
    type: 'inputStringCorrectAnswer';
} & QuestionItemCorrectAnswerInputStringCorrectAnswer) | ({
    type: 'inputNumberCorrectAnswer';
} & QuestionItemCorrectAnswerInputNumberCorrectAnswer) | null;
/**
 * Indicates if options need to be shuffled on frontend.
 */
export type QuestionitemAreOptionsShuffled = boolean;
/**
 * Question that needs input as answer.
 */
export type LongreadExerciseInputQuestionItem = {
    type: 'input';
    id: QuestionId;
    order: ListingOrder;
    content: QuestionItemContent;
    score: QuestionItemScore;
    attachments: Array<LongreadMaterialAttachmentItem>;
    correctAnswer: QuestionItemCorrectAnswer;
    autoEvaluation: QuestionItemAutoEvaluation;
    recommendation: QuestionOptionRecommendation;
    input: QuestionItemEvaluationBlock;
};
/**
 * Question that requires the right choice as answer.
 */
export type LongreadExerciseSingleChoiceQuestionitem = {
    type: 'singleChoice';
    id: QuestionId;
    order: ListingOrder;
    content: QuestionItemContent;
    score: QuestionItemScore;
    attachments: Array<LongreadMaterialAttachmentItem>;
    options: QuestionItemOptions;
    areOptionsShuffled: QuestionitemAreOptionsShuffled;
    singleChoice: {
        options: QuestionItemOptions;
    };
};
/**
 * Question that requires chosing multiple options as answer.
 */
export type LongreadExerciseMultipleChoiceQuestionItem = {
    type: 'multipleChoice';
    id: QuestionId;
    order: ListingOrder;
    content: QuestionItemContent;
    score: QuestionItemScore;
    attachments: Array<LongreadMaterialAttachmentItem>;
    options: QuestionItemOptions;
    areOptionsShuffled: QuestionitemAreOptionsShuffled;
    multipleChoice: {
        options: QuestionItemOptions;
    };
};
export type LongreadExerciseQuestionItem = ({
    type: 'input';
} & LongreadExerciseInputQuestionItem) | ({
    type: 'singleChoice';
} & LongreadExerciseSingleChoiceQuestionitem) | ({
    type: 'multipleChoice';
} & LongreadExerciseMultipleChoiceQuestionItem);
/**
 * Video identifier in UUID format.
 */
export type VideoId = string;
/**
 * Video state.
 */
export type VideoPlatformState = 'unspecified' | 'empty' | 'uploaded' | 'transcoding' | 'viewable' | 'ready' | 'partiallyReady' | 'error';
/**
 * Reviewers assigned to this exercise task.
 */
export type LongreadExerciseMaterialReviewers = Array<UserId>;
/**
 * Assignees linked to this exercise task.
 */
export type LongreadExerciseMaterialAssignees = Array<UserId>;
export type LongreadExerciseMaterialIsTrackingStudents = boolean;
/**
 * Indicates if questions need to be shuffled on frontend.
 */
export type AreQuestionsShuffled = boolean;
export type LongreadMarkdownMaterialItem = {
    discriminator: LongreadMaterialDiscriminator;
    state: PublicationState;
    viewType: LongreadMaterialViewType;
    type: LongreadMaterialType;
    id: LongreadMaterialId;
    order: ListingOrder;
    viewContent: LongreadMaterialViewContent;
    publishDate: PublishDate;
    publishedAt: PublishedAt;
};
export type LongreadFileMaterialItem = {
    discriminator: LongreadMaterialDiscriminator;
    state: PublicationState;
    viewType: LongreadMaterialViewType;
    type: LongreadMaterialType;
    id: LongreadMaterialId;
    order: ListingOrder;
    mediaType: FileMediaType;
    filename: FileNameObjectPath;
    version: LongreadMaterialVersion;
    length: LongreadMaterialLength;
    publishDate: PublishDate;
    publishedAt: PublishedAt;
    content: LongreadMaterialContent;
};
export type LongreadExerciseCodingMaterialItem = {
    discriminator: LongreadMaterialDiscriminator;
    state: PublicationState;
    viewType: LongreadMaterialViewType;
    type: LongreadMaterialType;
    id: LongreadMaterialId;
    order: ListingOrder;
    name: ExerciseName;
    viewContent: LongreadMaterialViewContent;
    estimation: LongreadMaterialEstimation;
    reviewers: LongreadExerciseMaterialReviewers;
    assignees: LongreadExerciseMaterialAssignees;
    attachments: Array<LongreadMaterialAttachmentItem>;
    backloggedAt: BackloggedAt;
    taskId: TaskId;
    isTrackingStudents: LongreadExerciseMaterialIsTrackingStudents;
    exerciseUrl: ExerciseUrl;
    coding: LongreadMaterialCoding;
};
export type LongreadImageMaterialItem = {
    discriminator: LongreadMaterialDiscriminator;
    state: PublicationState;
    viewType: LongreadMaterialViewType;
    type: LongreadMaterialType;
    id: LongreadMaterialId;
    order: ListingOrder;
    /**
     * Image scale.
     */
    imageScale: number | null;
    mediaType: FileMediaType;
    filename: FileNameObjectPath;
    version: LongreadMaterialVersion;
    length: LongreadMaterialLength;
    publishDate: PublishDate;
    publishedAt: PublishedAt;
    content: LongreadMaterialContent;
};
export type LongreadExerciseQuestionsMaterialItem = {
    discriminator: LongreadMaterialDiscriminator;
    state: PublicationState;
    viewType: LongreadMaterialViewType;
    type: LongreadMaterialType;
    id: LongreadMaterialId;
    order: ListingOrder;
    name: ExerciseName;
    viewContent: LongreadMaterialViewContent;
    estimation: LongreadMaterialEstimation;
    reviewers: LongreadExerciseMaterialReviewers;
    assignees: LongreadExerciseMaterialAssignees;
    attachments: Array<LongreadMaterialAttachmentItem>;
    backloggedAt: BackloggedAt;
    taskId: TaskId;
    isTrackingStudents: LongreadExerciseMaterialIsTrackingStudents;
    mode: LongreadExerciseQuestionsMode;
    areQuestionsShuffled: AreQuestionsShuffled;
    settings: ExerciseQuestionsSettings;
    quizId: QuizId;
    questions: Array<LongreadExerciseQuestionItem>;
};
export type LongreadVideoPlatformMaterialItem = {
    discriminator: LongreadMaterialDiscriminator;
    state: PublicationState;
    viewType: LongreadMaterialViewType;
    type: LongreadMaterialType;
    id: LongreadMaterialId;
    order: ListingOrder;
    /**
     * Embedded video title.
     */
    name: string;
    /**
     * Embedded video description.
     */
    description: string;
    videoId: VideoId;
    timecodes: XRePropertyIncompleteOnlyEmptyArrayObserved;
    publishDate: PublishDate;
    videoState: VideoPlatformState;
    url: string;
};
export type LongreadVideoMaterialItem = {
    discriminator: LongreadMaterialDiscriminator;
    state: PublicationState;
    viewType: LongreadMaterialViewType;
    type: LongreadMaterialType;
    id: LongreadMaterialId;
    order: ListingOrder;
    mediaType: FileMediaType;
    filename: FileNameObjectPath;
    version: LongreadMaterialVersion;
    length: LongreadMaterialLength;
    publishDate: PublishDate;
    publishedAt: PublishedAt;
    content: LongreadMaterialContent;
};
export type LongreadAudioMaterialItem = {
    discriminator: LongreadMaterialDiscriminator;
    state: PublicationState;
    viewType: LongreadMaterialViewType;
    type: LongreadMaterialType;
    id: LongreadMaterialId;
    order: ListingOrder;
    mediaType: FileMediaType;
    filename: FileNameObjectPath;
    version: LongreadMaterialVersion;
    length: LongreadMaterialLength;
    publishDate: PublishDate;
    publishedAt: PublishedAt;
    content: LongreadMaterialContent;
};
export type LongreadMaterialItem = ({
    discriminator: 'markdown';
} & LongreadMarkdownMaterialItem) | ({
    discriminator: 'file';
} & LongreadFileMaterialItem) | ({
    discriminator: 'coding';
} & LongreadExerciseCodingMaterialItem) | ({
    discriminator: 'image';
} & LongreadImageMaterialItem) | ({
    discriminator: 'questions';
} & LongreadExerciseQuestionsMaterialItem) | ({
    discriminator: 'videoPlatform';
} & LongreadVideoPlatformMaterialItem) | ({
    discriminator: 'video';
} & LongreadVideoMaterialItem) | ({
    discriminator: 'audio';
} & LongreadAudioMaterialItem);
export type LongreadMaterialsByIdResponse = {
    items: Array<LongreadMaterialItem>;
    paging: Paging;
};
/**
 * Task type.
 */
export type TaskType = 'coding' | 'questions';
/**
 * Task state.
 */
export type TaskState = 'backlog' | 'inProgress' | 'submitted' | 'review' | 'evaluated' | 'failed';
/**
 * Task score, if it was evaluated.
 */
export type TaskScore = number | null;
/**
 * Task score translated to the course skill level.
 */
export type TaskScoreSkillLevel = 'none' | 'basic' | 'intermediate' | 'advanced';
/**
 * Extra score for task, if not null.
 */
export type TaskExtraScore = number | null;
/**
 * Task creation in LMS timestamp.
 */
export type CreatedAt = string;
/**
 * Task start timestamp.
 */
export type StartedAt = string | null;
/**
 * Task submit timestamp.
 */
export type SubmitAt = string | null;
/**
 * Task rejection timestamp.
 */
export type RejectAt = string | null;
/**
 * Task evaluation by system timestamp.
 */
export type EvaluateAt = string | null;
/**
 * How many late days already been spent on task, if any.
 */
export type TaskLateDays = number | null;
/**
 * JSON-serialized markdown content of task rendered in LMS.
 */
export type TaskExerciseViewContent = string | null;
export type TaskExerciseActivity = {
    id: ActivityId;
    name: ActivityName;
    weight: ActivityWeight;
    isLateDaysEnabled: ActivityIsLateDaysEnabled;
};
export type TaskAttachment = {
    name: FileAttachmentName;
    filename: FileNameObjectPath;
    mediaType: FileMediaType;
    length: LongreadMaterialLength;
    version: LongreadMaterialVersion;
};
export type TaskExerciseQuestionOrders = Array<TaskExerciseQuestionOrder> | null;
export type TaskExerciseQuestionOrder = {
    questionId: QuestionId;
    order: ListingOrder;
    optionOrders: Array<TaskExerciseQuestionOrderOptionOrder>;
};
export type TaskExerciseQuestionOrderOptionOrder = {
    optionId: QuestionOptionId;
    order: ListingOrder;
};
export type TaskExercise = {
    id: ExerciseId;
    name: ExerciseName;
    type: TaskType;
    maxScore: MaxScore;
    startDate: StartDate;
    deadline: Deadline;
    timer: XRePropertyIncompleteOnlyNullObserved;
    activity: TaskExerciseActivity;
    questionOrders: TaskExerciseQuestionOrders;
    areQuestionsShuffled: AreQuestionsShuffled | null;
    quizId: QuizId | null;
    mode: XRePropertyIncompleteOnlyNullObserved;
    viewContent: TaskExerciseViewContent;
    exerciseUrl: ExerciseUrl;
    attachments: Array<TaskAttachment> | null;
    settings: ExerciseQuestionsSettings | null;
};
export type TaskCourse = {
    id: CourseId;
    name: CourseName;
    isArchived: CourseIsArchived;
};
export type TaskCourseTheme = {
    id: CourseThemeId;
    name: CourseThemeName;
};
export type TaskLongread = {
    id: LongreadId;
    name: LongreadName;
};
export type TaskReviewer = {
    id: UserId;
    /**
     * Reviewer's full name.
     */
    name: string;
    identityEmail: UniversityEmail;
    email: UniversityEmail;
    identityIdentifier: UserId;
    timeAccount: TimeAccount;
    lastName: string;
    firstName: string;
    middleName: string | null;
} | null;
export type TaskSolutionAnswersQuestionInputAnswerValue = XRePropertyIncompleteOnlyNullObserved;
/**
 * Recommendation text in HTML shown under input box on frontend.
 *
 */
export type TaskSolutionAnswersQuestionInputAnswerRecommendation = string;
/**
 * Object representing information about answer string values expected as valid by task authors. Object is null if task authors decide not to show answers after task evaluation.
 *
 */
export type TaskSolutionAnswersQuestionInputAnswer = {
    values: Array<string>;
    value: TaskSolutionAnswersQuestionInputAnswerValue;
    recommendation: TaskSolutionAnswersQuestionInputAnswerRecommendation;
} | null;
/**
 * Object representing information about answer number values expected as valid by task authors. Object is null if task authors decide not to show answers after task evaluation.
 *
 */
export type TaskSolutionAnswersQuestionInputNumberAnswer = {
    values: Array<number>;
    value: TaskSolutionAnswersQuestionInputAnswerValue;
    recommendation: TaskSolutionAnswersQuestionInputAnswerRecommendation;
} | null;
export type TaskSolutionAnswersQuestionOptionsItem = {
    id: QuestionOptionId;
    isCorrect: QuestionOptionIsCorrect;
    recommendation: QuestionOptionRecommendation;
};
export type TaskSolutionAnswersQuestionOptionsQuestionItem = {
    id: QuestionId;
    type: 'singleChoice' | 'multipleChoice';
    answer: NullOnly;
    options: Array<TaskSolutionAnswersQuestionOptionsItem>;
};
export type TaskSolutionAnswersQuestionInputQuestionItem = {
    id: QuestionId;
    type: 'input';
    answer: TaskSolutionAnswersQuestionInputAnswer;
    options: NullOnly;
};
export type TaskSolutionAnswersQuestionInputNumberQuestionItem = {
    id: QuestionId;
    type: 'inputNumber';
    answer: TaskSolutionAnswersQuestionInputNumberAnswer;
    options: NullOnly;
};
export type TaskSolutionAnswersQuestion = ({
    type: 'singleChoice' | 'multipleChoice';
} & TaskSolutionAnswersQuestionOptionsQuestionItem) | ({
    type: 'input';
} & TaskSolutionAnswersQuestionInputQuestionItem) | ({
    type: 'inputNumber';
} & TaskSolutionAnswersQuestionInputNumberQuestionItem);
export type TaskSolutionAnswersItem = {
    /**
     * Answer given by student.
     */
    answer: string | number;
    question: TaskSolutionAnswersQuestion;
};
export type TaskSolution = {
    type: TaskType;
    /**
     * URL for solution, if value is not null.
     */
    solutionUrl: string | null;
    answers: Array<TaskSolutionAnswersItem> | null;
    attachments: Array<TaskAttachment> | null;
} | null;
export type TaskScoresItem = {
    questionId: QuestionId;
    score: TaskScore;
};
export type TaskScores = Array<TaskScoresItem> | null;
/**
 * Quiz session ID, null if task type is not "questions".
 */
export type QuizSessionId = TaskId | null;
/**
 * Numeric identifier of the "questions" task attempt.
 */
export type AttemptId = number;
/**
 * Evaluated attempt ID, null if task type is not "questions".
 */
export type TaskEvaluatedAttemptId = AttemptId | null;
/**
 * Identifier of the current attempt ID, null if task type is not "questions" and value is not set.
 *
 */
export type TaskCurrentAttemptId = AttemptId | null;
/**
 * Last attempt ID, null if task type is not "questions".
 */
export type TaskLastAttemptId = AttemptId | null;
export type TaskByIdResponse = {
    id: TaskId;
    type: TaskType;
    state: TaskState;
    score: TaskScore;
    scoreSkillLevel: TaskScoreSkillLevel | null;
    isSkillLevelEnabled: CourseIsSkillLevelEnabled;
    isLateDaysEnabled: ActivityIsLateDaysEnabled;
    extraScore: TaskExtraScore;
    createdAt: CreatedAt;
    startedAt: StartedAt;
    submitAt: SubmitAt;
    rejectAt: RejectAt;
    evaluateAt: EvaluateAt;
    deadline: Deadline;
    lateDays: TaskLateDays;
    exercise: TaskExercise;
    course: TaskCourse;
    theme: TaskCourseTheme;
    longread: TaskLongread;
    student: CurrentStudentResponse;
    reviewer: TaskReviewer;
    solution: TaskSolution;
    scores: TaskScores;
    quizSessionId: QuizSessionId;
    evaluatedAttemptId: TaskEvaluatedAttemptId;
    currentAttemptId: TaskCurrentAttemptId;
    lastAttemptId: TaskLastAttemptId;
};
/**
 * S3-compatible temporary presigned URL for file object to download.
 *
 */
export type ObjectStorageUrl = string;
export type GenerateContentDownloadLinkResponse = {
    url: ObjectStorageUrl;
};
/**
 * Maximum number of items to return.
 */
export type LimitQuery = number;
/**
 * Number of items to skip before collecting result items.
 */
export type OffsetQuery = number;
/**
 * Include only courses whose state matches any of the specified values.
 *
 */
export type PublicationStateFilterQuery = Array<PublicationState>;
/**
 * File object path in storage specified in URL query.
 */
export type FileNameQuery = FileNameObjectPath;
/**
 * Material content revision identifier specified in URL query.
 */
export type VersionQuery = LongreadMaterialVersion;
/**
 * Numeric identifier of the course specified in URL path.
 */
export type CourseIdPath = CourseId;
/**
 * Numeric identifier of the course theme specified in URL path.
 */
export type ThemeIdPath = CourseThemeId;
/**
 * Numeric identifier of the longread item specified in URL path.
 *
 */
export type LongreadIdPath = LongreadId;
/**
 * Numeric identifier of the task item specified in URL path.
 */
export type TaskIdPath = TaskId;
export type CurrentStudentData = {
    body?: never;
    path?: never;
    query?: never;
    url: '/micro-lms/students/me';
};
export type CurrentStudentErrors = {
    /**
     * HTTP 401 - Unauthorized error. Returned when the required BffCookie is missing, invalid, or expired.
     *
     */
    401: BaseUnauthorizedError;
    /**
     * Default catch-all error object, untyped.
     */
    default: BaseProblemError;
};
export type CurrentStudentError = CurrentStudentErrors[keyof CurrentStudentErrors];
export type CurrentStudentResponses = {
    /**
     * Successful response with the authenticated student data.
     */
    200: CurrentStudentResponse;
};
export type CurrentStudentResponse2 = CurrentStudentResponses[keyof CurrentStudentResponses];
export type ListStudentCoursesData = {
    body?: never;
    path?: never;
    query?: {
        /**
         * Maximum number of items to return.
         */
        limit?: number;
        /**
         * Number of items to skip before collecting result items.
         */
        offset?: number;
        /**
         * Include only courses whose state matches any of the specified values.
         *
         */
        state?: Array<PublicationState>;
    };
    url: '/micro-lms/courses/student';
};
export type ListStudentCoursesErrors = {
    /**
     * HTTP 401 - Unauthorized error. Returned when the required BffCookie is missing, invalid, or expired.
     *
     */
    401: BaseUnauthorizedError;
    /**
     * Default catch-all error object, untyped.
     */
    default: BaseProblemError;
};
export type ListStudentCoursesError = ListStudentCoursesErrors[keyof ListStudentCoursesErrors];
export type ListStudentCoursesResponses = {
    /**
     * Successful response with a list of courses summary for the authenticated student.
     *
     */
    200: ListStudentCoursesResponse;
};
export type ListStudentCoursesResponse2 = ListStudentCoursesResponses[keyof ListStudentCoursesResponses];
export type CourseSummaryByIdData = {
    body?: never;
    path: {
        /**
         * Numeric identifier of the course specified in URL path.
         */
        courseId: CourseId;
    };
    query?: never;
    url: '/micro-lms/courses/{courseId}';
};
export type CourseSummaryByIdErrors = {
    /**
     * HTTP 400 - Bad Request error. Returned when request is invalid.
     *
     */
    400: BaseBadRequestError;
    /**
     * HTTP 401 - Unauthorized error. Returned when the required BffCookie is missing, invalid, or expired.
     *
     */
    401: BaseUnauthorizedError;
    /**
     * HTTP 404 - Not Found error. Returned when entity was not found by its ID.
     *
     */
    404: BaseNotFoundError;
    /**
     * Default catch-all error object, untyped.
     */
    default: BaseProblemError;
};
export type CourseSummaryByIdError = CourseSummaryByIdErrors[keyof CourseSummaryByIdErrors];
export type CourseSummaryByIdResponses = {
    /**
     * Successful response with course summary by its ID.
     */
    200: CourseSummaryByIdResponse;
};
export type CourseSummaryByIdResponse2 = CourseSummaryByIdResponses[keyof CourseSummaryByIdResponses];
export type CourseOverviewByIdData = {
    body?: never;
    path: {
        /**
         * Numeric identifier of the course specified in URL path.
         */
        courseId: CourseId;
    };
    query?: never;
    url: '/micro-lms/courses/{courseId}/overview';
};
export type CourseOverviewByIdErrors = {
    /**
     * HTTP 400 - Bad Request error. Returned when request is invalid.
     *
     */
    400: BaseBadRequestError;
    /**
     * HTTP 401 - Unauthorized error. Returned when the required BffCookie is missing, invalid, or expired.
     *
     */
    401: BaseUnauthorizedError;
    /**
     * HTTP 404 - Not Found error. Returned when entity was not found by its ID.
     *
     */
    404: BaseNotFoundError;
    /**
     * Default catch-all error object, untyped.
     */
    default: BaseProblemError;
};
export type CourseOverviewByIdError = CourseOverviewByIdErrors[keyof CourseOverviewByIdErrors];
export type CourseOverviewByIdResponses = {
    /**
     * Successful response with course overview by its ID.
     */
    200: CourseOverviewByIdResponse;
};
export type CourseOverviewByIdResponse2 = CourseOverviewByIdResponses[keyof CourseOverviewByIdResponses];
export type CourseThemeSummaryByIdData = {
    body?: never;
    path: {
        /**
         * Numeric identifier of the course theme specified in URL path.
         */
        themeId: CourseThemeId;
    };
    query?: never;
    url: '/micro-lms/themes/{themeId}';
};
export type CourseThemeSummaryByIdErrors = {
    /**
     * HTTP 400 - Bad Request error. Returned when request is invalid.
     *
     */
    400: BaseBadRequestError;
    /**
     * HTTP 401 - Unauthorized error. Returned when the required BffCookie is missing, invalid, or expired.
     *
     */
    401: BaseUnauthorizedError;
    /**
     * HTTP 404 - Not Found error. Returned when entity was not found by its ID.
     *
     */
    404: BaseNotFoundError;
    /**
     * Default catch-all error object, untyped.
     */
    default: BaseProblemError;
};
export type CourseThemeSummaryByIdError = CourseThemeSummaryByIdErrors[keyof CourseThemeSummaryByIdErrors];
export type CourseThemeSummaryByIdResponses = {
    /**
     * Successful response with course theme summary by its ID.
     */
    200: CourseThemeSummaryByIdResponse;
};
export type CourseThemeSummaryByIdResponse2 = CourseThemeSummaryByIdResponses[keyof CourseThemeSummaryByIdResponses];
export type LongreadSummaryByIdData = {
    body?: never;
    path: {
        /**
         * Numeric identifier of the longread item specified in URL path.
         *
         */
        longreadId: LongreadId;
    };
    query?: never;
    url: '/micro-lms/longreads/{longreadId}';
};
export type LongreadSummaryByIdErrors = {
    /**
     * HTTP 400 - Bad Request error. Returned when request is invalid.
     *
     */
    400: BaseBadRequestError;
    /**
     * HTTP 401 - Unauthorized error. Returned when the required BffCookie is missing, invalid, or expired.
     *
     */
    401: BaseUnauthorizedError;
    /**
     * HTTP 404 - Not Found error. Returned when entity was not found by its ID.
     *
     */
    404: BaseNotFoundError;
    /**
     * Default catch-all error object, untyped.
     */
    default: BaseProblemError;
};
export type LongreadSummaryByIdError = LongreadSummaryByIdErrors[keyof LongreadSummaryByIdErrors];
export type LongreadSummaryByIdResponses = {
    /**
     * Successful response with longread item summary by its ID.
     *
     */
    200: LongreadSummaryByIdResponse;
};
export type LongreadSummaryByIdResponse2 = LongreadSummaryByIdResponses[keyof LongreadSummaryByIdResponses];
export type LongreadMaterialsByIdData = {
    body?: never;
    path: {
        /**
         * Numeric identifier of the longread item specified in URL path.
         *
         */
        longreadId: LongreadId;
    };
    query?: {
        /**
         * Maximum number of items to return.
         */
        limit?: number;
        /**
         * Number of items to skip before collecting result items.
         */
        offset?: number;
    };
    url: '/micro-lms/longreads/{longreadId}/materials';
};
export type LongreadMaterialsByIdErrors = {
    /**
     * HTTP 400 - Bad Request error. Returned when request is invalid.
     *
     */
    400: BaseBadRequestError;
    /**
     * HTTP 401 - Unauthorized error. Returned when the required BffCookie is missing, invalid, or expired.
     *
     */
    401: BaseUnauthorizedError;
    /**
     * HTTP 404 - Not Found error. Returned when entity was not found by its ID.
     *
     */
    404: BaseNotFoundError;
    /**
     * Default catch-all error object, untyped.
     */
    default: BaseProblemError;
};
export type LongreadMaterialsByIdError = LongreadMaterialsByIdErrors[keyof LongreadMaterialsByIdErrors];
export type LongreadMaterialsByIdResponses = {
    /**
     * Successful response with longread materials by its ID.
     */
    200: LongreadMaterialsByIdResponse;
};
export type LongreadMaterialsByIdResponse2 = LongreadMaterialsByIdResponses[keyof LongreadMaterialsByIdResponses];
export type TaskByIdData = {
    body?: never;
    path: {
        /**
         * Numeric identifier of the task item specified in URL path.
         */
        taskId: TaskId;
    };
    query?: never;
    url: '/micro-lms/tasks/{taskId}';
};
export type TaskByIdErrors = {
    /**
     * HTTP 401 - Unauthorized error. Returned when the required BffCookie is missing, invalid, or expired.
     *
     */
    401: BaseUnauthorizedError;
    /**
     * HTTP 404 - Not Found error. Returned when entity was not found by its ID.
     *
     */
    404: BaseNotFoundError;
    /**
     * Default catch-all error object, untyped.
     */
    default: BaseProblemError;
};
export type TaskByIdError = TaskByIdErrors[keyof TaskByIdErrors];
export type TaskByIdResponses = {
    /**
     * Successful response with task by its ID.
     */
    200: TaskByIdResponse;
};
export type TaskByIdResponse2 = TaskByIdResponses[keyof TaskByIdResponses];
export type GenerateContentDownloadLinkData = {
    body?: never;
    path?: never;
    query: {
        /**
         * File object path in storage specified in URL query.
         */
        filename: FileNameObjectPath;
        /**
         * Material content revision identifier specified in URL query.
         */
        version?: LongreadMaterialVersion;
    };
    url: '/micro-lms/content/download-link';
};
export type GenerateContentDownloadLinkErrors = {
    /**
     * HTTP 400 - Bad Request error. Returned when request is invalid.
     *
     */
    400: BaseBadRequestError;
    /**
     * HTTP 401 - Unauthorized error. Returned when the required BffCookie is missing, invalid, or expired.
     *
     */
    401: BaseUnauthorizedError;
    /**
     * HTTP 403 - Forbidden error. Returned when the resource is forbidden.
     *
     */
    403: BaseForbiddenError;
    /**
     * Default catch-all error object, untyped.
     */
    default: BaseProblemError;
};
export type GenerateContentDownloadLinkError = GenerateContentDownloadLinkErrors[keyof GenerateContentDownloadLinkErrors];
export type GenerateContentDownloadLinkResponses = {
    /**
     * Successful response generated content download link.
     */
    200: GenerateContentDownloadLinkResponse;
};
export type GenerateContentDownloadLinkResponse2 = GenerateContentDownloadLinkResponses[keyof GenerateContentDownloadLinkResponses];
//# sourceMappingURL=types.gen.d.ts.map