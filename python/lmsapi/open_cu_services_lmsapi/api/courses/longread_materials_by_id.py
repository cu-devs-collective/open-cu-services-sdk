from http import HTTPStatus
from typing import Any
from urllib.parse import quote

import httpx

from ...client import AuthenticatedClient, Client
from ...models.base_bad_request_error import BaseBadRequestError
from ...models.base_not_found_error import BaseNotFoundError
from ...models.base_problem_error import BaseProblemError
from ...models.base_unauthorized_error import BaseUnauthorizedError
from ...models.longread_materials_by_id_response import LongreadMaterialsByIdResponse
from ...types import UNSET, Response, Unset


def _get_kwargs(
    longread_id: int,
    *,
    limit: int | Unset = 25,
    offset: int | Unset = 0,
) -> dict[str, Any]:

    params: dict[str, Any] = {}

    params["limit"] = limit

    params["offset"] = offset

    params = {k: v for k, v in params.items() if v is not UNSET and v is not None}

    _kwargs: dict[str, Any] = {
        "method": "get",
        "url": "/micro-lms/longreads/{longread_id}/materials".format(
            longread_id=quote(str(longread_id), safe=""),
        ),
        "params": params,
    }

    return _kwargs


def _parse_response(
    *, client: AuthenticatedClient | Client, response: httpx.Response
) -> BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | LongreadMaterialsByIdResponse:
    if response.status_code == 200:
        response_200 = LongreadMaterialsByIdResponse.from_dict(response.json())

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
    BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | LongreadMaterialsByIdResponse
]:
    return Response(
        status_code=HTTPStatus(response.status_code),
        content=response.content,
        headers=response.headers,
        parsed=_parse_response(client=client, response=response),
    )


def sync_detailed(
    longread_id: int,
    *,
    client: AuthenticatedClient,
    limit: int | Unset = 25,
    offset: int | Unset = 0,
) -> Response[
    BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | LongreadMaterialsByIdResponse
]:
    """Get longread materials by its ID.

     Returns longread materials by longreadId. Materials are blocks like markdown, files and exercises.
    Blocks are declared for each longread.

    Args:
        longread_id (int): Numeric identifier of the longread item. Example: 12707.
        limit (int | Unset):  Default: 25.
        offset (int | Unset):  Default: 0.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        Response[BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | LongreadMaterialsByIdResponse]
    """

    kwargs = _get_kwargs(
        longread_id=longread_id,
        limit=limit,
        offset=offset,
    )

    response = client.get_httpx_client().request(
        **kwargs,
    )

    return _build_response(client=client, response=response)


def sync(
    longread_id: int,
    *,
    client: AuthenticatedClient,
    limit: int | Unset = 25,
    offset: int | Unset = 0,
) -> (
    BaseBadRequestError
    | BaseNotFoundError
    | BaseProblemError
    | BaseUnauthorizedError
    | LongreadMaterialsByIdResponse
    | None
):
    """Get longread materials by its ID.

     Returns longread materials by longreadId. Materials are blocks like markdown, files and exercises.
    Blocks are declared for each longread.

    Args:
        longread_id (int): Numeric identifier of the longread item. Example: 12707.
        limit (int | Unset):  Default: 25.
        offset (int | Unset):  Default: 0.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | LongreadMaterialsByIdResponse
    """

    return sync_detailed(
        longread_id=longread_id,
        client=client,
        limit=limit,
        offset=offset,
    ).parsed


async def asyncio_detailed(
    longread_id: int,
    *,
    client: AuthenticatedClient,
    limit: int | Unset = 25,
    offset: int | Unset = 0,
) -> Response[
    BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | LongreadMaterialsByIdResponse
]:
    """Get longread materials by its ID.

     Returns longread materials by longreadId. Materials are blocks like markdown, files and exercises.
    Blocks are declared for each longread.

    Args:
        longread_id (int): Numeric identifier of the longread item. Example: 12707.
        limit (int | Unset):  Default: 25.
        offset (int | Unset):  Default: 0.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        Response[BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | LongreadMaterialsByIdResponse]
    """

    kwargs = _get_kwargs(
        longread_id=longread_id,
        limit=limit,
        offset=offset,
    )

    response = await client.get_async_httpx_client().request(**kwargs)

    return _build_response(client=client, response=response)


async def asyncio(
    longread_id: int,
    *,
    client: AuthenticatedClient,
    limit: int | Unset = 25,
    offset: int | Unset = 0,
) -> (
    BaseBadRequestError
    | BaseNotFoundError
    | BaseProblemError
    | BaseUnauthorizedError
    | LongreadMaterialsByIdResponse
    | None
):
    """Get longread materials by its ID.

     Returns longread materials by longreadId. Materials are blocks like markdown, files and exercises.
    Blocks are declared for each longread.

    Args:
        longread_id (int): Numeric identifier of the longread item. Example: 12707.
        limit (int | Unset):  Default: 25.
        offset (int | Unset):  Default: 0.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        BaseBadRequestError | BaseNotFoundError | BaseProblemError | BaseUnauthorizedError | LongreadMaterialsByIdResponse
    """

    return (
        await asyncio_detailed(
            longread_id=longread_id,
            client=client,
            limit=limit,
            offset=offset,
        )
    ).parsed
