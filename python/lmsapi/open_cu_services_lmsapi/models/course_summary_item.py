from __future__ import annotations

import datetime
from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar, cast

from attrs import define as _attrs_define
from dateutil.parser import isoparse

from ..models.course_category import CourseCategory
from ..models.course_category_cover import CourseCategoryCover
from ..models.publication_state import PublicationState

if TYPE_CHECKING:
    from ..models.course_settings import CourseSettings


T = TypeVar("T", bound="CourseSummaryItem")


@_attrs_define
class CourseSummaryItem:
    """Summary information about a course, used for course listing.

    Attributes:
        id (int): Numeric identifier of the course. Example: 897.
        name (str): Course name. Example: Английский язык 204S4.
        state (PublicationState): Publication state of an item. Example: published.
        publish_date (datetime.datetime | None): Scheduled item publication timestamp, if value is not null. Example:
            2026-01-26T07:00:00+00:00.
        published_at (datetime.datetime | None): Actual item publication timestamp. Example:
            2026-01-26T07:00:44.919045+00:00.
        settings (CourseSettings): Course settings.
        subject_id (int | None): Identifier of the subject this course belongs to, if value is not null.
             Example: 32.
        is_archived (bool): Indicates if the course is archived.
        category (CourseCategory): Category to which the course belongs to. Example: general.
        category_cover (CourseCategoryCover): Course card icon style identifier. Example: symmetricCircles.
    """

    id: int
    name: str
    state: PublicationState
    publish_date: datetime.datetime | None
    published_at: datetime.datetime | None
    settings: CourseSettings
    subject_id: int | None
    is_archived: bool
    category: CourseCategory
    category_cover: CourseCategoryCover

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

        settings = self.settings.to_dict()

        subject_id: int | None
        subject_id = self.subject_id

        is_archived = self.is_archived

        category = self.category.value

        category_cover = self.category_cover.value

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "id": id,
                "name": name,
                "state": state,
                "publishDate": publish_date,
                "publishedAt": published_at,
                "settings": settings,
                "subjectId": subject_id,
                "isArchived": is_archived,
                "category": category,
                "categoryCover": category_cover,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        from ..models.course_settings import CourseSettings

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

        settings = CourseSettings.from_dict(d.pop("settings"))

        def _parse_subject_id(data: object) -> int | None:
            if data is None:
                return data
            return cast(int | None, data)

        subject_id = _parse_subject_id(d.pop("subjectId"))

        is_archived = d.pop("isArchived")

        category = CourseCategory(d.pop("category"))

        category_cover = CourseCategoryCover(d.pop("categoryCover"))

        course_summary_item = cls(
            id=id,
            name=name,
            state=state,
            publish_date=publish_date,
            published_at=published_at,
            settings=settings,
            subject_id=subject_id,
            is_archived=is_archived,
            category=category,
            category_cover=category_cover,
        )

        return course_summary_item
