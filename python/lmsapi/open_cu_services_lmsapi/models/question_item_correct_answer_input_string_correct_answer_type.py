from enum import Enum


class QuestionItemCorrectAnswerInputStringCorrectAnswerType(str, Enum):
    INPUTSTRINGCORRECTANSWER = "inputStringCorrectAnswer"

    def __str__(self) -> str:
        return str(self.value)
