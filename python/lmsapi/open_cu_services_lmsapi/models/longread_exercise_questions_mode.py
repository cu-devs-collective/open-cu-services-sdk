from enum import Enum


class LongreadExerciseQuestionsMode(str, Enum):
    ATMOMENT = "atMoment"
    BYDEADLINE = "byDeadline"

    def __str__(self) -> str:
        return str(self.value)
