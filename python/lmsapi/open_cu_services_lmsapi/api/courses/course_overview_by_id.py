from http import HTTPStatus
from typing import Any
from urllib.parse import quote

import httpx

from ...client import AuthenticatedClient, Client
from ...models.base_bad_request_error import BaseBadRequestError
from ...models.base_not_found_error import BaseNotFoundError
from ...models.base_problem_error import BaseProblemError
from ...models.base_unauthorized_error import BaseUnauthorizedError
from ...models.course_overview_by_id_response import CourseOverviewByIdResponse
from ...types import Response


def _get_kwargs(
    course_id: int,
) -> dict[str, Any]:

    _kwargs: dict[str, Any] = {
        "method": "get",
        "url": "/micro-lms/courses/{course_id}/overview".format(
            course_id=quote(str(course_id), safe=""),
        ),
    }

    return _kwargs


def _parse_response(
    *, client: AuthenticatedClient | Client, response: httpx.Response
) -> BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | CourseOverviewByIdResponse:
    if response.status_code == 200:
        response_200 = CourseOverviewByIdResponse.from_dict(response.json())

        return response_200

    if response.status_code == 400:
        response_400 = BaseBadRequestError.from_dict(response.json())

        return response_400

    if response.status_code == 401:
        response_401 = BaseUnauthorizedError.from_dict(response.json())

        return response_401

    if response.status_code == 404:
        response_404 = BaseNotFoundError.from_dict(response.json())

        return response_404

    response_default = BaseProblemError.from_dict(response.json())

    return response_default


def _build_response(
    *, client: AuthenticatedClient | Client, response: httpx.Response
) -> Response[
    BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | CourseOverviewByIdResponse
]:
    return Response(
        status_code=HTTPStatus(response.status_code),
        content=response.content,
        headers=response.headers,
        parsed=_parse_response(client=client, response=response),
    )


def sync_detailed(
    course_id: int,
    *,
    client: AuthenticatedClient,
) -> Response[
    BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | CourseOverviewByIdResponse
]:
    """Get course overview by its ID.

     Returns course overview by courseId. Overview consists of unit items called as themes, which are
    typically weekly modules of longread IDs and exercise items.

    Args:
        course_id (int): Numeric identifier of the course. Example: 897.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        Response[BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | CourseOverviewByIdResponse]
    """

    kwargs = _get_kwargs(
        course_id=course_id,
    )

    response = client.get_httpx_client().request(
        **kwargs,
    )

    return _build_response(client=client, response=response)


def sync(
    course_id: int,
    *,
    client: AuthenticatedClient,
) -> (
    BaseBadRequestError
    | BaseNotFoundError
    | BaseProblemError
    | BaseUnauthorizedError
    | CourseOverviewByIdResponse
    | None
):
    """Get course overview by its ID.

     Returns course overview by courseId. Overview consists of unit items called as themes, which are
    typically weekly modules of longread IDs and exercise items.

    Args:
        course_id (int): Numeric identifier of the course. Example: 897.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | CourseOverviewByIdResponse
    """

    return sync_detailed(
        course_id=course_id,
        client=client,
    ).parsed


async def asyncio_detailed(
    course_id: int,
    *,
    client: AuthenticatedClient,
) -> Response[
    BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | CourseOverviewByIdResponse
]:
    """Get course overview by its ID.

     Returns course overview by courseId. Overview consists of unit items called as themes, which are
    typically weekly modules of longread IDs and exercise items.

    Args:
        course_id (int): Numeric identifier of the course. Example: 897.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        Response[BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | CourseOverviewByIdResponse]
    """

    kwargs = _get_kwargs(
        course_id=course_id,
    )

    response = await client.get_async_httpx_client().request(**kwargs)

    return _build_response(client=client, response=response)


async def asyncio(
    course_id: int,
    *,
    client: AuthenticatedClient,
) -> (
    BaseBadRequestError
    | BaseNotFoundError
    | BaseProblemError
    | BaseUnauthorizedError
    | CourseOverviewByIdResponse
    | None
):
    """Get course overview by its ID.

     Returns course overview by courseId. Overview consists of unit items called as themes, which are
    typically weekly modules of longread IDs and exercise items.

    Args:
        course_id (int): Numeric identifier of the course. Example: 897.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | CourseOverviewByIdResponse
    """

    return (
        await asyncio_detailed(
            course_id=course_id,
            client=client,
        )
    ).parsed
