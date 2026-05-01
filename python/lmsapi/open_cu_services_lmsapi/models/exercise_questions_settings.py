from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar

from attrs import define as _attrs_define

from ..models.questions_settings_eval_strategy import QuestionsSettingsEvalStrategy

T = TypeVar("T", bound="ExerciseQuestionsSettings")


@_attrs_define
class ExerciseQuestionsSettings:
    """Settings for questions exercise behavior.

    Attributes:
        questions_per_attempt (None):
        attempts_limit (int):  Example: 1.
        evaluation_strategy (QuestionsSettingsEvalStrategy): Questions exercise evaluation strategy. Example: last.
    """

    questions_per_attempt: None
    attempts_limit: int
    evaluation_strategy: QuestionsSettingsEvalStrategy

    def to_dict(self) -> dict[str, Any]:
        questions_per_attempt = self.questions_per_attempt

        attempts_limit = self.attempts_limit

        evaluation_strategy = self.evaluation_strategy.value

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "questionsPerAttempt": questions_per_attempt,
                "attemptsLimit": attempts_limit,
                "evaluationStrategy": evaluation_strategy,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        questions_per_attempt = d.pop("questionsPerAttempt")

        attempts_limit = d.pop("attemptsLimit")

        evaluation_strategy = QuestionsSettingsEvalStrategy(d.pop("evaluationStrategy"))

        exercise_questions_settings = cls(
            questions_per_attempt=questions_per_attempt,
            attempts_limit=attempts_limit,
            evaluation_strategy=evaluation_strategy,
        )

        return exercise_questions_settings
