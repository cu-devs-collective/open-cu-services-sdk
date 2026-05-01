from __future__ import annotations

import datetime
from collections.abc import Mapping
from typing import Any, TypeVar, cast

from attrs import define as _attrs_define
from dateutil.parser import isoparse

from ..models.course_category import CourseCategory
from ..models.publication_state import PublicationState

T = TypeVar("T", bound="CourseThemeSummaryByIdResponse")


@_attrs_define
class CourseThemeSummaryByIdResponse:
    """Summary information about a course theme by its ID.

    Attributes:
        id (int): Numeric identifier of the course theme. Example: 6663.
        name (str): Course theme name shown on the course view in LMS.
             Example: Силлабус.
        state (PublicationState): Publication state of an item. Example: published.
        publish_date (datetime.datetime | None): Scheduled item publication timestamp, if value is not null. Example:
            2026-01-26T07:00:00+00:00.
        published_at (datetime.datetime | None): Actual item publication timestamp. Example:
            2026-01-26T07:00:44.919045+00:00.
        order (int): Listing order determining the item's line position in the LMS, lower values come first.
             Example: 1.
        category (CourseCategory): Category to which the course belongs to. Example: general.
        category_cover (int): Numeric identifier of the category cover.
    """

    id: int
    name: str
    state: PublicationState
    publish_date: datetime.datetime | None
    published_at: datetime.datetime | None
    order: int
    category: CourseCategory
    category_cover: int

    def to_dict(self) -> dict[str, Any]:
        id = self.id

        name = self.name

        state = self.state.value

        publish_date: None | str
        if isinstance(self.publish_date, datetime.datetime):
            publish_date = self.publish_date.isoformat()
        else:
            publish_date = self.publish_date

        published_at: None | str
        if isinstance(self.published_at, datetime.datetime):
            published_at = self.published_at.isoformat()
        else:
            published_at = self.published_at

        order = self.order

        category = self.category.value

        category_cover = self.category_cover

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "id": id,
                "name": name,
                "state": state,
                "publishDate": publish_date,
                "publishedAt": published_at,
                "order": order,
                "category": category,
                "categoryCover": category_cover,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        id = d.pop("id")

        name = d.pop("name")

        state = PublicationState(d.pop("state"))

        def _parse_publish_date(data: object) -> datetime.datetime | None:
            if data is None:
                return data
            try:
                if not isinstance(data, str):
                    raise TypeError()
                componentsschemas_publish_date_type_0 = isoparse(data)

                return componentsschemas_publish_date_type_0
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            return cast(datetime.datetime | None, data)

        publish_date = _parse_publish_date(d.pop("publishDate"))

        def _parse_published_at(data: object) -> datetime.datetime | None:
            if data is None:
                return data
            try:
                if not isinstance(data, str):
                    raise TypeError()
                componentsschemas_published_at_type_0 = isoparse(data)

                return componentsschemas_published_at_type_0
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            return cast(datetime.datetime | None, data)

        published_at = _parse_published_at(d.pop("publishedAt"))

        order = d.pop("order")

        category = CourseCategory(d.pop("category"))

        category_cover = d.pop("categoryCover")

        course_theme_summary_by_id_response = cls(
            id=id,
            name=name,
            state=state,
            publish_date=publish_date,
            published_at=published_at,
            order=order,
            category=category,
            category_cover=category_cover,
        )

        return course_theme_summary_by_id_response
