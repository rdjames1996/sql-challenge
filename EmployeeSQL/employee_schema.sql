CREATE TABLE "titles" (
    "title_id" varchar(30) PRIMARY KEY NOT NULL,
    "title" varchar(30) NOT NULL
);

CREATE TABLE "departments" (
    "dept_no" varchar(30) PRIMARY KEY NOT NULL,
    "dept_name" varchar(30) NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar(30) NOT NULL,
    "emp_no" int NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        emp_no,dept_no
     )
);

CREATE TABLE "employees" (
    "emp_no" int PRIMARY KEY NOT NULL,
    "emp_title_id" varchar(30) NOT NULL,
    "birth_date" date NOT NULL,
    "first_name" varchar(30) NOT NULL,
    "last_name" varchar(30) NOT NULL,
    "sex" varchar(30) NOT NULL,
    "hire_date" date NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" int NOT NULL,
    "dept_no" varchar(30) NOT NULL,
	CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        emp_no,dept_no
		)
);

CREATE TABLE "salaries" (
    "emp_no" int PRIMARY KEY NOT NULL,
    "salary" int NOT NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");