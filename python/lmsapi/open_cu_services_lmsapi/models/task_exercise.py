from __future__ import annotations

import datetime
from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar, cast

from attrs import define as _attrs_define
from dateutil.parser import isoparse

from ..models.task_type import TaskType

if TYPE_CHECKING:
    from ..models.exercise_questions_settings import ExerciseQuestionsSettings
    from ..models.task_attachment import TaskAttachment
    from ..models.task_exercise_activity import TaskExerciseActivity
    from ..models.task_exercise_question_order import TaskExerciseQuestionOrder


T = TypeVar("T", bound="TaskExercise")


@_attrs_define
class TaskExercise:
    """
    Attributes:
        id (int): Numeric identifier of the exercise item. Example: 48139.
        name (str): Exercise name shown as the header is LMS. Example: Seminar 1. Week 2.
        type_ (TaskType): Task type. Example: coding.
        max_score (float): Maximum possible score for completing exercise. Example: 10.
        start_date (datetime.datetime): Scheduled item start timestamp. Example: 2026-01-26T07:00:00+00:00.
        deadline (datetime.datetime): Deadline timestamp by which the item must be completed. Example:
            2026-02-15T19:00:00+00:00.
        timer (None):
        activity (TaskExerciseActivity):  Example: {'id': 1880, 'name': 'Домашние задания', 'weight': 0.2,
            'isLateDaysEnabled': True}.
        question_orders (list[TaskExerciseQuestionOrder] | None):
        are_questions_shuffled (bool | None):
        quiz_id (int | None):
        mode (None):
        view_content (None | str): JSON-serialized markdown content of task rendered in LMS. Example: {"description":
            "<p>Заполни “Шаблон: моя мотивация” и прикрепи в поле ниже.</p>"}.
        exercise_url (None | str): URL of coding exercise if configured.
        attachments (list[TaskAttachment] | None):
        settings (ExerciseQuestionsSettings | None):
    """

    id: int
    name: str
    type_: TaskType
    max_score: float
    start_date: datetime.datetime
    deadline: datetime.datetime
    timer: None
    activity: TaskExerciseActivity
    question_orders: list[TaskExerciseQuestionOrder] | None
    are_questions_shuffled: bool | None
    quiz_id: int | None
    mode: None
    view_content: None | str
    exercise_url: None | str
    attachments: list[TaskAttachment] | None
    settings: ExerciseQuestionsSettings | None

    def to_dict(self) -> dict[str, Any]:
        from ..models.exercise_questions_settings import ExerciseQuestionsSettings

        id = self.id

        name = self.name

        type_ = self.type_.value

        max_score = self.max_score

        start_date = self.start_date.isoformat()

        deadline = self.deadline.isoformat()

        timer = self.timer

        activity = self.activity.to_dict()

        question_orders: list[dict[str, Any]] | None
        if isinstance(self.question_orders, list):
            question_orders = []
            for componentsschemas_task_exercise_question_orders_type_0_item_data in self.question_orders:
                componentsschemas_task_exercise_question_orders_type_0_item = (
                    componentsschemas_task_exercise_question_orders_type_0_item_data.to_dict()
                )
                question_orders.append(componentsschemas_task_exercise_question_orders_type_0_item)

        else:
            question_orders = self.question_orders

        are_questions_shuffled: bool | None
        are_questions_shuffled = self.are_questions_shuffled

        quiz_id: int | None
        quiz_id = self.quiz_id

        mode = self.mode

        view_content: None | str
        view_content = self.view_content

        exercise_url: None | str
        exercise_url = self.exercise_url

        attachments: list[dict[str, Any]] | None
        if isinstance(self.attachments, list):
            attachments = []
            for attachments_type_0_item_data in self.attachments:
                attachments_type_0_item = attachments_type_0_item_data.to_dict()
                attachments.append(attachments_type_0_item)

        else:
            attachments = self.attachments

        settings: dict[str, Any] | None
        if isinstance(self.settings, ExerciseQuestionsSettings):
            settings = self.settings.to_dict()
        else:
            settings = self.settings

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "id": id,
                "name": name,
                "type": type_,
                "maxScore": max_score,
                "startDate": start_date,
                "deadline": deadline,
                "timer": timer,
                "activity": activity,
                "questionOrders": question_orders,
                "areQuestionsShuffled": are_questions_shuffled,
                "quizId": quiz_id,
                "mode": mode,
                "viewContent": view_content,
                "exerciseUrl": exercise_url,
                "attachments": attachments,
                "settings": settings,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        from ..models.exercise_questions_settings import ExerciseQuestionsSettings
        from ..models.task_attachment import TaskAttachment
        from ..models.task_exercise_activity import TaskExerciseActivity
        from ..models.task_exercise_question_order import TaskExerciseQuestionOrder

        d = dict(src_dict)
        id = d.pop("id")

        name = d.pop("name")

        type_ = TaskType(d.pop("type"))

        max_score = d.pop("maxScore")

        start_date = isoparse(d.pop("startDate"))

        deadline = isoparse(d.pop("deadline"))

        timer = d.pop("timer")

        activity = TaskExerciseActivity.from_dict(d.pop("activity"))

        def _parse_question_orders(data: object) -> list[TaskExerciseQuestionOrder] | None:
            if data is None:
                return data
            try:
                if not isinstance(data, list):
                    raise TypeError()
                componentsschemas_task_exercise_question_orders_type_0 = []
                _componentsschemas_task_exercise_question_orders_type_0 = data
                for (
                    componentsschemas_task_exercise_question_orders_type_0_item_data
                ) in _componentsschemas_task_exercise_question_orders_type_0:
                    componentsschemas_task_exercise_question_orders_type_0_item = TaskExerciseQuestionOrder.from_dict(
                        componentsschemas_task_exercise_question_orders_type_0_item_data
                    )

                    componentsschemas_task_exercise_question_orders_type_0.append(
                        componentsschemas_task_exercise_question_orders_type_0_item
                    )

                return componentsschemas_task_exercise_question_orders_type_0
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            return cast(list[TaskExerciseQuestionOrder] | None, data)

        question_orders = _parse_question_orders(d.pop("questionOrders"))

        def _parse_are_questions_shuffled(data: object) -> bool | None:
            if data is None:
                return data
            return cast(bool | None, data)

        are_questions_shuffled = _parse_are_questions_shuffled(d.pop("areQuestionsShuffled"))

        def _parse_quiz_id(data: object) -> int | None:
            if data is None:
                return data
            return cast(int | None, data)

        quiz_id = _parse_quiz_id(d.pop("quizId"))

        mode = d.pop("mode")

        def _parse_view_content(data: object) -> None | str:
            if data is None:
                return data
            return cast(None | str, data)

        view_content = _parse_view_content(d.pop("viewContent"))

        def _parse_exercise_url(data: object) -> None | str:
            if data is None:
                return data
            return cast(None | str, data)

        exercise_url = _parse_exercise_url(d.pop("exerciseUrl"))

        def _parse_attachments(data: object) -> list[TaskAttachment] | None:
            if data is None:
                return data
            try:
                if not isinstance(data, list):
                    raise TypeError()
                attachments_type_0 = []
                _attachments_type_0 = data
                for attachments_type_0_item_data in _attachments_type_0:
                    attachments_type_0_item = TaskAttachment.from_dict(attachments_type_0_item_data)

                    attachments_type_0.append(attachments_type_0_item)

                return attachments_type_0
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            return cast(list[TaskAttachment] | None, data)

        attachments = _parse_attachments(d.pop("attachments"))

        def _parse_settings(data: object) -> ExerciseQuestionsSettings | None:
            if data is None:
                return data
            try:
                if not isinstance(data, dict):
                    raise TypeError()
                settings_type_1 = ExerciseQuestionsSettings.from_dict(data)

                return settings_type_1
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            return cast(ExerciseQuestionsSettings | None, data)

        settings = _parse_settings(d.pop("settings"))

        task_exercise = cls(
            id=id,
            name=name,
            type_=type_,
            max_score=max_score,
            start_date=start_date,
            deadline=deadline,
            timer=timer,
            activity=activity,
            question_orders=question_orders,
            are_questions_shuffled=are_questions_shuffled,
            quiz_id=quiz_id,
            mode=mode,
            view_content=view_content,
            exercise_url=exercise_url,
            attachments=attachments,
            settings=settings,
        )

        return task_exercise
