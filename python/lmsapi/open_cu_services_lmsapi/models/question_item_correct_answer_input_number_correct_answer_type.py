from enum import Enum


class QuestionItemCorrectAnswerInputNumberCorrectAnswerType(str, Enum):
    INPUTNUMBERCORRECTANSWER = "inputNumberCorrectAnswer"

    def __str__(self) -> str:
        return str(self.value)
