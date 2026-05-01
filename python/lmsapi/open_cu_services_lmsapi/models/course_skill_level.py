from enum import Enum


class CourseSkillLevel(str, Enum):
    NONE = "none"

    def __str__(self) -> str:
        return str(self.value)
