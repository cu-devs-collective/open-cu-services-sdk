from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar

from attrs import define as _attrs_define

from ..types import UNSET, Unset

T = TypeVar("T", bound="BaseForbiddenError")


@_attrs_define
class BaseForbiddenError:
    """Base error for Forbidden error.

    Example:
        {'title': 'Forbidden', 'status': 403, 'detail': 'Нет доступа к ресурсу ', 'instance': '/content/download-
            link?filename=example', 'traceId': '00-00000000000000000000000000000000-0000000000000000-01'}

    Attributes:
        title (str): Short, human-readable summary of the problem type. Example: Unauthorized.
        status (int): HTTP status code. Example: 401.
        trace_id (str): W3C Trace Context traceparent value for backend to correlate requests across services.
             Example: 00-00000000000000000000000000000000-0000000000000000-01.
        type_ (str | Unset):  Example: https://httpstatuscodes.io/401.
        detail (str | Unset): Details of the error. Example: Ресурс с идентификатором 1 не найден.
        instance (str | Unset): Relative request path without service prefix where error occurred.
             Example: /courses/1.
    """

    title: str
    status: int
    trace_id: str
    type_: str | Unset = UNSET
    detail: str | Unset = UNSET
    instance: str | Unset = UNSET

    def to_dict(self) -> dict[str, Any]:
        title = self.title

        status = self.status

        trace_id = self.trace_id

        type_ = self.type_

        detail = self.detail

        instance = self.instance

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "title": title,
                "status": status,
                "traceId": trace_id,
            }
        )
        if type_ is not UNSET:
            field_dict["type"] = type_
        if detail is not UNSET:
            field_dict["detail"] = detail
        if instance is not UNSET:
            field_dict["instance"] = instance

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        title = d.pop("title")

        status = d.pop("status")

        trace_id = d.pop("traceId")

        type_ = d.pop("type", UNSET)

        detail = d.pop("detail", UNSET)

        instance = d.pop("instance", UNSET)

        base_forbidden_error = cls(
            title=title,
            status=status,
            trace_id=trace_id,
            type_=type_,
            detail=detail,
            instance=instance,
        )

        return base_forbidden_error
