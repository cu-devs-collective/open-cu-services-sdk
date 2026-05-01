from enum import Enum


class LongreadExerciseSingleChoiceQuestionitemType(str, Enum):
    SINGLECHOICE = "singleChoice"

    def __str__(self) -> str:
        return str(self.value)
