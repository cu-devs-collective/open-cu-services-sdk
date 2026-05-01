from enum import Enum


class CourseCategoryCover(str, Enum):
    CURVESGRID = "curvesGrid"
    ELLIPSESOVERLAP = "ellipsesOverlap"
    GEOMETRICTRIANGLE = "geometricTriangle"
    GRIDPLANES = "gridPlanes"
    SINEWAVE = "sineWave"
    SPIRALLOOPS = "spiralLoops"
    SYMMETRICCIRCLES = "symmetricCircles"
    VERTICALLINES = "verticalLines"

    def __str__(self) -> str:
        return str(self.value)
