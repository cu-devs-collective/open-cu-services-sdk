from enum import Enum


class TaskSolutionAnswersQuestionOptionsQuestionItemType(str, Enum):
    MULTIPLECHOICE = "multipleChoice"
    SINGLECHOICE = "singleChoice"

    def __str__(self) -> str:
        return str(self.value)
