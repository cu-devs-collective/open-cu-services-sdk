from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar, cast

from attrs import define as _attrs_define

T = TypeVar("T", bound="TaskScoresItem")


@_attrs_define
class TaskScoresItem:
    """
    Attributes:
        question_id (int): Numeric identifier of the question. Example: 766.
        score (float | None): Task score, if it was evaluated.
    """

    question_id: int
    score: float | None

    def to_dict(self) -> dict[str, Any]:
        question_id = self.question_id

        score: float | None
        score = self.score

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "questionId": question_id,
                "score": score,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        question_id = d.pop("questionId")

        def _parse_score(data: object) -> float | None:
            if data is None:
                return data
            return cast(float | None, data)

        score = _parse_score(d.pop("score"))

        task_scores_item = cls(
            question_id=question_id,
            score=score,
        )

        return task_scores_item
