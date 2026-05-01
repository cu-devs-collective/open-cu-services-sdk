from enum import Enum


class VideoPlatformState(str, Enum):
    EMPTY = "empty"
    ERROR = "error"
    PARTIALLYREADY = "partiallyReady"
    READY = "ready"
    TRANSCODING = "transcoding"
    UNSPECIFIED = "unspecified"
    UPLOADED = "uploaded"
    VIEWABLE = "viewable"

    def __str__(self) -> str:
        return str(self.value)
