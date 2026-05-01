from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar, cast

from attrs import define as _attrs_define

from ..models.question_item_correct_answer_input_string_correct_answer_type import (
    QuestionItemCorrectAnswerInputStringCorrectAnswerType,
)

T = TypeVar("T", bound="QuestionItemCorrectAnswerInputStringCorrectAnswer")


@_attrs_define
class QuestionItemCorrectAnswerInputStringCorrectAnswer:
    """Shows correct string input answers.

    Attributes:
        type_ (QuestionItemCorrectAnswerInputStringCorrectAnswerType):  Example: inputStringCorrectAnswer.
        variants (list[str]):  Example: ['АБББ', 'А Б Б Б', 'А, Б, Б, Б'].
    """

    type_: QuestionItemCorrectAnswerInputStringCorrectAnswerType
    variants: list[str]

    def to_dict(self) -> dict[str, Any]:
        type_ = self.type_.value

        variants = self.variants

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "type": type_,
                "variants": variants,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        type_ = QuestionItemCorrectAnswerInputStringCorrectAnswerType(d.pop("type"))

        variants = cast(list[str], d.pop("variants"))

        question_item_correct_answer_input_string_correct_answer = cls(
            type_=type_,
            variants=variants,
        )

        return question_item_correct_answer_input_string_correct_answer
