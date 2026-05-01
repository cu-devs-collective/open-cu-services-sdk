import { client } from "./client.gen";
type ClientConfig = Parameters<typeof client.setConfig>[0];
export declare const DEFAULT_BASE_URL = "https://my.centraluniversity.ru/api";
export declare const DEFAULT_USER_AGENT = "Open-CU-Services/TypeScript";
export declare const SDK_VERSION = "0.1.0";
export declare const SPEC_VERSION = "0.1.0";
export declare const createLmsApiClient: (config?: ClientConfig) => import("./client").Client;
export {};
//# sourceMappingURL=default.d.ts.map