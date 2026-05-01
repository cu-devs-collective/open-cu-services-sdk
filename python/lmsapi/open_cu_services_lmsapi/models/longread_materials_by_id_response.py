from __future__ import annotations

from collections.abc import Mapping
from typing import TYPE_CHECKING, Any, TypeVar

from attrs import define as _attrs_define

if TYPE_CHECKING:
    from ..models.longread_audio_material_item import LongreadAudioMaterialItem
    from ..models.longread_exercise_coding_material_item import LongreadExerciseCodingMaterialItem
    from ..models.longread_exercise_questions_material_item import LongreadExerciseQuestionsMaterialItem
    from ..models.longread_file_material_item import LongreadFileMaterialItem
    from ..models.longread_image_material_item import LongreadImageMaterialItem
    from ..models.longread_markdown_material_item import LongreadMarkdownMaterialItem
    from ..models.longread_video_material_item import LongreadVideoMaterialItem
    from ..models.longread_video_platform_material_item import LongreadVideoPlatformMaterialItem
    from ..models.paging import Paging


T = TypeVar("T", bound="LongreadMaterialsByIdResponse")


@_attrs_define
class LongreadMaterialsByIdResponse:
    """
    Attributes:
        items (list[LongreadAudioMaterialItem | LongreadExerciseCodingMaterialItem |
            LongreadExerciseQuestionsMaterialItem | LongreadFileMaterialItem | LongreadImageMaterialItem |
            LongreadMarkdownMaterialItem | LongreadVideoMaterialItem | LongreadVideoPlatformMaterialItem]):
        paging (Paging):
    """

    items: list[
        LongreadAudioMaterialItem
        | LongreadExerciseCodingMaterialItem
        | LongreadExerciseQuestionsMaterialItem
        | LongreadFileMaterialItem
        | LongreadImageMaterialItem
        | LongreadMarkdownMaterialItem
        | LongreadVideoMaterialItem
        | LongreadVideoPlatformMaterialItem
    ]
    paging: Paging

    def to_dict(self) -> dict[str, Any]:
        from ..models.longread_exercise_coding_material_item import LongreadExerciseCodingMaterialItem
        from ..models.longread_exercise_questions_material_item import LongreadExerciseQuestionsMaterialItem
        from ..models.longread_file_material_item import LongreadFileMaterialItem
        from ..models.longread_image_material_item import LongreadImageMaterialItem
        from ..models.longread_markdown_material_item import LongreadMarkdownMaterialItem
        from ..models.longread_video_material_item import LongreadVideoMaterialItem
        from ..models.longread_video_platform_material_item import LongreadVideoPlatformMaterialItem

        items = []
        for items_item_data in self.items:
            items_item: dict[str, Any]
            if isinstance(items_item_data, LongreadMarkdownMaterialItem):
                items_item = items_item_data.to_dict()
            elif isinstance(items_item_data, LongreadFileMaterialItem):
                items_item = items_item_data.to_dict()
            elif isinstance(items_item_data, LongreadExerciseCodingMaterialItem):
                items_item = items_item_data.to_dict()
            elif isinstance(items_item_data, LongreadImageMaterialItem):
                items_item = items_item_data.to_dict()
            elif isinstance(items_item_data, LongreadExerciseQuestionsMaterialItem):
                items_item = items_item_data.to_dict()
            elif isinstance(items_item_data, LongreadVideoPlatformMaterialItem):
                items_item = items_item_data.to_dict()
            elif isinstance(items_item_data, LongreadVideoMaterialItem):
                items_item = items_item_data.to_dict()
            else:
                items_item = items_item_data.to_dict()

            items.append(items_item)

        paging = self.paging.to_dict()

        field_dict: dict[str, Any] = {}

        field_dict.update(
            {
                "items": items,
                "paging": paging,
            }
        )

        return field_dict

    @classmethod
    def from_dict(cls: type[T], src_dict: Mapping[str, Any]) -> T:
        from ..models.longread_audio_material_item import LongreadAudioMaterialItem
        from ..models.longread_exercise_coding_material_item import LongreadExerciseCodingMaterialItem
        from ..models.longread_exercise_questions_material_item import LongreadExerciseQuestionsMaterialItem
        from ..models.longread_file_material_item import LongreadFileMaterialItem
        from ..models.longread_image_material_item import LongreadImageMaterialItem
        from ..models.longread_markdown_material_item import LongreadMarkdownMaterialItem
        from ..models.longread_video_material_item import LongreadVideoMaterialItem
        from ..models.longread_video_platform_material_item import LongreadVideoPlatformMaterialItem
        from ..models.paging import Paging

        d = dict(src_dict)
        items = []
        _items = d.pop("items")
        for items_item_data in _items:

            def _parse_items_item(
                data: object,
            ) -> (
                LongreadAudioMaterialItem
                | LongreadExerciseCodingMaterialItem
                | LongreadExerciseQuestionsMaterialItem
                | LongreadFileMaterialItem
                | LongreadImageMaterialItem
                | LongreadMarkdownMaterialItem
                | LongreadVideoMaterialItem
                | LongreadVideoPlatformMaterialItem
            ):
                try:
                    if not isinstance(data, dict):
                        raise TypeError()
                    componentsschemas_longread_material_item_type_0 = LongreadMarkdownMaterialItem.from_dict(data)

                    return componentsschemas_longread_material_item_type_0
                except (TypeError, ValueError, AttributeError, KeyError):
                    pass
                try:
                    if not isinstance(data, dict):
                        raise TypeError()
                    componentsschemas_longread_material_item_type_1 = LongreadFileMaterialItem.from_dict(data)

                    return componentsschemas_longread_material_item_type_1
                except (TypeError, ValueError, AttributeError, KeyError):
                    pass
                try:
                    if not isinstance(data, dict):
                        raise TypeError()
                    componentsschemas_longread_material_item_type_2 = LongreadExerciseCodingMaterialItem.from_dict(data)

                    return componentsschemas_longread_material_item_type_2
                except (TypeError, ValueError, AttributeError, KeyError):
                    pass
                try:
                    if not isinstance(data, dict):
                        raise TypeError()
                    componentsschemas_longread_material_item_type_3 = LongreadImageMaterialItem.from_dict(data)

                    return componentsschemas_longread_material_item_type_3
                except (TypeError, ValueError, AttributeError, KeyError):
                    pass
                try:
                    if not isinstance(data, dict):
                        raise TypeError()
                    componentsschemas_longread_material_item_type_4 = LongreadExerciseQuestionsMaterialItem.from_dict(
                        data
                    )

                    return componentsschemas_longread_material_item_type_4
                except (TypeError, ValueError, AttributeError, KeyError):
                    pass
                try:
                    if not isinstance(data, dict):
                        raise TypeError()
                    componentsschemas_longread_material_item_type_5 = LongreadVideoPlatformMaterialItem.from_dict(data)

                    return componentsschemas_longread_material_item_type_5
                except (TypeError, ValueError, AttributeError, KeyError):
                    pass
                try:
                    if not isinstance(data, dict):
                        raise TypeError()
                    componentsschemas_longread_material_item_type_6 = LongreadVideoMaterialItem.from_dict(data)

                    return componentsschemas_longread_material_item_type_6
                except (TypeError, ValueError, AttributeError, KeyError):
                    pass
                if not isinstance(data, dict):
                    raise TypeError()
                componentsschemas_longread_material_item_type_7 = LongreadAudioMaterialItem.from_dict(data)

                return componentsschemas_longread_material_item_type_7

            items_item = _parse_items_item(items_item_data)

            items.append(items_item)

        paging = Paging.from_dict(d.pop("paging"))

        longread_materials_by_id_response = cls(
            items=items,
            paging=paging,
        )

        return longread_materials_by_id_response
