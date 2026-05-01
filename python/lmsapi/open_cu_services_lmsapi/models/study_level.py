from enum import Enum


class StudyLevel(str, Enum):
    BACHELOR = "bachelor"
    DPO = "dpo"
    DPOMASTER = "dpoMaster"
    MASTER = "master"
    NONE = "none"

    def __str__(self) -> str:
        return str(self.value)
