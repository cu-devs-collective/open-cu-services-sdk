from __future__ import annotations

import datetime
from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar, cast

from attrs import define as _attrs_define
from dateutil.parser import isoparse

from ..models.publication_state import PublicationState

if TYPE_CHECKING:
    from ..models.longread_item import LongreadItem


T = TypeVar("T", bound="CourseThemeItem")


@_attrs_define
class CourseThemeItem:
    """Course theme is a unit, which is typically a weekly module of longread IDs and exercise items.

    Attributes:
        id (int): Numeric identifier of the course theme. Example: 6663.
        name (str): Course theme name shown on the course view in LMS.
             Example: Силлабус.
        order (int): Listing order determining the item's line position in the LMS, lower values come first.
             Example: 1.
        state (PublicationState): Publication state of an item. Example: published.
        publish_date (datetime.datetime | None): Scheduled item publication timestamp, if value is not null. Example:
            2026-01-26T07:00:00+00:00.
        published_at (datetime.datetime | None): Actual item publication timestamp. Example:
            2026-01-26T07:00:44.919045+00:00.
        longreads (list[LongreadItem]):
    """

    id: int
    name: str
    order: int
    state: PublicationState
    publish_date: datetime.datetime | None
    published_at: datetime.datetime | None
    longreads: list[LongreadItem]

    def to_dict(self) -> dict[str, Any]:
        id = self.id

        name = self.name

        order = self.order

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

        longreads = []
        for longreads_item_data in self.longreads:
            longreads_item = longreads_item_data.to_dict()
            longreads.append(longreads_item)

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "id": id,
                "name": name,
                "order": order,
                "state": state,
                "publishDate": publish_date,
                "publishedAt": published_at,
                "longreads": longreads,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        from ..models.longread_item import LongreadItem

        d = dict(src_dict)
        id = d.pop("id")

        name = d.pop("name")

        order = d.pop("order")

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

        longreads = []
        _longreads = d.pop("longreads")
        for longreads_item_data in _longreads:
            longreads_item = LongreadItem.from_dict(longreads_item_data)

            longreads.append(longreads_item)

        course_theme_item = cls(
            id=id,
            name=name,
            order=order,
            state=state,
            publish_date=publish_date,
            published_at=published_at,
            longreads=longreads,
        )

        return course_theme_item
