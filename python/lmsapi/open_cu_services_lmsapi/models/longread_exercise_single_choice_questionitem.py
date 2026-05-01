from __future__ import annotations

from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar

from attrs import define as _attrs_define

from ..models.longread_exercise_single_choice_questionitem_type import LongreadExerciseSingleChoiceQuestionitemType

if TYPE_CHECKING:
    from ..models.longread_exercise_single_choice_questionitem_single_choice import (
        LongreadExerciseSingleChoiceQuestionitemSingleChoice,
    )
    from ..models.longread_material_attachment_item import LongreadMaterialAttachmentItem
    from ..models.question_item_option import QuestionItemOption


T = TypeVar("T", bound="LongreadExerciseSingleChoiceQuestionitem")


@_attrs_define
class LongreadExerciseSingleChoiceQuestionitem:
    """Question that requires the right choice as answer.

    Attributes:
        type_ (LongreadExerciseSingleChoiceQuestionitemType):  Example: singleChoice.
        id (int): Numeric identifier of the question. Example: 766.
        order (int): Listing order determining the item's line position in the LMS, lower values come first.
             Example: 1.
        content (str): JSON-serialized markdown question content rendered in LMS. Example: {"description": "..."}.
        score (float): Score (max possible) for answering the question correctly. Example: 5.
        attachments (list[LongreadMaterialAttachmentItem]):
        options (list[QuestionItemOption]):
        are_options_shuffled (bool): Indicates if options need to be shuffled on frontend.
        single_choice (LongreadExerciseSingleChoiceQuestionitemSingleChoice):
    """

    type_: LongreadExerciseSingleChoiceQuestionitemType
    id: int
    order: int
    content: str
    score: float
    attachments: list[LongreadMaterialAttachmentItem]
    options: list[QuestionItemOption]
    are_options_shuffled: bool
    single_choice: LongreadExerciseSingleChoiceQuestionitemSingleChoice

    def to_dict(self) -> dict[str, Any]:
        type_ = self.type_.value

        id = self.id

        order = self.order

        content = self.content

        score = self.score

        attachments = []
        for attachments_item_data in self.attachments:
            attachments_item = attachments_item_data.to_dict()
            attachments.append(attachments_item)

        options = []
        for componentsschemas_question_item_options_item_data in self.options:
            componentsschemas_question_item_options_item = componentsschemas_question_item_options_item_data.to_dict()
            options.append(componentsschemas_question_item_options_item)

        are_options_shuffled = self.are_options_shuffled

        single_choice = self.single_choice.to_dict()

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "type": type_,
                "id": id,
                "order": order,
                "content": content,
                "score": score,
                "attachments": attachments,
                "options": options,
                "areOptionsShuffled": are_options_shuffled,
                "singleChoice": single_choice,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        from ..models.longread_exercise_single_choice_questionitem_single_choice import (
            LongreadExerciseSingleChoiceQuestionitemSingleChoice,
        )
        from ..models.longread_material_attachment_item import LongreadMaterialAttachmentItem
        from ..models.question_item_option import QuestionItemOption

        d = dict(src_dict)
        type_ = LongreadExerciseSingleChoiceQuestionitemType(d.pop("type"))

        id = d.pop("id")

        order = d.pop("order")

        content = d.pop("content")

        score = d.pop("score")

        attachments = []
        _attachments = d.pop("attachments")
        for attachments_item_data in _attachments:
            attachments_item = LongreadMaterialAttachmentItem.from_dict(attachments_item_data)

            attachments.append(attachments_item)

        options = []
        _options = d.pop("options")
        for componentsschemas_question_item_options_item_data in _options:
            componentsschemas_question_item_options_item = QuestionItemOption.from_dict(
                componentsschemas_question_item_options_item_data
            )

            options.append(componentsschemas_question_item_options_item)

        are_options_shuffled = d.pop("areOptionsShuffled")

        single_choice = LongreadExerciseSingleChoiceQuestionitemSingleChoice.from_dict(d.pop("singleChoice"))

        longread_exercise_single_choice_questionitem = cls(
            type_=type_,
            id=id,
            order=order,
            content=content,
            score=score,
            attachments=attachments,
            options=options,
            are_options_shuffled=are_options_shuffled,
            single_choice=single_choice,
        )

        return longread_exercise_single_choice_questionitem
