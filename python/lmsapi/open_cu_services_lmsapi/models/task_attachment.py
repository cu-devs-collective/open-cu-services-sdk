from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar, cast

from attrs import define as _attrs_define

from ..models.file_media_type import FileMediaType

T = TypeVar("T", bound="TaskAttachment")


@_attrs_define
class TaskAttachment:
    """
    Example:
        {'name': '6 неделя_Стресс-менеджмент_Шаблон Моя Мотивация.xlsx', 'filename': 'exercises/60068/6 неделя_Стресс-
            менеджмент_Шаблон Моя Мотивация.xlsx', 'mediaType': 'file', 'length': 403448, 'version': '01175dc5'}

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

        task_attachment = cls(
            name=name,
            filename=filename,
            media_type=media_type,
            length=length,
            version=version,
        )

        return task_attachment
