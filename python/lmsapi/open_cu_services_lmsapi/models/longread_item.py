from __future__ import annotations

import datetime
from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar, cast

from attrs import define as _attrs_define
from dateutil.parser import isoparse

from ..models.longread_type import LongreadType
from ..models.publication_state import PublicationState

if TYPE_CHECKING:
    from ..models.exercise_item import ExerciseItem


T = TypeVar("T", bound="LongreadItem")


@_attrs_define
class LongreadItem:
    """A longread list item within a course theme. It may be self-contained content or include one or more associated
    exercises.

        Attributes:
            id (int): Numeric identifier of the longread item. Example: 12707.
            type_ (LongreadType): Longread item type. Example: common.
            name (str): Longread name shown as the header in LMS. Example: Ссылка на силлабус.
            state (PublicationState): Publication state of an item. Example: published.
            publish_date (datetime.datetime | None): Scheduled item publication timestamp, if value is not null. Example:
                2026-01-26T07:00:00+00:00.
            published_at (datetime.datetime | None): Actual item publication timestamp. Example:
                2026-01-26T07:00:44.919045+00:00.
            exercises (list[ExerciseItem]): Exercises associated with this longread.
    """

    id: int
    type_: LongreadType
    name: str
    state: PublicationState
    publish_date: datetime.datetime | None
    published_at: datetime.datetime | None
    exercises: list[ExerciseItem]

    def to_dict(self) -> dict[str, Any]:
        id = self.id

        type_ = self.type_.value

        name = self.name

        state = self.state.value

        publish_date: None | str
        if isinstance(self.publish_date, datetime.datetime):
            publish_date = self.publish_date.isoformat()
        else:
            publish_date = self.publish_date

        published_at: None | str
        if isinstance(self.published_at, datetime.datetime):
            published_at = self.published_at.isoformat()
        else:
            published_at = self.published_at

        exercises = []
        for exercises_item_data in self.exercises:
            exercises_item = exercises_item_data.to_dict()
            exercises.append(exercises_item)

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "id": id,
                "type": type_,
                "name": name,
                "state": state,
                "publishDate": publish_date,
                "publishedAt": published_at,
                "exercises": exercises,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        from ..models.exercise_item import ExerciseItem

        d = dict(src_dict)
        id = d.pop("id")

        type_ = LongreadType(d.pop("type"))

        name = d.pop("name")

        state = PublicationState(d.pop("state"))

        def _parse_publish_date(data: object) -> datetime.datetime | None:
            if data is None:
                return data
            try:
                if not isinstance(data, str):
                    raise TypeError()
                componentsschemas_publish_date_type_0 = isoparse(data)

                return componentsschemas_publish_date_type_0
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            return cast(datetime.datetime | None, data)

        publish_date = _parse_publish_date(d.pop("publishDate"))

        def _parse_published_at(data: object) -> datetime.datetime | None:
            if data is None:
                return data
            try:
                if not isinstance(data, str):
                    raise TypeError()
                componentsschemas_published_at_type_0 = isoparse(data)

                return componentsschemas_published_at_type_0
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            return cast(datetime.datetime | None, data)

        published_at = _parse_published_at(d.pop("publishedAt"))

        exercises = []
        _exercises = d.pop("exercises")
        for exercises_item_data in _exercises:
            exercises_item = ExerciseItem.from_dict(exercises_item_data)

            exercises.append(exercises_item)

        longread_item = cls(
            id=id,
            type_=type_,
            name=name,
            state=state,
            publish_date=publish_date,
            published_at=published_at,
            exercises=exercises,
        )

        return longread_item
