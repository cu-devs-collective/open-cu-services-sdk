from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar, cast

from attrs import define as _attrs_define

T = TypeVar("T", bound="LongreadMaterialCoding")


@_attrs_define
class LongreadMaterialCoding:
    """
    Attributes:
        exercise_url (None | str): URL of coding exercise if configured.
    """

    exercise_url: None | str

    def to_dict(self) -> dict[str, Any]:
        exercise_url: None | str
        exercise_url = self.exercise_url

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "exerciseUrl": exercise_url,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)

        def _parse_exercise_url(data: object) -> None | str:
            if data is None:
                return data
            return cast(None | str, data)

        exercise_url = _parse_exercise_url(d.pop("exerciseUrl"))

        longread_material_coding = cls(
            exercise_url=exercise_url,
        )

        return longread_material_coding
