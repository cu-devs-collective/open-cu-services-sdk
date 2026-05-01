from __future__ import annotations

from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar

from attrs import define as _attrs_define

if TYPE_CHECKING:
    from ..models.question_item_option import QuestionItemOption


T = TypeVar("T", bound="LongreadExerciseMultipleChoiceQuestionItemMultipleChoice")


@_attrs_define
class LongreadExerciseMultipleChoiceQuestionItemMultipleChoice:
    """
    Attributes:
        options (list[QuestionItemOption]):
    """

    options: list[QuestionItemOption]

    def to_dict(self) -> dict[str, Any]:
        options = []
        for componentsschemas_question_item_options_item_data in self.options:
            componentsschemas_question_item_options_item = componentsschemas_question_item_options_item_data.to_dict()
            options.append(componentsschemas_question_item_options_item)

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "options": options,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        from ..models.question_item_option import QuestionItemOption

        d = dict(src_dict)
        options = []
        _options = d.pop("options")
        for componentsschemas_question_item_options_item_data in _options:
            componentsschemas_question_item_options_item = QuestionItemOption.from_dict(
                componentsschemas_question_item_options_item_data
            )

            options.append(componentsschemas_question_item_options_item)

        longread_exercise_multiple_choice_question_item_multiple_choice = cls(
            options=options,
        )

        return longread_exercise_multiple_choice_question_item_multiple_choice
