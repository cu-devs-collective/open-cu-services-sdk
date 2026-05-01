from enum import Enum


class TaskScoreSkillLevel(str, Enum):
    ADVANCED = "advanced"
    BASIC = "basic"
    INTERMEDIATE = "intermediate"
    NONE = "none"

    def __str__(self) -> str:
        return str(self.value)
