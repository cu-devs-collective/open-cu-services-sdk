import asyncio
import json

from open_cu_services_lmsapi import create_lms_client_from_env
from open_cu_services_lmsapi.api.student import current_student
from open_cu_services_lmsapi.models import CurrentStudentResponse, BaseProblemError, BaseUnauthorizedError
from open_cu_services_lmsapi.types import Response


async def main() -> int:
    # Loads bff_cookie from env variable CU_LMS_BFF_COOKIE
    async with create_lms_client_from_env() as client:
        response: Response[BaseProblemError | BaseUnauthorizedError | CurrentStudentResponse]
        try:
            response = await current_student.asyncio_detailed(client=client)
        except Exception as e:
            raise RuntimeError("current_student.asyncio_detailed failed") from e

        if isinstance(response.parsed, CurrentStudentResponse):
            print("current_student response:")
            print(json.dumps(
                response.parsed.to_dict(),
                indent=2, ensure_ascii=False))
            return 0

        print("current_student response"
              + f" response.status_code={response.status_code}"
              + f" response.parsed={type(response.parsed).__name__}:")
        if response.parsed:
            print(json.dumps(
                response.parsed.to_dict(),
                indent=2, ensure_ascii=False))
        else:
            print(f"no content was parsed, got raw content: {response.content}")

    return 1


if __name__ == "__main__":
    raise SystemExit(asyncio.run(main()))
