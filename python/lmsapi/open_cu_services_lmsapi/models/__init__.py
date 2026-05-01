"""Contains all the data models used in inputs/outputs"""

from .activity_definition import ActivityDefinition
from .base_bad_request_error import BaseBadRequestError
from .base_bad_request_error_errors import BaseBadRequestErrorErrors
from .base_forbidden_error import BaseForbiddenError
from .base_not_found_error import BaseNotFoundError
from .base_problem_error import BaseProblemError
from .base_unauthorized_error import BaseUnauthorizedError
from .course_category import CourseCategory
from .course_category_cover import CourseCategoryCover
from .course_overview_by_id_response import CourseOverviewByIdResponse
from .course_settings import CourseSettings
from .course_skill_level import CourseSkillLevel
from .course_summary_item import CourseSummaryItem
from .course_theme_item import CourseThemeItem
from .course_theme_summary_by_id_response import CourseThemeSummaryByIdResponse
from .current_student_response import CurrentStudentResponse
from .exercise_item import ExerciseItem
from .exercise_questions_settings import ExerciseQuestionsSettings
from .file_media_type import FileMediaType
from .generate_content_download_link_response import GenerateContentDownloadLinkResponse
from .list_student_courses_response import ListStudentCoursesResponse
from .longread_audio_material_item import LongreadAudioMaterialItem
from .longread_exercise_coding_material_item import LongreadExerciseCodingMaterialItem
from .longread_exercise_input_question_item import LongreadExerciseInputQuestionItem
from .longread_exercise_input_question_item_type import LongreadExerciseInputQuestionItemType
from .longread_exercise_multiple_choice_question_item import LongreadExerciseMultipleChoiceQuestionItem
from .longread_exercise_multiple_choice_question_item_multiple_choice import (
    LongreadExerciseMultipleChoiceQuestionItemMultipleChoice,
)
from .longread_exercise_multiple_choice_question_item_type import LongreadExerciseMultipleChoiceQuestionItemType
from .longread_exercise_questions_material_item import LongreadExerciseQuestionsMaterialItem
from .longread_exercise_questions_mode import LongreadExerciseQuestionsMode
from .longread_exercise_single_choice_questionitem import LongreadExerciseSingleChoiceQuestionitem
from .longread_exercise_single_choice_questionitem_single_choice import (
    LongreadExerciseSingleChoiceQuestionitemSingleChoice,
)
from .longread_exercise_single_choice_questionitem_type import LongreadExerciseSingleChoiceQuestionitemType
from .longread_file_material_item import LongreadFileMaterialItem
from .longread_image_material_item import LongreadImageMaterialItem
from .longread_item import LongreadItem
from .longread_markdown_material_item import LongreadMarkdownMaterialItem
from .longread_material_activity import LongreadMaterialActivity
from .longread_material_attachment_item import LongreadMaterialAttachmentItem
from .longread_material_coding import LongreadMaterialCoding
from .longread_material_content import LongreadMaterialContent
from .longread_material_discriminator import LongreadMaterialDiscriminator
from .longread_material_estimation import LongreadMaterialEstimation
from .longread_material_media_type_upper import LongreadMaterialMediaTypeUpper
from .longread_material_type import LongreadMaterialType
from .longread_material_view_type import LongreadMaterialViewType
from .longread_materials_by_id_response import LongreadMaterialsByIdResponse
from .longread_summary_by_id_response import LongreadSummaryByIdResponse
from .longread_type import LongreadType
from .longread_video_material_item import LongreadVideoMaterialItem
from .longread_video_platform_material_item import LongreadVideoPlatformMaterialItem
from .paging import Paging
from .publication_state import PublicationState
from .question_item_correct_answer_input_number_correct_answer import QuestionItemCorrectAnswerInputNumberCorrectAnswer
from .question_item_correct_answer_input_number_correct_answer_type import (
    QuestionItemCorrectAnswerInputNumberCorrectAnswerType,
)
from .question_item_correct_answer_input_string_correct_answer import QuestionItemCorrectAnswerInputStringCorrectAnswer
from .question_item_correct_answer_input_string_correct_answer_type import (
    QuestionItemCorrectAnswerInputStringCorrectAnswerType,
)
from .question_item_evaluation_block import QuestionItemEvaluationBlock
from .question_item_option import QuestionItemOption
from .questions_settings_eval_strategy import QuestionsSettingsEvalStrategy
from .study_level import StudyLevel
from .task_attachment import TaskAttachment
from .task_by_id_response import TaskByIdResponse
from .task_course import TaskCourse
from .task_course_theme import TaskCourseTheme
from .task_exercise import TaskExercise
from .task_exercise_activity import TaskExerciseActivity
from .task_exercise_question_order import TaskExerciseQuestionOrder
from .task_exercise_question_order_option_order import TaskExerciseQuestionOrderOptionOrder
from .task_longread import TaskLongread
from .task_reviewer_type_0 import TaskReviewerType0
from .task_score_skill_level import TaskScoreSkillLevel
from .task_scores_item import TaskScoresItem
from .task_solution_answers_item import TaskSolutionAnswersItem
from .task_solution_answers_question_input_answer_type_0 import TaskSolutionAnswersQuestionInputAnswerType0
from .task_solution_answers_question_input_number_answer_type_0 import TaskSolutionAnswersQuestionInputNumberAnswerType0
from .task_solution_answers_question_input_number_question_item import (
    TaskSolutionAnswersQuestionInputNumberQuestionItem,
)
from .task_solution_answers_question_input_number_question_item_type import (
    TaskSolutionAnswersQuestionInputNumberQuestionItemType,
)
from .task_solution_answers_question_input_question_item import TaskSolutionAnswersQuestionInputQuestionItem
from .task_solution_answers_question_input_question_item_type import TaskSolutionAnswersQuestionInputQuestionItemType
from .task_solution_answers_question_options_item import TaskSolutionAnswersQuestionOptionsItem
from .task_solution_answers_question_options_question_item import TaskSolutionAnswersQuestionOptionsQuestionItem
from .task_solution_answers_question_options_question_item_type import (
    TaskSolutionAnswersQuestionOptionsQuestionItemType,
)
from .task_solution_type_0 import TaskSolutionType0
from .task_state import TaskState
from .task_type import TaskType
from .video_platform_state import VideoPlatformState
from .x_re_property_incomplete_only_empty_array_observed_item import XRePropertyIncompleteOnlyEmptyArrayObservedItem

