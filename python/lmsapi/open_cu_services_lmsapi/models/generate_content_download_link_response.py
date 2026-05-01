from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar

from attrs import define as _attrs_define

T = TypeVar("T", bound="GenerateContentDownloadLinkResponse")


@_attrs_define
class GenerateContentDownloadLinkResponse:
    """
    Attributes:
        url (str): S3-compatible temporary presigned URL for file object to download.
             Example: https://storage.yandexcloud.net/...?AWSAccessKeyId=abcdef&Expires=1777680299&Signature=ghijkl.
    """

    url: str

    def to_dict(self) -> dict[str, Any]:
        url = self.url

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "url": url,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        url = d.pop("url")

        generate_content_download_link_response = cls(
            url=url,
        )

        return generate_content_download_link_response
