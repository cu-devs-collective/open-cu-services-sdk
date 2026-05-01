from http import HTTPStatus
from typing import Any

import httpx

from ...client import AuthenticatedClient, Client
from ...models.base_problem_error import BaseProblemError
from ...models.base_unauthorized_error import BaseUnauthorizedError
from ...models.current_student_response import CurrentStudentResponse
from ...types import Response


def _get_kwargs() -> dict[str, Any]:

    _kwargs: dict[str, Any] = {
        "method": "get",
        "url": "/micro-lms/students/me",
    }

    return _kwargs


def _parse_response(
    *, client: AuthenticatedClient | Client, response: httpx.Response
) -> BaseProblemError | BaseUnauthorizedError | CurrentStudentResponse:
    if response.status_code == 200:
        response_200 = CurrentStudentResponse.from_dict(response.json())

        return response_200

    if response.status_code == 401:
        response_401 = BaseUnauthorizedError.from_dict(response.json())

        return response_401

    response_default = BaseProblemError.from_dict(response.json())

    return response_default


def _build_response(
    *, client: AuthenticatedClient | Client, response: httpx.Response
) -> Response[BaseProblemError | BaseUnauthorizedError | CurrentStudentResponse]:
    return Response(
        status_code=HTTPStatus(response.status_code),
        content=response.content,
        headers=response.headers,
        parsed=_parse_response(client=client, response=response),
    )


def sync_detailed(
    *,
    client: AuthenticatedClient,
) -> Response[BaseProblemError | BaseUnauthorizedError | CurrentStudentResponse]:
    """Get current student.

     Returns authenticated student data.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        Response[BaseProblemError | BaseUnauthorizedError | CurrentStudentResponse]
    """

    kwargs = _get_kwargs()

    response = client.get_httpx_client().request(
        **kwargs,
    )

    return _build_response(client=client, response=response)


def sync(
    *,
    client: AuthenticatedClient,
) -> BaseProblemError | BaseUnauthorizedError | CurrentStudentResponse | None:
    """Get current student.

     Returns authenticated student data.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        BaseProblemError | BaseUnauthorizedError | CurrentStudentResponse
    """

    return sync_detailed(
        client=client,
    ).parsed


async def asyncio_detailed(
    *,
    client: AuthenticatedClient,
) -> Response[BaseProblemError | BaseUnauthorizedError | CurrentStudentResponse]:
    """Get current student.

     Returns authenticated student data.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        Response[BaseProblemError | BaseUnauthorizedError | CurrentStudentResponse]
    """

    kwargs = _get_kwargs()

    response = await client.get_async_httpx_client().request(**kwargs)

    return _build_response(client=client, response=response)


async def asyncio(
    *,
    client: AuthenticatedClient,
) -> BaseProblemError | BaseUnauthorizedError | CurrentStudentResponse | None:
    """Get current student.

     Returns authenticated student data.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        BaseProblemError | BaseUnauthorizedError | CurrentStudentResponse
    """

    return (
        await asyncio_detailed(
            client=client,
        )
    ).parsed
