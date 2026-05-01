from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar, cast
from uuid import UUID

from attrs import define as _attrs_define

from ..models.study_level import StudyLevel

T = TypeVar("T", bound="CurrentStudentResponse")


@_attrs_define
class CurrentStudentResponse:
    """
    Attributes:
        id (UUID): Unique identifier of the user. Example: 00000000-0000-0000-0000-000000000000.
        last_name (str):  Example: Иванов.
        first_name (str):  Example: Иван.
        middle_name (None | str):  Example: Иванович.
        university_email (str):  Example: i.ivanov@edu.centraluniversity.ru.
        time_account (str): Username in TiMe messenger (T-Bank's fork of Mattermost). Example: i.ivanov.
        study_start_year (int | None): Year the student enrolled at the university. Example: 2024.
        study_level (StudyLevel): Student’s current education level. Example: bachelor.
        late_days_balance (int): Number of late days remaining for the student. Example: 50.
    """

    id: UUID
    last_name: str
    first_name: str
    middle_name: None | str
    university_email: str
    time_account: str
    study_start_year: int | None
    study_level: StudyLevel
    late_days_balance: int

    def to_dict(self) -> dict[str, Any]:
        id = str(self.id)

        last_name = self.last_name

        first_name = self.first_name

        middle_name: None | str
        middle_name = self.middle_name

        university_email = self.university_email

        time_account = self.time_account

        study_start_year: int | None
        study_start_year = self.study_start_year

        study_level = self.study_level.value

        late_days_balance = self.late_days_balance

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "id": id,
                "lastName": last_name,
                "firstName": first_name,
                "middleName": middle_name,
                "universityEmail": university_email,
                "timeAccount": time_account,
                "studyStartYear": study_start_year,
                "studyLevel": study_level,
                "lateDaysBalance": late_days_balance,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        id = UUID(d.pop("id"))

        last_name = d.pop("lastName")

        first_name = d.pop("firstName")

        def _parse_middle_name(data: object) -> None | str:
            if data is None:
                return data
            return cast(None | str, data)

        middle_name = _parse_middle_name(d.pop("middleName"))

        university_email = d.pop("universityEmail")

        time_account = d.pop("timeAccount")

        def _parse_study_start_year(data: object) -> int | None:
            if data is None:
                return data
            return cast(int | None, data)

        study_start_year = _parse_study_start_year(d.pop("studyStartYear"))

        study_level = StudyLevel(d.pop("studyLevel"))

        late_days_balance = d.pop("lateDaysBalance")

        current_student_response = cls(
            id=id,
            last_name=last_name,
            first_name=first_name,
            middle_name=middle_name,
            university_email=university_email,
            time_account=time_account,
            study_start_year=study_start_year,
            study_level=study_level,
            late_days_balance=late_days_balance,
        )

        return current_student_response
