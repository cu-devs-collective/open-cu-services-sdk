from enum import Enum


class LongreadMaterialType(str, Enum):
    CODING = "coding"
    CONTENT = "content"
    IMAGE = "image"
    MARKDOWN = "markdown"
    QUESTIONS = "questions"
    VIDEOPLATFORM = "videoPlatform"

    def __str__(self) -> str:
        return str(self.value)
