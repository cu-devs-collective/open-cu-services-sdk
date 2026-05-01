from http import HTTPStatus
from typing import Any
from urllib.parse import quote

import httpx

from ...client import AuthenticatedClient, Client
from ...models.base_bad_request_error import BaseBadRequestError
from ...models.base_not_found_error import BaseNotFoundError
from ...models.base_problem_error import BaseProblemError
from ...models.base_unauthorized_error import BaseUnauthorizedError
from ...models.course_theme_summary_by_id_response import CourseThemeSummaryByIdResponse
from ...types import Response


def _get_kwargs(
    theme_id: int,
) -> dict[str, Any]:

    _kwargs: dict[str, Any] = {
        "method": "get",
        "url": "/micro-lms/themes/{theme_id}".format(
            theme_id=quote(str(theme_id), safe=""),
        ),
    }

    return _kwargs


def _parse_response(
    *, client: AuthenticatedClient | Client, response: httpx.Response
) -> (
    BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | CourseThemeSummaryByIdResponse
):
    if response.status_code == 200:
        response_200 = CourseThemeSummaryByIdResponse.from_dict(response.json())

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
    BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | CourseThemeSummaryByIdResponse
]:
    return Response(
        status_code=HTTPStatus(response.status_code),
        content=response.content,
        headers=response.headers,
        parsed=_parse_response(client=client, response=response),
    )


def sync_detailed(
    theme_id: int,
    *,
    client: AuthenticatedClient,
) -> Response[
    BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | CourseThemeSummaryByIdResponse
]:
    """Get course theme summary by its ID.

     Returns summary information about a course theme by themeId.

    Args:
        theme_id (int): Numeric identifier of the course theme. Example: 6663.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        Response[BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | CourseThemeSummaryByIdResponse]
    """

    kwargs = _get_kwargs(
        theme_id=theme_id,
    )

    response = client.get_httpx_client().request(
        **kwargs,
    )

    return _build_response(client=client, response=response)


def sync(
    theme_id: int,
    *,
    client: AuthenticatedClient,
) -> (
    BaseBadRequestError
    | BaseNotFoundError
    | BaseProblemError
    | BaseUnauthorizedError
    | CourseThemeSummaryByIdResponse
    | None
):
    """Get course theme summary by its ID.

     Returns summary information about a course theme by themeId.

    Args:
        theme_id (int): Numeric identifier of the course theme. Example: 6663.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | CourseThemeSummaryByIdResponse
    """

    return sync_detailed(
        theme_id=theme_id,
        client=client,
    ).parsed


async def asyncio_detailed(
    theme_id: int,
    *,
    client: AuthenticatedClient,
) -> Response[
    BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | CourseThemeSummaryByIdResponse
]:
    """Get course theme summary by its ID.

     Returns summary information about a course theme by themeId.

    Args:
        theme_id (int): Numeric identifier of the course theme. Example: 6663.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        Response[BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | CourseThemeSummaryByIdResponse]
    """

    kwargs = _get_kwargs(
        theme_id=theme_id,
    )

    response = await client.get_async_httpx_client().request(**kwargs)

    return _build_response(client=client, response=response)


async def asyncio(
    theme_id: int,
    *,
    client: AuthenticatedClient,
) -> (
    BaseBadRequestError
    | BaseNotFoundError
    | BaseProblemError
    | BaseUnauthorizedError
    | CourseThemeSummaryByIdResponse
    | None
):
    """Get course theme summary by its ID.

     Returns summary information about a course theme by themeId.

    Args:
        theme_id (int): Numeric identifier of the course theme. Example: 6663.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | CourseThemeSummaryByIdResponse
    """

    return (
        await asyncio_detailed(
            theme_id=theme_id,
            client=client,
        )
    ).parsed
