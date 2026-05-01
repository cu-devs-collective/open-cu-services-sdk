from __future__ import annotations

from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar, cast

from attrs import define as _attrs_define

from ..models.task_solution_answers_question_input_question_item_type import (
    TaskSolutionAnswersQuestionInputQuestionItemType,
)

if TYPE_CHECKING:
    from ..models.task_solution_answers_question_input_answer_type_0 import TaskSolutionAnswersQuestionInputAnswerType0


T = TypeVar("T", bound="TaskSolutionAnswersQuestionInputQuestionItem")


@_attrs_define
class TaskSolutionAnswersQuestionInputQuestionItem:
    """
    Attributes:
        id (int): Numeric identifier of the question. Example: 766.
        type_ (TaskSolutionAnswersQuestionInputQuestionItemType):  Example: input.
        answer (None | TaskSolutionAnswersQuestionInputAnswerType0): Object representing information about answer string
            values expected as valid by task authors. Object is null if task authors decide not to show answers after task
            evaluation.
        options (None):
    """

    id: int
    type_: TaskSolutionAnswersQuestionInputQuestionItemType
    answer: None | TaskSolutionAnswersQuestionInputAnswerType0
    options: None

    def to_dict(self) -> dict[str, Any]:
        from ..models.task_solution_answers_question_input_answer_type_0 import (
            TaskSolutionAnswersQuestionInputAnswerType0,
        )

        id = self.id

        type_ = self.type_.value

        answer: dict[str, Any] | None
        if isinstance(self.answer, TaskSolutionAnswersQuestionInputAnswerType0):
            answer = self.answer.to_dict()
        else:
            answer = self.answer

        options = self.options

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
        from ..models.task_solution_answers_question_input_answer_type_0 import (
            TaskSolutionAnswersQuestionInputAnswerType0,
        )

        d = dict(src_dict)
        id = d.pop("id")

        type_ = TaskSolutionAnswersQuestionInputQuestionItemType(d.pop("type"))

        def _parse_answer(data: object) -> None | TaskSolutionAnswersQuestionInputAnswerType0:
            if data is None:
                return data
            try:
                if not isinstance(data, dict):
                    raise TypeError()
                componentsschemas_task_solution_answers_question_input_answer_type_0 = (
                    TaskSolutionAnswersQuestionInputAnswerType0.from_dict(data)
                )

                return componentsschemas_task_solution_answers_question_input_answer_type_0
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            return cast(None | TaskSolutionAnswersQuestionInputAnswerType0, data)

        answer = _parse_answer(d.pop("answer"))

        options = d.pop("options")

        task_solution_answers_question_input_question_item = cls(
            id=id,
            type_=type_,
            answer=answer,
            options=options,
        )

        return task_solution_answers_question_input_question_item
