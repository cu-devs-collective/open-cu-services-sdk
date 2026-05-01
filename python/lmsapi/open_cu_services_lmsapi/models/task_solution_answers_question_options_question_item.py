from __future__ import annotations

from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar

from attrs import define as _attrs_define

from ..models.task_solution_answers_question_options_question_item_type import (
    TaskSolutionAnswersQuestionOptionsQuestionItemType,
)

if TYPE_CHECKING:
    from ..models.task_solution_answers_question_options_item import TaskSolutionAnswersQuestionOptionsItem


T = TypeVar("T", bound="TaskSolutionAnswersQuestionOptionsQuestionItem")


@_attrs_define
class TaskSolutionAnswersQuestionOptionsQuestionItem:
    """
    Attributes:
        id (int): Numeric identifier of the question. Example: 766.
        type_ (TaskSolutionAnswersQuestionOptionsQuestionItemType):  Example: singleChoice.
        answer (None):
        options (list[TaskSolutionAnswersQuestionOptionsItem]):
    """

    id: int
    type_: TaskSolutionAnswersQuestionOptionsQuestionItemType
    answer: None
    options: list[TaskSolutionAnswersQuestionOptionsItem]

    def to_dict(self) -> dict[str, Any]:
        id = self.id

        type_ = self.type_.value

        answer = self.answer

        options = []
        for options_item_data in self.options:
            options_item = options_item_data.to_dict()
            options.append(options_item)

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "id": id,
                "type": type_,
                "answer": answer,
                "options": options,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        from ..models.task_solution_answers_question_options_item import TaskSolutionAnswersQuestionOptionsItem

        d = dict(src_dict)
        id = d.pop("id")

        type_ = TaskSolutionAnswersQuestionOptionsQuestionItemType(d.pop("type"))

        answer = d.pop("answer")

        options = []
        _options = d.pop("options")
        for options_item_data in _options:
            options_item = TaskSolutionAnswersQuestionOptionsItem.from_dict(options_item_data)

            options.append(options_item)

        task_solution_answers_question_options_question_item = cls(
            id=id,
            type_=type_,
            answer=answer,
            options=options,
        )

        return task_solution_answers_question_options_question_item
