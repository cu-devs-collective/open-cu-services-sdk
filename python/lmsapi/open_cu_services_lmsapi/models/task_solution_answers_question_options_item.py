from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar, cast

from attrs import define as _attrs_define

T = TypeVar("T", bound="TaskSolutionAnswersQuestionOptionsItem")


@_attrs_define
class TaskSolutionAnswersQuestionOptionsItem:
    """
    Attributes:
        id (int): Numeric identifier of the question option. Example: 471.
        is_correct (bool): Indicates if the option is the correct answer. Example: True.
        recommendation (None | str): Text rendered under the options on frontend. Example: -.
    """

    id: int
    is_correct: bool
    recommendation: None | str

    def to_dict(self) -> dict[str, Any]:
        id = self.id

        is_correct = self.is_correct

        recommendation: None | str
        recommendation = self.recommendation

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "id": id,
                "isCorrect": is_correct,
                "recommendation": recommendation,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        id = d.pop("id")

        is_correct = d.pop("isCorrect")

        def _parse_recommendation(data: object) -> None | str:
            if data is None:
                return data
            return cast(None | str, data)

        recommendation = _parse_recommendation(d.pop("recommendation"))

        task_solution_answers_question_options_item = cls(
            id=id,
            is_correct=is_correct,
            recommendation=recommendation,
        )

        return task_solution_answers_question_options_item
