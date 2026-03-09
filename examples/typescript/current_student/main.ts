import {
  createLmsApiClient,
  currentStudent
} from "@cu-devs-collective/open-cu-services-lmsapi";

async function main() {
  const bffCookie = process.env.CU_LMS_BFF_COOKIE;
  if (!bffCookie) {
    throw new Error("CU_LMS_BFF_COOKIE is not set in env");
  }

  const client = createLmsApiClient();
  const result = await currentStudent({
    client,
    auth: () => bffCookie
  });

  if (result.error) {
    if (result.error instanceof Error) {
      console.error("currentStudent returned error:");
      console.error(result.error);
    } else {
      console.error(`currentStudent response with status ${result.response?.status}:`);
      console.error(JSON.stringify(result.error, null, 2));
    }
    process.exit(1);
  }

  console.log(`currentStudent response:`);
  console.log(JSON.stringify(result.data, null, 2));
}

await main();
