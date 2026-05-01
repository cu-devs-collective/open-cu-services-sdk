from __future__ import annotations

import datetime
from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar, cast

from attrs import define as _attrs_define
from dateutil.parser import isoparse

if TYPE_CHECKING:
    from ..models.longread_material_activity import LongreadMaterialActivity


T = TypeVar("T", bound="LongreadMaterialEstimation")


@_attrs_define
class LongreadMaterialEstimation:
    """Estimation and grading constraints for exercise material.

    Attributes:
        start_date (datetime.datetime): Scheduled item start timestamp. Example: 2026-01-26T07:00:00+00:00.
        timer (None | str): Timer by which exercise should be completed. Example: 00:30:00.
        max_score (float | None):
        deadline (datetime.datetime | None):
        activity (LongreadMaterialActivity | None):
    """

    start_date: datetime.datetime
    timer: None | str
    max_score: float | None
    deadline: datetime.datetime | None
    activity: LongreadMaterialActivity | None

    def to_dict(self) -> dict[str, Any]:
        from ..models.longread_material_activity import LongreadMaterialActivity

        start_date = self.start_date.isoformat()

        timer: None | str
        timer = self.timer

        max_score: float | None
        max_score = self.max_score

        deadline: None | str
        if isinstance(self.deadline, datetime.datetime):
            deadline = self.deadline.isoformat()
        else:
            deadline = self.deadline

        activity: dict[str, Any] | None
        if isinstance(self.activity, LongreadMaterialActivity):
            activity = self.activity.to_dict()
        else:
            activity = self.activity

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "startDate": start_date,
                "timer": timer,
                "maxScore": max_score,
                "deadline": deadline,
                "activity": activity,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        from ..models.longread_material_activity import LongreadMaterialActivity

        d = dict(src_dict)
        start_date = isoparse(d.pop("startDate"))

        def _parse_timer(data: object) -> None | str:
            if data is None:
                return data
            return cast(None | str, data)

        timer = _parse_timer(d.pop("timer"))

        def _parse_max_score(data: object) -> float | None:
            if data is None:
                return data
            return cast(float | None, data)

        max_score = _parse_max_score(d.pop("maxScore"))

        def _parse_deadline(data: object) -> datetime.datetime | None:
            if data is None:
                return data
            try:
                if not isinstance(data, str):
                    raise TypeError()
                deadline_type_1 = isoparse(data)

                return deadline_type_1
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            return cast(datetime.datetime | None, data)

        deadline = _parse_deadline(d.pop("deadline"))

        def _parse_activity(data: object) -> LongreadMaterialActivity | None:
            if data is None:
                return data
            try:
                if not isinstance(data, dict):
                    raise TypeError()
                activity_type_1 = LongreadMaterialActivity.from_dict(data)

                return activity_type_1
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            return cast(LongreadMaterialActivity | None, data)

        activity = _parse_activity(d.pop("activity"))

        longread_material_estimation = cls(
            start_date=start_date,
            timer=timer,
            max_score=max_score,
            deadline=deadline,
            activity=activity,
        )

        return longread_material_estimation
