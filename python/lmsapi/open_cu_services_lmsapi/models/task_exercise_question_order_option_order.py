from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar

from attrs import define as _attrs_define

T = TypeVar("T", bound="TaskExerciseQuestionOrderOptionOrder")


@_attrs_define
class TaskExerciseQuestionOrderOptionOrder:
    """
    Attributes:
        option_id (int): Numeric identifier of the question option. Example: 471.
        order (int): Listing order determining the item's line position in the LMS, lower values come first.
             Example: 1.
    """

    option_id: int
    order: int

    def to_dict(self) -> dict[str, Any]:
        option_id = self.option_id

        order = self.order

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "optionId": option_id,
                "order": order,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        option_id = d.pop("optionId")

        order = d.pop("order")

        task_exercise_question_order_option_order = cls(
            option_id=option_id,
            order=order,
        )

        return task_exercise_question_order_option_order
