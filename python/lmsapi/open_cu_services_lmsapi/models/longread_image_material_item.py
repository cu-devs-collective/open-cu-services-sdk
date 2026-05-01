from __future__ import annotations

import datetime
from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar, cast

from attrs import define as _attrs_define
from dateutil.parser import isoparse

from ..models.file_media_type import FileMediaType
from ..models.longread_material_discriminator import LongreadMaterialDiscriminator
from ..models.longread_material_type import LongreadMaterialType
from ..models.longread_material_view_type import LongreadMaterialViewType
from ..models.publication_state import PublicationState

if TYPE_CHECKING:
    from ..models.longread_material_content import LongreadMaterialContent


T = TypeVar("T", bound="LongreadImageMaterialItem")


@_attrs_define
class LongreadImageMaterialItem:
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
        image_scale (int | None): Image scale. Example: 100.
        media_type (FileMediaType): Media type attachment identifier. Example: file.
        filename (str): File object path in storage. Example: longreads/16770/English_204S4-C_SW_Week 6.pdf.
        version (None | str): Material content revision identifier. Example: 0104f8da.
        length (int): Material payload size in bytes. Example: 1701642.
        publish_date (datetime.datetime | None): Scheduled item publication timestamp, if value is not null. Example:
            2026-01-26T07:00:00+00:00.
        published_at (datetime.datetime | None): Actual item publication timestamp. Example:
            2026-01-26T07:00:44.919045+00:00.
        content (LongreadMaterialContent):
    """

    discriminator: LongreadMaterialDiscriminator
    state: PublicationState
    view_type: LongreadMaterialViewType
    type_: LongreadMaterialType
    id: int
    order: int
    image_scale: int | None
    media_type: FileMediaType
    filename: str
    version: None | str
    length: int
    publish_date: datetime.datetime | None
    published_at: datetime.datetime | None
    content: LongreadMaterialContent

    def to_dict(self) -> dict[str, Any]:
        discriminator = self.discriminator.value

        state = self.state.value

        view_type = self.view_type.value

        type_ = self.type_.value

        id = self.id

        order = self.order

        image_scale: int | None
        image_scale = self.image_scale

        media_type = self.media_type.value

        filename = self.filename

        version: None | str
        version = self.version

        length = self.length

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

        content = self.content.to_dict()

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "discriminator": discriminator,
                "state": state,
                "viewType": view_type,
                "type": type_,
                "id": id,
                "order": order,
                "imageScale": image_scale,
                "mediaType": media_type,
                "filename": filename,
                "version": version,
                "length": length,
                "publishDate": publish_date,
                "publishedAt": published_at,
                "content": content,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        from ..models.longread_material_content import LongreadMaterialContent

        d = dict(src_dict)
        discriminator = LongreadMaterialDiscriminator(d.pop("discriminator"))

        state = PublicationState(d.pop("state"))

        view_type = LongreadMaterialViewType(d.pop("viewType"))

        type_ = LongreadMaterialType(d.pop("type"))

        id = d.pop("id")

        order = d.pop("order")

        def _parse_image_scale(data: object) -> int | None:
            if data is None:
                return data
            return cast(int | None, data)

        image_scale = _parse_image_scale(d.pop("imageScale"))

        media_type = FileMediaType(d.pop("mediaType"))

        filename = d.pop("filename")

        def _parse_version(data: object) -> None | str:
            if data is None:
                return data
            return cast(None | str, data)

        version = _parse_version(d.pop("version"))

        length = d.pop("length")

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

        content = LongreadMaterialContent.from_dict(d.pop("content"))

        longread_image_material_item = cls(
            discriminator=discriminator,
            state=state,
            view_type=view_type,
            type_=type_,
            id=id,
            order=order,
            image_scale=image_scale,
            media_type=media_type,
            filename=filename,
            version=version,
            length=length,
            publish_date=publish_date,
            published_at=published_at,
            content=content,
        )

        return longread_image_material_item
