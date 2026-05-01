from enum import Enum


class LongreadMaterialViewType(str, Enum):
    AUDIO = "audio"
    EXERCISECODING = "exerciseCoding"
    EXERCISEQUESTIONS = "exerciseQuestions"
    FILE = "file"
    IMAGE = "image"
    NGXMARKDOWN = "ngxMarkdown"
    VIDEO = "video"
    VIDEOPLATFORM = "videoPlatform"

    def __str__(self) -> str:
        return str(self.value)
