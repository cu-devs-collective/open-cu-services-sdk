from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar

from attrs import define as _attrs_define
from attrs import field as _attrs_field

from ..types import UNSET, Unset

T = TypeVar("T", bound="BaseProblemError")


@_attrs_define
class BaseProblemError:
    """Base problem JSON error based from RFC 9457 with trace ID.

    Attributes:
        title (str): Short, human-readable summary of the problem type. Example: Unauthorized.
        status (int): HTTP status code. Example: 401.
        type_ (str | Unset):  Example: https://httpstatuscodes.io/401.
        trace_id (str | Unset): W3C Trace Context traceparent value for backend to correlate requests across services.
             Example: 00-00000000000000000000000000000000-0000000000000000-01.
    """

    title: str
    status: int
    type_: str | Unset = UNSET
    trace_id: str | Unset = UNSET
    additional_properties: dict[str, Any] = _attrs_field(init=False, factory=dict)

    def to_dict(self) -> dict[str, Any]:
        title = self.title

        status = self.status

        type_ = self.type_

        trace_id = self.trace_id

        field_dict: dict[str, Any] = {}
        field_dict.update(self.additional_properties)
        field_dict.update(
            {
                "title": title,
                "status": status,
            }
        )
        if type_ is not UNSET:
            field_dict["type"] = type_
        if trace_id is not UNSET:
            field_dict["traceId"] = trace_id

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        title = d.pop("title")

        status = d.pop("status")

        type_ = d.pop("type", UNSET)

        trace_id = d.pop("traceId", UNSET)

        base_problem_error = cls(
            title=title,
            status=status,
            type_=type_,
            trace_id=trace_id,
        )

        base_problem_error.additional_properties = d
        return base_problem_error

    @property
    def additional_keys(self) -> list[str]:
        return list(self.additional_properties.keys())

    def __getitem__(self, key: str) -> Any:
        return self.additional_properties[key]

    def __setitem__(self, key: str, value: Any) -> None:
        self.additional_properties[key] = value

    def __delitem__(self, key: str) -> None:
        del self.additional_properties[key]

    def __contains__(self, key: str) -> bool:
        return key in self.additional_properties
