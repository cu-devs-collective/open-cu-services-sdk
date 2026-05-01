from __future__ import annotations

import datetime
from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar, cast
from uuid import UUID

from attrs import define as _attrs_define
from dateutil.parser import isoparse

from ..models.longread_material_discriminator import LongreadMaterialDiscriminator
from ..models.longread_material_type import LongreadMaterialType
from ..models.longread_material_view_type import LongreadMaterialViewType
from ..models.publication_state import PublicationState

if TYPE_CHECKING:
    from ..models.longread_material_attachment_item import LongreadMaterialAttachmentItem
    from ..models.longread_material_coding import LongreadMaterialCoding
    from ..models.longread_material_estimation import LongreadMaterialEstimation


T = TypeVar("T", bound="LongreadExerciseCodingMaterialItem")


@_attrs_define
class LongreadExerciseCodingMaterialItem:
    """
    Attributes:
        discriminator (LongreadMaterialDiscriminator): Material block discriminator used by LMS frontend. Example:
            markdown.
        state (PublicationState): Publication state of an item. Example: published.
        view_type (LongreadMaterialViewType): View renderer type used by LMS frontend. Example: ngxMarkdown.
        type_ (LongreadMaterialType): Material block type identifier. Example: markdown.
        id (int): Numeric identifier of a longread material block. Example: 54041.
        order (int): Listing order determining the item's line position in the LMS, lower values come first.
             Example: 1.
        name (str): Exercise name shown as the header is LMS. Example: Seminar 1. Week 2.
        view_content (None | str): JSON-serialized markdown content rendered in LMS. Example:
            {"value":"<p>...</p>","isTuiEditor":true}.
        estimation (LongreadMaterialEstimation): Estimation and grading constraints for exercise material.
        reviewers (list[UUID]): Reviewers assigned to this exercise task.
        assignees (list[UUID]): Assignees linked to this exercise task.
        attachments (list[LongreadMaterialAttachmentItem]):
        backlogged_at (datetime.datetime | None): Timestamp when task was moved to backlog. Example:
            2026-03-07T07:00:05.991326+00:00.
        task_id (int): Numeric identifier of the task. Example: 1468065.
        is_tracking_students (bool):
        exercise_url (None | str): URL of coding exercise if configured.
        coding (LongreadMaterialCoding):
    """

    discriminator: LongreadMaterialDiscriminator
    state: PublicationState
    view_type: LongreadMaterialViewType
    type_: LongreadMaterialType
    id: int
    order: int
    name: str
    view_content: None | str
    estimation: LongreadMaterialEstimation
    reviewers: list[UUID]
    assignees: list[UUID]
    attachments: list[LongreadMaterialAttachmentItem]
    backlogged_at: datetime.datetime | None
    task_id: int
    is_tracking_students: bool
    exercise_url: None | str
    coding: LongreadMaterialCoding

    def to_dict(self) -> dict[str, Any]:
        discriminator = self.discriminator.value

        state = self.state.value

        view_type = self.view_type.value

        type_ = self.type_.value

        id = self.id

        order = self.order

        name = self.name

        view_content: None | str
        view_content = self.view_content

        estimation = self.estimation.to_dict()

        reviewers = []
        for componentsschemas_longread_exercise_material_reviewers_item_data in self.reviewers:
            componentsschemas_longread_exercise_material_reviewers_item = str(
                componentsschemas_longread_exercise_material_reviewers_item_data
            )
            reviewers.append(componentsschemas_longread_exercise_material_reviewers_item)

        assignees = []
        for componentsschemas_longread_exercise_material_assignees_item_data in self.assignees:
            componentsschemas_longread_exercise_material_assignees_item = str(
                componentsschemas_longread_exercise_material_assignees_item_data
            )
            assignees.append(componentsschemas_longread_exercise_material_assignees_item)

        attachments = []
        for attachments_item_data in self.attachments:
            attachments_item = attachments_item_data.to_dict()
            attachments.append(attachments_item)

        backlogged_at: None | str
        if isinstance(self.backlogged_at, datetime.datetime):
            backlogged_at = self.backlogged_at.isoformat()
        else:
            backlogged_at = self.backlogged_at

        task_id = self.task_id

        is_tracking_students = self.is_tracking_students

        exercise_url: None | str
        exercise_url = self.exercise_url

        coding = self.coding.to_dict()

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "discriminator": discriminator,
                "state": state,
                "viewType": view_type,
                "type": type_,
                "id": id,
                "order": order,
                "name": name,
                "viewContent": view_content,
                "estimation": estimation,
                "reviewers": reviewers,
                "assignees": assignees,
                "attachments": attachments,
                "backloggedAt": backlogged_at,
                "taskId": task_id,
                "isTrackingStudents": is_tracking_students,
                "exerciseUrl": exercise_url,
                "coding": coding,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        from ..models.longread_material_attachment_item import LongreadMaterialAttachmentItem
        from ..models.longread_material_coding import LongreadMaterialCoding
        from ..models.longread_material_estimation import LongreadMaterialEstimation

        d = dict(src_dict)
        discriminator = LongreadMaterialDiscriminator(d.pop("discriminator"))

        state = PublicationState(d.pop("state"))

        view_type = LongreadMaterialViewType(d.pop("viewType"))

        type_ = LongreadMaterialType(d.pop("type"))

        id = d.pop("id")

        order = d.pop("order")

        name = d.pop("name")

        def _parse_view_content(data: object) -> None | str:
            if data is None:
                return data
            return cast(None | str, data)

        view_content = _parse_view_content(d.pop("viewContent"))

        estimation = LongreadMaterialEstimation.from_dict(d.pop("estimation"))

        reviewers = []
        _reviewers = d.pop("reviewers")
        for componentsschemas_longread_exercise_material_reviewers_item_data in _reviewers:
            componentsschemas_longread_exercise_material_reviewers_item = UUID(
                componentsschemas_longread_exercise_material_reviewers_item_data
            )

            reviewers.append(componentsschemas_longread_exercise_material_reviewers_item)

        assignees = []
        _assignees = d.pop("assignees")
        for componentsschemas_longread_exercise_material_assignees_item_data in _assignees:
            componentsschemas_longread_exercise_material_assignees_item = UUID(
                componentsschemas_longread_exercise_material_assignees_item_data
            )

            assignees.append(componentsschemas_longread_exercise_material_assignees_item)

        attachments = []
        _attachments = d.pop("attachments")
        for attachments_item_data in _attachments:
            attachments_item = LongreadMaterialAttachmentItem.from_dict(attachments_item_data)

            attachments.append(attachments_item)

        def _parse_backlogged_at(data: object) -> datetime.datetime | None:
            if data is None:
                return data
            try:
                if not isinstance(data, str):
                    raise TypeError()
                componentsschemas_backlogged_at_type_0 = isoparse(data)

                return componentsschemas_backlogged_at_type_0
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            return cast(datetime.datetime | None, data)

        backlogged_at = _parse_backlogged_at(d.pop("backloggedAt"))

        task_id = d.pop("taskId")

        is_tracking_students = d.pop("isTrackingStudents")

        def _parse_exercise_url(data: object) -> None | str:
            if data is None:
                return data
            return cast(None | str, data)

        exercise_url = _parse_exercise_url(d.pop("exerciseUrl"))

        coding = LongreadMaterialCoding.from_dict(d.pop("coding"))

        longread_exercise_coding_material_item = cls(
            discriminator=discriminator,
            state=state,
            view_type=view_type,
            type_=type_,
            id=id,
            order=order,
            name=name,
            view_content=view_content,
            estimation=estimation,
            reviewers=reviewers,
            assignees=assignees,
            attachments=attachments,
            backlogged_at=backlogged_at,
            task_id=task_id,
            is_tracking_students=is_tracking_students,
            exercise_url=exercise_url,
            coding=coding,
        )

        return longread_exercise_coding_material_item
