from __future__ import annotations

from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar, cast

from attrs import define as _attrs_define

from ..models.longread_exercise_input_question_item_type import LongreadExerciseInputQuestionItemType

if TYPE_CHECKING:
    from ..models.longread_material_attachment_item import LongreadMaterialAttachmentItem
    from ..models.question_item_correct_answer_input_number_correct_answer import (
        QuestionItemCorrectAnswerInputNumberCorrectAnswer,
    )
    from ..models.question_item_correct_answer_input_string_correct_answer import (
        QuestionItemCorrectAnswerInputStringCorrectAnswer,
    )
    from ..models.question_item_evaluation_block import QuestionItemEvaluationBlock


T = TypeVar("T", bound="LongreadExerciseInputQuestionItem")


@_attrs_define
class LongreadExerciseInputQuestionItem:
    """Question that needs input as answer.

    Attributes:
        type_ (LongreadExerciseInputQuestionItemType):  Example: input.
        id (int): Numeric identifier of the question. Example: 766.
        order (int): Listing order determining the item's line position in the LMS, lower values come first.
             Example: 1.
        content (str): JSON-serialized markdown question content rendered in LMS. Example: {"description": "..."}.
        score (float): Score (max possible) for answering the question correctly. Example: 5.
        attachments (list[LongreadMaterialAttachmentItem]):
        correct_answer (None | QuestionItemCorrectAnswerInputNumberCorrectAnswer |
            QuestionItemCorrectAnswerInputStringCorrectAnswer):
        auto_evaluation (bool): Indicates if the question is auto evaluated.
        recommendation (None | str): Text rendered under the options on frontend. Example: -.
        input_ (QuestionItemEvaluationBlock):
    """

    type_: LongreadExerciseInputQuestionItemType
    id: int
    order: int
    content: str
    score: float
    attachments: list[LongreadMaterialAttachmentItem]
    correct_answer: (
        None | QuestionItemCorrectAnswerInputNumberCorrectAnswer | QuestionItemCorrectAnswerInputStringCorrectAnswer
    )
    auto_evaluation: bool
    recommendation: None | str
    input_: QuestionItemEvaluationBlock

    def to_dict(self) -> dict[str, Any]:
        from ..models.question_item_correct_answer_input_number_correct_answer import (
            QuestionItemCorrectAnswerInputNumberCorrectAnswer,
        )
        from ..models.question_item_correct_answer_input_string_correct_answer import (
            QuestionItemCorrectAnswerInputStringCorrectAnswer,
        )

        type_ = self.type_.value

        id = self.id

        order = self.order

        content = self.content

        score = self.score

        attachments = []
        for attachments_item_data in self.attachments:
            attachments_item = attachments_item_data.to_dict()
            attachments.append(attachments_item)

        correct_answer: dict[str, Any] | None
        if isinstance(self.correct_answer, QuestionItemCorrectAnswerInputStringCorrectAnswer):
            correct_answer = self.correct_answer.to_dict()
        elif isinstance(self.correct_answer, QuestionItemCorrectAnswerInputNumberCorrectAnswer):
            correct_answer = self.correct_answer.to_dict()
        else:
            correct_answer = self.correct_answer

        auto_evaluation = self.auto_evaluation

        recommendation: None | str
        recommendation = self.recommendation

        input_ = self.input_.to_dict()

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "type": type_,
                "id": id,
                "order": order,
                "content": content,
                "score": score,
                "attachments": attachments,
                "correctAnswer": correct_answer,
                "autoEvaluation": auto_evaluation,
                "recommendation": recommendation,
                "input": input_,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        from ..models.longread_material_attachment_item import LongreadMaterialAttachmentItem
        from ..models.question_item_correct_answer_input_number_correct_answer import (
            QuestionItemCorrectAnswerInputNumberCorrectAnswer,
        )
        from ..models.question_item_correct_answer_input_string_correct_answer import (
            QuestionItemCorrectAnswerInputStringCorrectAnswer,
        )
        from ..models.question_item_evaluation_block import QuestionItemEvaluationBlock

        d = dict(src_dict)
        type_ = LongreadExerciseInputQuestionItemType(d.pop("type"))

        id = d.pop("id")

        order = d.pop("order")

        content = d.pop("content")

        score = d.pop("score")

        attachments = []
        _attachments = d.pop("attachments")
        for attachments_item_data in _attachments:
            attachments_item = LongreadMaterialAttachmentItem.from_dict(attachments_item_data)

            attachments.append(attachments_item)

        def _parse_correct_answer(
            data: object,
        ) -> (
            None | QuestionItemCorrectAnswerInputNumberCorrectAnswer | QuestionItemCorrectAnswerInputStringCorrectAnswer
        ):
            if data is None:
                return data
            try:
                if not isinstance(data, dict):
                    raise TypeError()
                componentsschemas_question_item_correct_answer_type_0 = (
                    QuestionItemCorrectAnswerInputStringCorrectAnswer.from_dict(data)
                )

                return componentsschemas_question_item_correct_answer_type_0
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            try:
                if not isinstance(data, dict):
                    raise TypeError()
                componentsschemas_question_item_correct_answer_type_1 = (
                    QuestionItemCorrectAnswerInputNumberCorrectAnswer.from_dict(data)
                )

                return componentsschemas_question_item_correct_answer_type_1
            except (TypeError, ValueError, AttributeError, KeyError):
                pass
            return cast(
                None
                | QuestionItemCorrectAnswerInputNumberCorrectAnswer
                | QuestionItemCorrectAnswerInputStringCorrectAnswer,
                data,
            )

        correct_answer = _parse_correct_answer(d.pop("correctAnswer"))

        auto_evaluation = d.pop("autoEvaluation")

        def _parse_recommendation(data: object) -> None | str:
            if data is None:
                return data
            return cast(None | str, data)

        recommendation = _parse_recommendation(d.pop("recommendation"))

        input_ = QuestionItemEvaluationBlock.from_dict(d.pop("input"))

        longread_exercise_input_question_item = cls(
            type_=type_,
            id=id,
            order=order,
            content=content,
            score=score,
            attachments=attachments,
            correct_answer=correct_answer,
            auto_evaluation=auto_evaluation,
            recommendation=recommendation,
            input_=input_,
        )

        return longread_exercise_input_question_item
