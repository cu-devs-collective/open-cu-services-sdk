from enum import Enum


class LongreadExerciseMultipleChoiceQuestionItemType(str, Enum):
    MULTIPLECHOICE = "multipleChoice"

    def __str__(self) -> str:
        return str(self.value)
