from __future__ import annotations

import datetime
from collections.abc import Mapping
from typing import Any, TypeVar, cast

from attrs import define as _attrs_define
from dateutil.parser import isoparse

from ..models.longread_material_discriminator import LongreadMaterialDiscriminator
from ..models.longread_material_type import LongreadMaterialType
from ..models.longread_material_view_type import LongreadMaterialViewType
from ..models.publication_state import PublicationState

T = TypeVar("T", bound="LongreadMarkdownMaterialItem")


@_attrs_define
class LongreadMarkdownMaterialItem:
    """
    Attributes:
        discriminator (LongreadMaterialDiscriminator): Material block discriminator used by LMS frontend. Example:
            markdown.
        state (PublicationState): Publication state of an item. Example: published.
        view_type (LongreadMaterialViewType): View renderer type used by LMS frontend. Example: ngxMarkdown.
        type_ (LongreadMaterialType): Material block type identifier. Example: markdown.
        id (int): Numeric identifier of a longread material block. Example: 54041.
        order (int): Listing order determining the item's line position in the LMS, lower values come first.
             Example: 1.
        view_content (None | str): JSON-serialized markdown content rendered in LMS. Example:
            {"value":"<p>...</p>","isTuiEditor":true}.
        publish_date (datetime.datetime | None): Scheduled item publication timestamp, if value is not null. Example:
            2026-01-26T07:00:00+00:00.
        published_at (datetime.datetime | None): Actual item publication timestamp. Example:
            2026-01-26T07:00:44.919045+00:00.
    """

    discriminator: LongreadMaterialDiscriminator
    state: PublicationState
    view_type: LongreadMaterialViewType
    type_: LongreadMaterialType
    id: int
    order: int
    view_content: None | str
    publish_date: datetime.datetime | None
    published_at: datetime.datetime | None

    def to_dict(self) -> dict[str, Any]:
        discriminator = self.discriminator.value

        state = self.state.value

        view_type = self.view_type.value

        type_ = self.type_.value

        id = self.id

        order = self.order

        view_content: None | str
        view_content = self.view_content

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

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "discriminator": discriminator,
                "state": state,
                "viewType": view_type,
                "type": type_,
                "id": id,
                "order": order,
                "viewContent": view_content,
                "publishDate": publish_date,
                "publishedAt": published_at,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        discriminator = LongreadMaterialDiscriminator(d.pop("discriminator"))

        state = PublicationState(d.pop("state"))

        view_type = LongreadMaterialViewType(d.pop("viewType"))

        type_ = LongreadMaterialType(d.pop("type"))

        id = d.pop("id")

        order = d.pop("order")

        def _parse_view_content(data: object) -> None | str:
            if data is None:
                return data
            return cast(None | str, data)

        view_content = _parse_view_content(d.pop("viewContent"))

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

        longread_markdown_material_item = cls(
            discriminator=discriminator,
            state=state,
            view_type=view_type,
            type_=type_,
            id=id,
            order=order,
            view_content=view_content,
            publish_date=publish_date,
            published_at=published_at,
        )

        return longread_markdown_material_item
