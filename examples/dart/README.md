# Dart Open CU Services SDK Examples

Examples use environment variables for configuration. Set them before running.

Setting environment variables in macOS / Linux:

```bash
export CU_LMS_BFF_COOKIE="change-to-bff-cookie-from-lms"
```

Setting environment variables in Windows:

```powershell
setx CU_LMS_BFF_COOKIE "change-to-bff-cookie-from-lms"
```

## CU LMS API (`lmsapi`) Examples

- [`current_student/main.dart`](./current_student/main.dart) - fetching the
  current student
- [`list_student_courses_full/main.dart`](./list_student_courses_full/main.dart)
  \- fetching the courses in which student is enrolled, with full error handling
