from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar

from attrs import define as _attrs_define

T = TypeVar("T", bound="TaskCourseTheme")


@_attrs_define
class TaskCourseTheme:
    """
    Attributes:
        id (int): Numeric identifier of the course theme. Example: 6663.
        name (str): Course theme name shown on the course view in LMS.
             Example: Силлабус.
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

        task_course_theme = cls(
            id=id,
            name=name,
        )

        return task_course_theme
