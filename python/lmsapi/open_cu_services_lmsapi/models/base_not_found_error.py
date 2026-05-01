from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar

from attrs import define as _attrs_define

from ..types import UNSET, Unset

T = TypeVar("T", bound="BaseNotFoundError")


@_attrs_define
class BaseNotFoundError:
    """Base error for Not Found status.

    Example:
        {'title': 'NotFound', 'status': 404, 'detail': 'Ресурс с идентификатором 1 не найден', 'instance': '/courses/1',
            'entityId': 1, 'traceId': '00-00000000000000000000000000000000-0000000000000000-01'}

    Attributes:
        title (str): Short, human-readable summary of the problem type. Example: Unauthorized.
        status (int): HTTP status code. Example: 401.
        trace_id (str): W3C Trace Context traceparent value for backend to correlate requests across services.
             Example: 00-00000000000000000000000000000000-0000000000000000-01.
        detail (str | Unset): Details of the error. Example: Ресурс с идентификатором 1 не найден.
        instance (str | Unset): Relative request path without service prefix where error occurred.
             Example: /courses/1.
        entity_id (int | Unset): ID of the entity that was not found. Example: 1.
    """

    title: str
    status: int
    trace_id: str
    detail: str | Unset = UNSET
    instance: str | Unset = UNSET
    entity_id: int | Unset = UNSET

    def to_dict(self) -> dict[str, Any]:
        title = self.title

        status = self.status

        trace_id = self.trace_id

        detail = self.detail

        instance = self.instance

        entity_id = self.entity_id

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "title": title,
                "status": status,
                "traceId": trace_id,
            }
        )
        if detail is not UNSET:
            field_dict["detail"] = detail
        if instance is not UNSET:
            field_dict["instance"] = instance
        if entity_id is not UNSET:
            field_dict["entityId"] = entity_id

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        title = d.pop("title")

        status = d.pop("status")

        trace_id = d.pop("traceId")

        detail = d.pop("detail", UNSET)

        instance = d.pop("instance", UNSET)

        entity_id = d.pop("entityId", UNSET)

        base_not_found_error = cls(
            title=title,
            status=status,
            trace_id=trace_id,
            detail=detail,
            instance=instance,
            entity_id=entity_id,
        )

        return base_not_found_error
