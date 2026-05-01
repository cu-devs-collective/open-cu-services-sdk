from enum import Enum


class CourseCategory(str, Enum):
    ANALYTICS = "analytics"
    BUSINESS = "business"
    CAREER = "career"
    DESIGN = "design"
    DEVELOPMENT = "development"
    GENERAL = "general"
    MANAGEMENT = "management"
    MATHEMATICS = "mathematics"
    ML = "ml"
    SOFTSKILLS = "softSkills"
    STEM = "stem"
    WITHOUTCATEGORY = "withoutCategory"

    def __str__(self) -> str:
        return str(self.value)
