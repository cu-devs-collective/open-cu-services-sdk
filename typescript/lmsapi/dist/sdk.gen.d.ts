import type { Client, Options as Options2, TDataShape } from './client';
import type { CourseOverviewByIdData, CourseOverviewByIdErrors, CourseOverviewByIdResponses, CourseSummaryByIdData, CourseSummaryByIdErrors, CourseSummaryByIdResponses, CourseThemeSummaryByIdData, CourseThemeSummaryByIdErrors, CourseThemeSummaryByIdResponses, CurrentStudentData, CurrentStudentErrors, CurrentStudentResponses, GenerateContentDownloadLinkData, GenerateContentDownloadLinkErrors, GenerateContentDownloadLinkResponses, ListStudentCoursesData, ListStudentCoursesErrors, ListStudentCoursesResponses, LongreadMaterialsByIdData, LongreadMaterialsByIdErrors, LongreadMaterialsByIdResponses, LongreadSummaryByIdData, LongreadSummaryByIdErrors, LongreadSummaryByIdResponses, TaskByIdData, TaskByIdErrors, TaskByIdResponses } from './types.gen';
export type Options<TData extends TDataShape = TDataShape, ThrowOnError extends boolean = boolean, TResponse = unknown> = Options2<TData, ThrowOnError, TResponse> & {
    /**
     * You can provide a client instance returned by `createClient()` instead of
     * individual options. This might be also useful if you want to implement a
     * custom client.
     */
    client?: Client;
    /**
     * You can pass arbitrary values through the `meta` object. This can be
     * used to access values that aren't defined as part of the SDK function.
     */
    meta?: Record<string, unknown>;
};
/**
 * Get current student.
 *
 * Returns authenticated student data.
 */
export declare const currentStudent: <ThrowOnError extends boolean = false>(options?: Options<CurrentStudentData, ThrowOnError>) => import("./client").RequestResult<CurrentStudentResponses, CurrentStudentErrors, ThrowOnError, "fields">;
/**
 * List courses for the current student.
 *
 * Returns courses summary the authenticated student is enrolled in.
 *
 */
export declare const listStudentCourses: <ThrowOnError extends boolean = false>(options?: Options<ListStudentCoursesData, ThrowOnError>) => import("./client").RequestResult<ListStudentCoursesResponses, ListStudentCoursesErrors, ThrowOnError, "fields">;
/**
 * Get course summary by its ID.
 *
 * Returns summary information about a course by courseId.
 */
export declare const courseSummaryById: <ThrowOnError extends boolean = false>(options: Options<CourseSummaryByIdData, ThrowOnError>) => import("./client").RequestResult<CourseSummaryByIdResponses, CourseSummaryByIdErrors, ThrowOnError, "fields">;
/**
 * Get course overview by its ID.
 *
 * Returns course overview by courseId. Overview consists of unit items called as themes, which are typically weekly modules of longread IDs and exercise items.
 *
 */
export declare const courseOverviewById: <ThrowOnError extends boolean = false>(options: Options<CourseOverviewByIdData, ThrowOnError>) => import("./client").RequestResult<CourseOverviewByIdResponses, CourseOverviewByIdErrors, ThrowOnError, "fields">;
/**
 * Get course theme summary by its ID.
 *
 * Returns summary information about a course theme by themeId.
 */
export declare const courseThemeSummaryById: <ThrowOnError extends boolean = false>(options: Options<CourseThemeSummaryByIdData, ThrowOnError>) => import("./client").RequestResult<CourseThemeSummaryByIdResponses, CourseThemeSummaryByIdErrors, ThrowOnError, "fields">;
/**
 * Get longread summary by its ID.
 *
 * Returns summary information about a longread item by longreadId.
 *
 */
export declare const longreadSummaryById: <ThrowOnError extends boolean = false>(options: Options<LongreadSummaryByIdData, ThrowOnError>) => import("./client").RequestResult<LongreadSummaryByIdResponses, LongreadSummaryByIdErrors, ThrowOnError, "fields">;
/**
 * Get longread materials by its ID.
 *
 * Returns longread materials by longreadId. Materials are blocks like markdown, files and exercises. Blocks are declared for each longread.
 *
 */
export declare const longreadMaterialsById: <ThrowOnError extends boolean = false>(options: Options<LongreadMaterialsByIdData, ThrowOnError>) => import("./client").RequestResult<LongreadMaterialsByIdResponses, LongreadMaterialsByIdErrors, ThrowOnError, "fields">;
/**
 * Get task by its ID.
 *
 * Returns task by taskId.
 */
export declare const taskById: <ThrowOnError extends boolean = false>(options: Options<TaskByIdData, ThrowOnError>) => import("./client").RequestResult<TaskByIdResponses, TaskByIdErrors, ThrowOnError, "fields">;
/**
 * Generate content download link.
 *
 * Returns generated content download link by filename.
 */
export declare const generateContentDownloadLink: <ThrowOnError extends boolean = false>(options: Options<GenerateContentDownloadLinkData, ThrowOnError>) => import("./client").RequestResult<GenerateContentDownloadLinkResponses, GenerateContentDownloadLinkErrors, ThrowOnError, "fields">;
//# sourceMappingURL=sdk.gen.d.ts.map