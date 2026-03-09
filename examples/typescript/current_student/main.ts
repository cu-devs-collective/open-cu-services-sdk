import {
  createLmsApiClient,
  currentStudent
} from "@cu-devs-collective/open-cu-services-lmsapi";

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
  console.error("currentStudent returned error:");
  console.error(JSON.stringify(result.error, null, 2));
  process.exit(1);
}

console.log(`currentStudent response of type ${result.constructor.name}:`);
console.log(JSON.stringify(result.data, null, 2));
