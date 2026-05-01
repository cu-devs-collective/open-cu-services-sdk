from __future__ import annotations

import datetime
from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar, cast

from attrs import define as _attrs_define
from dateutil.parser import isoparse

from ..models.task_score_skill_level import TaskScoreSkillLevel
from ..models.task_state import TaskState
from ..models.task_type import TaskType

if TYPE_CHECKING:
    from ..models.current_student_response import CurrentStudentResponse
    from ..models.task_course import TaskCourse
    from ..models.task_course_theme import TaskCourseTheme
    from ..models.task_exercise import TaskExercise
    from ..models.task_longread import TaskLongread
    from ..models.task_reviewer_type_0 import TaskReviewerType0
    from ..models.task_scores_item import TaskScoresItem
    from ..models.task_solution_type_0 import TaskSolutionType0


T = TypeVar("T", bound="TaskByIdResponse")


@_attrs_define
class TaskByIdResponse:
    """
    Attributes:
        id (int): Numeric identifier of the task. Example: 1468065.
        type_ (TaskType): Task type. Example: coding.
        state (TaskState): Task state. Example: inProgress.
        score (float | None): Task score, if it was evaluated.
        score_skill_level (None | TaskScoreSkillLevel):
        is_skill_level_enabled (bool): Indicates if skill level is enabled for the course.
        is_late_days_enabled (bool): Indicates if late days can be used for this activity. Example: True.
        extra_score (float | None): Extra score for task, if not null. Example: 1.
        created_at (datetime.datetime): Task creation in LMS timestamp.
        started_at (datetime.datetime | None): Task start timestamp.
        submit_at (datetime.datetime | None): Task submit timestamp.
        reject_at (datetime.datetime | None): Task rejection timestamp.
        evaluate_at (datetime.datetime | None): Task evaluation by system timestamp.
        deadline (datetime.datetime): Deadline timestamp by which the item must be completed. Example:
            2026-02-15T19:00:00+00:00.
        late_days (int | None): How many late days already been spent on task, if any. Example: 5.
        exercise (TaskExercise):
        course (TaskCourse):
        theme (TaskCourseTheme):
        longread (TaskLongread):
        student (CurrentStudentResponse):
        reviewer (None | TaskReviewerType0):
        solution (None | TaskSolutionType0):
        scores (list[TaskScoresItem] | None):
        quiz_session_id (int | None): Quiz session ID, null if task type is not "questions".
        evaluated_attempt_id (int | None): Evaluated attempt ID, null if task type is not "questions".
        current_attempt_id (int | None): Identifier of the current attempt ID, null if task type is not "questions" and
            value is not set.
        last_attempt_id (int | None): Last attempt ID, null if task type is not "questions".
    """

    id: int
    type_: TaskType
    state: TaskState
    score: float | None
    score_skill_level: None | TaskScoreSkillLevel
    is_skill_level_enabled: bool
    is_late_days_enabled: bool
    extra_score: float | None
    created_at: datetime.datetime
    started_at: datetime.datetime | None
    submit_at: datetime.datetime | None
    reject_at: datetime.datetime | None
    evaluate_at: datetime.datetime | None
    deadline: datetime.datetime
    late_days: int | None
    exercise: TaskExercise
    course: TaskCourse
    theme: TaskCourseTheme
    longread: TaskLongread
    student: CurrentStudentResponse
    reviewer: None | TaskReviewerType0
    solution: None | TaskSolutionType0
    scores: list[TaskScoresItem] | None
    quiz_session_id: int | None
    evaluated_attempt_id: int | None
    current_attempt_id: int | None
    last_attempt_id: int | None

    def to_dict(self) -> dict[str, Any]:
        from ..models.task_reviewer_type_0 import TaskReviewerType0
        from ..models.task_solution_type_0 import TaskSolutionType0

        id = self.id

        type_ = self.type_.value

        state = self.state.value

        score: float | None
        score = self.score

        score_skill_level: None | str
        if isinstance(self.score_skill_level, TaskScoreSkillLevel):
            score_skill_level = self.score_skill_level.value
        else:
            score_skill_level = self.score_skill_level

        is_skill_level_enabled = self.is_skill_level_enabled

        is_late_days_enabled = self.is_late_days_enabled

        extra_score: float | None
        extra_score = self.extra_score

        created_at = self.created_at.isoformat()

        started_at: None | str
        if isinstance(self.started_at, datetime.datetime):
            started_at = self.started_at.isoformat()
        else:
            started_at = self.started_at

        submit_at: None | str
        if isinstance(self.submit_at, datetime.datetime):
            submit_at = self.submit_at.isoformat()
        else:
            submit_at = self.submit_at

        reject_at: None | str
        if isinstance(self.reject_at, datetime.datetime):
            reject_at = self.reject_at.isoformat()
        else:
            reject_at = self.reject_at

        evaluate_at: None | str
        if isinstance(self.evaluate_at, datetime.datetime):
            evaluate_at = self.evaluate_at.isoformat()
        else:
            evaluate_at = self.evaluate_at

        deadline = self.deadline.isoformat()

        late_days: int | None
        late_days = self.late_days

        exercise = self.exercise.to_dict()

        course = self.course.to_dict()

        theme = self.theme.to_dict()

        longread = self.longread.to_dict()

        student = self.student.to_dict()

        reviewer: dict[str, Any] | None
        if isinstance(self.reviewer, TaskReviewerType0):
            reviewer = self.reviewer.to_dict()
        else:
            reviewer = self.reviewer

        solution: dict[str, Any] | None
        if isinstance(self.solution, TaskSolutionType0):
            solution = self.solution.to_dict()
        else:
            solution = self.solution

        scores: list[dict[str, Any]] | None
        if isinstance(self.scores, list):
            scores = []
            for componentsschemas_task_scores_type_0_item_data in self.scores:
                componentsschemas_task_scores_type_0_item = componentsschemas_task_scores_type_0_item_data.to_dict()
                scores.append(componentsschemas_task_scores_type_0_item)

        else:
            scores = self.scores

        quiz_session_id: int | None
        quiz_session_id = self.quiz_session_id

        evaluated_attempt_id: int | None
        evaluated_attempt_id = self.evaluated_attempt_id

        current_attempt_id: int | None
        current_attempt_id = self.current_attempt_id

        last_attempt_id: int | None
        last_attempt_id = self.last_attempt_id

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "id": id,
                "type": type_,
                "state": state,
                "score": score,
                "scoreSkillLevel": score_skill_level,
                "isSkillLevelEnabled": is_skill_level_enabled,
                "isLateDaysEnabled": is_late_days_enabled,
                "extraScore": extra_score,
                "createdAt": created_at,
                "startedAt": started_at,
                "submitAt": submit_at,
                "rejectAt": reject_at,
                "evaluateAt": evaluate_at,
                "deadline": deadline,
                "lateDays": late_days,
                "exercise": exercise,
                "course": course,
                "theme": theme,
                "longread": longread,
                "student": student,
                "reviewer": reviewer,
                "solution": solution,
                "scores": scores,
                "quizSessionId": quiz_session_id,
                "evaluatedAttemptId": evaluated_attempt_id,
                "currentAttemptId": current_attempt_id,
                "lastAttemptId": last_attempt_id,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        from ..models.current_student_response import CurrentStudentResponse
        from ..models.task_course import TaskCourse
        from ..models.task_course_theme import TaskCourseTheme
        from ..models.task_exercise import TaskExercise
        from ..models.task_longread import TaskLongread
        from ..models.task_reviewer_type_0 import TaskReviewerType0
        from ..models.task_scores_item import TaskScoresItem
        from ..models.task_solution_type_0 import TaskSolutionType0

        d = dict(src_dict)
        id = d.pop("id")

        type_ = TaskType(d.pop("type"))

        state = TaskState(d.pop("state"))

        def _parse_score(data: object) -> float | None:
            if data is None:
                return data
            return cast(float | None, data)

        score = _parse_score(d.pop("score"))

        def _parse_score_skill_level(data: object) -> None | TaskScoreSkillLevel:
            if data is None:
                return data
            try:
                if not isinstance(data, str):
                    raise TypeError()
                score_skill_level_type_1 = TaskScoreSkillLevel(data)

                return score_skill_level_type_1
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            return cast(None | TaskScoreSkillLevel, data)

        score_skill_level = _parse_score_skill_level(d.pop("scoreSkillLevel"))

        is_skill_level_enabled = d.pop("isSkillLevelEnabled")

        is_late_days_enabled = d.pop("isLateDaysEnabled")

        def _parse_extra_score(data: object) -> float | None:
            if data is None:
                return data
            return cast(float | None, data)

        extra_score = _parse_extra_score(d.pop("extraScore"))

        created_at = isoparse(d.pop("createdAt"))

        def _parse_started_at(data: object) -> datetime.datetime | None:
            if data is None:
                return data
            try:
                if not isinstance(data, str):
                    raise TypeError()
                componentsschemas_started_at_type_0 = isoparse(data)

                return componentsschemas_started_at_type_0
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            return cast(datetime.datetime | None, data)

        started_at = _parse_started_at(d.pop("startedAt"))

        def _parse_submit_at(data: object) -> datetime.datetime | None:
            if data is None:
                return data
            try:
                if not isinstance(data, str):
                    raise TypeError()
                componentsschemas_submit_at_type_0 = isoparse(data)

                return componentsschemas_submit_at_type_0
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            return cast(datetime.datetime | None, data)

        submit_at = _parse_submit_at(d.pop("submitAt"))

        def _parse_reject_at(data: object) -> datetime.datetime | None:
            if data is None:
                return data
            try:
                if not isinstance(data, str):
                    raise TypeError()
                componentsschemas_reject_at_type_0 = isoparse(data)

                return componentsschemas_reject_at_type_0
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            return cast(datetime.datetime | None, data)

        reject_at = _parse_reject_at(d.pop("rejectAt"))

        def _parse_evaluate_at(data: object) -> datetime.datetime | None:
            if data is None:
                return data
            try:
                if not isinstance(data, str):
                    raise TypeError()
                componentsschemas_evaluate_at_type_0 = isoparse(data)

                return componentsschemas_evaluate_at_type_0
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            return cast(datetime.datetime | None, data)

        evaluate_at = _parse_evaluate_at(d.pop("evaluateAt"))

        deadline = isoparse(d.pop("deadline"))

        def _parse_late_days(data: object) -> int | None:
            if data is None:
                return data
            return cast(int | None, data)

        late_days = _parse_late_days(d.pop("lateDays"))

        exercise = TaskExercise.from_dict(d.pop("exercise"))

        course = TaskCourse.from_dict(d.pop("course"))

        theme = TaskCourseTheme.from_dict(d.pop("theme"))

        longread = TaskLongread.from_dict(d.pop("longread"))

        student = CurrentStudentResponse.from_dict(d.pop("student"))

        def _parse_reviewer(data: object) -> None | TaskReviewerType0:
            if data is None:
                return data
            try:
                if not isinstance(data, dict):
                    raise TypeError()
                componentsschemas_task_reviewer_type_0 = TaskReviewerType0.from_dict(data)

                return componentsschemas_task_reviewer_type_0
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            return cast(None | TaskReviewerType0, data)

        reviewer = _parse_reviewer(d.pop("reviewer"))

        def _parse_solution(data: object) -> None | TaskSolutionType0:
            if data is None:
                return data
            try:
                if not isinstance(data, dict):
                    raise TypeError()
                componentsschemas_task_solution_type_0 = TaskSolutionType0.from_dict(data)

                return componentsschemas_task_solution_type_0
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            return cast(None | TaskSolutionType0, data)

        solution = _parse_solution(d.pop("solution"))

        def _parse_scores(data: object) -> list[TaskScoresItem] | None:
            if data is None:
                return data
            try:
                if not isinstance(data, list):
                    raise TypeError()
                componentsschemas_task_scores_type_0 = []
                _componentsschemas_task_scores_type_0 = data
                for componentsschemas_task_scores_type_0_item_data in _componentsschemas_task_scores_type_0:
                    componentsschemas_task_scores_type_0_item = TaskScoresItem.from_dict(
                        componentsschemas_task_scores_type_0_item_data
                    )

                    componentsschemas_task_scores_type_0.append(componentsschemas_task_scores_type_0_item)

                return componentsschemas_task_scores_type_0
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            return cast(list[TaskScoresItem] | None, data)

        scores = _parse_scores(d.pop("scores"))

        def _parse_quiz_session_id(data: object) -> int | None:
            if data is None:
                return data
            return cast(int | None, data)

        quiz_session_id = _parse_quiz_session_id(d.pop("quizSessionId"))

        def _parse_evaluated_attempt_id(data: object) -> int | None:
            if data is None:
                return data
            return cast(int | None, data)

        evaluated_attempt_id = _parse_evaluated_attempt_id(d.pop("evaluatedAttemptId"))

        def _parse_current_attempt_id(data: object) -> int | None:
            if data is None:
                return data
            return cast(int | None, data)

        current_attempt_id = _parse_current_attempt_id(d.pop("currentAttemptId"))

        def _parse_last_attempt_id(data: object) -> int | None:
            if data is None:
                return data
            return cast(int | None, data)

        last_attempt_id = _parse_last_attempt_id(d.pop("lastAttemptId"))

        task_by_id_response = cls(
            id=id,
            type_=type_,
            state=state,
            score=score,
            score_skill_level=score_skill_level,
            is_skill_level_enabled=is_skill_level_enabled,
            is_late_days_enabled=is_late_days_enabled,
            extra_score=extra_score,
            created_at=created_at,
            started_at=started_at,
            submit_at=submit_at,
            reject_at=reject_at,
            evaluate_at=evaluate_at,
            deadline=deadline,
            late_days=late_days,
            exercise=exercise,
            course=course,
            theme=theme,
            longread=longread,
            student=student,
            reviewer=reviewer,
            solution=solution,
            scores=scores,
            quiz_session_id=quiz_session_id,
            evaluated_attempt_id=evaluated_attempt_id,
            current_attempt_id=current_attempt_id,
            last_attempt_id=last_attempt_id,
        )

        return task_by_id_response
