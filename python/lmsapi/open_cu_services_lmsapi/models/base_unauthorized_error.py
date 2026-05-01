from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar

from attrs import define as _attrs_define

from ..types import UNSET, Unset

T = TypeVar("T", bound="BaseUnauthorizedError")


@_attrs_define
class BaseUnauthorizedError:
    """Base error for Unauthorized status.

    Example:
        {'type': 'https://httpstatuscodes.io/401', 'title': 'Unauthorized', 'status': 401, 'traceId':
            '00-00000000000000000000000000000000-0000000000000000-01'}

    Attributes:
        title (str): Short, human-readable summary of the problem type. Example: Unauthorized.
        status (int): HTTP status code. Example: 401.
        trace_id (str): W3C Trace Context traceparent value for backend to correlate requests across services.
             Example: 00-00000000000000000000000000000000-0000000000000000-01.
        type_ (str | Unset):  Example: https://httpstatuscodes.io/401.
    """

    title: str
    status: int
    trace_id: str
    type_: str | Unset = UNSET

    def to_dict(self) -> dict[str, Any]:
        title = self.title

        status = self.status

        trace_id = self.trace_id

        type_ = self.type_

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

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        title = d.pop("title")

        status = d.pop("status")

        trace_id = d.pop("traceId")

        type_ = d.pop("type", UNSET)

        base_unauthorized_error = cls(
            title=title,
            status=status,
            trace_id=trace_id,
            type_=type_,
        )

        return base_unauthorized_error
