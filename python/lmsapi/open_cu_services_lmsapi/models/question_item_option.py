from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar, cast

from attrs import define as _attrs_define

T = TypeVar("T", bound="QuestionItemOption")


@_attrs_define
class QuestionItemOption:
    """Option is a possible answer that can be chosen.

    Attributes:
        id (int): Numeric identifier of the question option. Example: 471.
        value (str): The option value rendered on frontend. Example: Ознакомлен.
        order (int): Listing order determining the item's line position in the LMS, lower values come first.
             Example: 1.
        is_correct (bool): Indicates if the option is the correct answer. Example: True.
        recommendation (None | str): Text rendered under the options on frontend. Example: -.
    """

    id: int
    value: str
    order: int
    is_correct: bool
    recommendation: None | str

    def to_dict(self) -> dict[str, Any]:
        id = self.id

        value = self.value

        order = self.order

        is_correct = self.is_correct

        recommendation: None | str
        recommendation = self.recommendation

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "id": id,
                "value": value,
                "order": order,
                "isCorrect": is_correct,
                "recommendation": recommendation,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        id = d.pop("id")

        value = d.pop("value")

        order = d.pop("order")

        is_correct = d.pop("isCorrect")

        def _parse_recommendation(data: object) -> None | str:
            if data is None:
                return data
            return cast(None | str, data)

        recommendation = _parse_recommendation(d.pop("recommendation"))

        question_item_option = cls(
            id=id,
            value=value,
            order=order,
            is_correct=is_correct,
            recommendation=recommendation,
        )

        return question_item_option