__all__ = (
    "ActivityDefinition",
    "BaseBadRequestError",
    "BaseBadRequestErrorErrors",
    "BaseForbiddenError",
    "BaseNotFoundError",
    "BaseProblemError",
    "BaseUnauthorizedError",
    "CourseCategory",
    "CourseCategoryCover",
    "CourseOverviewByIdResponse",
    "CourseSettings",
    "CourseSkillLevel",
    "CourseSummaryItem",
    "CourseThemeItem",
    "CourseThemeSummaryByIdResponse",
    "CurrentStudentResponse",
    "ExerciseItem",
    "ExerciseQuestionsSettings",
    "FileMediaType",
    "GenerateContentDownloadLinkResponse",
    "ListStudentCoursesResponse",
    "LongreadAudioMaterialItem",
    "LongreadExerciseCodingMaterialItem",
    "LongreadExerciseInputQuestionItem",
    "LongreadExerciseInputQuestionItemType",
    "LongreadExerciseMultipleChoiceQuestionItem",
    "LongreadExerciseMultipleChoiceQuestionItemMultipleChoice",
    "LongreadExerciseMultipleChoiceQuestionItemType",
    "LongreadExerciseQuestionsMaterialItem",
    "LongreadExerciseQuestionsMode",
    "LongreadExerciseSingleChoiceQuestionitem",
    "LongreadExerciseSingleChoiceQuestionitemSingleChoice",
    "LongreadExerciseSingleChoiceQuestionitemType",
    "LongreadFileMaterialItem",
    "LongreadImageMaterialItem",
    "LongreadItem",
    "LongreadMarkdownMaterialItem",
    "LongreadMaterialActivity",
    "LongreadMaterialAttachmentItem",
    "LongreadMaterialCoding",
    "LongreadMaterialContent",
    "LongreadMaterialDiscriminator",
    "LongreadMaterialEstimation",
    "LongreadMaterialMediaTypeUpper",
    "LongreadMaterialsByIdResponse",
    "LongreadMaterialType",
    "LongreadMaterialViewType",
    "LongreadSummaryByIdResponse",
    "LongreadType",
    "LongreadVideoMaterialItem",
    "LongreadVideoPlatformMaterialItem",
    "Paging",
    "PublicationState",
    "QuestionItemCorrectAnswerInputNumberCorrectAnswer",
    "QuestionItemCorrectAnswerInputNumberCorrectAnswerType",
    "QuestionItemCorrectAnswerInputStringCorrectAnswer",
    "QuestionItemCorrectAnswerInputStringCorrectAnswerType",
    "QuestionItemEvaluationBlock",
    "QuestionItemOption",
    "QuestionsSettingsEvalStrategy",
    "StudyLevel",
    "TaskAttachment",
    "TaskByIdResponse",
    "TaskCourse",
    "TaskCourseTheme",
    "TaskExercise",
    "TaskExerciseActivity",
    "TaskExerciseQuestionOrder",
    "TaskExerciseQuestionOrderOptionOrder",
    "TaskLongread",
    "TaskReviewerType0",
    "TaskScoresItem",
    "TaskScoreSkillLevel",
    "TaskSolutionAnswersItem",
    "TaskSolutionAnswersQuestionInputAnswerType0",
    "TaskSolutionAnswersQuestionInputNumberAnswerType0",
    "TaskSolutionAnswersQuestionInputNumberQuestionItem",
    "TaskSolutionAnswersQuestionInputNumberQuestionItemType",
    "TaskSolutionAnswersQuestionInputQuestionItem",
    "TaskSolutionAnswersQuestionInputQuestionItemType",
    "TaskSolutionAnswersQuestionOptionsItem",
    "TaskSolutionAnswersQuestionOptionsQuestionItem",
    "TaskSolutionAnswersQuestionOptionsQuestionItemType",
    "TaskSolutionType0",
    "TaskState",
    "TaskType",
    "VideoPlatformState",
    "XRePropertyIncompleteOnlyEmptyArrayObservedItem",
)
