from __future__ import annotations

import datetime
from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar, cast

from attrs import define as _attrs_define
from dateutil.parser import isoparse

from ..models.publication_state import PublicationState

if TYPE_CHECKING:
    from ..models.course_settings import CourseSettings
    from ..models.course_theme_item import CourseThemeItem


T = TypeVar("T", bound="CourseOverviewByIdResponse")


@_attrs_define
class CourseOverviewByIdResponse:
    """
    Attributes:
        id (int): Numeric identifier of the course. Example: 897.
        name (str): Course name. Example: Английский язык 204S4.
        is_archived (bool): Indicates if the course is archived.
        state (PublicationState): Publication state of an item. Example: published.
        publish_date (datetime.datetime | None): Scheduled item publication timestamp, if value is not null. Example:
            2026-01-26T07:00:00+00:00.
        published_at (datetime.datetime | None): Actual item publication timestamp. Example:
            2026-01-26T07:00:44.919045+00:00.
        settings (CourseSettings): Course settings.
        themes (list[CourseThemeItem]):
    """

    id: int
    name: str
    is_archived: bool
    state: PublicationState
    publish_date: datetime.datetime | None
    published_at: datetime.datetime | None
    settings: CourseSettings
    themes: list[CourseThemeItem]

    def to_dict(self) -> dict[str, Any]:
        id = self.id

        name = self.name

        is_archived = self.is_archived

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

        themes = []
        for themes_item_data in self.themes:
            themes_item = themes_item_data.to_dict()
            themes.append(themes_item)

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "id": id,
                "name": name,
                "isArchived": is_archived,
                "state": state,
                "publishDate": publish_date,
                "publishedAt": published_at,
                "settings": settings,
                "themes": themes,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        from ..models.course_settings import CourseSettings
        from ..models.course_theme_item import CourseThemeItem

        d = dict(src_dict)
        id = d.pop("id")

        name = d.pop("name")

        is_archived = d.pop("isArchived")

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

        themes = []
        _themes = d.pop("themes")
        for themes_item_data in _themes:
            themes_item = CourseThemeItem.from_dict(themes_item_data)

            themes.append(themes_item)

        course_overview_by_id_response = cls(
            id=id,
            name=name,
            is_archived=is_archived,
            state=state,
            publish_date=publish_date,
            published_at=published_at,
            settings=settings,
            themes=themes,
        )

        return course_overview_by_id_response
