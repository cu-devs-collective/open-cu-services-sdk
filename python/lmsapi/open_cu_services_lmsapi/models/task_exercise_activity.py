from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar

from attrs import define as _attrs_define

T = TypeVar("T", bound="TaskExerciseActivity")


@_attrs_define
class TaskExerciseActivity:
    """
    Example:
        {'id': 1880, 'name': 'Домашние задания', 'weight': 0.2, 'isLateDaysEnabled': True}

    Attributes:
        id (int): Numeric identifier of the activity item. Example: 2161.
        name (str): Activity name. Example: Аудиторная работа на семинарах.
        weight (float): Weight coefficient for every single activity by activity name, used in the course grade formula
            to calculate the overall semester score.
             Example: 0.25.
        is_late_days_enabled (bool): Indicates if late days can be used for this activity. Example: True.
    """

    id: int
    name: str
    weight: float
    is_late_days_enabled: bool

    def to_dict(self) -> dict[str, Any]:
        id = self.id

        name = self.name

        weight = self.weight

        is_late_days_enabled = self.is_late_days_enabled

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "id": id,
                "name": name,
                "weight": weight,
                "isLateDaysEnabled": is_late_days_enabled,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        id = d.pop("id")

        name = d.pop("name")

        weight = d.pop("weight")

        is_late_days_enabled = d.pop("isLateDaysEnabled")

        task_exercise_activity = cls(
            id=id,
            name=name,
            weight=weight,
            is_late_days_enabled=is_late_days_enabled,
        )

        return task_exercise_activity
