from http import HTTPStatus
from typing import Any
from urllib.parse import quote

import httpx

from ...client import AuthenticatedClient, Client
from ...models.base_not_found_error import BaseNotFoundError
from ...models.base_problem_error import BaseProblemError
from ...models.base_unauthorized_error import BaseUnauthorizedError
from ...models.task_by_id_response import TaskByIdResponse
from ...types import Response


def _get_kwargs(
    task_id: int,
) -> dict[str, Any]:

    _kwargs: dict[str, Any] = {
        "method": "get",
        "url": "/micro-lms/tasks/{task_id}".format(
            task_id=quote(str(task_id), safe=""),
        ),
    }

    return _kwargs


def _parse_response(
    *, client: AuthenticatedClient | Client, response: httpx.Response
) -> BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | TaskByIdResponse:
    if response.status_code == 200:
        response_200 = TaskByIdResponse.from_dict(response.json())

        return response_200

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
) -> Response[BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | TaskByIdResponse]:
    return Response(
        status_code=HTTPStatus(response.status_code),
        content=response.content,
        headers=response.headers,
        parsed=_parse_response(client=client, response=response),
    )


def sync_detailed(
    task_id: int,
    *,
    client: AuthenticatedClient,
) -> Response[BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | TaskByIdResponse]:
    """Get task by its ID.

     Returns task by taskId.

    Args:
        task_id (int): Numeric identifier of the task. Example: 1468065.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        Response[BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | TaskByIdResponse]
    """

    kwargs = _get_kwargs(
        task_id=task_id,
    )

    response = client.get_httpx_client().request(
        **kwargs,
    )

    return _build_response(client=client, response=response)


def sync(
    task_id: int,
    *,
    client: AuthenticatedClient,
) -> BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | TaskByIdResponse | None:
    """Get task by its ID.

     Returns task by taskId.

    Args:
        task_id (int): Numeric identifier of the task. Example: 1468065.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | TaskByIdResponse
    """

    return sync_detailed(
        task_id=task_id,
        client=client,
    ).parsed


async def asyncio_detailed(
    task_id: int,
    *,
    client: AuthenticatedClient,
) -> Response[BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | TaskByIdResponse]:
    """Get task by its ID.

     Returns task by taskId.

    Args:
        task_id (int): Numeric identifier of the task. Example: 1468065.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        Response[BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | TaskByIdResponse]
    """

    kwargs = _get_kwargs(
        task_id=task_id,
    )

    response = await client.get_async_httpx_client().request(**kwargs)

    return _build_response(client=client, response=response)


async def asyncio(
    task_id: int,
    *,
    client: AuthenticatedClient,
) -> BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | TaskByIdResponse | None:
    """Get task by its ID.

     Returns task by taskId.

    Args:
        task_id (int): Numeric identifier of the task. Example: 1468065.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | TaskByIdResponse
    """

    return (
        await asyncio_detailed(
            task_id=task_id,
            client=client,
        )
    ).parsed
