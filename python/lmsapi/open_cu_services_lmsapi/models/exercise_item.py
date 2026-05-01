from __future__ import annotations

import datetime
from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar

from attrs import define as _attrs_define
from dateutil.parser import isoparse

if TYPE_CHECKING:
    from ..models.activity_definition import ActivityDefinition


T = TypeVar("T", bound="ExerciseItem")


@_attrs_define
class ExerciseItem:
    """An exercise item within a longread item.

    Attributes:
        id (int): Numeric identifier of the exercise item. Example: 48139.
        name (str): Exercise name shown as the header is LMS. Example: Seminar 1. Week 2.
        max_score (float): Maximum possible score for completing exercise. Example: 10.
        activity (ActivityDefinition): Activity definition shared across exercises. Multiple exercises reference the
            same activity definition.
        deadline (datetime.datetime): Deadline timestamp by which the item must be completed. Example:
            2026-02-15T19:00:00+00:00.
    """

    id: int
    name: str
    max_score: float
    activity: ActivityDefinition
    deadline: datetime.datetime

    def to_dict(self) -> dict[str, Any]:
        id = self.id

        name = self.name

        max_score = self.max_score

        activity = self.activity.to_dict()

        deadline = self.deadline.isoformat()

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "id": id,
                "name": name,
                "maxScore": max_score,
                "activity": activity,
                "deadline": deadline,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        from ..models.activity_definition import ActivityDefinition

        d = dict(src_dict)
        id = d.pop("id")

        name = d.pop("name")

        max_score = d.pop("maxScore")

        activity = ActivityDefinition.from_dict(d.pop("activity"))

        deadline = isoparse(d.pop("deadline"))

        exercise_item = cls(
            id=id,
            name=name,
            max_score=max_score,
            activity=activity,
            deadline=deadline,
        )

        return exercise_item
