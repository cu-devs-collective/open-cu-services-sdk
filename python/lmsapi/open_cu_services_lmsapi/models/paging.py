from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar

from attrs import define as _attrs_define

T = TypeVar("T", bound="Paging")


@_attrs_define
class Paging:
    """
    Attributes:
        limit (int):  Example: 25.
        offset (int):
        total_count (int):  Example: 1.
    """

    limit: int
    offset: int
    total_count: int

    def to_dict(self) -> dict[str, Any]:
        limit = self.limit

        offset = self.offset

        total_count = self.total_count

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "limit": limit,
                "offset": offset,
                "totalCount": total_count,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        limit = d.pop("limit")

        offset = d.pop("offset")

        total_count = d.pop("totalCount")

        paging = cls(
            limit=limit,
            offset=offset,
            total_count=total_count,
        )

        return paging
