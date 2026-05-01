from __future__ import annotations

from collections.abc import Mapping
from typing import Any, TypeVar, cast
from uuid import UUID

from attrs import define as _attrs_define

T = TypeVar("T", bound="TaskReviewerType0")


@_attrs_define
class TaskReviewerType0:
    """
    Attributes:
        id (UUID): Unique identifier of the user. Example: 00000000-0000-0000-0000-000000000000.
        name (str): Reviewer's full name. Example: Иван Иванов .
        identity_email (str):  Example: i.ivanov@edu.centraluniversity.ru.
        email (str):  Example: i.ivanov@edu.centraluniversity.ru.
        identity_identifier (UUID): Unique identifier of the user. Example: 00000000-0000-0000-0000-000000000000.
        time_account (str): Username in TiMe messenger (T-Bank's fork of Mattermost). Example: i.ivanov.
        last_name (str):  Example: Иван.
        first_name (str):  Example: Иванов.
        middle_name (None | str):
    """

    id: UUID
    name: str
    identity_email: str
    email: str
    identity_identifier: UUID
    time_account: str
    last_name: str
    first_name: str
    middle_name: None | str

    def to_dict(self) -> dict[str, Any]:
        id = str(self.id)

        name = self.name

        identity_email = self.identity_email

        email = self.email

        identity_identifier = str(self.identity_identifier)

        time_account = self.time_account

        last_name = self.last_name

        first_name = self.first_name

        middle_name: None | str
        middle_name = self.middle_name

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "id": id,
                "name": name,
                "identityEmail": identity_email,
                "email": email,
                "identityIdentifier": identity_identifier,
                "timeAccount": time_account,
                "lastName": last_name,
                "firstName": first_name,
                "middleName": middle_name,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        d = dict(src_dict)
        id = UUID(d.pop("id"))

        name = d.pop("name")

        identity_email = d.pop("identityEmail")

        email = d.pop("email")

        identity_identifier = UUID(d.pop("identityIdentifier"))

        time_account = d.pop("timeAccount")

        last_name = d.pop("lastName")

        first_name = d.pop("firstName")

        def _parse_middle_name(data: object) -> None | str:
            if data is None:
                return data
            return cast(None | str, data)

        middle_name = _parse_middle_name(d.pop("middleName"))

        task_reviewer_type_0 = cls(
            id=id,
            name=name,
            identity_email=identity_email,
            email=email,
            identity_identifier=identity_identifier,
            time_account=time_account,
            last_name=last_name,
            first_name=first_name,
            middle_name=middle_name,
        )

        return task_reviewer_type_0
