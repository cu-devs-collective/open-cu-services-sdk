from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar, cast

from attrs import define as _attrs_define

T = TypeVar("T", bound="TaskSolutionAnswersQuestionInputNumberAnswerType0")


@_attrs_define
class TaskSolutionAnswersQuestionInputNumberAnswerType0:
    """Object representing information about answer number values expected as valid by task authors. Object is null if task
    authors decide not to show answers after task evaluation.

        Attributes:
            values (list[float]):  Example: [5.44].
            value (None):
            recommendation (str): Recommendation text in HTML shown under input box on frontend.
                 Example: <p><span style="color: black; font-size: 11pt">Data Dump/data dump/Дата дамп/дата дамп/База знаний/
                база знаний / Дамп данных/ дамп данных</span></p>.
    """

    values: list[float]
    value: None
    recommendation: str

    def to_dict(self) -> dict[str, Any]:
        values = self.values

        value = self.value

        recommendation = self.recommendation

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "values": values,
                "value": value,
                "recommendation": recommendation,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        values = cast(list[float], d.pop("values"))

        value = d.pop("value")

        recommendation = d.pop("recommendation")

        task_solution_answers_question_input_number_answer_type_0 = cls(
            values=values,
            value=value,
            recommendation=recommendation,
        )

        return task_solution_answers_question_input_number_answer_type_0
