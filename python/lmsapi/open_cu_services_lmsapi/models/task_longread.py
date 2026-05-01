from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar

from attrs import define as _attrs_define

T = TypeVar("T", bound="TaskLongread")


@_attrs_define
class TaskLongread:
    """
    Attributes:
        id (int): Numeric identifier of the longread item. Example: 12707.
        name (str): Longread name shown as the header in LMS. Example: Ссылка на силлабус.
    """

    id: int
    name: str

    def to_dict(self) -> dict[str, Any]:
        id = self.id

        name = self.name

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "id": id,
                "name": name,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        id = d.pop("id")

        name = d.pop("name")

        task_longread = cls(
            id=id,
            name=name,
        )

        return task_longread
