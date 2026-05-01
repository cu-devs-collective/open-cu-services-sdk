from __future__ import annotations

from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar, cast

from attrs import define as _attrs_define

if TYPE_CHECKING:
    from ..models.question_item_correct_answer_input_number_correct_answer import (
        QuestionItemCorrectAnswerInputNumberCorrectAnswer,
    )
    from ..models.question_item_correct_answer_input_string_correct_answer import (
        QuestionItemCorrectAnswerInputStringCorrectAnswer,
    )


T = TypeVar("T", bound="QuestionItemEvaluationBlock")


@_attrs_define
class QuestionItemEvaluationBlock:
    """
    Attributes:
        correct_answer (None | QuestionItemCorrectAnswerInputNumberCorrectAnswer |
            QuestionItemCorrectAnswerInputStringCorrectAnswer):
        auto_evaluation (bool): Indicates if the question is auto evaluated.
        recommendation (None | str): Text rendered under the options on frontend. Example: -.
    """

    correct_answer: (
        None | QuestionItemCorrectAnswerInputNumberCorrectAnswer | QuestionItemCorrectAnswerInputStringCorrectAnswer
    )
    auto_evaluation: bool
    recommendation: None | str

    def to_dict(self) -> dict[str, Any]:
        from ..models.question_item_correct_answer_input_number_correct_answer import (
            QuestionItemCorrectAnswerInputNumberCorrectAnswer,
        )
        from ..models.question_item_correct_answer_input_string_correct_answer import (
            QuestionItemCorrectAnswerInputStringCorrectAnswer,
        )

        correct_answer: dict[str, Any] | None
        if isinstance(self.correct_answer, QuestionItemCorrectAnswerInputStringCorrectAnswer):
            correct_answer = self.correct_answer.to_dict()
        elif isinstance(self.correct_answer, QuestionItemCorrectAnswerInputNumberCorrectAnswer):
            correct_answer = self.correct_answer.to_dict()
        else:
            correct_answer = self.correct_answer

        auto_evaluation = self.auto_evaluation

        recommendation: None | str
        recommendation = self.recommendation

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "correctAnswer": correct_answer,
                "autoEvaluation": auto_evaluation,
                "recommendation": recommendation,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        from ..models.question_item_correct_answer_input_number_correct_answer import (
            QuestionItemCorrectAnswerInputNumberCorrectAnswer,
        )
        from ..models.question_item_correct_answer_input_string_correct_answer import (
            QuestionItemCorrectAnswerInputStringCorrectAnswer,
        )

        d = dict(src_dict)

        def _parse_correct_answer(
            data: object,
        ) -> (
            None | QuestionItemCorrectAnswerInputNumberCorrectAnswer | QuestionItemCorrectAnswerInputStringCorrectAnswer
        ):
            if data is None:
                return data
            try:
                if not isinstance(data, dict):
                    raise TypeError()
                componentsschemas_question_item_correct_answer_type_0 = (
                    QuestionItemCorrectAnswerInputStringCorrectAnswer.from_dict(data)
                )

                return componentsschemas_question_item_correct_answer_type_0
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            try:
                if not isinstance(data, dict):
                    raise TypeError()
                componentsschemas_question_item_correct_answer_type_1 = (
                    QuestionItemCorrectAnswerInputNumberCorrectAnswer.from_dict(data)
                )

                return componentsschemas_question_item_correct_answer_type_1
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            return cast(
                None
                | QuestionItemCorrectAnswerInputNumberCorrectAnswer
                | QuestionItemCorrectAnswerInputStringCorrectAnswer,
                data,
            )

        correct_answer = _parse_correct_answer(d.pop("correctAnswer"))

        auto_evaluation = d.pop("autoEvaluation")

        def _parse_recommendation(data: object) -> None | str:
            if data is None:
                return data
            return cast(None | str, data)

        recommendation = _parse_recommendation(d.pop("recommendation"))

        question_item_evaluation_block = cls(
            correct_answer=correct_answer,
            auto_evaluation=auto_evaluation,
            recommendation=recommendation,
        )

        return question_item_evaluation_block
