from enum import Enum


class LongreadType(str, Enum):
    COMMON = "common"
    HANDOUT = "handout"

    def __str__(self) -> str:
        return str(self.value)
