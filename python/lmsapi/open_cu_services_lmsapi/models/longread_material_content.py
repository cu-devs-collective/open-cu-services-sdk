from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar, cast

from attrs import define as _attrs_define

from ..models.longread_material_media_type_upper import LongreadMaterialMediaTypeUpper

T = TypeVar("T", bound="LongreadMaterialContent")


@_attrs_define
class LongreadMaterialContent:
    """
    Attributes:
        name (str): File attachment display name shown in LMS. Example: English_204S4-C_SW_Week 6.pdf.
        filename (str): File object path in storage. Example: longreads/16770/English_204S4-C_SW_Week 6.pdf.
        media_type (LongreadMaterialMediaTypeUpper): Media type identifier in upper. Example: File.
        version (None | str): Material content revision identifier. Example: 0104f8da.
        length (int): Material payload size in bytes. Example: 1701642.
    """

    name: str
    filename: str
    media_type: LongreadMaterialMediaTypeUpper
    version: None | str
    length: int

    def to_dict(self) -> dict[str, Any]:
        name = self.name

        filename = self.filename

        media_type = self.media_type.value

        version: None | str
        version = self.version

        length = self.length

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "name": name,
                "filename": filename,
                "mediaType": media_type,
                "version": version,
                "length": length,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        name = d.pop("name")

        filename = d.pop("filename")

        media_type = LongreadMaterialMediaTypeUpper(d.pop("mediaType"))

        def _parse_version(data: object) -> None | str:
            if data is None:
                return data
            return cast(None | str, data)

        version = _parse_version(d.pop("version"))

        length = d.pop("length")

        longread_material_content = cls(
            name=name,
            filename=filename,
            media_type=media_type,
            version=version,
            length=length,
        )

        return longread_material_content
