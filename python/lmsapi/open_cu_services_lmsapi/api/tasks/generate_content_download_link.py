from http import HTTPStatus
from typing import Any

import httpx

from ...client import AuthenticatedClient, Client
from ...models.base_bad_request_error import BaseBadRequestError
from ...models.base_forbidden_error import BaseForbiddenError
from ...models.base_problem_error import BaseProblemError
from ...models.base_unauthorized_error import BaseUnauthorizedError
from ...models.generate_content_download_link_response import GenerateContentDownloadLinkResponse
from ...types import UNSET, Response, Unset


def _get_kwargs(
    *,
    filename: str,
    version: None | str | Unset = UNSET,
) -> dict[str, Any]:

    params: dict[str, Any] = {}

    params["filename"] = filename

    json_version: None | str | Unset
    if isinstance(version, Unset):
        json_version = UNSET
    else:
        json_version = version
    params["version"] = json_version

    params = {k: v for k, v in params.items() if v is not UNSET and v is not None}

    _kwargs: dict[str, Any] = {
        "method": "get",
        "url": "/micro-lms/content/download-link",
        "params": params,
    }

    return _kwargs


def _parse_response(
    *, client: AuthenticatedClient | Client, response: httpx.Response
) -> (
    BaseBadRequestError
    | BaseForbiddenError
    | BaseProblemError
    | BaseUnauthorizedError
    | GenerateContentDownloadLinkResponse
):
    if response.status_code == 200:
        response_200 = GenerateContentDownloadLinkResponse.from_dict(response.json())

        return response_200

    if response.status_code == 400:
        response_400 = BaseBadRequestError.from_dict(response.json())

        return response_400

    if response.status_code == 401:
        response_401 = BaseUnauthorizedError.from_dict(response.json())

        return response_401

    if response.status_code == 403:
        response_403 = BaseForbiddenError.from_dict(response.json())

        return response_403

    response_default = BaseProblemError.from_dict(response.json())

    return response_default


def _build_response(
    *, client: AuthenticatedClient | Client, response: httpx.Response
) -> Response[
    BaseBadRequestError
    | BaseForbiddenError
    | BaseProblemError
    | BaseUnauthorizedError
    | GenerateContentDownloadLinkResponse
]:
    return Response(
        status_code=HTTPStatus(response.status_code),
        content=response.content,
        headers=response.headers,
        parsed=_parse_response(client=client, response=response),
    )


def sync_detailed(
    *,
    client: AuthenticatedClient,
    filename: str,
    version: None | str | Unset = UNSET,
) -> Response[
    BaseBadRequestError
    | BaseForbiddenError
    | BaseProblemError
    | BaseUnauthorizedError
    | GenerateContentDownloadLinkResponse
]:
    """Generate content download link.

     Returns generated content download link by filename.

    Args:
        filename (str): File object path in storage. Example:
            longreads/16770/English_204S4-C_SW_Week 6.pdf.
        version (None | str | Unset): Material content revision identifier. Example: 0104f8da.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        Response[BaseBadRequestError | BaseForbiddenError | BaseProblemError | BaseUnauthorizedError | GenerateContentDownloadLinkResponse]
    """

    kwargs = _get_kwargs(
        filename=filename,
        version=version,
    )

    response = client.get_httpx_client().request(
        **kwargs,
    )

    return _build_response(client=client, response=response)


def sync(
    *,
    client: AuthenticatedClient,
    filename: str,
    version: None | str | Unset = UNSET,
) -> (
    BaseBadRequestError
    | BaseForbiddenError
    | BaseProblemError
    | BaseUnauthorizedError
    | GenerateContentDownloadLinkResponse
    | None
):
    """Generate content download link.

     Returns generated content download link by filename.

    Args:
        filename (str): File object path in storage. Example:
            longreads/16770/English_204S4-C_SW_Week 6.pdf.
        version (None | str | Unset): Material content revision identifier. Example: 0104f8da.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        BaseBadRequestError | BaseForbiddenError | BaseProblemError | BaseUnauthorizedError | GenerateContentDownloadLinkResponse
    """

    return sync_detailed(
        client=client,
        filename=filename,
        version=version,
    ).parsed


async def asyncio_detailed(
    *,
    client: AuthenticatedClient,
    filename: str,
    version: None | str | Unset = UNSET,
) -> Response[
    BaseBadRequestError
    | BaseForbiddenError
    | BaseProblemError
    | BaseUnauthorizedError
    | GenerateContentDownloadLinkResponse
]:
    """Generate content download link.

     Returns generated content download link by filename.

    Args:
        filename (str): File object path in storage. Example:
            longreads/16770/English_204S4-C_SW_Week 6.pdf.
        version (None | str | Unset): Material content revision identifier. Example: 0104f8da.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        Response[BaseBadRequestError | BaseForbiddenError | BaseProblemError | BaseUnauthorizedError | GenerateContentDownloadLinkResponse]
    """

    kwargs = _get_kwargs(
        filename=filename,
        version=version,
    )

    response = await client.get_async_httpx_client().request(**kwargs)

    return _build_response(client=client, response=response)


async def asyncio(
    *,
    client: AuthenticatedClient,
    filename: str,
    version: None | str | Unset = UNSET,
) -> (
    BaseBadRequestError
    | BaseForbiddenError
    | BaseProblemError
    | BaseUnauthorizedError
    | GenerateContentDownloadLinkResponse
    | None
):
    """Generate content download link.

     Returns generated content download link by filename.

    Args:
        filename (str): File object path in storage. Example:
            longreads/16770/English_204S4-C_SW_Week 6.pdf.
        version (None | str | Unset): Material content revision identifier. Example: 0104f8da.

    Raises:
        errors.UnexpectedStatus: If the server returns an undocumented status code and Client.raise_on_unexpected_status is True.
        httpx.TimeoutException: If the request takes longer than Client.timeout.

    Returns:
        BaseBadRequestError | BaseForbiddenError | BaseProblemError | BaseUnauthorizedError | GenerateContentDownloadLinkResponse
    """

    return (
        await asyncio_detailed(
            client=client,
            filename=filename,
            version=version,
        )
    ).parsed
