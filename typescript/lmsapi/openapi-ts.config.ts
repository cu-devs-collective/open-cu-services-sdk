import { defineConfig } from "@hey-api/openapi-ts";

export default defineConfig({
  input: "../../spec/lmsapi/lmsapi.re.openapi.yaml",
  output: {
    path: "src",
    clean: true,
    indexFile: true
  },
  plugins: [
    "@hey-api/client-fetch",
    "@hey-api/typescript",
    "zod",
    {
      name: "@hey-api/sdk",
      validator: {
        request: false,
        response: true
      }
    }
  ]
});
