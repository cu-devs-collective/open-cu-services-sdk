from __future__ import annotations

from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar

from attrs import define as _attrs_define

if TYPE_CHECKING:
    from ..models.base_bad_request_error_errors import BaseBadRequestErrorErrors


T = TypeVar("T", bound="BaseBadRequestError")


@_attrs_define
class BaseBadRequestError:
    """Base error for Bad Request status.

    Example:
        {'title': 'One or more validation errors occurred.', 'status': 400, 'errors': {'courseId': ["The value 'invalid-
            value-example' is not valid."]}}

    Attributes:
        title (str): Short, human-readable summary of the problem type. Example: Unauthorized.
        status (int): HTTP status code. Example: 401.
        errors (BaseBadRequestErrorErrors): Field-level validation errors keyed by property name. Example: {'courseId':
            ["The value 'invalid-value-example' is not valid."]}.
    """

    title: str
    status: int
    errors: BaseBadRequestErrorErrors

    def to_dict(self) -> dict[str, Any]:
        title = self.title

        status = self.status

        errors = self.errors.to_dict()

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "title": title,
                "status": status,
                "errors": errors,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        from ..models.base_bad_request_error_errors import BaseBadRequestErrorErrors

        d = dict(src_dict)
        title = d.pop("title")

        status = d.pop("status")

        errors = BaseBadRequestErrorErrors.from_dict(d.pop("errors"))

        base_bad_request_error = cls(
            title=title,
            status=status,
            errors=errors,
        )

        return base_bad_request_error
