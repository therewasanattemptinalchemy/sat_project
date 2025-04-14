CREATE DATABASE SAT;

CREATE TABLE schools
(
	dbn VARCHAR(50),
	school_name VARCHAR(200),
	no_of_tests INTEGER,
	cr_avg INTEGER,
	math_avg INTEGER,
	writing_avg INTEGER
);

---1. Show all the data---
SELECT * FROM schools;

---2.Count the no. of schools that didn't report---
SELECT COUNT(*)
FROM schools
WHERE no_of_test = 0;

---3.Which schools are the best in each component---
SELECT dbn, school_name, no_of_tests, cr_avg  AS cr_math_writing FROM schools
WHERE cr_avg = (SELECT MAX(cr_avg) FROM schools)

UNION

SELECT dbn, school_name, no_of_tests, math_avg FROM schools
WHERE math_avg = (SELECT MAX(math_avg) FROM schools)

UNION

SELECT dbn, school_name, no_of_tests, writing_avg FROM schools
WHERE writing_avg = (SELECT MAX(writing_avg) FROM schools)

---4.Top 10 schools by average total SAT scores.---
SELECT cr_avg+math_avg+writing_avg AS total_marks, school_name, dbn FROM schools
ORDER BY total_marks ASC
LIMIT 10;
