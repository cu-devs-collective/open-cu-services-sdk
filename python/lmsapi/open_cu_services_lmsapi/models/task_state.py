from enum import Enum


class TaskState(str, Enum):
    BACKLOG = "backlog"
    EVALUATED = "evaluated"
    FAILED = "failed"
    INPROGRESS = "inProgress"
    REVIEW = "review"
    SUBMITTED = "submitted"

    def __str__(self) -> str:
        return str(self.value)
