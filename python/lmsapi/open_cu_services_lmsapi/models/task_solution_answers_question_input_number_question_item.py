from __future__ import annotations

from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar, cast

from attrs import define as _attrs_define

from ..models.task_solution_answers_question_input_number_question_item_type import (
    TaskSolutionAnswersQuestionInputNumberQuestionItemType,
)

if TYPE_CHECKING:
    from ..models.task_solution_answers_question_input_number_answer_type_0 import (
        TaskSolutionAnswersQuestionInputNumberAnswerType0,
    )


T = TypeVar("T", bound="TaskSolutionAnswersQuestionInputNumberQuestionItem")


@_attrs_define
class TaskSolutionAnswersQuestionInputNumberQuestionItem:
    """
    Attributes:
        id (int): Numeric identifier of the question. Example: 766.
        type_ (TaskSolutionAnswersQuestionInputNumberQuestionItemType):  Example: inputNumber.
        answer (None | TaskSolutionAnswersQuestionInputNumberAnswerType0): Object representing information about answer
            number values expected as valid by task authors. Object is null if task authors decide not to show answers after
            task evaluation.
        options (None):
    """

    id: int
    type_: TaskSolutionAnswersQuestionInputNumberQuestionItemType
    answer: None | TaskSolutionAnswersQuestionInputNumberAnswerType0
    options: None

    def to_dict(self) -> dict[str, Any]:
        from ..models.task_solution_answers_question_input_number_answer_type_0 import (
            TaskSolutionAnswersQuestionInputNumberAnswerType0,
        )

        id = self.id

        type_ = self.type_.value

        answer: dict[str, Any] | None
        if isinstance(self.answer, TaskSolutionAnswersQuestionInputNumberAnswerType0):
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
        from ..models.task_solution_answers_question_input_number_answer_type_0 import (
            TaskSolutionAnswersQuestionInputNumberAnswerType0,
        )

        d = dict(src_dict)
        id = d.pop("id")

        type_ = TaskSolutionAnswersQuestionInputNumberQuestionItemType(d.pop("type"))

        def _parse_answer(data: object) -> None | TaskSolutionAnswersQuestionInputNumberAnswerType0:
            if data is None:
                return data
            try:
                if not isinstance(data, dict):
                    raise TypeError()
                componentsschemas_task_solution_answers_question_input_number_answer_type_0 = (
                    TaskSolutionAnswersQuestionInputNumberAnswerType0.from_dict(data)
                )

                return componentsschemas_task_solution_answers_question_input_number_answer_type_0
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            return cast(None | TaskSolutionAnswersQuestionInputNumberAnswerType0, data)

        answer = _parse_answer(d.pop("answer"))

        options = d.pop("options")

        task_solution_answers_question_input_number_question_item = cls(
            id=id,
            type_=type_,
            answer=answer,
            options=options,
        )

        return task_solution_answers_question_input_number_question_item
