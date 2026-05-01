from enum import Enum


class TaskType(str, Enum):
    CODING = "coding"
    QUESTIONS = "questions"

    def __str__(self) -> str:
        return str(self.value)
