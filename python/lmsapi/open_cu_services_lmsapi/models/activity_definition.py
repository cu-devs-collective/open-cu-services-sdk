from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar

from attrs import define as _attrs_define

T = TypeVar("T", bound="ActivityDefinition")


@_attrs_define
class ActivityDefinition:
    """Activity definition shared across exercises. Multiple exercises reference the same activity definition.

    Attributes:
        id (int): Numeric identifier of the activity item. Example: 2161.
        name (str): Activity name. Example: Аудиторная работа на семинарах.
        weight (float): Weight coefficient for every single activity by activity name, used in the course grade formula
            to calculate the overall semester score.
             Example: 0.25.
    """

    id: int
    name: str
    weight: float

    def to_dict(self) -> dict[str, Any]:
        id = self.id

        name = self.name

        weight = self.weight

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "id": id,
                "name": name,
                "weight": weight,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        id = d.pop("id")

        name = d.pop("name")

        weight = d.pop("weight")

        activity_definition = cls(
            id=id,
            name=name,
            weight=weight,
        )

        return activity_definition
