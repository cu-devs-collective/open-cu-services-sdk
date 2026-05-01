import * as z from 'zod';
export declare const zBaseErrorType: z.ZodString;
/**
 * Short, human-readable summary of the problem type.
 */
export declare const zBaseErrorTitle: z.ZodString;
/**
 * HTTP status code.
 */
export declare const zBaseErrorStatus: z.ZodInt;
/**
 * Details of the error.
 */
export declare const zBaseErrorDetail: z.ZodString;
/**
 * Relative request path without service prefix where error occurred.
 *
 */
export declare const zBaseErrorInstance: z.ZodString;
/**
 * W3C Trace Context traceparent value for backend to correlate requests across services.
 *
 */
export declare const zBaseErrorTraceId: z.ZodString;
/**
 * Base problem JSON error based from RFC 9457 with trace ID.
 */
export declare const zBaseProblemError: z.ZodObject<{
    type: z.ZodOptional<z.ZodString>;
    title: z.ZodString;
    status: z.ZodInt;
    traceId: z.ZodOptional<z.ZodString>;
}, z.core.$strip>;
/**
 * Base error for Bad Request status.
 */
export declare const zBaseBadRequestError: z.ZodObject<{
    title: z.ZodString;
    status: z.ZodInt;
    errors: z.ZodRecord<z.ZodString, z.ZodArray<z.ZodString>>;
}, z.core.$strip>;
/**
 * Base error for Unauthorized status.
 */
export declare const zBaseUnauthorizedError: z.ZodObject<{
    type: z.ZodOptional<z.ZodString>;
    title: z.ZodString;
    status: z.ZodInt;
    traceId: z.ZodString;
}, z.core.$strip>;
/**
 * Base error for Forbidden error.
 */
export declare const zBaseForbiddenError: z.ZodObject<{
    type: z.ZodOptional<z.ZodString>;
    title: z.ZodString;
    status: z.ZodInt;
    detail: z.ZodOptional<z.ZodString>;
    instance: z.ZodOptional<z.ZodString>;
    traceId: z.ZodString;
}, z.core.$strip>;
/**
 * Base error for Not Found status.
 */
export declare const zBaseNotFoundError: z.ZodObject<{
    title: z.ZodString;
    status: z.ZodInt;
    detail: z.ZodOptional<z.ZodString>;
    instance: z.ZodOptional<z.ZodString>;
    entityId: z.ZodOptional<z.ZodInt>;
    traceId: z.ZodString;
}, z.core.$strip>;
/**
 * Value only seen as null.
 */
export declare const zXRePropertyIncompleteOnlyNullObserved: z.ZodNullable<z.ZodUnknown>;
/**
 * Value only seen as empty array.
 */
export declare const zXRePropertyIncompleteOnlyEmptyArrayObserved: z.ZodArray<z.ZodRecord<z.ZodString, z.ZodUnknown>>;
/**
 * Value only expected to be null.
 */
export declare const zNullOnly: z.ZodNullable<z.ZodUnknown>;
/**
 * Publication state of an item.
 */
export declare const zPublicationState: z.ZodEnum<{
    published: "published";
    archived: "archived";
    draft: "draft";
}>;
/**
 * Numeric identifier of the course.
 */
export declare const zCourseId: z.ZodInt;
/**
 * Skill level label configured for the course.
 */
export declare const zCourseSkillLevel: z.ZodEnum<{
    none: "none";
}>;
/**
 * Indicates if skill level is enabled for the course.
 */
export declare const zCourseIsSkillLevelEnabled: z.ZodBoolean;
/**
 * External syllabus URL of the course.
 */
export declare const zCourseSyllabusUrl: z.ZodNullable<z.ZodString>;
/**
 * TiMe channel of the course.
 */
export declare const zCourseTimeChannelUrl: z.ZodNullable<z.ZodString>;
/**
 * Course settings.
 */
export declare const zCourseSettings: z.ZodObject<{
    skillLevel: z.ZodEnum<{
        none: "none";
    }>;
    isSkillLevelEnabled: z.ZodBoolean;
    syllabusUrl: z.ZodNullable<z.ZodString>;
    timeChannelUrl: z.ZodNullable<z.ZodString>;
}, z.core.$strip>;
/**
 * Course name.
 */
export declare const zCourseName: z.ZodString;
/**
 * Indicates if the course is archived.
 */
export declare const zCourseIsArchived: z.ZodBoolean;
/**
 * Scheduled item publication timestamp, if value is not null.
 */
export declare const zPublishDate: z.ZodNullable<z.ZodISODateTime>;
/**
 * Actual item publication timestamp.
 */
export declare const zPublishedAt: z.ZodNullable<z.ZodISODateTime>;
/**
 * Category to which the course belongs to.
 */
export declare const zCourseCategory: z.ZodEnum<{
    withoutCategory: "withoutCategory";
    general: "general";
    mathematics: "mathematics";
    business: "business";
    development: "development";
    stem: "stem";
    softSkills: "softSkills";
    ml: "ml";
    design: "design";
    analytics: "analytics";
    career: "career";
    management: "management";
}>;
/**
 * Course card icon style identifier.
 */
export declare const zCourseCategoryCover: z.ZodEnum<{
    sineWave: "sineWave";
    curvesGrid: "curvesGrid";
    ellipsesOverlap: "ellipsesOverlap";
    geometricTriangle: "geometricTriangle";
    verticalLines: "verticalLines";
    gridPlanes: "gridPlanes";
    spiralLoops: "spiralLoops";
    symmetricCircles: "symmetricCircles";
}>;
/**
 * Identifier of the subject this course belongs to, if value is not null.
 *
 */
export declare const zSubjectId: z.ZodNullable<z.ZodInt>;
/**
 * Summary information about a course, used for course listing.
 */
