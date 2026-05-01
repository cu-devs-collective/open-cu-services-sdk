from __future__ import annotations

from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar

from attrs import define as _attrs_define

if TYPE_CHECKING:
    from ..models.course_summary_item import CourseSummaryItem
    from ..models.paging import Paging


T = TypeVar("T", bound="ListStudentCoursesResponse")


@_attrs_define
class ListStudentCoursesResponse:
    """
    Attributes:
        items (list[CourseSummaryItem]):
        paging (Paging):
    """

    items: list[CourseSummaryItem]
    paging: Paging

    def to_dict(self) -> dict[str, Any]:
        items = []
        for items_item_data in self.items:
            items_item = items_item_data.to_dict()
            items.append(items_item)

        paging = self.paging.to_dict()

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "items": items,
                "paging": paging,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        from ..models.course_summary_item import CourseSummaryItem
        from ..models.paging import Paging

        d = dict(src_dict)
        items = []
        _items = d.pop("items")
        for items_item_data in _items:
            items_item = CourseSummaryItem.from_dict(items_item_data)

            items.append(items_item)

        paging = Paging.from_dict(d.pop("paging"))

        list_student_courses_response = cls(
            items=items,
            paging=paging,
        )

        return list_student_courses_response
