from enum import Enum


class LongreadMaterialMediaTypeUpper(str, Enum):
    AUDIO = "Audio"
    FILE = "File"
    IMAGE = "Image"
    VIDEO = "Video"

    def __str__(self) -> str:
        return str(self.value)
