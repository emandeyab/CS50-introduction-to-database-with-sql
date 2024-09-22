CREATE INDEX "enrollments_by_student_id" ON "courses" ("student_id");

CREATE INDEX "enrollments_course_id" ON "enrollments" ("course_id");

CREATE INDEX "courses_dept_number_semester" ON "courses" ("department", "number", "semester");

CREATE INDEX "satisfies_course_req" ON "satisfies" ("course_id", "requirement_id");

CREATE INDEX "courses_title_semester" ON "courses"("title", "semester");
