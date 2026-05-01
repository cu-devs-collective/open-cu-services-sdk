from enum import Enum


class LongreadMaterialDiscriminator(str, Enum):
    AUDIO = "audio"
    CODING = "coding"
    FILE = "file"
    IMAGE = "image"
    MARKDOWN = "markdown"
    QUESTIONS = "questions"
    VIDEO = "video"
    VIDEOPLATFORM = "videoPlatform"

    def __str__(self) -> str:
        return str(self.value)
