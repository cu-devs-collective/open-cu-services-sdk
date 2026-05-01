from __future__ import annotations

import datetime
from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar, cast
from uuid import UUID

from attrs import define as _attrs_define
from dateutil.parser import isoparse

from ..models.longread_material_discriminator import LongreadMaterialDiscriminator
from ..models.longread_material_type import LongreadMaterialType
from ..models.longread_material_view_type import LongreadMaterialViewType
from ..models.publication_state import PublicationState
from ..models.video_platform_state import VideoPlatformState

if TYPE_CHECKING:
    from ..models.x_re_property_incomplete_only_empty_array_observed_item import (
        XRePropertyIncompleteOnlyEmptyArrayObservedItem,
    )


T = TypeVar("T", bound="LongreadVideoPlatformMaterialItem")


@_attrs_define
class LongreadVideoPlatformMaterialItem:
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
        name (str): Embedded video title. Example: Прожарка резюме и HR-собеседования.
        description (str): Embedded video description.
        video_id (UUID): Video identifier in UUID format. Example: 89b9757f-3f1d-4e9b-8f50-4c7f99617ff4.
        timecodes (list[XRePropertyIncompleteOnlyEmptyArrayObservedItem]): Value only seen as empty array.
        publish_date (datetime.datetime | None): Scheduled item publication timestamp, if value is not null. Example:
            2026-01-26T07:00:00+00:00.
        video_state (VideoPlatformState): Video state. Example: ready.
        url (str):  Example: https://vp-embed.example.com/?token=ey....
    """

    discriminator: LongreadMaterialDiscriminator
    state: PublicationState
    view_type: LongreadMaterialViewType
    type_: LongreadMaterialType
    id: int
    order: int
    name: str
    description: str
    video_id: UUID
    timecodes: list[XRePropertyIncompleteOnlyEmptyArrayObservedItem]
    publish_date: datetime.datetime | None
    video_state: VideoPlatformState
    url: str

    def to_dict(self) -> dict[str, Any]:
        discriminator = self.discriminator.value

        state = self.state.value

        view_type = self.view_type.value

        type_ = self.type_.value

        id = self.id

        order = self.order

        name = self.name

        description = self.description

        video_id = str(self.video_id)

        timecodes = []
        for componentsschemas_x_re_property_incomplete_only_empty_array_observed_item_data in self.timecodes:
            componentsschemas_x_re_property_incomplete_only_empty_array_observed_item = (
                componentsschemas_x_re_property_incomplete_only_empty_array_observed_item_data.to_dict()
            )
            timecodes.append(componentsschemas_x_re_property_incomplete_only_empty_array_observed_item)

        publish_date: None | str
        if isinstance(self.publish_date, datetime.datetime):
            publish_date = self.publish_date.isoformat()
        else:
            publish_date = self.publish_date

        video_state = self.video_state.value

        url = self.url

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "discriminator": discriminator,
                "state": state,
                "viewType": view_type,
                "type": type_,
                "id": id,
                "order": order,
                "name": name,
                "description": description,
                "videoId": video_id,
                "timecodes": timecodes,
                "publishDate": publish_date,
                "videoState": video_state,
                "url": url,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        from ..models.x_re_property_incomplete_only_empty_array_observed_item import (
            XRePropertyIncompleteOnlyEmptyArrayObservedItem,
        )

        d = dict(src_dict)
        discriminator = LongreadMaterialDiscriminator(d.pop("discriminator"))

        state = PublicationState(d.pop("state"))

        view_type = LongreadMaterialViewType(d.pop("viewType"))

        type_ = LongreadMaterialType(d.pop("type"))

        id = d.pop("id")

        order = d.pop("order")

        name = d.pop("name")

        description = d.pop("description")

        video_id = UUID(d.pop("videoId"))

        timecodes = []
        _timecodes = d.pop("timecodes")
        for componentsschemas_x_re_property_incomplete_only_empty_array_observed_item_data in _timecodes:
            componentsschemas_x_re_property_incomplete_only_empty_array_observed_item = (
                XRePropertyIncompleteOnlyEmptyArrayObservedItem.from_dict(
                    componentsschemas_x_re_property_incomplete_only_empty_array_observed_item_data
                )
            )

            timecodes.append(componentsschemas_x_re_property_incomplete_only_empty_array_observed_item)

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

        video_state = VideoPlatformState(d.pop("videoState"))

        url = d.pop("url")

        longread_video_platform_material_item = cls(
            discriminator=discriminator,
            state=state,
            view_type=view_type,
            type_=type_,
            id=id,
            order=order,
            name=name,
            description=description,
            video_id=video_id,
            timecodes=timecodes,
            publish_date=publish_date,
            video_state=video_state,
            url=url,
        )

        return longread_video_platform_material_item
