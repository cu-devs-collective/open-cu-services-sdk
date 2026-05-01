from enum import Enum


class TaskSolutionAnswersQuestionInputNumberQuestionItemType(str, Enum):
    INPUTNUMBER = "inputNumber"

    def __str__(self) -> str:
        return str(self.value)
