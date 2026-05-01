from __future__ import annotations

from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar, cast

from attrs import define as _attrs_define

from ..models.task_type import TaskType

if TYPE_CHECKING:
    from ..models.task_attachment import TaskAttachment
    from ..models.task_solution_answers_item import TaskSolutionAnswersItem


T = TypeVar("T", bound="TaskSolutionType0")


@_attrs_define
class TaskSolutionType0:
    """
    Attributes:
        type_ (TaskType): Task type. Example: coding.
        solution_url (None | str): URL for solution, if value is not null. Example: https://my.centraluniversity.ru.
        answers (list[TaskSolutionAnswersItem] | None):
        attachments (list[TaskAttachment] | None):
    """

    type_: TaskType
    solution_url: None | str
    answers: list[TaskSolutionAnswersItem] | None
    attachments: list[TaskAttachment] | None

    def to_dict(self) -> dict[str, Any]:
        type_ = self.type_.value

        solution_url: None | str
        solution_url = self.solution_url

        answers: list[dict[str, Any]] | None
        if isinstance(self.answers, list):
            answers = []
            for answers_type_0_item_data in self.answers:
                answers_type_0_item = answers_type_0_item_data.to_dict()
                answers.append(answers_type_0_item)

        else:
            answers = self.answers

        attachments: list[dict[str, Any]] | None
        if isinstance(self.attachments, list):
            attachments = []
            for attachments_type_0_item_data in self.attachments:
                attachments_type_0_item = attachments_type_0_item_data.to_dict()
                attachments.append(attachments_type_0_item)

        else:
            attachments = self.attachments

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "type": type_,
                "solutionUrl": solution_url,
                "answers": answers,
                "attachments": attachments,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        from ..models.task_attachment import TaskAttachment
        from ..models.task_solution_answers_item import TaskSolutionAnswersItem

        d = dict(src_dict)
        type_ = TaskType(d.pop("type"))

        def _parse_solution_url(data: object) -> None | str:
            if data is None:
                return data
            return cast(None | str, data)

        solution_url = _parse_solution_url(d.pop("solutionUrl"))

        def _parse_answers(data: object) -> list[TaskSolutionAnswersItem] | None:
            if data is None:
                return data
            try:
                if not isinstance(data, list):
                    raise TypeError()
                answers_type_0 = []
                _answers_type_0 = data
                for answers_type_0_item_data in _answers_type_0:
                    answers_type_0_item = TaskSolutionAnswersItem.from_dict(answers_type_0_item_data)

                    answers_type_0.append(answers_type_0_item)

                return answers_type_0
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            return cast(list[TaskSolutionAnswersItem] | None, data)

        answers = _parse_answers(d.pop("answers"))

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

        task_solution_type_0 = cls(
            type_=type_,
            solution_url=solution_url,
            answers=answers,
            attachments=attachments,
        )

        return task_solution_type_0
