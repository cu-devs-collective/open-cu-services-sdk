from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar

from attrs import define as _attrs_define

T = TypeVar("T", bound="TaskCourse")


@_attrs_define
class TaskCourse:
    """
    Attributes:
        id (int): Numeric identifier of the course. Example: 897.
        name (str): Course name. Example: Английский язык 204S4.
        is_archived (bool): Indicates if the course is archived.
    """

    id: int
    name: str
    is_archived: bool

    def to_dict(self) -> dict[str, Any]:
        id = self.id

        name = self.name

        is_archived = self.is_archived

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "id": id,
                "name": name,
                "isArchived": is_archived,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        id = d.pop("id")

        name = d.pop("name")

        is_archived = d.pop("isArchived")

        task_course = cls(
            id=id,
            name=name,
            is_archived=is_archived,
        )

        return task_course
