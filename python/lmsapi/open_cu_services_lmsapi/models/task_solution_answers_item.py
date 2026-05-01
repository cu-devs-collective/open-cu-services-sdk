from __future__ import annotations

from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar, cast

from attrs import define as _attrs_define

if TYPE_CHECKING:
    from ..models.task_solution_answers_question_input_number_question_item import (
        TaskSolutionAnswersQuestionInputNumberQuestionItem,
    )
    from ..models.task_solution_answers_question_input_question_item import TaskSolutionAnswersQuestionInputQuestionItem
    from ..models.task_solution_answers_question_options_question_item import (
        TaskSolutionAnswersQuestionOptionsQuestionItem,
    )


T = TypeVar("T", bound="TaskSolutionAnswersItem")


@_attrs_define
class TaskSolutionAnswersItem:
    """
    Attributes:
        answer (float | str): Answer given by student.
        question (TaskSolutionAnswersQuestionInputNumberQuestionItem | TaskSolutionAnswersQuestionInputQuestionItem |
            TaskSolutionAnswersQuestionOptionsQuestionItem):
    """

    answer: float | str
    question: (
        TaskSolutionAnswersQuestionInputNumberQuestionItem
        | TaskSolutionAnswersQuestionInputQuestionItem
        | TaskSolutionAnswersQuestionOptionsQuestionItem
    )

    def to_dict(self) -> dict[str, Any]:
        from ..models.task_solution_answers_question_input_question_item import (
            TaskSolutionAnswersQuestionInputQuestionItem,
        )
        from ..models.task_solution_answers_question_options_question_item import (
            TaskSolutionAnswersQuestionOptionsQuestionItem,
        )

        answer: float | str
        answer = self.answer

        question: dict[str, Any]
        if isinstance(self.question, TaskSolutionAnswersQuestionOptionsQuestionItem):
            question = self.question.to_dict()
        elif isinstance(self.question, TaskSolutionAnswersQuestionInputQuestionItem):
            question = self.question.to_dict()
        else:
            question = self.question.to_dict()

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "answer": answer,
                "question": question,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        from ..models.task_solution_answers_question_input_number_question_item import (
            TaskSolutionAnswersQuestionInputNumberQuestionItem,
        )
        from ..models.task_solution_answers_question_input_question_item import (
            TaskSolutionAnswersQuestionInputQuestionItem,
        )
        from ..models.task_solution_answers_question_options_question_item import (
            TaskSolutionAnswersQuestionOptionsQuestionItem,
        )

        d = dict(src_dict)

        def _parse_answer(data: object) -> float | str:
            return cast(float | str, data)

        answer = _parse_answer(d.pop("answer"))

        def _parse_question(
            data: object,
        ) -> (
            TaskSolutionAnswersQuestionInputNumberQuestionItem
            | TaskSolutionAnswersQuestionInputQuestionItem
            | TaskSolutionAnswersQuestionOptionsQuestionItem
        ):
            try:
                if not isinstance(data, dict):
                    raise TypeError()
                componentsschemas_task_solution_answers_question_type_0 = (
                    TaskSolutionAnswersQuestionOptionsQuestionItem.from_dict(data)
                )

                return componentsschemas_task_solution_answers_question_type_0
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            try:
                if not isinstance(data, dict):
                    raise TypeError()
                componentsschemas_task_solution_answers_question_type_1 = (
                    TaskSolutionAnswersQuestionInputQuestionItem.from_dict(data)
                )

                return componentsschemas_task_solution_answers_question_type_1
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            if not isinstance(data, dict):
                raise TypeError()
            componentsschemas_task_solution_answers_question_type_2 = (
                TaskSolutionAnswersQuestionInputNumberQuestionItem.from_dict(data)
            )

            return componentsschemas_task_solution_answers_question_type_2

        question = _parse_question(d.pop("question"))

        task_solution_answers_item = cls(
            answer=answer,
            question=question,
        )

        return task_solution_answers_item
