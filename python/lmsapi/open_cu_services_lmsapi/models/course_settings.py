from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar, cast

from attrs import define as _attrs_define

from ..models.course_skill_level import CourseSkillLevel

T = TypeVar("T", bound="CourseSettings")


@_attrs_define
class CourseSettings:
    """Course settings.

    Attributes:
        skill_level (CourseSkillLevel): Skill level label configured for the course. Example: none.
        is_skill_level_enabled (bool): Indicates if skill level is enabled for the course.
        syllabus_url (None | str): External syllabus URL of the course.
        time_channel_url (None | str): TiMe channel of the course.
    """

    skill_level: CourseSkillLevel
    is_skill_level_enabled: bool
    syllabus_url: None | str
    time_channel_url: None | str

    def to_dict(self) -> dict[str, Any]:
        skill_level = self.skill_level.value

        is_skill_level_enabled = self.is_skill_level_enabled

        syllabus_url: None | str
        syllabus_url = self.syllabus_url

        time_channel_url: None | str
        time_channel_url = self.time_channel_url

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "skillLevel": skill_level,
                "isSkillLevelEnabled": is_skill_level_enabled,
                "syllabusUrl": syllabus_url,
                "timeChannelUrl": time_channel_url,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        skill_level = CourseSkillLevel(d.pop("skillLevel"))

        is_skill_level_enabled = d.pop("isSkillLevelEnabled")

        def _parse_syllabus_url(data: object) -> None | str:
            if data is None:
                return data
            return cast(None | str, data)

        syllabus_url = _parse_syllabus_url(d.pop("syllabusUrl"))

        def _parse_time_channel_url(data: object) -> None | str:
            if data is None:
                return data
            return cast(None | str, data)

        time_channel_url = _parse_time_channel_url(d.pop("timeChannelUrl"))

        course_settings = cls(
            skill_level=skill_level,
            is_skill_level_enabled=is_skill_level_enabled,
            syllabus_url=syllabus_url,
            time_channel_url=time_channel_url,
        )

        return course_settings
