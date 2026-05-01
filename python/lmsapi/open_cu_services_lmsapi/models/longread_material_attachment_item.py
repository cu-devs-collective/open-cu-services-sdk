from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar, cast

from attrs import define as _attrs_define

from ..models.file_media_type import FileMediaType

T = TypeVar("T", bound="LongreadMaterialAttachmentItem")


@_attrs_define
class LongreadMaterialAttachmentItem:
    """
    Attributes:
        name (str): File attachment display name shown in LMS. Example: English_204S4-C_SW_Week 6.pdf.
        filename (str): File object path in storage. Example: longreads/16770/English_204S4-C_SW_Week 6.pdf.
        media_type (FileMediaType): Media type attachment identifier. Example: file.
        length (int): Material payload size in bytes. Example: 1701642.
        version (None | str): Material content revision identifier. Example: 0104f8da.
    """

    name: str
    filename: str
    media_type: FileMediaType
    length: int
    version: None | str

    def to_dict(self) -> dict[str, Any]:
        name = self.name

        filename = self.filename

        media_type = self.media_type.value

        length = self.length

        version: None | str
        version = self.version

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "name": name,
                "filename": filename,
                "mediaType": media_type,
                "length": length,
                "version": version,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        name = d.pop("name")

        filename = d.pop("filename")

        media_type = FileMediaType(d.pop("mediaType"))

        length = d.pop("length")

        def _parse_version(data: object) -> None | str:
            if data is None:
                return data
            return cast(None | str, data)

        version = _parse_version(d.pop("version"))

        longread_material_attachment_item = cls(
            name=name,
            filename=filename,
            media_type=media_type,
            length=length,
            version=version,
        )

        return longread_material_attachment_item
