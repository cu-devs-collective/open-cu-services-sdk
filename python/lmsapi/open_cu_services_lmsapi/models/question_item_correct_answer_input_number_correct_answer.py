from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar, cast

from attrs import define as _attrs_define

from ..models.question_item_correct_answer_input_number_correct_answer_type import (
    QuestionItemCorrectAnswerInputNumberCorrectAnswerType,
)
from ..types import UNSET, Unset

T = TypeVar("T", bound="QuestionItemCorrectAnswerInputNumberCorrectAnswer")


@_attrs_define
class QuestionItemCorrectAnswerInputNumberCorrectAnswer:
    """Shows correct number input answers.

    Attributes:
        type_ (QuestionItemCorrectAnswerInputNumberCorrectAnswerType):  Example: inputNumberCorrectAnswer.
        variants (list[float]):  Example: [2.5].
        show_precision_hint (bool): Indicates if precision hint should be shown on frontend. Example: True.
        precision (int | None):  Example: 2.
        auto_evaluation_precision (None | str | Unset):  Example: 0.00.
    """

    type_: QuestionItemCorrectAnswerInputNumberCorrectAnswerType
    variants: list[float]
    show_precision_hint: bool
    precision: int | None
    auto_evaluation_precision: None | str | Unset = UNSET

    def to_dict(self) -> dict[str, Any]:
        type_ = self.type_.value

        variants = self.variants

        show_precision_hint = self.show_precision_hint

        precision: int | None
        precision = self.precision

        auto_evaluation_precision: None | str | Unset
        if isinstance(self.auto_evaluation_precision, Unset):
            auto_evaluation_precision = UNSET
        else:
            auto_evaluation_precision = self.auto_evaluation_precision

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "type": type_,
                "variants": variants,
                "showPrecisionHint": show_precision_hint,
                "precision": precision,
            }
        )
        if auto_evaluation_precision is not UNSET:
            field_dict["autoEvaluationPrecision"] = auto_evaluation_precision

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        type_ = QuestionItemCorrectAnswerInputNumberCorrectAnswerType(d.pop("type"))

        variants = cast(list[float], d.pop("variants"))

        show_precision_hint = d.pop("showPrecisionHint")

        def _parse_precision(data: object) -> int | None:
            if data is None:
                return data
            return cast(int | None, data)

        precision = _parse_precision(d.pop("precision"))

        def _parse_auto_evaluation_precision(data: object) -> None | str | Unset:
            if data is None:
                return data
            if isinstance(data, Unset):
                return data
            return cast(None | str | Unset, data)

        auto_evaluation_precision = _parse_auto_evaluation_precision(d.pop("autoEvaluationPrecision", UNSET))

        question_item_correct_answer_input_number_correct_answer = cls(
            type_=type_,
            variants=variants,
            show_precision_hint=show_precision_hint,
            precision=precision,
            auto_evaluation_precision=auto_evaluation_precision,
        )

        return question_item_correct_answer_input_number_correct_answer
