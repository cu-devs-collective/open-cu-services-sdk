from __future__ import annotations

from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar

from attrs import define as _attrs_define

if TYPE_CHECKING:
    from ..models.task_exercise_question_order_option_order import TaskExerciseQuestionOrderOptionOrder


T = TypeVar("T", bound="TaskExerciseQuestionOrder")


@_attrs_define
class TaskExerciseQuestionOrder:
    """
    Attributes:
        question_id (int): Numeric identifier of the question. Example: 766.
        order (int): Listing order determining the item's line position in the LMS, lower values come first.
             Example: 1.
        option_orders (list[TaskExerciseQuestionOrderOptionOrder]):
    """

    question_id: int
    order: int
    option_orders: list[TaskExerciseQuestionOrderOptionOrder]

    def to_dict(self) -> dict[str, Any]:
        question_id = self.question_id

        order = self.order

        option_orders = []
        for option_orders_item_data in self.option_orders:
            option_orders_item = option_orders_item_data.to_dict()
            option_orders.append(option_orders_item)

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "questionId": question_id,
                "order": order,
                "optionOrders": option_orders,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        from ..models.task_exercise_question_order_option_order import TaskExerciseQuestionOrderOptionOrder

        d = dict(src_dict)
        question_id = d.pop("questionId")

        order = d.pop("order")

        option_orders = []
        _option_orders = d.pop("optionOrders")
        for option_orders_item_data in _option_orders:
            option_orders_item = TaskExerciseQuestionOrderOptionOrder.from_dict(option_orders_item_data)

            option_orders.append(option_orders_item)

        task_exercise_question_order = cls(
            question_id=question_id,
            order=order,
            option_orders=option_orders,
        )

        return task_exercise_question_order