export declare const zCourseSummaryItem: z.ZodObject<{
    id: z.ZodInt;
    name: z.ZodString;
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    publishDate: z.ZodNullable<z.ZodISODateTime>;
    publishedAt: z.ZodNullable<z.ZodISODateTime>;
    settings: z.ZodObject<{
        skillLevel: z.ZodEnum<{
            none: "none";
        }>;
        isSkillLevelEnabled: z.ZodBoolean;
        syllabusUrl: z.ZodNullable<z.ZodString>;
        timeChannelUrl: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>;
    subjectId: z.ZodNullable<z.ZodInt>;
    isArchived: z.ZodBoolean;
    category: z.ZodEnum<{
        withoutCategory: "withoutCategory";
        general: "general";
        mathematics: "mathematics";
        business: "business";
        development: "development";
        stem: "stem";
        softSkills: "softSkills";
        ml: "ml";
        design: "design";
        analytics: "analytics";
        career: "career";
        management: "management";
    }>;
    categoryCover: z.ZodEnum<{
        sineWave: "sineWave";
        curvesGrid: "curvesGrid";
        ellipsesOverlap: "ellipsesOverlap";
        geometricTriangle: "geometricTriangle";
        verticalLines: "verticalLines";
        gridPlanes: "gridPlanes";
        spiralLoops: "spiralLoops";
        symmetricCircles: "symmetricCircles";
    }>;
}, z.core.$strip>;
export declare const zPaging: z.ZodObject<{
    limit: z.ZodInt;
    offset: z.ZodInt;
    totalCount: z.ZodInt;
}, z.core.$strip>;
export declare const zListStudentCoursesResponse: z.ZodObject<{
    items: z.ZodArray<z.ZodObject<{
        id: z.ZodInt;
        name: z.ZodString;
        state: z.ZodEnum<{
            published: "published";
            archived: "archived";
            draft: "draft";
        }>;
        publishDate: z.ZodNullable<z.ZodISODateTime>;
        publishedAt: z.ZodNullable<z.ZodISODateTime>;
        settings: z.ZodObject<{
            skillLevel: z.ZodEnum<{
                none: "none";
            }>;
            isSkillLevelEnabled: z.ZodBoolean;
            syllabusUrl: z.ZodNullable<z.ZodString>;
            timeChannelUrl: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>;
        subjectId: z.ZodNullable<z.ZodInt>;
        isArchived: z.ZodBoolean;
        category: z.ZodEnum<{
            withoutCategory: "withoutCategory";
            general: "general";
            mathematics: "mathematics";
            business: "business";
            development: "development";
            stem: "stem";
            softSkills: "softSkills";
            ml: "ml";
            design: "design";
            analytics: "analytics";
            career: "career";
            management: "management";
        }>;
        categoryCover: z.ZodEnum<{
            sineWave: "sineWave";
            curvesGrid: "curvesGrid";
            ellipsesOverlap: "ellipsesOverlap";
            geometricTriangle: "geometricTriangle";
            verticalLines: "verticalLines";
            gridPlanes: "gridPlanes";
            spiralLoops: "spiralLoops";
            symmetricCircles: "symmetricCircles";
        }>;
    }, z.core.$strip>>;
    paging: z.ZodObject<{
        limit: z.ZodInt;
        offset: z.ZodInt;
        totalCount: z.ZodInt;
    }, z.core.$strip>;
}, z.core.$strip>;
/**
 * Unique identifier of the user.
 */
export declare const zUserId: z.ZodUUID;
export declare const zUniversityEmail: z.ZodEmail;
/**
 * Username in TiMe messenger (T-Bank's fork of Mattermost).
 */
export declare const zTimeAccount: z.ZodString;
/**
 * Student’s current education level.
 */
export declare const zStudyLevel: z.ZodEnum<{
    none: "none";
    bachelor: "bachelor";
    master: "master";
    dpo: "dpo";
    dpoMaster: "dpoMaster";
}>;
export declare const zCurrentStudentResponse: z.ZodObject<{
    id: z.ZodUUID;
    lastName: z.ZodString;
    firstName: z.ZodString;
    middleName: z.ZodNullable<z.ZodString>;
    universityEmail: z.ZodEmail;
    timeAccount: z.ZodString;
    studyStartYear: z.ZodNullable<z.ZodInt>;
    studyLevel: z.ZodEnum<{
        none: "none";
        bachelor: "bachelor";
        master: "master";
        dpo: "dpo";
        dpoMaster: "dpoMaster";
    }>;
    lateDaysBalance: z.ZodInt;
}, z.core.$strip>;
export declare const zCourseSummaryByIdResponse: z.ZodObject<{
    id: z.ZodInt;
    name: z.ZodString;
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    publishDate: z.ZodNullable<z.ZodISODateTime>;
    publishedAt: z.ZodNullable<z.ZodISODateTime>;
    settings: z.ZodObject<{
        skillLevel: z.ZodEnum<{
            none: "none";
        }>;
        isSkillLevelEnabled: z.ZodBoolean;
        syllabusUrl: z.ZodNullable<z.ZodString>;
        timeChannelUrl: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>;
    subjectId: z.ZodNullable<z.ZodInt>;
    isArchived: z.ZodBoolean;
    category: z.ZodEnum<{
        withoutCategory: "withoutCategory";
        general: "general";
        mathematics: "mathematics";
        business: "business";
        development: "development";
        stem: "stem";
        softSkills: "softSkills";
        ml: "ml";
        design: "design";
        analytics: "analytics";
        career: "career";
        management: "management";
    }>;
    categoryCover: z.ZodEnum<{
        sineWave: "sineWave";
        curvesGrid: "curvesGrid";
        ellipsesOverlap: "ellipsesOverlap";
        geometricTriangle: "geometricTriangle";
        verticalLines: "verticalLines";
        gridPlanes: "gridPlanes";
        spiralLoops: "spiralLoops";
        symmetricCircles: "symmetricCircles";
    }>;
}, z.core.$strip>;
/**
 * Numeric identifier of the course theme.
 */
export declare const zCourseThemeId: z.ZodInt;
/**
 * Numeric identifier of the longread item.
 */
export declare const zLongreadId: z.ZodInt;
/**
 * Longread item type.
 */
export declare const zLongreadType: z.ZodEnum<{
    common: "common";
    handout: "handout";
}>;
/**
 * Numeric identifier of the exercise item.
 */
export declare const zExerciseId: z.ZodInt;
/**
 * Numeric identifier of the activity item.
 */
export declare const zActivityId: z.ZodInt;
/**
 * Activity name.
 */
export declare const zActivityName: z.ZodString;
/**
 * Weight coefficient for every single activity by activity name, used in the course grade formula to calculate the overall semester score.
 *
 */
export declare const zActivityWeight: z.ZodNumber;
/**
 * Activity definition shared across exercises. Multiple exercises reference the same activity definition.
 *
 */
export declare const zActivityDefinition: z.ZodObject<{
    id: z.ZodInt;
    name: z.ZodString;
    weight: z.ZodNumber;
}, z.core.$strip>;
/**
 * Deadline timestamp by which the item must be completed.
 */
export declare const zDeadline: z.ZodISODateTime;
/**
 * Maximum possible score for completing exercise.
 */
export declare const zMaxScore: z.ZodNumber;
/**
 * Exercise name shown as the header is LMS.
 */
export declare const zExerciseName: z.ZodString;
/**
 * An exercise item within a longread item.
 */
export declare const zExerciseItem: z.ZodObject<{
    id: z.ZodInt;
    name: z.ZodString;
    maxScore: z.ZodNumber;
    activity: z.ZodObject<{
        id: z.ZodInt;
        name: z.ZodString;
        weight: z.ZodNumber;
    }, z.core.$strip>;
    deadline: z.ZodISODateTime;
}, z.core.$strip>;
/**
 * Longread name shown as the header in LMS.
 */
export declare const zLongreadName: z.ZodString;
/**
 * A longread list item within a course theme. It may be self-contained content or include one or more associated exercises.
 *
 */
export declare const zLongreadItem: z.ZodObject<{
    id: z.ZodInt;
    type: z.ZodEnum<{
        common: "common";
        handout: "handout";
    }>;
    name: z.ZodString;
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    publishDate: z.ZodNullable<z.ZodISODateTime>;
    publishedAt: z.ZodNullable<z.ZodISODateTime>;
    exercises: z.ZodArray<z.ZodObject<{
        id: z.ZodInt;
        name: z.ZodString;
        maxScore: z.ZodNumber;
        activity: z.ZodObject<{
            id: z.ZodInt;
            name: z.ZodString;
            weight: z.ZodNumber;
        }, z.core.$strip>;
        deadline: z.ZodISODateTime;
    }, z.core.$strip>>;
}, z.core.$strip>;
/**
 * Course theme name shown on the course view in LMS.
 *
 */
export declare const zCourseThemeName: z.ZodString;
/**
 * Listing order determining the item's line position in the LMS, lower values come first.
 *
 */
export declare const zListingOrder: z.ZodInt;
/**
 * Course theme is a unit, which is typically a weekly module of longread IDs and exercise items.
 *
 */
export declare const zCourseThemeItem: z.ZodObject<{
    id: z.ZodInt;
    name: z.ZodString;
    order: z.ZodInt;
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    publishDate: z.ZodNullable<z.ZodISODateTime>;
    publishedAt: z.ZodNullable<z.ZodISODateTime>;
    longreads: z.ZodArray<z.ZodObject<{
        id: z.ZodInt;
        type: z.ZodEnum<{
            common: "common";
            handout: "handout";
        }>;
        name: z.ZodString;
        state: z.ZodEnum<{
            published: "published";
            archived: "archived";
            draft: "draft";
        }>;
        publishDate: z.ZodNullable<z.ZodISODateTime>;
        publishedAt: z.ZodNullable<z.ZodISODateTime>;
        exercises: z.ZodArray<z.ZodObject<{
            id: z.ZodInt;
            name: z.ZodString;
            maxScore: z.ZodNumber;
            activity: z.ZodObject<{
                id: z.ZodInt;
                name: z.ZodString;
                weight: z.ZodNumber;
            }, z.core.$strip>;
            deadline: z.ZodISODateTime;
        }, z.core.$strip>>;
    }, z.core.$strip>>;
}, z.core.$strip>;
export declare const zCourseOverviewByIdResponse: z.ZodObject<{
    id: z.ZodInt;
    name: z.ZodString;
    isArchived: z.ZodBoolean;
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    publishDate: z.ZodNullable<z.ZodISODateTime>;
    publishedAt: z.ZodNullable<z.ZodISODateTime>;
    settings: z.ZodObject<{
        skillLevel: z.ZodEnum<{
            none: "none";
        }>;
        isSkillLevelEnabled: z.ZodBoolean;
        syllabusUrl: z.ZodNullable<z.ZodString>;
        timeChannelUrl: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>;
    themes: z.ZodArray<z.ZodObject<{
        id: z.ZodInt;
        name: z.ZodString;
        order: z.ZodInt;
        state: z.ZodEnum<{
            published: "published";
            archived: "archived";
            draft: "draft";
        }>;
        publishDate: z.ZodNullable<z.ZodISODateTime>;
        publishedAt: z.ZodNullable<z.ZodISODateTime>;
        longreads: z.ZodArray<z.ZodObject<{
            id: z.ZodInt;
            type: z.ZodEnum<{
                common: "common";
                handout: "handout";
            }>;
            name: z.ZodString;
            state: z.ZodEnum<{
                published: "published";
                archived: "archived";
                draft: "draft";
            }>;
            publishDate: z.ZodNullable<z.ZodISODateTime>;
            publishedAt: z.ZodNullable<z.ZodISODateTime>;
            exercises: z.ZodArray<z.ZodObject<{
                id: z.ZodInt;
                name: z.ZodString;
                maxScore: z.ZodNumber;
                activity: z.ZodObject<{
                    id: z.ZodInt;
                    name: z.ZodString;
                    weight: z.ZodNumber;
                }, z.core.$strip>;
                deadline: z.ZodISODateTime;
            }, z.core.$strip>>;
        }, z.core.$strip>>;
    }, z.core.$strip>>;
}, z.core.$strip>;
/**
 * Summary information about a course theme by its ID.
 */
export declare const zCourseThemeSummaryByIdResponse: z.ZodObject<{
    id: z.ZodInt;
    name: z.ZodString;
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    publishDate: z.ZodNullable<z.ZodISODateTime>;
    publishedAt: z.ZodNullable<z.ZodISODateTime>;
    order: z.ZodInt;
    category: z.ZodEnum<{
        withoutCategory: "withoutCategory";
        general: "general";
        mathematics: "mathematics";
        business: "business";
        development: "development";
        stem: "stem";
        softSkills: "softSkills";
        ml: "ml";
        design: "design";
        analytics: "analytics";
        career: "career";
        management: "management";
    }>;
    categoryCover: z.ZodInt;
}, z.core.$strip>;
export declare const zLongreadSummaryByIdResponse: z.ZodObject<{
    id: z.ZodInt;
    type: z.ZodEnum<{
        common: "common";
        handout: "handout";
    }>;
    name: z.ZodString;
    order: z.ZodInt;
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    publishDate: z.ZodNullable<z.ZodISODateTime>;
    publishedAt: z.ZodNullable<z.ZodISODateTime>;
}, z.core.$strip>;
/**
 * Numeric identifier of a longread material block.
 */
export declare const zLongreadMaterialId: z.ZodInt;
/**
 * Material block type identifier.
 */
export declare const zLongreadMaterialType: z.ZodEnum<{
    markdown: "markdown";
    content: "content";
    coding: "coding";
    image: "image";
    questions: "questions";
    videoPlatform: "videoPlatform";
}>;
/**
 * Material block discriminator used by LMS frontend.
 */
export declare const zLongreadMaterialDiscriminator: z.ZodEnum<{
    markdown: "markdown";
    coding: "coding";
    image: "image";
    questions: "questions";
    videoPlatform: "videoPlatform";
    file: "file";
    video: "video";
    audio: "audio";
}>;
/**
 * View renderer type used by LMS frontend.
 */
export declare const zLongreadMaterialViewType: z.ZodEnum<{
    image: "image";
    videoPlatform: "videoPlatform";
    file: "file";
    video: "video";
    audio: "audio";
    ngxMarkdown: "ngxMarkdown";
    exerciseCoding: "exerciseCoding";
    exerciseQuestions: "exerciseQuestions";
}>;
/**
 * Media type attachment identifier.
 */
export declare const zFileMediaType: z.ZodEnum<{
    image: "image";
    file: "file";
    video: "video";
    audio: "audio";
}>;
/**
 * Media type identifier in upper.
 */
export declare const zLongreadMaterialMediaTypeUpper: z.ZodEnum<{
    File: "File";
    Image: "Image";
    Video: "Video";
    Audio: "Audio";
}>;
/**
 * Material content revision identifier.
 */
export declare const zLongreadMaterialVersion: z.ZodNullable<z.ZodString>;
/**
 * Material payload size in bytes.
 */
export declare const zLongreadMaterialLength: z.ZodInt;
/**
 * File attachment display name shown in LMS.
 */
export declare const zFileAttachmentName: z.ZodString;
/**
 * File object path in storage.
 */
export declare const zFileNameObjectPath: z.ZodString;
export declare const zLongreadMaterialContent: z.ZodObject<{
    name: z.ZodString;
    filename: z.ZodString;
    mediaType: z.ZodEnum<{
        File: "File";
        Image: "Image";
        Video: "Video";
        Audio: "Audio";
    }>;
    version: z.ZodNullable<z.ZodString>;
    length: z.ZodInt;
}, z.core.$strip>;
/**
 * JSON-serialized markdown content rendered in LMS.
 */
export declare const zLongreadMaterialViewContent: z.ZodNullable<z.ZodString>;
export declare const zLongreadMaterialAttachmentItem: z.ZodObject<{
    name: z.ZodString;
    filename: z.ZodString;
    mediaType: z.ZodEnum<{
        image: "image";
        file: "file";
        video: "video";
        audio: "audio";
    }>;
    length: z.ZodInt;
    version: z.ZodNullable<z.ZodString>;
}, z.core.$strip>;
/**
 * Numeric identifier of the task.
 */
export declare const zTaskId: z.ZodInt;
/**
 * URL of coding exercise if configured.
 */
export declare const zExerciseUrl: z.ZodNullable<z.ZodString>;
export declare const zLongreadMaterialCoding: z.ZodObject<{
    exerciseUrl: z.ZodNullable<z.ZodString>;
}, z.core.$strip>;
/**
 * Indicates if late days can be used for this activity.
 */
export declare const zActivityIsLateDaysEnabled: z.ZodBoolean;
/**
 * Activity configuration for a longread exercise.
 */
export declare const zLongreadMaterialActivity: z.ZodObject<{
    id: z.ZodInt;
    name: z.ZodString;
    weight: z.ZodNumber;
    maxExercisesCount: z.ZodNumber;
    averageScoreThreshold: z.ZodNullable<z.ZodNumber>;
    isLateDaysEnabled: z.ZodBoolean;
}, z.core.$strip>;
/**
 * Timer by which exercise should be completed.
 */
export declare const zLongreadMaterialTimer: z.ZodNullable<z.ZodString>;
/**
 * Scheduled item start timestamp.
 */
export declare const zStartDate: z.ZodISODateTime;
/**
 * Estimation and grading constraints for exercise material.
 */
export declare const zLongreadMaterialEstimation: z.ZodObject<{
    startDate: z.ZodISODateTime;
    timer: z.ZodNullable<z.ZodString>;
    maxScore: z.ZodNullable<z.ZodNumber>;
    deadline: z.ZodNullable<z.ZodISODateTime>;
    activity: z.ZodNullable<z.ZodObject<{
        id: z.ZodInt;
        name: z.ZodString;
        weight: z.ZodNumber;
        maxExercisesCount: z.ZodNumber;
        averageScoreThreshold: z.ZodNullable<z.ZodNumber>;
        isLateDaysEnabled: z.ZodBoolean;
    }, z.core.$strip>>;
}, z.core.$strip>;
/**
 * Timestamp when task was moved to backlog.
 */
export declare const zBackloggedAt: z.ZodNullable<z.ZodISODateTime>;
/**
 * Questions mode.
 */
export declare const zLongreadExerciseQuestionsMode: z.ZodEnum<{
    atMoment: "atMoment";
    byDeadline: "byDeadline";
}>;
/**
 * Questions exercise evaluation strategy.
 */
export declare const zQuestionsSettingsEvalStrategy: z.ZodEnum<{
    last: "last";
    best: "best";
}>;
/**
 * Settings for questions exercise behavior.
 */
export declare const zExerciseQuestionsSettings: z.ZodObject<{
    questionsPerAttempt: z.ZodNullable<z.ZodUnknown>;
    attemptsLimit: z.ZodInt;
    evaluationStrategy: z.ZodEnum<{
        last: "last";
        best: "best";
    }>;
}, z.core.$strip>;
/**
 * Numeric identifier of the quiz.
 */
export declare const zQuizId: z.ZodInt;
/**
 * Numeric identifier of the question.
 */
export declare const zQuestionId: z.ZodInt;
/**
 * Text rendered under the options on frontend.
 */
export declare const zQuestionOptionRecommendation: z.ZodNullable<z.ZodString>;
/**
 * Indicates if the question is auto evaluated.
 */
export declare const zQuestionItemAutoEvaluation: z.ZodBoolean;
/**
 * JSON-serialized markdown question content rendered in LMS.
 */
export declare const zQuestionItemContent: z.ZodString;
/**
 * Score (max possible) for answering the question correctly.
 */
export declare const zQuestionItemScore: z.ZodNumber;
/**
 * Numeric identifier of the question option.
 */
export declare const zQuestionOptionId: z.ZodInt;
/**
 * Indicates if the option is the correct answer.
 */
export declare const zQuestionOptionIsCorrect: z.ZodBoolean;
/**
 * Option is a possible answer that can be chosen.
 */
export declare const zQuestionItemOption: z.ZodObject<{
    id: z.ZodInt;
    value: z.ZodString;
    order: z.ZodInt;
    isCorrect: z.ZodBoolean;
    recommendation: z.ZodNullable<z.ZodString>;
}, z.core.$strip>;
export declare const zQuestionItemOptions: z.ZodArray<z.ZodObject<{
    id: z.ZodInt;
    value: z.ZodString;
    order: z.ZodInt;
    isCorrect: z.ZodBoolean;
    recommendation: z.ZodNullable<z.ZodString>;
}, z.core.$strip>>;
/**
 * Shows correct string input answers.
 */
export declare const zQuestionItemCorrectAnswerInputStringCorrectAnswer: z.ZodObject<{
    type: z.ZodEnum<{
        inputStringCorrectAnswer: "inputStringCorrectAnswer";
    }>;
    variants: z.ZodArray<z.ZodString>;
}, z.core.$strip>;
/**
 * Shows correct number input answers.
 */
export declare const zQuestionItemCorrectAnswerInputNumberCorrectAnswer: z.ZodObject<{
    type: z.ZodEnum<{
        inputNumberCorrectAnswer: "inputNumberCorrectAnswer";
    }>;
    variants: z.ZodArray<z.ZodNumber>;
    showPrecisionHint: z.ZodBoolean;
    autoEvaluationPrecision: z.ZodOptional<z.ZodNullable<z.ZodString>>;
    precision: z.ZodNullable<z.ZodInt>;
}, z.core.$strip>;
export declare const zQuestionItemCorrectAnswer: z.ZodNullable<z.ZodDiscriminatedUnion<[z.ZodObject<{
    variants: z.ZodArray<z.ZodString>;
    type: z.ZodLiteral<"inputStringCorrectAnswer">;
}, z.core.$strip>, z.ZodObject<{
    variants: z.ZodArray<z.ZodNumber>;
    showPrecisionHint: z.ZodBoolean;
    autoEvaluationPrecision: z.ZodOptional<z.ZodNullable<z.ZodString>>;
    precision: z.ZodNullable<z.ZodInt>;
    type: z.ZodLiteral<"inputNumberCorrectAnswer">;
}, z.core.$strip>], "type">>;
export declare const zQuestionItemEvaluationBlock: z.ZodObject<{
    correctAnswer: z.ZodNullable<z.ZodDiscriminatedUnion<[z.ZodObject<{
        variants: z.ZodArray<z.ZodString>;
        type: z.ZodLiteral<"inputStringCorrectAnswer">;
    }, z.core.$strip>, z.ZodObject<{
        variants: z.ZodArray<z.ZodNumber>;
        showPrecisionHint: z.ZodBoolean;
        autoEvaluationPrecision: z.ZodOptional<z.ZodNullable<z.ZodString>>;
        precision: z.ZodNullable<z.ZodInt>;
        type: z.ZodLiteral<"inputNumberCorrectAnswer">;
    }, z.core.$strip>], "type">>;
    autoEvaluation: z.ZodBoolean;
    recommendation: z.ZodNullable<z.ZodString>;
}, z.core.$strip>;
/**
 * Indicates if options need to be shuffled on frontend.
 */
export declare const zQuestionitemAreOptionsShuffled: z.ZodBoolean;
/**
 * Question that needs input as answer.
 */
export declare const zLongreadExerciseInputQuestionItem: z.ZodObject<{
    type: z.ZodEnum<{
        input: "input";
    }>;
    id: z.ZodInt;
    order: z.ZodInt;
    content: z.ZodString;
    score: z.ZodNumber;
    attachments: z.ZodArray<z.ZodObject<{
        name: z.ZodString;
        filename: z.ZodString;
        mediaType: z.ZodEnum<{
            image: "image";
            file: "file";
            video: "video";
            audio: "audio";
        }>;
        length: z.ZodInt;
        version: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>>;
    correctAnswer: z.ZodNullable<z.ZodDiscriminatedUnion<[z.ZodObject<{
        variants: z.ZodArray<z.ZodString>;
        type: z.ZodLiteral<"inputStringCorrectAnswer">;
    }, z.core.$strip>, z.ZodObject<{
        variants: z.ZodArray<z.ZodNumber>;
        showPrecisionHint: z.ZodBoolean;
        autoEvaluationPrecision: z.ZodOptional<z.ZodNullable<z.ZodString>>;
        precision: z.ZodNullable<z.ZodInt>;
        type: z.ZodLiteral<"inputNumberCorrectAnswer">;
    }, z.core.$strip>], "type">>;
    autoEvaluation: z.ZodBoolean;
    recommendation: z.ZodNullable<z.ZodString>;
    input: z.ZodObject<{
        correctAnswer: z.ZodNullable<z.ZodDiscriminatedUnion<[z.ZodObject<{
            variants: z.ZodArray<z.ZodString>;
            type: z.ZodLiteral<"inputStringCorrectAnswer">;
        }, z.core.$strip>, z.ZodObject<{
            variants: z.ZodArray<z.ZodNumber>;
            showPrecisionHint: z.ZodBoolean;
            autoEvaluationPrecision: z.ZodOptional<z.ZodNullable<z.ZodString>>;
            precision: z.ZodNullable<z.ZodInt>;
            type: z.ZodLiteral<"inputNumberCorrectAnswer">;
        }, z.core.$strip>], "type">>;
        autoEvaluation: z.ZodBoolean;
        recommendation: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>;
}, z.core.$strip>;
/**
 * Question that requires the right choice as answer.
 */
export declare const zLongreadExerciseSingleChoiceQuestionitem: z.ZodObject<{
    type: z.ZodEnum<{
        singleChoice: "singleChoice";
    }>;
    id: z.ZodInt;
    order: z.ZodInt;
    content: z.ZodString;
    score: z.ZodNumber;
    attachments: z.ZodArray<z.ZodObject<{
        name: z.ZodString;
        filename: z.ZodString;
        mediaType: z.ZodEnum<{
            image: "image";
            file: "file";
            video: "video";
            audio: "audio";
        }>;
        length: z.ZodInt;
        version: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>>;
    options: z.ZodArray<z.ZodObject<{
        id: z.ZodInt;
        value: z.ZodString;
        order: z.ZodInt;
        isCorrect: z.ZodBoolean;
        recommendation: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>>;
    areOptionsShuffled: z.ZodBoolean;
    singleChoice: z.ZodObject<{
        options: z.ZodArray<z.ZodObject<{
            id: z.ZodInt;
            value: z.ZodString;
            order: z.ZodInt;
            isCorrect: z.ZodBoolean;
            recommendation: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>>;
    }, z.core.$strip>;
}, z.core.$strip>;
/**
 * Question that requires chosing multiple options as answer.
 */
export declare const zLongreadExerciseMultipleChoiceQuestionItem: z.ZodObject<{
    type: z.ZodEnum<{
        multipleChoice: "multipleChoice";
    }>;
    id: z.ZodInt;
    order: z.ZodInt;
    content: z.ZodString;
    score: z.ZodNumber;
    attachments: z.ZodArray<z.ZodObject<{
        name: z.ZodString;
        filename: z.ZodString;
        mediaType: z.ZodEnum<{
            image: "image";
            file: "file";
            video: "video";
            audio: "audio";
        }>;
        length: z.ZodInt;
        version: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>>;
    options: z.ZodArray<z.ZodObject<{
        id: z.ZodInt;
        value: z.ZodString;
        order: z.ZodInt;
        isCorrect: z.ZodBoolean;
        recommendation: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>>;
    areOptionsShuffled: z.ZodBoolean;
    multipleChoice: z.ZodObject<{
        options: z.ZodArray<z.ZodObject<{
            id: z.ZodInt;
            value: z.ZodString;
            order: z.ZodInt;
            isCorrect: z.ZodBoolean;
            recommendation: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>>;
    }, z.core.$strip>;
}, z.core.$strip>;
export declare const zLongreadExerciseQuestionItem: z.ZodDiscriminatedUnion<[z.ZodObject<{
    id: z.ZodInt;
    order: z.ZodInt;
    content: z.ZodString;
    score: z.ZodNumber;
    attachments: z.ZodArray<z.ZodObject<{
        name: z.ZodString;
        filename: z.ZodString;
        mediaType: z.ZodEnum<{
            image: "image";
            file: "file";
            video: "video";
            audio: "audio";
        }>;
        length: z.ZodInt;
        version: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>>;
    correctAnswer: z.ZodNullable<z.ZodDiscriminatedUnion<[z.ZodObject<{
        variants: z.ZodArray<z.ZodString>;
        type: z.ZodLiteral<"inputStringCorrectAnswer">;
    }, z.core.$strip>, z.ZodObject<{
        variants: z.ZodArray<z.ZodNumber>;
        showPrecisionHint: z.ZodBoolean;
        autoEvaluationPrecision: z.ZodOptional<z.ZodNullable<z.ZodString>>;
        precision: z.ZodNullable<z.ZodInt>;
        type: z.ZodLiteral<"inputNumberCorrectAnswer">;
    }, z.core.$strip>], "type">>;
    autoEvaluation: z.ZodBoolean;
    recommendation: z.ZodNullable<z.ZodString>;
    input: z.ZodObject<{
        correctAnswer: z.ZodNullable<z.ZodDiscriminatedUnion<[z.ZodObject<{
            variants: z.ZodArray<z.ZodString>;
            type: z.ZodLiteral<"inputStringCorrectAnswer">;
        }, z.core.$strip>, z.ZodObject<{
            variants: z.ZodArray<z.ZodNumber>;
            showPrecisionHint: z.ZodBoolean;
            autoEvaluationPrecision: z.ZodOptional<z.ZodNullable<z.ZodString>>;
            precision: z.ZodNullable<z.ZodInt>;
            type: z.ZodLiteral<"inputNumberCorrectAnswer">;
        }, z.core.$strip>], "type">>;
        autoEvaluation: z.ZodBoolean;
        recommendation: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>;
    type: z.ZodLiteral<"input">;
}, z.core.$strip>, z.ZodObject<{
    id: z.ZodInt;
    order: z.ZodInt;
    content: z.ZodString;
    score: z.ZodNumber;
    attachments: z.ZodArray<z.ZodObject<{
        name: z.ZodString;
        filename: z.ZodString;
        mediaType: z.ZodEnum<{
            image: "image";
            file: "file";
            video: "video";
            audio: "audio";
        }>;
        length: z.ZodInt;
        version: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>>;
    options: z.ZodArray<z.ZodObject<{
        id: z.ZodInt;
        value: z.ZodString;
        order: z.ZodInt;
        isCorrect: z.ZodBoolean;
        recommendation: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>>;
    areOptionsShuffled: z.ZodBoolean;
    singleChoice: z.ZodObject<{
        options: z.ZodArray<z.ZodObject<{
            id: z.ZodInt;
            value: z.ZodString;
            order: z.ZodInt;
            isCorrect: z.ZodBoolean;
            recommendation: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>>;
    }, z.core.$strip>;
    type: z.ZodLiteral<"singleChoice">;
}, z.core.$strip>, z.ZodObject<{
    id: z.ZodInt;
    order: z.ZodInt;
    content: z.ZodString;
    score: z.ZodNumber;
    attachments: z.ZodArray<z.ZodObject<{
        name: z.ZodString;
        filename: z.ZodString;
        mediaType: z.ZodEnum<{
            image: "image";
            file: "file";
            video: "video";
            audio: "audio";
        }>;
        length: z.ZodInt;
        version: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>>;
    options: z.ZodArray<z.ZodObject<{
        id: z.ZodInt;
        value: z.ZodString;
        order: z.ZodInt;
        isCorrect: z.ZodBoolean;
        recommendation: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>>;
    areOptionsShuffled: z.ZodBoolean;
    multipleChoice: z.ZodObject<{
        options: z.ZodArray<z.ZodObject<{
            id: z.ZodInt;
            value: z.ZodString;
            order: z.ZodInt;
            isCorrect: z.ZodBoolean;
            recommendation: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>>;
    }, z.core.$strip>;
    type: z.ZodLiteral<"multipleChoice">;
}, z.core.$strip>], "type">;
/**
 * Video identifier in UUID format.
 */
export declare const zVideoId: z.ZodUUID;
/**
 * Video state.
 */
export declare const zVideoPlatformState: z.ZodEnum<{
    error: "error";
    unspecified: "unspecified";
    empty: "empty";
    uploaded: "uploaded";
    transcoding: "transcoding";
    viewable: "viewable";
    ready: "ready";
    partiallyReady: "partiallyReady";
}>;
/**
 * Reviewers assigned to this exercise task.
 */
export declare const zLongreadExerciseMaterialReviewers: z.ZodArray<z.ZodUUID>;
/**
 * Assignees linked to this exercise task.
 */
export declare const zLongreadExerciseMaterialAssignees: z.ZodArray<z.ZodUUID>;
export declare const zLongreadExerciseMaterialIsTrackingStudents: z.ZodBoolean;
/**
 * Indicates if questions need to be shuffled on frontend.
 */
export declare const zAreQuestionsShuffled: z.ZodBoolean;
export declare const zLongreadMarkdownMaterialItem: z.ZodObject<{
    discriminator: z.ZodEnum<{
        markdown: "markdown";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
    }>;
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    viewType: z.ZodEnum<{
        image: "image";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
        ngxMarkdown: "ngxMarkdown";
        exerciseCoding: "exerciseCoding";
        exerciseQuestions: "exerciseQuestions";
    }>;
    type: z.ZodEnum<{
        markdown: "markdown";
        content: "content";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
    }>;
    id: z.ZodInt;
    order: z.ZodInt;
    viewContent: z.ZodNullable<z.ZodString>;
    publishDate: z.ZodNullable<z.ZodISODateTime>;
    publishedAt: z.ZodNullable<z.ZodISODateTime>;
}, z.core.$strip>;
export declare const zLongreadFileMaterialItem: z.ZodObject<{
    discriminator: z.ZodEnum<{
        markdown: "markdown";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
    }>;
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    viewType: z.ZodEnum<{
        image: "image";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
        ngxMarkdown: "ngxMarkdown";
        exerciseCoding: "exerciseCoding";
        exerciseQuestions: "exerciseQuestions";
    }>;
    type: z.ZodEnum<{
        markdown: "markdown";
        content: "content";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
    }>;
    id: z.ZodInt;
    order: z.ZodInt;
    mediaType: z.ZodEnum<{
        image: "image";
        file: "file";
        video: "video";
        audio: "audio";
    }>;
    filename: z.ZodString;
    version: z.ZodNullable<z.ZodString>;
    length: z.ZodInt;
    publishDate: z.ZodNullable<z.ZodISODateTime>;
    publishedAt: z.ZodNullable<z.ZodISODateTime>;
    content: z.ZodObject<{
        name: z.ZodString;
        filename: z.ZodString;
        mediaType: z.ZodEnum<{
            File: "File";
            Image: "Image";
            Video: "Video";
            Audio: "Audio";
        }>;
        version: z.ZodNullable<z.ZodString>;
        length: z.ZodInt;
    }, z.core.$strip>;
}, z.core.$strip>;
export declare const zLongreadExerciseCodingMaterialItem: z.ZodObject<{
    discriminator: z.ZodEnum<{
        markdown: "markdown";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
    }>;
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    viewType: z.ZodEnum<{
        image: "image";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
        ngxMarkdown: "ngxMarkdown";
        exerciseCoding: "exerciseCoding";
        exerciseQuestions: "exerciseQuestions";
    }>;
    type: z.ZodEnum<{
        markdown: "markdown";
        content: "content";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
    }>;
    id: z.ZodInt;
    order: z.ZodInt;
    name: z.ZodString;
    viewContent: z.ZodNullable<z.ZodString>;
    estimation: z.ZodObject<{
        startDate: z.ZodISODateTime;
        timer: z.ZodNullable<z.ZodString>;
        maxScore: z.ZodNullable<z.ZodNumber>;
        deadline: z.ZodNullable<z.ZodISODateTime>;
        activity: z.ZodNullable<z.ZodObject<{
            id: z.ZodInt;
            name: z.ZodString;
            weight: z.ZodNumber;
            maxExercisesCount: z.ZodNumber;
            averageScoreThreshold: z.ZodNullable<z.ZodNumber>;
            isLateDaysEnabled: z.ZodBoolean;
        }, z.core.$strip>>;
    }, z.core.$strip>;
    reviewers: z.ZodArray<z.ZodUUID>;
    assignees: z.ZodArray<z.ZodUUID>;
    attachments: z.ZodArray<z.ZodObject<{
        name: z.ZodString;
        filename: z.ZodString;
        mediaType: z.ZodEnum<{
            image: "image";
            file: "file";
            video: "video";
            audio: "audio";
        }>;
        length: z.ZodInt;
        version: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>>;
    backloggedAt: z.ZodNullable<z.ZodISODateTime>;
    taskId: z.ZodInt;
    isTrackingStudents: z.ZodBoolean;
    exerciseUrl: z.ZodNullable<z.ZodString>;
    coding: z.ZodObject<{
        exerciseUrl: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>;
}, z.core.$strip>;
export declare const zLongreadImageMaterialItem: z.ZodObject<{
    discriminator: z.ZodEnum<{
        markdown: "markdown";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
    }>;
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    viewType: z.ZodEnum<{
        image: "image";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
        ngxMarkdown: "ngxMarkdown";
        exerciseCoding: "exerciseCoding";
        exerciseQuestions: "exerciseQuestions";
    }>;
    type: z.ZodEnum<{
        markdown: "markdown";
        content: "content";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
    }>;
    id: z.ZodInt;
    order: z.ZodInt;
    imageScale: z.ZodNullable<z.ZodInt>;
    mediaType: z.ZodEnum<{
        image: "image";
        file: "file";
        video: "video";
        audio: "audio";
    }>;
    filename: z.ZodString;
    version: z.ZodNullable<z.ZodString>;
    length: z.ZodInt;
    publishDate: z.ZodNullable<z.ZodISODateTime>;
    publishedAt: z.ZodNullable<z.ZodISODateTime>;
    content: z.ZodObject<{
        name: z.ZodString;
        filename: z.ZodString;
        mediaType: z.ZodEnum<{
            File: "File";
            Image: "Image";
            Video: "Video";
            Audio: "Audio";
        }>;
        version: z.ZodNullable<z.ZodString>;
        length: z.ZodInt;
    }, z.core.$strip>;
}, z.core.$strip>;
export declare const zLongreadExerciseQuestionsMaterialItem: z.ZodObject<{
    discriminator: z.ZodEnum<{
        markdown: "markdown";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
    }>;
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    viewType: z.ZodEnum<{
        image: "image";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
        ngxMarkdown: "ngxMarkdown";
        exerciseCoding: "exerciseCoding";
        exerciseQuestions: "exerciseQuestions";
    }>;
    type: z.ZodEnum<{
        markdown: "markdown";
        content: "content";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
    }>;
    id: z.ZodInt;
    order: z.ZodInt;
    name: z.ZodString;
    viewContent: z.ZodNullable<z.ZodString>;
    estimation: z.ZodObject<{
        startDate: z.ZodISODateTime;
        timer: z.ZodNullable<z.ZodString>;
        maxScore: z.ZodNullable<z.ZodNumber>;
        deadline: z.ZodNullable<z.ZodISODateTime>;
        activity: z.ZodNullable<z.ZodObject<{
            id: z.ZodInt;
            name: z.ZodString;
            weight: z.ZodNumber;
            maxExercisesCount: z.ZodNumber;
            averageScoreThreshold: z.ZodNullable<z.ZodNumber>;
            isLateDaysEnabled: z.ZodBoolean;
        }, z.core.$strip>>;
    }, z.core.$strip>;
    reviewers: z.ZodArray<z.ZodUUID>;
    assignees: z.ZodArray<z.ZodUUID>;
    attachments: z.ZodArray<z.ZodObject<{
        name: z.ZodString;
        filename: z.ZodString;
        mediaType: z.ZodEnum<{
            image: "image";
            file: "file";
            video: "video";
            audio: "audio";
        }>;
        length: z.ZodInt;
        version: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>>;
    backloggedAt: z.ZodNullable<z.ZodISODateTime>;
    taskId: z.ZodInt;
    isTrackingStudents: z.ZodBoolean;
    mode: z.ZodEnum<{
        atMoment: "atMoment";
        byDeadline: "byDeadline";
    }>;
    areQuestionsShuffled: z.ZodBoolean;
    settings: z.ZodObject<{
        questionsPerAttempt: z.ZodNullable<z.ZodUnknown>;
        attemptsLimit: z.ZodInt;
        evaluationStrategy: z.ZodEnum<{
            last: "last";
            best: "best";
        }>;
    }, z.core.$strip>;
    quizId: z.ZodInt;
    questions: z.ZodArray<z.ZodDiscriminatedUnion<[z.ZodObject<{
        id: z.ZodInt;
        order: z.ZodInt;
        content: z.ZodString;
        score: z.ZodNumber;
        attachments: z.ZodArray<z.ZodObject<{
            name: z.ZodString;
            filename: z.ZodString;
            mediaType: z.ZodEnum<{
                image: "image";
                file: "file";
                video: "video";
                audio: "audio";
            }>;
            length: z.ZodInt;
            version: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>>;
        correctAnswer: z.ZodNullable<z.ZodDiscriminatedUnion<[z.ZodObject<{
            variants: z.ZodArray<z.ZodString>;
            type: z.ZodLiteral<"inputStringCorrectAnswer">;
        }, z.core.$strip>, z.ZodObject<{
            variants: z.ZodArray<z.ZodNumber>;
            showPrecisionHint: z.ZodBoolean;
            autoEvaluationPrecision: z.ZodOptional<z.ZodNullable<z.ZodString>>;
            precision: z.ZodNullable<z.ZodInt>;
            type: z.ZodLiteral<"inputNumberCorrectAnswer">;
        }, z.core.$strip>], "type">>;
        autoEvaluation: z.ZodBoolean;
        recommendation: z.ZodNullable<z.ZodString>;
        input: z.ZodObject<{
            correctAnswer: z.ZodNullable<z.ZodDiscriminatedUnion<[z.ZodObject<{
                variants: z.ZodArray<z.ZodString>;
                type: z.ZodLiteral<"inputStringCorrectAnswer">;
            }, z.core.$strip>, z.ZodObject<{
                variants: z.ZodArray<z.ZodNumber>;
                showPrecisionHint: z.ZodBoolean;
                autoEvaluationPrecision: z.ZodOptional<z.ZodNullable<z.ZodString>>;
                precision: z.ZodNullable<z.ZodInt>;
                type: z.ZodLiteral<"inputNumberCorrectAnswer">;
            }, z.core.$strip>], "type">>;
            autoEvaluation: z.ZodBoolean;
            recommendation: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>;
        type: z.ZodLiteral<"input">;
    }, z.core.$strip>, z.ZodObject<{
        id: z.ZodInt;
        order: z.ZodInt;
        content: z.ZodString;
        score: z.ZodNumber;
        attachments: z.ZodArray<z.ZodObject<{
            name: z.ZodString;
            filename: z.ZodString;
            mediaType: z.ZodEnum<{
                image: "image";
                file: "file";
                video: "video";
                audio: "audio";
            }>;
            length: z.ZodInt;
            version: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>>;
        options: z.ZodArray<z.ZodObject<{
            id: z.ZodInt;
            value: z.ZodString;
            order: z.ZodInt;
            isCorrect: z.ZodBoolean;
            recommendation: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>>;
        areOptionsShuffled: z.ZodBoolean;
        singleChoice: z.ZodObject<{
            options: z.ZodArray<z.ZodObject<{
                id: z.ZodInt;
                value: z.ZodString;
                order: z.ZodInt;
                isCorrect: z.ZodBoolean;
                recommendation: z.ZodNullable<z.ZodString>;
            }, z.core.$strip>>;
        }, z.core.$strip>;
        type: z.ZodLiteral<"singleChoice">;
    }, z.core.$strip>, z.ZodObject<{
        id: z.ZodInt;
        order: z.ZodInt;
        content: z.ZodString;
        score: z.ZodNumber;
        attachments: z.ZodArray<z.ZodObject<{
            name: z.ZodString;
            filename: z.ZodString;
            mediaType: z.ZodEnum<{
                image: "image";
                file: "file";
                video: "video";
                audio: "audio";
            }>;
            length: z.ZodInt;
            version: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>>;
        options: z.ZodArray<z.ZodObject<{
            id: z.ZodInt;
            value: z.ZodString;
            order: z.ZodInt;
            isCorrect: z.ZodBoolean;
            recommendation: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>>;
        areOptionsShuffled: z.ZodBoolean;
        multipleChoice: z.ZodObject<{
            options: z.ZodArray<z.ZodObject<{
                id: z.ZodInt;
                value: z.ZodString;
                order: z.ZodInt;
                isCorrect: z.ZodBoolean;
                recommendation: z.ZodNullable<z.ZodString>;
            }, z.core.$strip>>;
        }, z.core.$strip>;
        type: z.ZodLiteral<"multipleChoice">;
    }, z.core.$strip>], "type">>;
}, z.core.$strip>;
export declare const zLongreadVideoPlatformMaterialItem: z.ZodObject<{
    discriminator: z.ZodEnum<{
        markdown: "markdown";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
    }>;
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    viewType: z.ZodEnum<{
        image: "image";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
        ngxMarkdown: "ngxMarkdown";
        exerciseCoding: "exerciseCoding";
        exerciseQuestions: "exerciseQuestions";
    }>;
    type: z.ZodEnum<{
        markdown: "markdown";
        content: "content";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
    }>;
    id: z.ZodInt;
    order: z.ZodInt;
    name: z.ZodString;
    description: z.ZodString;
    videoId: z.ZodUUID;
    timecodes: z.ZodArray<z.ZodRecord<z.ZodString, z.ZodUnknown>>;
    publishDate: z.ZodNullable<z.ZodISODateTime>;
    videoState: z.ZodEnum<{
        error: "error";
        unspecified: "unspecified";
        empty: "empty";
        uploaded: "uploaded";
        transcoding: "transcoding";
        viewable: "viewable";
        ready: "ready";
        partiallyReady: "partiallyReady";
    }>;
    url: z.ZodURL;
}, z.core.$strip>;
export declare const zLongreadVideoMaterialItem: z.ZodObject<{
    discriminator: z.ZodEnum<{
        markdown: "markdown";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
    }>;
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    viewType: z.ZodEnum<{
        image: "image";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
        ngxMarkdown: "ngxMarkdown";
        exerciseCoding: "exerciseCoding";
        exerciseQuestions: "exerciseQuestions";
    }>;
    type: z.ZodEnum<{
        markdown: "markdown";
        content: "content";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
    }>;
    id: z.ZodInt;
    order: z.ZodInt;
    mediaType: z.ZodEnum<{
        image: "image";
        file: "file";
        video: "video";
        audio: "audio";
    }>;
    filename: z.ZodString;
    version: z.ZodNullable<z.ZodString>;
    length: z.ZodInt;
    publishDate: z.ZodNullable<z.ZodISODateTime>;
    publishedAt: z.ZodNullable<z.ZodISODateTime>;
    content: z.ZodObject<{
        name: z.ZodString;
        filename: z.ZodString;
        mediaType: z.ZodEnum<{
            File: "File";
            Image: "Image";
            Video: "Video";
            Audio: "Audio";
        }>;
        version: z.ZodNullable<z.ZodString>;
        length: z.ZodInt;
    }, z.core.$strip>;
}, z.core.$strip>;
export declare const zLongreadAudioMaterialItem: z.ZodObject<{
    discriminator: z.ZodEnum<{
        markdown: "markdown";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
    }>;
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    viewType: z.ZodEnum<{
        image: "image";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
        ngxMarkdown: "ngxMarkdown";
        exerciseCoding: "exerciseCoding";
        exerciseQuestions: "exerciseQuestions";
    }>;
    type: z.ZodEnum<{
        markdown: "markdown";
        content: "content";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
    }>;
    id: z.ZodInt;
    order: z.ZodInt;
    mediaType: z.ZodEnum<{
        image: "image";
        file: "file";
        video: "video";
        audio: "audio";
    }>;
    filename: z.ZodString;
    version: z.ZodNullable<z.ZodString>;
    length: z.ZodInt;
    publishDate: z.ZodNullable<z.ZodISODateTime>;
    publishedAt: z.ZodNullable<z.ZodISODateTime>;
    content: z.ZodObject<{
        name: z.ZodString;
        filename: z.ZodString;
        mediaType: z.ZodEnum<{
            File: "File";
            Image: "Image";
            Video: "Video";
            Audio: "Audio";
        }>;
        version: z.ZodNullable<z.ZodString>;
        length: z.ZodInt;
    }, z.core.$strip>;
}, z.core.$strip>;
export declare const zLongreadMaterialItem: z.ZodDiscriminatedUnion<[z.ZodObject<{
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    viewType: z.ZodEnum<{
        image: "image";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
        ngxMarkdown: "ngxMarkdown";
        exerciseCoding: "exerciseCoding";
        exerciseQuestions: "exerciseQuestions";
    }>;
    type: z.ZodEnum<{
        markdown: "markdown";
        content: "content";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
    }>;
    id: z.ZodInt;
    order: z.ZodInt;
    viewContent: z.ZodNullable<z.ZodString>;
    publishDate: z.ZodNullable<z.ZodISODateTime>;
    publishedAt: z.ZodNullable<z.ZodISODateTime>;
    discriminator: z.ZodLiteral<"markdown">;
}, z.core.$strip>, z.ZodObject<{
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    viewType: z.ZodEnum<{
        image: "image";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
        ngxMarkdown: "ngxMarkdown";
        exerciseCoding: "exerciseCoding";
        exerciseQuestions: "exerciseQuestions";
    }>;
    type: z.ZodEnum<{
        markdown: "markdown";
        content: "content";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
    }>;
    id: z.ZodInt;
    order: z.ZodInt;
    mediaType: z.ZodEnum<{
        image: "image";
        file: "file";
        video: "video";
        audio: "audio";
    }>;
    filename: z.ZodString;
    version: z.ZodNullable<z.ZodString>;
    length: z.ZodInt;
    publishDate: z.ZodNullable<z.ZodISODateTime>;
    publishedAt: z.ZodNullable<z.ZodISODateTime>;
    content: z.ZodObject<{
        name: z.ZodString;
        filename: z.ZodString;
        mediaType: z.ZodEnum<{
            File: "File";
            Image: "Image";
            Video: "Video";
            Audio: "Audio";
        }>;
        version: z.ZodNullable<z.ZodString>;
        length: z.ZodInt;
    }, z.core.$strip>;
    discriminator: z.ZodLiteral<"file">;
}, z.core.$strip>, z.ZodObject<{
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    viewType: z.ZodEnum<{
        image: "image";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
        ngxMarkdown: "ngxMarkdown";
        exerciseCoding: "exerciseCoding";
        exerciseQuestions: "exerciseQuestions";
    }>;
    type: z.ZodEnum<{
        markdown: "markdown";
        content: "content";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
    }>;
    id: z.ZodInt;
    order: z.ZodInt;
    name: z.ZodString;
    viewContent: z.ZodNullable<z.ZodString>;
    estimation: z.ZodObject<{
        startDate: z.ZodISODateTime;
        timer: z.ZodNullable<z.ZodString>;
        maxScore: z.ZodNullable<z.ZodNumber>;
        deadline: z.ZodNullable<z.ZodISODateTime>;
        activity: z.ZodNullable<z.ZodObject<{
            id: z.ZodInt;
            name: z.ZodString;
            weight: z.ZodNumber;
            maxExercisesCount: z.ZodNumber;
            averageScoreThreshold: z.ZodNullable<z.ZodNumber>;
            isLateDaysEnabled: z.ZodBoolean;
        }, z.core.$strip>>;
    }, z.core.$strip>;
    reviewers: z.ZodArray<z.ZodUUID>;
    assignees: z.ZodArray<z.ZodUUID>;
    attachments: z.ZodArray<z.ZodObject<{
        name: z.ZodString;
        filename: z.ZodString;
        mediaType: z.ZodEnum<{
            image: "image";
            file: "file";
            video: "video";
            audio: "audio";
        }>;
        length: z.ZodInt;
        version: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>>;
    backloggedAt: z.ZodNullable<z.ZodISODateTime>;
    taskId: z.ZodInt;
    isTrackingStudents: z.ZodBoolean;
    exerciseUrl: z.ZodNullable<z.ZodString>;
    coding: z.ZodObject<{
        exerciseUrl: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>;
    discriminator: z.ZodLiteral<"coding">;
}, z.core.$strip>, z.ZodObject<{
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    viewType: z.ZodEnum<{
        image: "image";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
        ngxMarkdown: "ngxMarkdown";
        exerciseCoding: "exerciseCoding";
        exerciseQuestions: "exerciseQuestions";
    }>;
    type: z.ZodEnum<{
        markdown: "markdown";
        content: "content";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
    }>;
    id: z.ZodInt;
    order: z.ZodInt;
    imageScale: z.ZodNullable<z.ZodInt>;
    mediaType: z.ZodEnum<{
        image: "image";
        file: "file";
        video: "video";
        audio: "audio";
    }>;
    filename: z.ZodString;
    version: z.ZodNullable<z.ZodString>;
    length: z.ZodInt;
    publishDate: z.ZodNullable<z.ZodISODateTime>;
    publishedAt: z.ZodNullable<z.ZodISODateTime>;
    content: z.ZodObject<{
        name: z.ZodString;
        filename: z.ZodString;
        mediaType: z.ZodEnum<{
            File: "File";
            Image: "Image";
            Video: "Video";
            Audio: "Audio";
        }>;
        version: z.ZodNullable<z.ZodString>;
        length: z.ZodInt;
    }, z.core.$strip>;
    discriminator: z.ZodLiteral<"image">;
}, z.core.$strip>, z.ZodObject<{
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    viewType: z.ZodEnum<{
        image: "image";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
        ngxMarkdown: "ngxMarkdown";
        exerciseCoding: "exerciseCoding";
        exerciseQuestions: "exerciseQuestions";
    }>;
    type: z.ZodEnum<{
        markdown: "markdown";
        content: "content";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
    }>;
    id: z.ZodInt;
    order: z.ZodInt;
    name: z.ZodString;
    viewContent: z.ZodNullable<z.ZodString>;
    estimation: z.ZodObject<{
        startDate: z.ZodISODateTime;
        timer: z.ZodNullable<z.ZodString>;
        maxScore: z.ZodNullable<z.ZodNumber>;
        deadline: z.ZodNullable<z.ZodISODateTime>;
        activity: z.ZodNullable<z.ZodObject<{
            id: z.ZodInt;
            name: z.ZodString;
            weight: z.ZodNumber;
            maxExercisesCount: z.ZodNumber;
            averageScoreThreshold: z.ZodNullable<z.ZodNumber>;
            isLateDaysEnabled: z.ZodBoolean;
        }, z.core.$strip>>;
    }, z.core.$strip>;
    reviewers: z.ZodArray<z.ZodUUID>;
    assignees: z.ZodArray<z.ZodUUID>;
    attachments: z.ZodArray<z.ZodObject<{
        name: z.ZodString;
        filename: z.ZodString;
        mediaType: z.ZodEnum<{
            image: "image";
            file: "file";
            video: "video";
            audio: "audio";
        }>;
        length: z.ZodInt;
        version: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>>;
    backloggedAt: z.ZodNullable<z.ZodISODateTime>;
    taskId: z.ZodInt;
    isTrackingStudents: z.ZodBoolean;
    mode: z.ZodEnum<{
        atMoment: "atMoment";
        byDeadline: "byDeadline";
    }>;
    areQuestionsShuffled: z.ZodBoolean;
    settings: z.ZodObject<{
        questionsPerAttempt: z.ZodNullable<z.ZodUnknown>;
        attemptsLimit: z.ZodInt;
        evaluationStrategy: z.ZodEnum<{
            last: "last";
            best: "best";
        }>;
    }, z.core.$strip>;
    quizId: z.ZodInt;
    questions: z.ZodArray<z.ZodDiscriminatedUnion<[z.ZodObject<{
        id: z.ZodInt;
        order: z.ZodInt;
        content: z.ZodString;
        score: z.ZodNumber;
        attachments: z.ZodArray<z.ZodObject<{
            name: z.ZodString;
            filename: z.ZodString;
            mediaType: z.ZodEnum<{
                image: "image";
                file: "file";
                video: "video";
                audio: "audio";
            }>;
            length: z.ZodInt;
            version: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>>;
        correctAnswer: z.ZodNullable<z.ZodDiscriminatedUnion<[z.ZodObject<{
            variants: z.ZodArray<z.ZodString>;
            type: z.ZodLiteral<"inputStringCorrectAnswer">;
        }, z.core.$strip>, z.ZodObject<{
            variants: z.ZodArray<z.ZodNumber>;
            showPrecisionHint: z.ZodBoolean;
            autoEvaluationPrecision: z.ZodOptional<z.ZodNullable<z.ZodString>>;
            precision: z.ZodNullable<z.ZodInt>;
            type: z.ZodLiteral<"inputNumberCorrectAnswer">;
        }, z.core.$strip>], "type">>;
        autoEvaluation: z.ZodBoolean;
        recommendation: z.ZodNullable<z.ZodString>;
        input: z.ZodObject<{
            correctAnswer: z.ZodNullable<z.ZodDiscriminatedUnion<[z.ZodObject<{
                variants: z.ZodArray<z.ZodString>;
                type: z.ZodLiteral<"inputStringCorrectAnswer">;
            }, z.core.$strip>, z.ZodObject<{
                variants: z.ZodArray<z.ZodNumber>;
                showPrecisionHint: z.ZodBoolean;
                autoEvaluationPrecision: z.ZodOptional<z.ZodNullable<z.ZodString>>;
                precision: z.ZodNullable<z.ZodInt>;
                type: z.ZodLiteral<"inputNumberCorrectAnswer">;
            }, z.core.$strip>], "type">>;
            autoEvaluation: z.ZodBoolean;
            recommendation: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>;
        type: z.ZodLiteral<"input">;
    }, z.core.$strip>, z.ZodObject<{
        id: z.ZodInt;
        order: z.ZodInt;
        content: z.ZodString;
        score: z.ZodNumber;
        attachments: z.ZodArray<z.ZodObject<{
            name: z.ZodString;
            filename: z.ZodString;
            mediaType: z.ZodEnum<{
                image: "image";
                file: "file";
                video: "video";
                audio: "audio";
            }>;
            length: z.ZodInt;
            version: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>>;
        options: z.ZodArray<z.ZodObject<{
            id: z.ZodInt;
            value: z.ZodString;
            order: z.ZodInt;
            isCorrect: z.ZodBoolean;
            recommendation: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>>;
        areOptionsShuffled: z.ZodBoolean;
        singleChoice: z.ZodObject<{
            options: z.ZodArray<z.ZodObject<{
                id: z.ZodInt;
                value: z.ZodString;
                order: z.ZodInt;
                isCorrect: z.ZodBoolean;
                recommendation: z.ZodNullable<z.ZodString>;
            }, z.core.$strip>>;
        }, z.core.$strip>;
        type: z.ZodLiteral<"singleChoice">;
    }, z.core.$strip>, z.ZodObject<{
        id: z.ZodInt;
        order: z.ZodInt;
        content: z.ZodString;
        score: z.ZodNumber;
        attachments: z.ZodArray<z.ZodObject<{
            name: z.ZodString;
            filename: z.ZodString;
            mediaType: z.ZodEnum<{
                image: "image";
                file: "file";
                video: "video";
                audio: "audio";
            }>;
            length: z.ZodInt;
            version: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>>;
        options: z.ZodArray<z.ZodObject<{
            id: z.ZodInt;
            value: z.ZodString;
            order: z.ZodInt;
            isCorrect: z.ZodBoolean;
            recommendation: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>>;
        areOptionsShuffled: z.ZodBoolean;
        multipleChoice: z.ZodObject<{
            options: z.ZodArray<z.ZodObject<{
                id: z.ZodInt;
                value: z.ZodString;
                order: z.ZodInt;
                isCorrect: z.ZodBoolean;
                recommendation: z.ZodNullable<z.ZodString>;
            }, z.core.$strip>>;
        }, z.core.$strip>;
        type: z.ZodLiteral<"multipleChoice">;
    }, z.core.$strip>], "type">>;
    discriminator: z.ZodLiteral<"questions">;
}, z.core.$strip>, z.ZodObject<{
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    viewType: z.ZodEnum<{
        image: "image";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
        ngxMarkdown: "ngxMarkdown";
        exerciseCoding: "exerciseCoding";
        exerciseQuestions: "exerciseQuestions";
    }>;
    type: z.ZodEnum<{
        markdown: "markdown";
        content: "content";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
    }>;
    id: z.ZodInt;
    order: z.ZodInt;
    name: z.ZodString;
    description: z.ZodString;
    videoId: z.ZodUUID;
    timecodes: z.ZodArray<z.ZodRecord<z.ZodString, z.ZodUnknown>>;
    publishDate: z.ZodNullable<z.ZodISODateTime>;
    videoState: z.ZodEnum<{
        error: "error";
        unspecified: "unspecified";
        empty: "empty";
        uploaded: "uploaded";
        transcoding: "transcoding";
        viewable: "viewable";
        ready: "ready";
        partiallyReady: "partiallyReady";
    }>;
    url: z.ZodURL;
    discriminator: z.ZodLiteral<"videoPlatform">;
}, z.core.$strip>, z.ZodObject<{
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    viewType: z.ZodEnum<{
        image: "image";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
        ngxMarkdown: "ngxMarkdown";
        exerciseCoding: "exerciseCoding";
        exerciseQuestions: "exerciseQuestions";
    }>;
    type: z.ZodEnum<{
        markdown: "markdown";
        content: "content";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
    }>;
    id: z.ZodInt;
    order: z.ZodInt;
    mediaType: z.ZodEnum<{
        image: "image";
        file: "file";
        video: "video";
        audio: "audio";
    }>;
    filename: z.ZodString;
    version: z.ZodNullable<z.ZodString>;
    length: z.ZodInt;
    publishDate: z.ZodNullable<z.ZodISODateTime>;
    publishedAt: z.ZodNullable<z.ZodISODateTime>;
    content: z.ZodObject<{
        name: z.ZodString;
        filename: z.ZodString;
        mediaType: z.ZodEnum<{
            File: "File";
            Image: "Image";
            Video: "Video";
            Audio: "Audio";
        }>;
        version: z.ZodNullable<z.ZodString>;
        length: z.ZodInt;
    }, z.core.$strip>;
    discriminator: z.ZodLiteral<"video">;
}, z.core.$strip>, z.ZodObject<{
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    viewType: z.ZodEnum<{
        image: "image";
        videoPlatform: "videoPlatform";
        file: "file";
        video: "video";
        audio: "audio";
        ngxMarkdown: "ngxMarkdown";
        exerciseCoding: "exerciseCoding";
        exerciseQuestions: "exerciseQuestions";
    }>;
    type: z.ZodEnum<{
        markdown: "markdown";
        content: "content";
        coding: "coding";
        image: "image";
        questions: "questions";
        videoPlatform: "videoPlatform";
    }>;
    id: z.ZodInt;
    order: z.ZodInt;
    mediaType: z.ZodEnum<{
        image: "image";
        file: "file";
        video: "video";
        audio: "audio";
    }>;
    filename: z.ZodString;
    version: z.ZodNullable<z.ZodString>;
    length: z.ZodInt;
    publishDate: z.ZodNullable<z.ZodISODateTime>;
    publishedAt: z.ZodNullable<z.ZodISODateTime>;
    content: z.ZodObject<{
        name: z.ZodString;
        filename: z.ZodString;
        mediaType: z.ZodEnum<{
            File: "File";
            Image: "Image";
            Video: "Video";
            Audio: "Audio";
        }>;
        version: z.ZodNullable<z.ZodString>;
        length: z.ZodInt;
    }, z.core.$strip>;
    discriminator: z.ZodLiteral<"audio">;
}, z.core.$strip>], "discriminator">;
export declare const zLongreadMaterialsByIdResponse: z.ZodObject<{
    items: z.ZodArray<z.ZodDiscriminatedUnion<[z.ZodObject<{
        state: z.ZodEnum<{
            published: "published";
            archived: "archived";
            draft: "draft";
        }>;
        viewType: z.ZodEnum<{
            image: "image";
            videoPlatform: "videoPlatform";
            file: "file";
            video: "video";
            audio: "audio";
            ngxMarkdown: "ngxMarkdown";
            exerciseCoding: "exerciseCoding";
            exerciseQuestions: "exerciseQuestions";
        }>;
        type: z.ZodEnum<{
            markdown: "markdown";
            content: "content";
            coding: "coding";
            image: "image";
            questions: "questions";
            videoPlatform: "videoPlatform";
        }>;
        id: z.ZodInt;
        order: z.ZodInt;
        viewContent: z.ZodNullable<z.ZodString>;
        publishDate: z.ZodNullable<z.ZodISODateTime>;
        publishedAt: z.ZodNullable<z.ZodISODateTime>;
        discriminator: z.ZodLiteral<"markdown">;
    }, z.core.$strip>, z.ZodObject<{
        state: z.ZodEnum<{
            published: "published";
            archived: "archived";
            draft: "draft";
        }>;
        viewType: z.ZodEnum<{
            image: "image";
            videoPlatform: "videoPlatform";
            file: "file";
            video: "video";
            audio: "audio";
            ngxMarkdown: "ngxMarkdown";
            exerciseCoding: "exerciseCoding";
            exerciseQuestions: "exerciseQuestions";
        }>;
        type: z.ZodEnum<{
            markdown: "markdown";
            content: "content";
            coding: "coding";
            image: "image";
            questions: "questions";
            videoPlatform: "videoPlatform";
        }>;
        id: z.ZodInt;
        order: z.ZodInt;
        mediaType: z.ZodEnum<{
            image: "image";
            file: "file";
            video: "video";
            audio: "audio";
        }>;
        filename: z.ZodString;
        version: z.ZodNullable<z.ZodString>;
        length: z.ZodInt;
        publishDate: z.ZodNullable<z.ZodISODateTime>;
        publishedAt: z.ZodNullable<z.ZodISODateTime>;
        content: z.ZodObject<{
            name: z.ZodString;
            filename: z.ZodString;
            mediaType: z.ZodEnum<{
                File: "File";
                Image: "Image";
                Video: "Video";
                Audio: "Audio";
            }>;
            version: z.ZodNullable<z.ZodString>;
            length: z.ZodInt;
        }, z.core.$strip>;
        discriminator: z.ZodLiteral<"file">;
    }, z.core.$strip>, z.ZodObject<{
        state: z.ZodEnum<{
            published: "published";
            archived: "archived";
            draft: "draft";
        }>;
        viewType: z.ZodEnum<{
            image: "image";
            videoPlatform: "videoPlatform";
            file: "file";
            video: "video";
            audio: "audio";
            ngxMarkdown: "ngxMarkdown";
            exerciseCoding: "exerciseCoding";
            exerciseQuestions: "exerciseQuestions";
        }>;
        type: z.ZodEnum<{
            markdown: "markdown";
            content: "content";
            coding: "coding";
            image: "image";
            questions: "questions";
            videoPlatform: "videoPlatform";
        }>;
        id: z.ZodInt;
        order: z.ZodInt;
        name: z.ZodString;
        viewContent: z.ZodNullable<z.ZodString>;
        estimation: z.ZodObject<{
            startDate: z.ZodISODateTime;
            timer: z.ZodNullable<z.ZodString>;
            maxScore: z.ZodNullable<z.ZodNumber>;
            deadline: z.ZodNullable<z.ZodISODateTime>;
            activity: z.ZodNullable<z.ZodObject<{
                id: z.ZodInt;
                name: z.ZodString;
                weight: z.ZodNumber;
                maxExercisesCount: z.ZodNumber;
                averageScoreThreshold: z.ZodNullable<z.ZodNumber>;
                isLateDaysEnabled: z.ZodBoolean;
            }, z.core.$strip>>;
        }, z.core.$strip>;
        reviewers: z.ZodArray<z.ZodUUID>;
        assignees: z.ZodArray<z.ZodUUID>;
        attachments: z.ZodArray<z.ZodObject<{
            name: z.ZodString;
            filename: z.ZodString;
            mediaType: z.ZodEnum<{
                image: "image";
                file: "file";
                video: "video";
                audio: "audio";
            }>;
            length: z.ZodInt;
            version: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>>;
        backloggedAt: z.ZodNullable<z.ZodISODateTime>;
        taskId: z.ZodInt;
        isTrackingStudents: z.ZodBoolean;
        exerciseUrl: z.ZodNullable<z.ZodString>;
        coding: z.ZodObject<{
            exerciseUrl: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>;
        discriminator: z.ZodLiteral<"coding">;
    }, z.core.$strip>, z.ZodObject<{
        state: z.ZodEnum<{
            published: "published";
            archived: "archived";
            draft: "draft";
        }>;
        viewType: z.ZodEnum<{
            image: "image";
            videoPlatform: "videoPlatform";
            file: "file";
            video: "video";
            audio: "audio";
            ngxMarkdown: "ngxMarkdown";
            exerciseCoding: "exerciseCoding";
            exerciseQuestions: "exerciseQuestions";
        }>;
        type: z.ZodEnum<{
            markdown: "markdown";
            content: "content";
            coding: "coding";
            image: "image";
            questions: "questions";
            videoPlatform: "videoPlatform";
        }>;
        id: z.ZodInt;
        order: z.ZodInt;
        imageScale: z.ZodNullable<z.ZodInt>;
        mediaType: z.ZodEnum<{
            image: "image";
            file: "file";
            video: "video";
            audio: "audio";
        }>;
        filename: z.ZodString;
        version: z.ZodNullable<z.ZodString>;
        length: z.ZodInt;
        publishDate: z.ZodNullable<z.ZodISODateTime>;
        publishedAt: z.ZodNullable<z.ZodISODateTime>;
        content: z.ZodObject<{
            name: z.ZodString;
            filename: z.ZodString;
            mediaType: z.ZodEnum<{
                File: "File";
                Image: "Image";
                Video: "Video";
                Audio: "Audio";
            }>;
            version: z.ZodNullable<z.ZodString>;
            length: z.ZodInt;
        }, z.core.$strip>;
        discriminator: z.ZodLiteral<"image">;
    }, z.core.$strip>, z.ZodObject<{
        state: z.ZodEnum<{
            published: "published";
            archived: "archived";
            draft: "draft";
        }>;
        viewType: z.ZodEnum<{
            image: "image";
            videoPlatform: "videoPlatform";
            file: "file";
            video: "video";
            audio: "audio";
            ngxMarkdown: "ngxMarkdown";
            exerciseCoding: "exerciseCoding";
            exerciseQuestions: "exerciseQuestions";
        }>;
        type: z.ZodEnum<{
            markdown: "markdown";
            content: "content";
            coding: "coding";
            image: "image";
            questions: "questions";
            videoPlatform: "videoPlatform";
        }>;
        id: z.ZodInt;
        order: z.ZodInt;
        name: z.ZodString;
        viewContent: z.ZodNullable<z.ZodString>;
        estimation: z.ZodObject<{
            startDate: z.ZodISODateTime;
            timer: z.ZodNullable<z.ZodString>;
            maxScore: z.ZodNullable<z.ZodNumber>;
            deadline: z.ZodNullable<z.ZodISODateTime>;
            activity: z.ZodNullable<z.ZodObject<{
                id: z.ZodInt;
                name: z.ZodString;
                weight: z.ZodNumber;
                maxExercisesCount: z.ZodNumber;
                averageScoreThreshold: z.ZodNullable<z.ZodNumber>;
                isLateDaysEnabled: z.ZodBoolean;
            }, z.core.$strip>>;
        }, z.core.$strip>;
        reviewers: z.ZodArray<z.ZodUUID>;
        assignees: z.ZodArray<z.ZodUUID>;
        attachments: z.ZodArray<z.ZodObject<{
            name: z.ZodString;
            filename: z.ZodString;
            mediaType: z.ZodEnum<{
                image: "image";
                file: "file";
                video: "video";
                audio: "audio";
            }>;
            length: z.ZodInt;
            version: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>>;
        backloggedAt: z.ZodNullable<z.ZodISODateTime>;
        taskId: z.ZodInt;
        isTrackingStudents: z.ZodBoolean;
        mode: z.ZodEnum<{
            atMoment: "atMoment";
            byDeadline: "byDeadline";
        }>;
        areQuestionsShuffled: z.ZodBoolean;
        settings: z.ZodObject<{
            questionsPerAttempt: z.ZodNullable<z.ZodUnknown>;
            attemptsLimit: z.ZodInt;
            evaluationStrategy: z.ZodEnum<{
                last: "last";
                best: "best";
            }>;
        }, z.core.$strip>;
        quizId: z.ZodInt;
        questions: z.ZodArray<z.ZodDiscriminatedUnion<[z.ZodObject<{
            id: z.ZodInt;
            order: z.ZodInt;
            content: z.ZodString;
            score: z.ZodNumber;
            attachments: z.ZodArray<z.ZodObject<{
                name: z.ZodString;
                filename: z.ZodString;
                mediaType: z.ZodEnum<{
                    image: "image";
                    file: "file";
                    video: "video";
                    audio: "audio";
                }>;
                length: z.ZodInt;
                version: z.ZodNullable<z.ZodString>;
            }, z.core.$strip>>;
            correctAnswer: z.ZodNullable<z.ZodDiscriminatedUnion<[z.ZodObject<{
                variants: z.ZodArray<z.ZodString>;
                type: z.ZodLiteral<"inputStringCorrectAnswer">;
            }, z.core.$strip>, z.ZodObject<{
                variants: z.ZodArray<z.ZodNumber>;
                showPrecisionHint: z.ZodBoolean;
                autoEvaluationPrecision: z.ZodOptional<z.ZodNullable<z.ZodString>>;
                precision: z.ZodNullable<z.ZodInt>;
                type: z.ZodLiteral<"inputNumberCorrectAnswer">;
            }, z.core.$strip>], "type">>;
            autoEvaluation: z.ZodBoolean;
            recommendation: z.ZodNullable<z.ZodString>;
            input: z.ZodObject<{
                correctAnswer: z.ZodNullable<z.ZodDiscriminatedUnion<[z.ZodObject<{
                    variants: z.ZodArray<z.ZodString>;
                    type: z.ZodLiteral<"inputStringCorrectAnswer">;
                }, z.core.$strip>, z.ZodObject<{
                    variants: z.ZodArray<z.ZodNumber>;
                    showPrecisionHint: z.ZodBoolean;
                    autoEvaluationPrecision: z.ZodOptional<z.ZodNullable<z.ZodString>>;
                    precision: z.ZodNullable<z.ZodInt>;
                    type: z.ZodLiteral<"inputNumberCorrectAnswer">;
                }, z.core.$strip>], "type">>;
                autoEvaluation: z.ZodBoolean;
                recommendation: z.ZodNullable<z.ZodString>;
            }, z.core.$strip>;
            type: z.ZodLiteral<"input">;
        }, z.core.$strip>, z.ZodObject<{
            id: z.ZodInt;
            order: z.ZodInt;
            content: z.ZodString;
            score: z.ZodNumber;
            attachments: z.ZodArray<z.ZodObject<{
                name: z.ZodString;
                filename: z.ZodString;
                mediaType: z.ZodEnum<{
                    image: "image";
                    file: "file";
                    video: "video";
                    audio: "audio";
                }>;
                length: z.ZodInt;
                version: z.ZodNullable<z.ZodString>;
            }, z.core.$strip>>;
            options: z.ZodArray<z.ZodObject<{
                id: z.ZodInt;
                value: z.ZodString;
                order: z.ZodInt;
                isCorrect: z.ZodBoolean;
                recommendation: z.ZodNullable<z.ZodString>;
            }, z.core.$strip>>;
            areOptionsShuffled: z.ZodBoolean;
            singleChoice: z.ZodObject<{
                options: z.ZodArray<z.ZodObject<{
                    id: z.ZodInt;
                    value: z.ZodString;
                    order: z.ZodInt;
                    isCorrect: z.ZodBoolean;
                    recommendation: z.ZodNullable<z.ZodString>;
                }, z.core.$strip>>;
            }, z.core.$strip>;
            type: z.ZodLiteral<"singleChoice">;
        }, z.core.$strip>, z.ZodObject<{
            id: z.ZodInt;
            order: z.ZodInt;
            content: z.ZodString;
            score: z.ZodNumber;
            attachments: z.ZodArray<z.ZodObject<{
                name: z.ZodString;
                filename: z.ZodString;
                mediaType: z.ZodEnum<{
                    image: "image";
                    file: "file";
                    video: "video";
                    audio: "audio";
                }>;
                length: z.ZodInt;
                version: z.ZodNullable<z.ZodString>;
            }, z.core.$strip>>;
            options: z.ZodArray<z.ZodObject<{
                id: z.ZodInt;
                value: z.ZodString;
                order: z.ZodInt;
                isCorrect: z.ZodBoolean;
                recommendation: z.ZodNullable<z.ZodString>;
            }, z.core.$strip>>;
            areOptionsShuffled: z.ZodBoolean;
            multipleChoice: z.ZodObject<{
                options: z.ZodArray<z.ZodObject<{
                    id: z.ZodInt;
                    value: z.ZodString;
                    order: z.ZodInt;
                    isCorrect: z.ZodBoolean;
                    recommendation: z.ZodNullable<z.ZodString>;
                }, z.core.$strip>>;
            }, z.core.$strip>;
            type: z.ZodLiteral<"multipleChoice">;
        }, z.core.$strip>], "type">>;
        discriminator: z.ZodLiteral<"questions">;
    }, z.core.$strip>, z.ZodObject<{
        state: z.ZodEnum<{
            published: "published";
            archived: "archived";
            draft: "draft";
        }>;
        viewType: z.ZodEnum<{
            image: "image";
            videoPlatform: "videoPlatform";
            file: "file";
            video: "video";
            audio: "audio";
            ngxMarkdown: "ngxMarkdown";
            exerciseCoding: "exerciseCoding";
            exerciseQuestions: "exerciseQuestions";
        }>;
        type: z.ZodEnum<{
            markdown: "markdown";
            content: "content";
            coding: "coding";
            image: "image";
            questions: "questions";
            videoPlatform: "videoPlatform";
        }>;
        id: z.ZodInt;
        order: z.ZodInt;
        name: z.ZodString;
        description: z.ZodString;
        videoId: z.ZodUUID;
        timecodes: z.ZodArray<z.ZodRecord<z.ZodString, z.ZodUnknown>>;
        publishDate: z.ZodNullable<z.ZodISODateTime>;
        videoState: z.ZodEnum<{
            error: "error";
            unspecified: "unspecified";
            empty: "empty";
            uploaded: "uploaded";
            transcoding: "transcoding";
            viewable: "viewable";
            ready: "ready";
            partiallyReady: "partiallyReady";
        }>;
        url: z.ZodURL;
        discriminator: z.ZodLiteral<"videoPlatform">;
    }, z.core.$strip>, z.ZodObject<{
        state: z.ZodEnum<{
            published: "published";
            archived: "archived";
            draft: "draft";
        }>;
        viewType: z.ZodEnum<{
            image: "image";
            videoPlatform: "videoPlatform";
            file: "file";
            video: "video";
            audio: "audio";
            ngxMarkdown: "ngxMarkdown";
            exerciseCoding: "exerciseCoding";
            exerciseQuestions: "exerciseQuestions";
        }>;
        type: z.ZodEnum<{
            markdown: "markdown";
            content: "content";
            coding: "coding";
            image: "image";
            questions: "questions";
            videoPlatform: "videoPlatform";
        }>;
        id: z.ZodInt;
        order: z.ZodInt;
        mediaType: z.ZodEnum<{
            image: "image";
            file: "file";
            video: "video";
            audio: "audio";
        }>;
        filename: z.ZodString;
        version: z.ZodNullable<z.ZodString>;
        length: z.ZodInt;
        publishDate: z.ZodNullable<z.ZodISODateTime>;
        publishedAt: z.ZodNullable<z.ZodISODateTime>;
        content: z.ZodObject<{
            name: z.ZodString;
            filename: z.ZodString;
            mediaType: z.ZodEnum<{
                File: "File";
                Image: "Image";
                Video: "Video";
                Audio: "Audio";
            }>;
            version: z.ZodNullable<z.ZodString>;
            length: z.ZodInt;
        }, z.core.$strip>;
        discriminator: z.ZodLiteral<"video">;
    }, z.core.$strip>, z.ZodObject<{
        state: z.ZodEnum<{
            published: "published";
            archived: "archived";
            draft: "draft";
        }>;
        viewType: z.ZodEnum<{
            image: "image";
            videoPlatform: "videoPlatform";
            file: "file";
            video: "video";
            audio: "audio";
            ngxMarkdown: "ngxMarkdown";
            exerciseCoding: "exerciseCoding";
            exerciseQuestions: "exerciseQuestions";
        }>;
        type: z.ZodEnum<{
            markdown: "markdown";
            content: "content";
            coding: "coding";
            image: "image";
            questions: "questions";
            videoPlatform: "videoPlatform";
        }>;
        id: z.ZodInt;
        order: z.ZodInt;
        mediaType: z.ZodEnum<{
            image: "image";
            file: "file";
            video: "video";
            audio: "audio";
        }>;
        filename: z.ZodString;
        version: z.ZodNullable<z.ZodString>;
        length: z.ZodInt;
        publishDate: z.ZodNullable<z.ZodISODateTime>;
        publishedAt: z.ZodNullable<z.ZodISODateTime>;
        content: z.ZodObject<{
            name: z.ZodString;
            filename: z.ZodString;
            mediaType: z.ZodEnum<{
                File: "File";
                Image: "Image";
                Video: "Video";
                Audio: "Audio";
            }>;
            version: z.ZodNullable<z.ZodString>;
            length: z.ZodInt;
        }, z.core.$strip>;
        discriminator: z.ZodLiteral<"audio">;
    }, z.core.$strip>], "discriminator">>;
    paging: z.ZodObject<{
        limit: z.ZodInt;
        offset: z.ZodInt;
        totalCount: z.ZodInt;
    }, z.core.$strip>;
}, z.core.$strip>;
/**
 * Task type.
 */
export declare const zTaskType: z.ZodEnum<{
    coding: "coding";
    questions: "questions";
}>;
/**
 * Task state.
 */
export declare const zTaskState: z.ZodEnum<{
    backlog: "backlog";
    inProgress: "inProgress";
    submitted: "submitted";
    review: "review";
    evaluated: "evaluated";
    failed: "failed";
}>;
/**
 * Task score, if it was evaluated.
 */
export declare const zTaskScore: z.ZodNullable<z.ZodNumber>;
/**
 * Task score translated to the course skill level.
 */
export declare const zTaskScoreSkillLevel: z.ZodEnum<{
    basic: "basic";
    none: "none";
    intermediate: "intermediate";
    advanced: "advanced";
}>;
/**
 * Extra score for task, if not null.
 */
export declare const zTaskExtraScore: z.ZodNullable<z.ZodNumber>;
/**
 * Task creation in LMS timestamp.
 */
export declare const zCreatedAt: z.ZodISODateTime;
/**
 * Task start timestamp.
 */
export declare const zStartedAt: z.ZodNullable<z.ZodISODateTime>;
/**
 * Task submit timestamp.
 */
export declare const zSubmitAt: z.ZodNullable<z.ZodISODateTime>;
/**
 * Task rejection timestamp.
 */
export declare const zRejectAt: z.ZodNullable<z.ZodISODateTime>;
/**
 * Task evaluation by system timestamp.
 */
export declare const zEvaluateAt: z.ZodNullable<z.ZodISODateTime>;
/**
 * How many late days already been spent on task, if any.
 */
export declare const zTaskLateDays: z.ZodNullable<z.ZodInt>;
/**
 * JSON-serialized markdown content of task rendered in LMS.
 */
export declare const zTaskExerciseViewContent: z.ZodNullable<z.ZodString>;
export declare const zTaskExerciseActivity: z.ZodObject<{
    id: z.ZodInt;
    name: z.ZodString;
    weight: z.ZodNumber;
    isLateDaysEnabled: z.ZodBoolean;
}, z.core.$strip>;
export declare const zTaskAttachment: z.ZodObject<{
    name: z.ZodString;
    filename: z.ZodString;
    mediaType: z.ZodEnum<{
        image: "image";
        file: "file";
        video: "video";
        audio: "audio";
    }>;
    length: z.ZodInt;
    version: z.ZodNullable<z.ZodString>;
}, z.core.$strip>;
export declare const zTaskExerciseQuestionOrderOptionOrder: z.ZodObject<{
    optionId: z.ZodInt;
    order: z.ZodInt;
}, z.core.$strip>;
export declare const zTaskExerciseQuestionOrder: z.ZodObject<{
    questionId: z.ZodInt;
    order: z.ZodInt;
    optionOrders: z.ZodArray<z.ZodObject<{
        optionId: z.ZodInt;
        order: z.ZodInt;
    }, z.core.$strip>>;
}, z.core.$strip>;
export declare const zTaskExerciseQuestionOrders: z.ZodNullable<z.ZodArray<z.ZodObject<{
    questionId: z.ZodInt;
    order: z.ZodInt;
    optionOrders: z.ZodArray<z.ZodObject<{
        optionId: z.ZodInt;
        order: z.ZodInt;
    }, z.core.$strip>>;
}, z.core.$strip>>>;
export declare const zTaskExercise: z.ZodObject<{
    id: z.ZodInt;
    name: z.ZodString;
    type: z.ZodEnum<{
        coding: "coding";
        questions: "questions";
    }>;
    maxScore: z.ZodNumber;
    startDate: z.ZodISODateTime;
    deadline: z.ZodISODateTime;
    timer: z.ZodNullable<z.ZodUnknown>;
    activity: z.ZodObject<{
        id: z.ZodInt;
        name: z.ZodString;
        weight: z.ZodNumber;
        isLateDaysEnabled: z.ZodBoolean;
    }, z.core.$strip>;
    questionOrders: z.ZodNullable<z.ZodArray<z.ZodObject<{
        questionId: z.ZodInt;
        order: z.ZodInt;
        optionOrders: z.ZodArray<z.ZodObject<{
            optionId: z.ZodInt;
            order: z.ZodInt;
        }, z.core.$strip>>;
    }, z.core.$strip>>>;
    areQuestionsShuffled: z.ZodNullable<z.ZodBoolean>;
    quizId: z.ZodNullable<z.ZodInt>;
    mode: z.ZodNullable<z.ZodUnknown>;
    viewContent: z.ZodNullable<z.ZodString>;
    exerciseUrl: z.ZodNullable<z.ZodString>;
    attachments: z.ZodNullable<z.ZodArray<z.ZodObject<{
        name: z.ZodString;
        filename: z.ZodString;
        mediaType: z.ZodEnum<{
            image: "image";
            file: "file";
            video: "video";
            audio: "audio";
        }>;
        length: z.ZodInt;
        version: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>>>;
    settings: z.ZodNullable<z.ZodObject<{
        questionsPerAttempt: z.ZodNullable<z.ZodUnknown>;
        attemptsLimit: z.ZodInt;
        evaluationStrategy: z.ZodEnum<{
            last: "last";
            best: "best";
        }>;
    }, z.core.$strip>>;
}, z.core.$strip>;
export declare const zTaskCourse: z.ZodObject<{
    id: z.ZodInt;
    name: z.ZodString;
    isArchived: z.ZodBoolean;
}, z.core.$strip>;
export declare const zTaskCourseTheme: z.ZodObject<{
    id: z.ZodInt;
    name: z.ZodString;
}, z.core.$strip>;
export declare const zTaskLongread: z.ZodObject<{
    id: z.ZodInt;
    name: z.ZodString;
}, z.core.$strip>;
export declare const zTaskReviewer: z.ZodNullable<z.ZodObject<{
    id: z.ZodUUID;
    name: z.ZodString;
    identityEmail: z.ZodEmail;
    email: z.ZodEmail;
    identityIdentifier: z.ZodUUID;
    timeAccount: z.ZodString;
    lastName: z.ZodString;
    firstName: z.ZodString;
    middleName: z.ZodNullable<z.ZodString>;
}, z.core.$strip>>;
export declare const zTaskSolutionAnswersQuestionInputAnswerValue: z.ZodNullable<z.ZodUnknown>;
/**
 * Recommendation text in HTML shown under input box on frontend.
 *
 */
export declare const zTaskSolutionAnswersQuestionInputAnswerRecommendation: z.ZodString;
/**
 * Object representing information about answer string values expected as valid by task authors. Object is null if task authors decide not to show answers after task evaluation.
 *
 */
export declare const zTaskSolutionAnswersQuestionInputAnswer: z.ZodNullable<z.ZodObject<{
    values: z.ZodArray<z.ZodString>;
    value: z.ZodNullable<z.ZodUnknown>;
    recommendation: z.ZodString;
}, z.core.$strip>>;
/**
 * Object representing information about answer number values expected as valid by task authors. Object is null if task authors decide not to show answers after task evaluation.
 *
 */
export declare const zTaskSolutionAnswersQuestionInputNumberAnswer: z.ZodNullable<z.ZodObject<{
    values: z.ZodArray<z.ZodNumber>;
    value: z.ZodNullable<z.ZodUnknown>;
    recommendation: z.ZodString;
}, z.core.$strip>>;
export declare const zTaskSolutionAnswersQuestionOptionsItem: z.ZodObject<{
    id: z.ZodInt;
    isCorrect: z.ZodBoolean;
    recommendation: z.ZodNullable<z.ZodString>;
}, z.core.$strip>;
export declare const zTaskSolutionAnswersQuestionOptionsQuestionItem: z.ZodObject<{
    id: z.ZodInt;
    type: z.ZodEnum<{
        singleChoice: "singleChoice";
        multipleChoice: "multipleChoice";
    }>;
    answer: z.ZodNullable<z.ZodUnknown>;
    options: z.ZodArray<z.ZodObject<{
        id: z.ZodInt;
        isCorrect: z.ZodBoolean;
        recommendation: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>>;
}, z.core.$strip>;
export declare const zTaskSolutionAnswersQuestionInputQuestionItem: z.ZodObject<{
    id: z.ZodInt;
    type: z.ZodEnum<{
        input: "input";
    }>;
    answer: z.ZodNullable<z.ZodObject<{
        values: z.ZodArray<z.ZodString>;
        value: z.ZodNullable<z.ZodUnknown>;
        recommendation: z.ZodString;
    }, z.core.$strip>>;
    options: z.ZodNullable<z.ZodUnknown>;
}, z.core.$strip>;
export declare const zTaskSolutionAnswersQuestionInputNumberQuestionItem: z.ZodObject<{
    id: z.ZodInt;
    type: z.ZodEnum<{
        inputNumber: "inputNumber";
    }>;
    answer: z.ZodNullable<z.ZodObject<{
        values: z.ZodArray<z.ZodNumber>;
        value: z.ZodNullable<z.ZodUnknown>;
        recommendation: z.ZodString;
    }, z.core.$strip>>;
    options: z.ZodNullable<z.ZodUnknown>;
}, z.core.$strip>;
export declare const zTaskSolutionAnswersQuestion: z.ZodUnion<readonly [z.ZodIntersection<z.ZodObject<{
    type: z.ZodUnion<readonly [z.ZodLiteral<"singleChoice">, z.ZodLiteral<"multipleChoice">]>;
}, z.core.$strip>, z.ZodObject<{
    id: z.ZodInt;
    type: z.ZodEnum<{
        singleChoice: "singleChoice";
        multipleChoice: "multipleChoice";
    }>;
    answer: z.ZodNullable<z.ZodUnknown>;
    options: z.ZodArray<z.ZodObject<{
        id: z.ZodInt;
        isCorrect: z.ZodBoolean;
        recommendation: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>>;
}, z.core.$strip>>, z.ZodIntersection<z.ZodObject<{
    type: z.ZodLiteral<"input">;
}, z.core.$strip>, z.ZodObject<{
    id: z.ZodInt;
    type: z.ZodEnum<{
        input: "input";
    }>;
    answer: z.ZodNullable<z.ZodObject<{
        values: z.ZodArray<z.ZodString>;
        value: z.ZodNullable<z.ZodUnknown>;
        recommendation: z.ZodString;
    }, z.core.$strip>>;
    options: z.ZodNullable<z.ZodUnknown>;
}, z.core.$strip>>, z.ZodIntersection<z.ZodObject<{
    type: z.ZodLiteral<"inputNumber">;
}, z.core.$strip>, z.ZodObject<{
    id: z.ZodInt;
    type: z.ZodEnum<{
        inputNumber: "inputNumber";
    }>;
    answer: z.ZodNullable<z.ZodObject<{
        values: z.ZodArray<z.ZodNumber>;
        value: z.ZodNullable<z.ZodUnknown>;
        recommendation: z.ZodString;
    }, z.core.$strip>>;
    options: z.ZodNullable<z.ZodUnknown>;
}, z.core.$strip>>]>;
export declare const zTaskSolutionAnswersItem: z.ZodObject<{
    answer: z.ZodUnion<readonly [z.ZodString, z.ZodNumber]>;
    question: z.ZodUnion<readonly [z.ZodIntersection<z.ZodObject<{
        type: z.ZodUnion<readonly [z.ZodLiteral<"singleChoice">, z.ZodLiteral<"multipleChoice">]>;
    }, z.core.$strip>, z.ZodObject<{
        id: z.ZodInt;
        type: z.ZodEnum<{
            singleChoice: "singleChoice";
            multipleChoice: "multipleChoice";
        }>;
        answer: z.ZodNullable<z.ZodUnknown>;
        options: z.ZodArray<z.ZodObject<{
            id: z.ZodInt;
            isCorrect: z.ZodBoolean;
            recommendation: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>>;
    }, z.core.$strip>>, z.ZodIntersection<z.ZodObject<{
        type: z.ZodLiteral<"input">;
    }, z.core.$strip>, z.ZodObject<{
        id: z.ZodInt;
        type: z.ZodEnum<{
            input: "input";
        }>;
        answer: z.ZodNullable<z.ZodObject<{
            values: z.ZodArray<z.ZodString>;
            value: z.ZodNullable<z.ZodUnknown>;
            recommendation: z.ZodString;
        }, z.core.$strip>>;
        options: z.ZodNullable<z.ZodUnknown>;
    }, z.core.$strip>>, z.ZodIntersection<z.ZodObject<{
        type: z.ZodLiteral<"inputNumber">;
    }, z.core.$strip>, z.ZodObject<{
        id: z.ZodInt;
        type: z.ZodEnum<{
            inputNumber: "inputNumber";
        }>;
        answer: z.ZodNullable<z.ZodObject<{
            values: z.ZodArray<z.ZodNumber>;
            value: z.ZodNullable<z.ZodUnknown>;
            recommendation: z.ZodString;
        }, z.core.$strip>>;
        options: z.ZodNullable<z.ZodUnknown>;
    }, z.core.$strip>>]>;
}, z.core.$strip>;
export declare const zTaskSolution: z.ZodNullable<z.ZodObject<{
    type: z.ZodEnum<{
        coding: "coding";
        questions: "questions";
    }>;
    solutionUrl: z.ZodNullable<z.ZodURL>;
    answers: z.ZodNullable<z.ZodArray<z.ZodObject<{
        answer: z.ZodUnion<readonly [z.ZodString, z.ZodNumber]>;
        question: z.ZodUnion<readonly [z.ZodIntersection<z.ZodObject<{
            type: z.ZodUnion<readonly [z.ZodLiteral<"singleChoice">, z.ZodLiteral<"multipleChoice">]>;
        }, z.core.$strip>, z.ZodObject<{
            id: z.ZodInt;
            type: z.ZodEnum<{
                singleChoice: "singleChoice";
                multipleChoice: "multipleChoice";
            }>;
            answer: z.ZodNullable<z.ZodUnknown>;
            options: z.ZodArray<z.ZodObject<{
                id: z.ZodInt;
                isCorrect: z.ZodBoolean;
                recommendation: z.ZodNullable<z.ZodString>;
            }, z.core.$strip>>;
        }, z.core.$strip>>, z.ZodIntersection<z.ZodObject<{
            type: z.ZodLiteral<"input">;
        }, z.core.$strip>, z.ZodObject<{
            id: z.ZodInt;
            type: z.ZodEnum<{
                input: "input";
            }>;
            answer: z.ZodNullable<z.ZodObject<{
                values: z.ZodArray<z.ZodString>;
                value: z.ZodNullable<z.ZodUnknown>;
                recommendation: z.ZodString;
            }, z.core.$strip>>;
            options: z.ZodNullable<z.ZodUnknown>;
        }, z.core.$strip>>, z.ZodIntersection<z.ZodObject<{
            type: z.ZodLiteral<"inputNumber">;
        }, z.core.$strip>, z.ZodObject<{
            id: z.ZodInt;
            type: z.ZodEnum<{
                inputNumber: "inputNumber";
            }>;
            answer: z.ZodNullable<z.ZodObject<{
                values: z.ZodArray<z.ZodNumber>;
                value: z.ZodNullable<z.ZodUnknown>;
                recommendation: z.ZodString;
            }, z.core.$strip>>;
            options: z.ZodNullable<z.ZodUnknown>;
        }, z.core.$strip>>]>;
    }, z.core.$strip>>>;
    attachments: z.ZodNullable<z.ZodArray<z.ZodObject<{
        name: z.ZodString;
        filename: z.ZodString;
        mediaType: z.ZodEnum<{
            image: "image";
            file: "file";
            video: "video";
            audio: "audio";
        }>;
        length: z.ZodInt;
        version: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>>>;
}, z.core.$strip>>;
export declare const zTaskScoresItem: z.ZodObject<{
    questionId: z.ZodInt;
    score: z.ZodNullable<z.ZodNumber>;
}, z.core.$strip>;
export declare const zTaskScores: z.ZodNullable<z.ZodArray<z.ZodObject<{
    questionId: z.ZodInt;
    score: z.ZodNullable<z.ZodNumber>;
}, z.core.$strip>>>;
/**
 * Quiz session ID, null if task type is not "questions".
 */
export declare const zQuizSessionId: z.ZodNullable<z.ZodInt>;
/**
 * Numeric identifier of the "questions" task attempt.
 */
export declare const zAttemptId: z.ZodInt;
/**
 * Evaluated attempt ID, null if task type is not "questions".
 */
export declare const zTaskEvaluatedAttemptId: z.ZodNullable<z.ZodInt>;
/**
 * Identifier of the current attempt ID, null if task type is not "questions" and value is not set.
 *
 */
export declare const zTaskCurrentAttemptId: z.ZodNullable<z.ZodInt>;
/**
 * Last attempt ID, null if task type is not "questions".
 */
export declare const zTaskLastAttemptId: z.ZodNullable<z.ZodInt>;
export declare const zTaskByIdResponse: z.ZodObject<{
    id: z.ZodInt;
    type: z.ZodEnum<{
        coding: "coding";
        questions: "questions";
    }>;
    state: z.ZodEnum<{
        backlog: "backlog";
        inProgress: "inProgress";
        submitted: "submitted";
        review: "review";
        evaluated: "evaluated";
        failed: "failed";
    }>;
    score: z.ZodNullable<z.ZodNumber>;
    scoreSkillLevel: z.ZodNullable<z.ZodEnum<{
        basic: "basic";
        none: "none";
        intermediate: "intermediate";
        advanced: "advanced";
    }>>;
    isSkillLevelEnabled: z.ZodBoolean;
    isLateDaysEnabled: z.ZodBoolean;
    extraScore: z.ZodNullable<z.ZodNumber>;
    createdAt: z.ZodISODateTime;
    startedAt: z.ZodNullable<z.ZodISODateTime>;
    submitAt: z.ZodNullable<z.ZodISODateTime>;
    rejectAt: z.ZodNullable<z.ZodISODateTime>;
    evaluateAt: z.ZodNullable<z.ZodISODateTime>;
    deadline: z.ZodISODateTime;
    lateDays: z.ZodNullable<z.ZodInt>;
    exercise: z.ZodObject<{
        id: z.ZodInt;
        name: z.ZodString;
        type: z.ZodEnum<{
            coding: "coding";
            questions: "questions";
        }>;
        maxScore: z.ZodNumber;
        startDate: z.ZodISODateTime;
        deadline: z.ZodISODateTime;
        timer: z.ZodNullable<z.ZodUnknown>;
        activity: z.ZodObject<{
            id: z.ZodInt;
            name: z.ZodString;
            weight: z.ZodNumber;
            isLateDaysEnabled: z.ZodBoolean;
        }, z.core.$strip>;
        questionOrders: z.ZodNullable<z.ZodArray<z.ZodObject<{
            questionId: z.ZodInt;
            order: z.ZodInt;
            optionOrders: z.ZodArray<z.ZodObject<{
                optionId: z.ZodInt;
                order: z.ZodInt;
            }, z.core.$strip>>;
        }, z.core.$strip>>>;
        areQuestionsShuffled: z.ZodNullable<z.ZodBoolean>;
        quizId: z.ZodNullable<z.ZodInt>;
        mode: z.ZodNullable<z.ZodUnknown>;
        viewContent: z.ZodNullable<z.ZodString>;
        exerciseUrl: z.ZodNullable<z.ZodString>;
        attachments: z.ZodNullable<z.ZodArray<z.ZodObject<{
            name: z.ZodString;
            filename: z.ZodString;
            mediaType: z.ZodEnum<{
                image: "image";
                file: "file";
                video: "video";
                audio: "audio";
            }>;
            length: z.ZodInt;
            version: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>>>;
        settings: z.ZodNullable<z.ZodObject<{
            questionsPerAttempt: z.ZodNullable<z.ZodUnknown>;
            attemptsLimit: z.ZodInt;
            evaluationStrategy: z.ZodEnum<{
                last: "last";
                best: "best";
            }>;
        }, z.core.$strip>>;
    }, z.core.$strip>;
    course: z.ZodObject<{
        id: z.ZodInt;
        name: z.ZodString;
        isArchived: z.ZodBoolean;
    }, z.core.$strip>;
    theme: z.ZodObject<{
        id: z.ZodInt;
        name: z.ZodString;
    }, z.core.$strip>;
    longread: z.ZodObject<{
        id: z.ZodInt;
        name: z.ZodString;
    }, z.core.$strip>;
    student: z.ZodObject<{
        id: z.ZodUUID;
        lastName: z.ZodString;
        firstName: z.ZodString;
        middleName: z.ZodNullable<z.ZodString>;
        universityEmail: z.ZodEmail;
        timeAccount: z.ZodString;
        studyStartYear: z.ZodNullable<z.ZodInt>;
        studyLevel: z.ZodEnum<{
            none: "none";
            bachelor: "bachelor";
            master: "master";
            dpo: "dpo";
            dpoMaster: "dpoMaster";
        }>;
        lateDaysBalance: z.ZodInt;
    }, z.core.$strip>;
    reviewer: z.ZodNullable<z.ZodObject<{
        id: z.ZodUUID;
        name: z.ZodString;
        identityEmail: z.ZodEmail;
        email: z.ZodEmail;
        identityIdentifier: z.ZodUUID;
        timeAccount: z.ZodString;
        lastName: z.ZodString;
        firstName: z.ZodString;
        middleName: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>>;
    solution: z.ZodNullable<z.ZodObject<{
        type: z.ZodEnum<{
            coding: "coding";
            questions: "questions";
        }>;
        solutionUrl: z.ZodNullable<z.ZodURL>;
        answers: z.ZodNullable<z.ZodArray<z.ZodObject<{
            answer: z.ZodUnion<readonly [z.ZodString, z.ZodNumber]>;
            question: z.ZodUnion<readonly [z.ZodIntersection<z.ZodObject<{
                type: z.ZodUnion<readonly [z.ZodLiteral<"singleChoice">, z.ZodLiteral<"multipleChoice">]>;
            }, z.core.$strip>, z.ZodObject<{
                id: z.ZodInt;
                type: z.ZodEnum<{
                    singleChoice: "singleChoice";
                    multipleChoice: "multipleChoice";
                }>;
                answer: z.ZodNullable<z.ZodUnknown>;
                options: z.ZodArray<z.ZodObject<{
                    id: z.ZodInt;
                    isCorrect: z.ZodBoolean;
                    recommendation: z.ZodNullable<z.ZodString>;
                }, z.core.$strip>>;
            }, z.core.$strip>>, z.ZodIntersection<z.ZodObject<{
                type: z.ZodLiteral<"input">;
            }, z.core.$strip>, z.ZodObject<{
                id: z.ZodInt;
                type: z.ZodEnum<{
                    input: "input";
                }>;
                answer: z.ZodNullable<z.ZodObject<{
                    values: z.ZodArray<z.ZodString>;
                    value: z.ZodNullable<z.ZodUnknown>;
                    recommendation: z.ZodString;
                }, z.core.$strip>>;
                options: z.ZodNullable<z.ZodUnknown>;
            }, z.core.$strip>>, z.ZodIntersection<z.ZodObject<{
                type: z.ZodLiteral<"inputNumber">;
            }, z.core.$strip>, z.ZodObject<{
                id: z.ZodInt;
                type: z.ZodEnum<{
                    inputNumber: "inputNumber";
                }>;
                answer: z.ZodNullable<z.ZodObject<{
                    values: z.ZodArray<z.ZodNumber>;
                    value: z.ZodNullable<z.ZodUnknown>;
                    recommendation: z.ZodString;
                }, z.core.$strip>>;
                options: z.ZodNullable<z.ZodUnknown>;
            }, z.core.$strip>>]>;
        }, z.core.$strip>>>;
        attachments: z.ZodNullable<z.ZodArray<z.ZodObject<{
            name: z.ZodString;
            filename: z.ZodString;
            mediaType: z.ZodEnum<{
                image: "image";
                file: "file";
                video: "video";
                audio: "audio";
            }>;
            length: z.ZodInt;
            version: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>>>;
    }, z.core.$strip>>;
    scores: z.ZodNullable<z.ZodArray<z.ZodObject<{
        questionId: z.ZodInt;
        score: z.ZodNullable<z.ZodNumber>;
    }, z.core.$strip>>>;
    quizSessionId: z.ZodNullable<z.ZodInt>;
    evaluatedAttemptId: z.ZodNullable<z.ZodInt>;
    currentAttemptId: z.ZodNullable<z.ZodInt>;
    lastAttemptId: z.ZodNullable<z.ZodInt>;
}, z.core.$strip>;
/**
 * S3-compatible temporary presigned URL for file object to download.
 *
 */
export declare const zObjectStorageUrl: z.ZodString;
export declare const zGenerateContentDownloadLinkResponse: z.ZodObject<{
    url: z.ZodString;
}, z.core.$strip>;
/**
 * Maximum number of items to return.
 */
export declare const zLimitQuery: z.ZodDefault<z.ZodInt>;
/**
 * Number of items to skip before collecting result items.
 */
export declare const zOffsetQuery: z.ZodDefault<z.ZodInt>;
/**
 * Include only courses whose state matches any of the specified values.
 *
 */
export declare const zPublicationStateFilterQuery: z.ZodArray<z.ZodEnum<{
    published: "published";
    archived: "archived";
    draft: "draft";
}>>;
/**
 * File object path in storage specified in URL query.
 */
export declare const zFileNameQuery: z.ZodString;
/**
 * Material content revision identifier specified in URL query.
 */
export declare const zVersionQuery: z.ZodNullable<z.ZodString>;
/**
 * Numeric identifier of the course specified in URL path.
 */
export declare const zCourseIdPath: z.ZodInt;
/**
 * Numeric identifier of the course theme specified in URL path.
 */
export declare const zThemeIdPath: z.ZodInt;
/**
 * Numeric identifier of the longread item specified in URL path.
 *
 */
export declare const zLongreadIdPath: z.ZodInt;
/**
 * Numeric identifier of the task item specified in URL path.
 */
export declare const zTaskIdPath: z.ZodInt;
/**
 * Successful response with the authenticated student data.
 */
export declare const zCurrentStudentResponse2: z.ZodObject<{
    id: z.ZodUUID;
    lastName: z.ZodString;
    firstName: z.ZodString;
    middleName: z.ZodNullable<z.ZodString>;
    universityEmail: z.ZodEmail;
    timeAccount: z.ZodString;
    studyStartYear: z.ZodNullable<z.ZodInt>;
    studyLevel: z.ZodEnum<{
        none: "none";
        bachelor: "bachelor";
        master: "master";
        dpo: "dpo";
        dpoMaster: "dpoMaster";
    }>;
    lateDaysBalance: z.ZodInt;
}, z.core.$strip>;
export declare const zListStudentCoursesQuery: z.ZodObject<{
    limit: z.ZodDefault<z.ZodOptional<z.ZodInt>>;
    offset: z.ZodDefault<z.ZodOptional<z.ZodInt>>;
    state: z.ZodOptional<z.ZodArray<z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>>>;
}, z.core.$strip>;
/**
 * Successful response with a list of courses summary for the authenticated student.
 *
 */
export declare const zListStudentCoursesResponse2: z.ZodObject<{
    items: z.ZodArray<z.ZodObject<{
        id: z.ZodInt;
        name: z.ZodString;
        state: z.ZodEnum<{
            published: "published";
            archived: "archived";
            draft: "draft";
        }>;
        publishDate: z.ZodNullable<z.ZodISODateTime>;
        publishedAt: z.ZodNullable<z.ZodISODateTime>;
        settings: z.ZodObject<{
            skillLevel: z.ZodEnum<{
                none: "none";
            }>;
            isSkillLevelEnabled: z.ZodBoolean;
            syllabusUrl: z.ZodNullable<z.ZodString>;
            timeChannelUrl: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>;
        subjectId: z.ZodNullable<z.ZodInt>;
        isArchived: z.ZodBoolean;
        category: z.ZodEnum<{
            withoutCategory: "withoutCategory";
            general: "general";
            mathematics: "mathematics";
            business: "business";
            development: "development";
            stem: "stem";
            softSkills: "softSkills";
            ml: "ml";
            design: "design";
            analytics: "analytics";
            career: "career";
            management: "management";
        }>;
        categoryCover: z.ZodEnum<{
            sineWave: "sineWave";
            curvesGrid: "curvesGrid";
            ellipsesOverlap: "ellipsesOverlap";
            geometricTriangle: "geometricTriangle";
            verticalLines: "verticalLines";
            gridPlanes: "gridPlanes";
            spiralLoops: "spiralLoops";
            symmetricCircles: "symmetricCircles";
        }>;
    }, z.core.$strip>>;
    paging: z.ZodObject<{
        limit: z.ZodInt;
        offset: z.ZodInt;
        totalCount: z.ZodInt;
    }, z.core.$strip>;
}, z.core.$strip>;
export declare const zCourseSummaryByIdPath: z.ZodObject<{
    courseId: z.ZodInt;
}, z.core.$strip>;
/**
 * Successful response with course summary by its ID.
 */
export declare const zCourseSummaryByIdResponse2: z.ZodObject<{
    id: z.ZodInt;
    name: z.ZodString;
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    publishDate: z.ZodNullable<z.ZodISODateTime>;
    publishedAt: z.ZodNullable<z.ZodISODateTime>;
    settings: z.ZodObject<{
        skillLevel: z.ZodEnum<{
            none: "none";
        }>;
        isSkillLevelEnabled: z.ZodBoolean;
        syllabusUrl: z.ZodNullable<z.ZodString>;
        timeChannelUrl: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>;
    subjectId: z.ZodNullable<z.ZodInt>;
    isArchived: z.ZodBoolean;
    category: z.ZodEnum<{
        withoutCategory: "withoutCategory";
        general: "general";
        mathematics: "mathematics";
        business: "business";
        development: "development";
        stem: "stem";
        softSkills: "softSkills";
        ml: "ml";
        design: "design";
        analytics: "analytics";
        career: "career";
        management: "management";
    }>;
    categoryCover: z.ZodEnum<{
        sineWave: "sineWave";
        curvesGrid: "curvesGrid";
        ellipsesOverlap: "ellipsesOverlap";
        geometricTriangle: "geometricTriangle";
        verticalLines: "verticalLines";
        gridPlanes: "gridPlanes";
        spiralLoops: "spiralLoops";
        symmetricCircles: "symmetricCircles";
    }>;
}, z.core.$strip>;
export declare const zCourseOverviewByIdPath: z.ZodObject<{
    courseId: z.ZodInt;
}, z.core.$strip>;
/**
 * Successful response with course overview by its ID.
 */
export declare const zCourseOverviewByIdResponse2: z.ZodObject<{
    id: z.ZodInt;
    name: z.ZodString;
    isArchived: z.ZodBoolean;
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    publishDate: z.ZodNullable<z.ZodISODateTime>;
    publishedAt: z.ZodNullable<z.ZodISODateTime>;
    settings: z.ZodObject<{
        skillLevel: z.ZodEnum<{
            none: "none";
        }>;
        isSkillLevelEnabled: z.ZodBoolean;
        syllabusUrl: z.ZodNullable<z.ZodString>;
        timeChannelUrl: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>;
    themes: z.ZodArray<z.ZodObject<{
        id: z.ZodInt;
        name: z.ZodString;
        order: z.ZodInt;
        state: z.ZodEnum<{
            published: "published";
            archived: "archived";
            draft: "draft";
        }>;
        publishDate: z.ZodNullable<z.ZodISODateTime>;
        publishedAt: z.ZodNullable<z.ZodISODateTime>;
        longreads: z.ZodArray<z.ZodObject<{
            id: z.ZodInt;
            type: z.ZodEnum<{
                common: "common";
                handout: "handout";
            }>;
            name: z.ZodString;
            state: z.ZodEnum<{
                published: "published";
                archived: "archived";
                draft: "draft";
            }>;
            publishDate: z.ZodNullable<z.ZodISODateTime>;
            publishedAt: z.ZodNullable<z.ZodISODateTime>;
            exercises: z.ZodArray<z.ZodObject<{
                id: z.ZodInt;
                name: z.ZodString;
                maxScore: z.ZodNumber;
                activity: z.ZodObject<{
                    id: z.ZodInt;
                    name: z.ZodString;
                    weight: z.ZodNumber;
                }, z.core.$strip>;
                deadline: z.ZodISODateTime;
            }, z.core.$strip>>;
        }, z.core.$strip>>;
    }, z.core.$strip>>;
}, z.core.$strip>;
export declare const zCourseThemeSummaryByIdPath: z.ZodObject<{
    themeId: z.ZodInt;
}, z.core.$strip>;
/**
 * Successful response with course theme summary by its ID.
 */
export declare const zCourseThemeSummaryByIdResponse2: z.ZodObject<{
    id: z.ZodInt;
    name: z.ZodString;
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    publishDate: z.ZodNullable<z.ZodISODateTime>;
    publishedAt: z.ZodNullable<z.ZodISODateTime>;
    order: z.ZodInt;
    category: z.ZodEnum<{
        withoutCategory: "withoutCategory";
        general: "general";
        mathematics: "mathematics";
        business: "business";
        development: "development";
        stem: "stem";
        softSkills: "softSkills";
        ml: "ml";
        design: "design";
        analytics: "analytics";
        career: "career";
        management: "management";
    }>;
    categoryCover: z.ZodInt;
}, z.core.$strip>;
export declare const zLongreadSummaryByIdPath: z.ZodObject<{
    longreadId: z.ZodInt;
}, z.core.$strip>;
/**
 * Successful response with longread item summary by its ID.
 *
 */
export declare const zLongreadSummaryByIdResponse2: z.ZodObject<{
    id: z.ZodInt;
    type: z.ZodEnum<{
        common: "common";
        handout: "handout";
    }>;
    name: z.ZodString;
    order: z.ZodInt;
    state: z.ZodEnum<{
        published: "published";
        archived: "archived";
        draft: "draft";
    }>;
    publishDate: z.ZodNullable<z.ZodISODateTime>;
    publishedAt: z.ZodNullable<z.ZodISODateTime>;
}, z.core.$strip>;
export declare const zLongreadMaterialsByIdPath: z.ZodObject<{
    longreadId: z.ZodInt;
}, z.core.$strip>;
export declare const zLongreadMaterialsByIdQuery: z.ZodObject<{
    limit: z.ZodDefault<z.ZodOptional<z.ZodInt>>;
    offset: z.ZodDefault<z.ZodOptional<z.ZodInt>>;
}, z.core.$strip>;
/**
 * Successful response with longread materials by its ID.
 */
export declare const zLongreadMaterialsByIdResponse2: z.ZodObject<{
    items: z.ZodArray<z.ZodDiscriminatedUnion<[z.ZodObject<{
        state: z.ZodEnum<{
            published: "published";
            archived: "archived";
            draft: "draft";
        }>;
        viewType: z.ZodEnum<{
            image: "image";
            videoPlatform: "videoPlatform";
            file: "file";
            video: "video";
            audio: "audio";
            ngxMarkdown: "ngxMarkdown";
            exerciseCoding: "exerciseCoding";
            exerciseQuestions: "exerciseQuestions";
        }>;
        type: z.ZodEnum<{
            markdown: "markdown";
            content: "content";
            coding: "coding";
            image: "image";
            questions: "questions";
            videoPlatform: "videoPlatform";
        }>;
        id: z.ZodInt;
        order: z.ZodInt;
        viewContent: z.ZodNullable<z.ZodString>;
        publishDate: z.ZodNullable<z.ZodISODateTime>;
        publishedAt: z.ZodNullable<z.ZodISODateTime>;
        discriminator: z.ZodLiteral<"markdown">;
    }, z.core.$strip>, z.ZodObject<{
        state: z.ZodEnum<{
            published: "published";
            archived: "archived";
            draft: "draft";
        }>;
        viewType: z.ZodEnum<{
            image: "image";
            videoPlatform: "videoPlatform";
            file: "file";
            video: "video";
            audio: "audio";
            ngxMarkdown: "ngxMarkdown";
            exerciseCoding: "exerciseCoding";
            exerciseQuestions: "exerciseQuestions";
        }>;
        type: z.ZodEnum<{
            markdown: "markdown";
            content: "content";
            coding: "coding";
            image: "image";
            questions: "questions";
            videoPlatform: "videoPlatform";
        }>;
        id: z.ZodInt;
        order: z.ZodInt;
        mediaType: z.ZodEnum<{
            image: "image";
            file: "file";
            video: "video";
            audio: "audio";
        }>;
        filename: z.ZodString;
        version: z.ZodNullable<z.ZodString>;
        length: z.ZodInt;
        publishDate: z.ZodNullable<z.ZodISODateTime>;
        publishedAt: z.ZodNullable<z.ZodISODateTime>;
        content: z.ZodObject<{
            name: z.ZodString;
            filename: z.ZodString;
            mediaType: z.ZodEnum<{
                File: "File";
                Image: "Image";
                Video: "Video";
                Audio: "Audio";
            }>;
            version: z.ZodNullable<z.ZodString>;
            length: z.ZodInt;
        }, z.core.$strip>;
        discriminator: z.ZodLiteral<"file">;
    }, z.core.$strip>, z.ZodObject<{
        state: z.ZodEnum<{
            published: "published";
            archived: "archived";
            draft: "draft";
        }>;
        viewType: z.ZodEnum<{
            image: "image";
            videoPlatform: "videoPlatform";
            file: "file";
            video: "video";
            audio: "audio";
            ngxMarkdown: "ngxMarkdown";
            exerciseCoding: "exerciseCoding";
            exerciseQuestions: "exerciseQuestions";
        }>;
        type: z.ZodEnum<{
            markdown: "markdown";
            content: "content";
            coding: "coding";
            image: "image";
            questions: "questions";
            videoPlatform: "videoPlatform";
        }>;
        id: z.ZodInt;
        order: z.ZodInt;
        name: z.ZodString;
        viewContent: z.ZodNullable<z.ZodString>;
        estimation: z.ZodObject<{
            startDate: z.ZodISODateTime;
            timer: z.ZodNullable<z.ZodString>;
            maxScore: z.ZodNullable<z.ZodNumber>;
            deadline: z.ZodNullable<z.ZodISODateTime>;
            activity: z.ZodNullable<z.ZodObject<{
                id: z.ZodInt;
                name: z.ZodString;
                weight: z.ZodNumber;
                maxExercisesCount: z.ZodNumber;
                averageScoreThreshold: z.ZodNullable<z.ZodNumber>;
                isLateDaysEnabled: z.ZodBoolean;
            }, z.core.$strip>>;
        }, z.core.$strip>;
        reviewers: z.ZodArray<z.ZodUUID>;
        assignees: z.ZodArray<z.ZodUUID>;
        attachments: z.ZodArray<z.ZodObject<{
            name: z.ZodString;
            filename: z.ZodString;
            mediaType: z.ZodEnum<{
                image: "image";
                file: "file";
                video: "video";
                audio: "audio";
            }>;
            length: z.ZodInt;
            version: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>>;
        backloggedAt: z.ZodNullable<z.ZodISODateTime>;
        taskId: z.ZodInt;
        isTrackingStudents: z.ZodBoolean;
        exerciseUrl: z.ZodNullable<z.ZodString>;
        coding: z.ZodObject<{
            exerciseUrl: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>;
        discriminator: z.ZodLiteral<"coding">;
    }, z.core.$strip>, z.ZodObject<{
        state: z.ZodEnum<{
            published: "published";
            archived: "archived";
            draft: "draft";
        }>;
        viewType: z.ZodEnum<{
            image: "image";
            videoPlatform: "videoPlatform";
            file: "file";
            video: "video";
            audio: "audio";
            ngxMarkdown: "ngxMarkdown";
            exerciseCoding: "exerciseCoding";
            exerciseQuestions: "exerciseQuestions";
        }>;
        type: z.ZodEnum<{
            markdown: "markdown";
            content: "content";
            coding: "coding";
            image: "image";
            questions: "questions";
            videoPlatform: "videoPlatform";
        }>;
        id: z.ZodInt;
        order: z.ZodInt;
        imageScale: z.ZodNullable<z.ZodInt>;
        mediaType: z.ZodEnum<{
            image: "image";
            file: "file";
            video: "video";
            audio: "audio";
        }>;
        filename: z.ZodString;
        version: z.ZodNullable<z.ZodString>;
        length: z.ZodInt;
        publishDate: z.ZodNullable<z.ZodISODateTime>;
        publishedAt: z.ZodNullable<z.ZodISODateTime>;
        content: z.ZodObject<{
            name: z.ZodString;
            filename: z.ZodString;
            mediaType: z.ZodEnum<{
                File: "File";
                Image: "Image";
                Video: "Video";
                Audio: "Audio";
            }>;
            version: z.ZodNullable<z.ZodString>;
            length: z.ZodInt;
        }, z.core.$strip>;
        discriminator: z.ZodLiteral<"image">;
    }, z.core.$strip>, z.ZodObject<{
        state: z.ZodEnum<{
            published: "published";
            archived: "archived";
            draft: "draft";
        }>;
        viewType: z.ZodEnum<{
            image: "image";
            videoPlatform: "videoPlatform";
            file: "file";
            video: "video";
            audio: "audio";
            ngxMarkdown: "ngxMarkdown";
            exerciseCoding: "exerciseCoding";
            exerciseQuestions: "exerciseQuestions";
        }>;
        type: z.ZodEnum<{
            markdown: "markdown";
            content: "content";
            coding: "coding";
            image: "image";
            questions: "questions";
            videoPlatform: "videoPlatform";
        }>;
        id: z.ZodInt;
        order: z.ZodInt;
        name: z.ZodString;
        viewContent: z.ZodNullable<z.ZodString>;
        estimation: z.ZodObject<{
            startDate: z.ZodISODateTime;
            timer: z.ZodNullable<z.ZodString>;
            maxScore: z.ZodNullable<z.ZodNumber>;
            deadline: z.ZodNullable<z.ZodISODateTime>;
            activity: z.ZodNullable<z.ZodObject<{
                id: z.ZodInt;
                name: z.ZodString;
                weight: z.ZodNumber;
                maxExercisesCount: z.ZodNumber;
                averageScoreThreshold: z.ZodNullable<z.ZodNumber>;
                isLateDaysEnabled: z.ZodBoolean;
            }, z.core.$strip>>;
        }, z.core.$strip>;
        reviewers: z.ZodArray<z.ZodUUID>;
        assignees: z.ZodArray<z.ZodUUID>;
        attachments: z.ZodArray<z.ZodObject<{
            name: z.ZodString;
            filename: z.ZodString;
            mediaType: z.ZodEnum<{
                image: "image";
                file: "file";
                video: "video";
                audio: "audio";
            }>;
            length: z.ZodInt;
            version: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>>;
        backloggedAt: z.ZodNullable<z.ZodISODateTime>;
        taskId: z.ZodInt;
        isTrackingStudents: z.ZodBoolean;
        mode: z.ZodEnum<{
            atMoment: "atMoment";
            byDeadline: "byDeadline";
        }>;
        areQuestionsShuffled: z.ZodBoolean;
        settings: z.ZodObject<{
            questionsPerAttempt: z.ZodNullable<z.ZodUnknown>;
            attemptsLimit: z.ZodInt;
            evaluationStrategy: z.ZodEnum<{
                last: "last";
                best: "best";
            }>;
        }, z.core.$strip>;
        quizId: z.ZodInt;
        questions: z.ZodArray<z.ZodDiscriminatedUnion<[z.ZodObject<{
            id: z.ZodInt;
            order: z.ZodInt;
            content: z.ZodString;
            score: z.ZodNumber;
            attachments: z.ZodArray<z.ZodObject<{
                name: z.ZodString;
                filename: z.ZodString;
                mediaType: z.ZodEnum<{
                    image: "image";
                    file: "file";
                    video: "video";
                    audio: "audio";
                }>;
                length: z.ZodInt;
                version: z.ZodNullable<z.ZodString>;
            }, z.core.$strip>>;
            correctAnswer: z.ZodNullable<z.ZodDiscriminatedUnion<[z.ZodObject<{
                variants: z.ZodArray<z.ZodString>;
                type: z.ZodLiteral<"inputStringCorrectAnswer">;
            }, z.core.$strip>, z.ZodObject<{
                variants: z.ZodArray<z.ZodNumber>;
                showPrecisionHint: z.ZodBoolean;
                autoEvaluationPrecision: z.ZodOptional<z.ZodNullable<z.ZodString>>;
                precision: z.ZodNullable<z.ZodInt>;
                type: z.ZodLiteral<"inputNumberCorrectAnswer">;
            }, z.core.$strip>], "type">>;
            autoEvaluation: z.ZodBoolean;
            recommendation: z.ZodNullable<z.ZodString>;
            input: z.ZodObject<{
                correctAnswer: z.ZodNullable<z.ZodDiscriminatedUnion<[z.ZodObject<{
                    variants: z.ZodArray<z.ZodString>;
                    type: z.ZodLiteral<"inputStringCorrectAnswer">;
                }, z.core.$strip>, z.ZodObject<{
                    variants: z.ZodArray<z.ZodNumber>;
                    showPrecisionHint: z.ZodBoolean;
                    autoEvaluationPrecision: z.ZodOptional<z.ZodNullable<z.ZodString>>;
                    precision: z.ZodNullable<z.ZodInt>;
                    type: z.ZodLiteral<"inputNumberCorrectAnswer">;
                }, z.core.$strip>], "type">>;
                autoEvaluation: z.ZodBoolean;
                recommendation: z.ZodNullable<z.ZodString>;
            }, z.core.$strip>;
            type: z.ZodLiteral<"input">;
        }, z.core.$strip>, z.ZodObject<{
            id: z.ZodInt;
            order: z.ZodInt;
            content: z.ZodString;
            score: z.ZodNumber;
            attachments: z.ZodArray<z.ZodObject<{
                name: z.ZodString;
                filename: z.ZodString;
                mediaType: z.ZodEnum<{
                    image: "image";
                    file: "file";
                    video: "video";
                    audio: "audio";
                }>;
                length: z.ZodInt;
                version: z.ZodNullable<z.ZodString>;
            }, z.core.$strip>>;
            options: z.ZodArray<z.ZodObject<{
                id: z.ZodInt;
                value: z.ZodString;
                order: z.ZodInt;
                isCorrect: z.ZodBoolean;
                recommendation: z.ZodNullable<z.ZodString>;
            }, z.core.$strip>>;
            areOptionsShuffled: z.ZodBoolean;
            singleChoice: z.ZodObject<{
                options: z.ZodArray<z.ZodObject<{
                    id: z.ZodInt;
                    value: z.ZodString;
                    order: z.ZodInt;
                    isCorrect: z.ZodBoolean;
                    recommendation: z.ZodNullable<z.ZodString>;
                }, z.core.$strip>>;
            }, z.core.$strip>;
            type: z.ZodLiteral<"singleChoice">;
        }, z.core.$strip>, z.ZodObject<{
            id: z.ZodInt;
            order: z.ZodInt;
            content: z.ZodString;
            score: z.ZodNumber;
            attachments: z.ZodArray<z.ZodObject<{
                name: z.ZodString;
                filename: z.ZodString;
                mediaType: z.ZodEnum<{
                    image: "image";
                    file: "file";
                    video: "video";
                    audio: "audio";
                }>;
                length: z.ZodInt;
                version: z.ZodNullable<z.ZodString>;
            }, z.core.$strip>>;
            options: z.ZodArray<z.ZodObject<{
                id: z.ZodInt;
                value: z.ZodString;
                order: z.ZodInt;
                isCorrect: z.ZodBoolean;
                recommendation: z.ZodNullable<z.ZodString>;
            }, z.core.$strip>>;
            areOptionsShuffled: z.ZodBoolean;
            multipleChoice: z.ZodObject<{
                options: z.ZodArray<z.ZodObject<{
                    id: z.ZodInt;
                    value: z.ZodString;
                    order: z.ZodInt;
                    isCorrect: z.ZodBoolean;
                    recommendation: z.ZodNullable<z.ZodString>;
                }, z.core.$strip>>;
            }, z.core.$strip>;
            type: z.ZodLiteral<"multipleChoice">;
        }, z.core.$strip>], "type">>;
        discriminator: z.ZodLiteral<"questions">;
    }, z.core.$strip>, z.ZodObject<{
        state: z.ZodEnum<{
            published: "published";
            archived: "archived";
            draft: "draft";
        }>;
        viewType: z.ZodEnum<{
            image: "image";
            videoPlatform: "videoPlatform";
            file: "file";
            video: "video";
            audio: "audio";
            ngxMarkdown: "ngxMarkdown";
            exerciseCoding: "exerciseCoding";
            exerciseQuestions: "exerciseQuestions";
        }>;
        type: z.ZodEnum<{
            markdown: "markdown";
            content: "content";
            coding: "coding";
            image: "image";
            questions: "questions";
            videoPlatform: "videoPlatform";
        }>;
        id: z.ZodInt;
        order: z.ZodInt;
        name: z.ZodString;
        description: z.ZodString;
        videoId: z.ZodUUID;
        timecodes: z.ZodArray<z.ZodRecord<z.ZodString, z.ZodUnknown>>;
        publishDate: z.ZodNullable<z.ZodISODateTime>;
        videoState: z.ZodEnum<{
            error: "error";
            unspecified: "unspecified";
            empty: "empty";
            uploaded: "uploaded";
            transcoding: "transcoding";
            viewable: "viewable";
            ready: "ready";
            partiallyReady: "partiallyReady";
        }>;
        url: z.ZodURL;
        discriminator: z.ZodLiteral<"videoPlatform">;
    }, z.core.$strip>, z.ZodObject<{
        state: z.ZodEnum<{
            published: "published";
            archived: "archived";
            draft: "draft";
        }>;
        viewType: z.ZodEnum<{
            image: "image";
            videoPlatform: "videoPlatform";
            file: "file";
            video: "video";
            audio: "audio";
            ngxMarkdown: "ngxMarkdown";
            exerciseCoding: "exerciseCoding";
            exerciseQuestions: "exerciseQuestions";
        }>;
        type: z.ZodEnum<{
            markdown: "markdown";
            content: "content";
            coding: "coding";
            image: "image";
            questions: "questions";
            videoPlatform: "videoPlatform";
        }>;
        id: z.ZodInt;
        order: z.ZodInt;
        mediaType: z.ZodEnum<{
            image: "image";
            file: "file";
            video: "video";
            audio: "audio";
        }>;
        filename: z.ZodString;
        version: z.ZodNullable<z.ZodString>;
        length: z.ZodInt;
        publishDate: z.ZodNullable<z.ZodISODateTime>;
        publishedAt: z.ZodNullable<z.ZodISODateTime>;
        content: z.ZodObject<{
            name: z.ZodString;
            filename: z.ZodString;
            mediaType: z.ZodEnum<{
                File: "File";
                Image: "Image";
                Video: "Video";
                Audio: "Audio";
            }>;
            version: z.ZodNullable<z.ZodString>;
            length: z.ZodInt;
        }, z.core.$strip>;
        discriminator: z.ZodLiteral<"video">;
    }, z.core.$strip>, z.ZodObject<{
        state: z.ZodEnum<{
            published: "published";
            archived: "archived";
            draft: "draft";
        }>;
        viewType: z.ZodEnum<{
            image: "image";
            videoPlatform: "videoPlatform";
            file: "file";
            video: "video";
            audio: "audio";
            ngxMarkdown: "ngxMarkdown";
            exerciseCoding: "exerciseCoding";
            exerciseQuestions: "exerciseQuestions";
        }>;
        type: z.ZodEnum<{
            markdown: "markdown";
            content: "content";
            coding: "coding";
            image: "image";
            questions: "questions";
            videoPlatform: "videoPlatform";
        }>;
        id: z.ZodInt;
        order: z.ZodInt;
        mediaType: z.ZodEnum<{
            image: "image";
            file: "file";
            video: "video";
            audio: "audio";
        }>;
        filename: z.ZodString;
        version: z.ZodNullable<z.ZodString>;
        length: z.ZodInt;
        publishDate: z.ZodNullable<z.ZodISODateTime>;
        publishedAt: z.ZodNullable<z.ZodISODateTime>;
        content: z.ZodObject<{
            name: z.ZodString;
            filename: z.ZodString;
            mediaType: z.ZodEnum<{
                File: "File";
                Image: "Image";
                Video: "Video";
                Audio: "Audio";
            }>;
            version: z.ZodNullable<z.ZodString>;
            length: z.ZodInt;
        }, z.core.$strip>;
        discriminator: z.ZodLiteral<"audio">;
    }, z.core.$strip>], "discriminator">>;
    paging: z.ZodObject<{
        limit: z.ZodInt;
        offset: z.ZodInt;
        totalCount: z.ZodInt;
    }, z.core.$strip>;
}, z.core.$strip>;
export declare const zTaskByIdPath: z.ZodObject<{
    taskId: z.ZodInt;
}, z.core.$strip>;
/**
 * Successful response with task by its ID.
 */
export declare const zTaskByIdResponse2: z.ZodObject<{
    id: z.ZodInt;
    type: z.ZodEnum<{
        coding: "coding";
        questions: "questions";
    }>;
    state: z.ZodEnum<{
        backlog: "backlog";
        inProgress: "inProgress";
        submitted: "submitted";
        review: "review";
        evaluated: "evaluated";
        failed: "failed";
    }>;
    score: z.ZodNullable<z.ZodNumber>;
    scoreSkillLevel: z.ZodNullable<z.ZodEnum<{
        basic: "basic";
        none: "none";
        intermediate: "intermediate";
        advanced: "advanced";
    }>>;
    isSkillLevelEnabled: z.ZodBoolean;
    isLateDaysEnabled: z.ZodBoolean;
    extraScore: z.ZodNullable<z.ZodNumber>;
    createdAt: z.ZodISODateTime;
    startedAt: z.ZodNullable<z.ZodISODateTime>;
    submitAt: z.ZodNullable<z.ZodISODateTime>;
    rejectAt: z.ZodNullable<z.ZodISODateTime>;
    evaluateAt: z.ZodNullable<z.ZodISODateTime>;
    deadline: z.ZodISODateTime;
    lateDays: z.ZodNullable<z.ZodInt>;
    exercise: z.ZodObject<{
        id: z.ZodInt;
        name: z.ZodString;
        type: z.ZodEnum<{
            coding: "coding";
            questions: "questions";
        }>;
        maxScore: z.ZodNumber;
        startDate: z.ZodISODateTime;
        deadline: z.ZodISODateTime;
        timer: z.ZodNullable<z.ZodUnknown>;
        activity: z.ZodObject<{
            id: z.ZodInt;
            name: z.ZodString;
            weight: z.ZodNumber;
            isLateDaysEnabled: z.ZodBoolean;
        }, z.core.$strip>;
        questionOrders: z.ZodNullable<z.ZodArray<z.ZodObject<{
            questionId: z.ZodInt;
            order: z.ZodInt;
            optionOrders: z.ZodArray<z.ZodObject<{
                optionId: z.ZodInt;
                order: z.ZodInt;
            }, z.core.$strip>>;
        }, z.core.$strip>>>;
        areQuestionsShuffled: z.ZodNullable<z.ZodBoolean>;
        quizId: z.ZodNullable<z.ZodInt>;
        mode: z.ZodNullable<z.ZodUnknown>;
        viewContent: z.ZodNullable<z.ZodString>;
        exerciseUrl: z.ZodNullable<z.ZodString>;
        attachments: z.ZodNullable<z.ZodArray<z.ZodObject<{
            name: z.ZodString;
            filename: z.ZodString;
            mediaType: z.ZodEnum<{
                image: "image";
                file: "file";
                video: "video";
                audio: "audio";
            }>;
            length: z.ZodInt;
            version: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>>>;
        settings: z.ZodNullable<z.ZodObject<{
            questionsPerAttempt: z.ZodNullable<z.ZodUnknown>;
            attemptsLimit: z.ZodInt;
            evaluationStrategy: z.ZodEnum<{
                last: "last";
                best: "best";
            }>;
        }, z.core.$strip>>;
    }, z.core.$strip>;
    course: z.ZodObject<{
        id: z.ZodInt;
        name: z.ZodString;
        isArchived: z.ZodBoolean;
    }, z.core.$strip>;
    theme: z.ZodObject<{
        id: z.ZodInt;
        name: z.ZodString;
    }, z.core.$strip>;
    longread: z.ZodObject<{
        id: z.ZodInt;
        name: z.ZodString;
    }, z.core.$strip>;
    student: z.ZodObject<{
        id: z.ZodUUID;
        lastName: z.ZodString;
        firstName: z.ZodString;
        middleName: z.ZodNullable<z.ZodString>;
        universityEmail: z.ZodEmail;
        timeAccount: z.ZodString;
        studyStartYear: z.ZodNullable<z.ZodInt>;
        studyLevel: z.ZodEnum<{
            none: "none";
            bachelor: "bachelor";
            master: "master";
            dpo: "dpo";
            dpoMaster: "dpoMaster";
        }>;
        lateDaysBalance: z.ZodInt;
    }, z.core.$strip>;
    reviewer: z.ZodNullable<z.ZodObject<{
        id: z.ZodUUID;
        name: z.ZodString;
        identityEmail: z.ZodEmail;
        email: z.ZodEmail;
        identityIdentifier: z.ZodUUID;
        timeAccount: z.ZodString;
        lastName: z.ZodString;
        firstName: z.ZodString;
        middleName: z.ZodNullable<z.ZodString>;
    }, z.core.$strip>>;
    solution: z.ZodNullable<z.ZodObject<{
        type: z.ZodEnum<{
            coding: "coding";
            questions: "questions";
        }>;
        solutionUrl: z.ZodNullable<z.ZodURL>;
        answers: z.ZodNullable<z.ZodArray<z.ZodObject<{
            answer: z.ZodUnion<readonly [z.ZodString, z.ZodNumber]>;
            question: z.ZodUnion<readonly [z.ZodIntersection<z.ZodObject<{
                type: z.ZodUnion<readonly [z.ZodLiteral<"singleChoice">, z.ZodLiteral<"multipleChoice">]>;
            }, z.core.$strip>, z.ZodObject<{
                id: z.ZodInt;
                type: z.ZodEnum<{
                    singleChoice: "singleChoice";
                    multipleChoice: "multipleChoice";
                }>;
                answer: z.ZodNullable<z.ZodUnknown>;
                options: z.ZodArray<z.ZodObject<{
                    id: z.ZodInt;
                    isCorrect: z.ZodBoolean;
                    recommendation: z.ZodNullable<z.ZodString>;
                }, z.core.$strip>>;
            }, z.core.$strip>>, z.ZodIntersection<z.ZodObject<{
                type: z.ZodLiteral<"input">;
            }, z.core.$strip>, z.ZodObject<{
                id: z.ZodInt;
                type: z.ZodEnum<{
                    input: "input";
                }>;
                answer: z.ZodNullable<z.ZodObject<{
                    values: z.ZodArray<z.ZodString>;
                    value: z.ZodNullable<z.ZodUnknown>;
                    recommendation: z.ZodString;
                }, z.core.$strip>>;
                options: z.ZodNullable<z.ZodUnknown>;
            }, z.core.$strip>>, z.ZodIntersection<z.ZodObject<{
                type: z.ZodLiteral<"inputNumber">;
            }, z.core.$strip>, z.ZodObject<{
                id: z.ZodInt;
                type: z.ZodEnum<{
                    inputNumber: "inputNumber";
                }>;
                answer: z.ZodNullable<z.ZodObject<{
                    values: z.ZodArray<z.ZodNumber>;
                    value: z.ZodNullable<z.ZodUnknown>;
                    recommendation: z.ZodString;
                }, z.core.$strip>>;
                options: z.ZodNullable<z.ZodUnknown>;
            }, z.core.$strip>>]>;
        }, z.core.$strip>>>;
        attachments: z.ZodNullable<z.ZodArray<z.ZodObject<{
            name: z.ZodString;
            filename: z.ZodString;
            mediaType: z.ZodEnum<{
                image: "image";
                file: "file";
                video: "video";
                audio: "audio";
            }>;
            length: z.ZodInt;
            version: z.ZodNullable<z.ZodString>;
        }, z.core.$strip>>>;
    }, z.core.$strip>>;
    scores: z.ZodNullable<z.ZodArray<z.ZodObject<{
        questionId: z.ZodInt;
        score: z.ZodNullable<z.ZodNumber>;
    }, z.core.$strip>>>;
    quizSessionId: z.ZodNullable<z.ZodInt>;
    evaluatedAttemptId: z.ZodNullable<z.ZodInt>;
    currentAttemptId: z.ZodNullable<z.ZodInt>;
    lastAttemptId: z.ZodNullable<z.ZodInt>;
}, z.core.$strip>;
export declare const zGenerateContentDownloadLinkQuery: z.ZodObject<{
    filename: z.ZodString;
    version: z.ZodOptional<z.ZodNullable<z.ZodString>>;
}, z.core.$strip>;
/**
 * Successful response generated content download link.
 */
export declare const zGenerateContentDownloadLinkResponse2: z.ZodObject<{
    url: z.ZodString;
}, z.core.$strip>;
//# sourceMappingURL=zod.gen.d.ts.map