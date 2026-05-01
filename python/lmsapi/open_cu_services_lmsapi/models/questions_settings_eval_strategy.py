from enum import Enum


class QuestionsSettingsEvalStrategy(str, Enum):
    BEST = "best"
    LAST = "last"

    def __str__(self) -> str:
        return str(self.value)
