from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar, cast

from attrs import define as _attrs_define

T = TypeVar("T", bound="LongreadMaterialActivity")


@_attrs_define
class LongreadMaterialActivity:
    """Activity configuration for a longread exercise.

    Attributes:
        id (int): Numeric identifier of the activity item. Example: 2161.
        name (str): Activity name. Example: Аудиторная работа на семинарах.
        weight (float): Weight coefficient for every single activity by activity name, used in the course grade formula
            to calculate the overall semester score.
             Example: 0.25.
        max_exercises_count (float): Max exercises count. Example: 12.
        average_score_threshold (float | None): Average score threshold.
        is_late_days_enabled (bool): Indicates if late days can be used for this activity. Example: True.
    """

    id: int
    name: str
    weight: float
    max_exercises_count: float
    average_score_threshold: float | None
    is_late_days_enabled: bool

    def to_dict(self) -> dict[str, Any]:
        id = self.id

        name = self.name

        weight = self.weight

        max_exercises_count = self.max_exercises_count

        average_score_threshold: float | None
        average_score_threshold = self.average_score_threshold

        is_late_days_enabled = self.is_late_days_enabled

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "id": id,
                "name": name,
                "weight": weight,
                "maxExercisesCount": max_exercises_count,
                "averageScoreThreshold": average_score_threshold,
                "isLateDaysEnabled": is_late_days_enabled,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        id = d.pop("id")

        name = d.pop("name")

        weight = d.pop("weight")

        max_exercises_count = d.pop("maxExercisesCount")

        def _parse_average_score_threshold(data: object) -> float | None:
            if data is None:
                return data
            return cast(float | None, data)

        average_score_threshold = _parse_average_score_threshold(d.pop("averageScoreThreshold"))

        is_late_days_enabled = d.pop("isLateDaysEnabled")

        longread_material_activity = cls(
            id=id,
            name=name,
            weight=weight,
            max_exercises_count=max_exercises_count,
            average_score_threshold=average_score_threshold,
            is_late_days_enabled=is_late_days_enabled,
        )

        return longread_material_activity
