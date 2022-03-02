---------USE ONLY IF STARTING OVER---------
DROP TABLE if exists "departments" CASCADE;
DROP TABLE if exists "departmentemployee" CASCADE;
DROP TABLE if exists "departmentmanager" CASCADE;
DROP TABLE if exists "employees" CASCADE;
DROP TABLE if exists "salaries" CASCADE;
DROP TABLE if exists "titles" CASCADE;
-------------------------------------------

-- Assume no employee can work in more than one department
CREATE TABLE "departmentemployee" (
    "emp_id" int   NOT NULL,
    "dept_id" varchar(255)   NOT NULL,
    CONSTRAINT "pk_departmentemployee" PRIMARY KEY (
        "emp_id","dept_id"
     )
);

-- Assume no manager can manage more than one department
CREATE TABLE "departmentmanager" (
    "dept_id" varchar(255)   NOT NULL,
    "emp_id" int   NOT NULL,
    CONSTRAINT "pk_departmentmanager" PRIMARY KEY (
        "dept_id","emp_id"
     )
);

--Why does this one have to be third? Or is the "alter table" the problem?
CREATE TABLE "departments" (
    "dept_id" varchar(255)   NOT NULL,
    "dept_name" varchar(255)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_id"
     )
);

CREATE TABLE "employees" (
    "emp_id" int   NOT NULL,
    "title_id" varchar(255)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(255)   NOT NULL,
    "last_name" varchar(255)   NOT NULL,
    "sex" varchar(255)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_id"
     )
);

CREATE TABLE "salaries" (
    "emp_id" int   NOT NULL,
    "salary" money   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_id"
     )
);

CREATE TABLE "titles" (
    "title_id" varchar(255)   NOT NULL,
    "title" varchar(255)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "departmentemployee" ADD CONSTRAINT "fk_departmentemployee_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employees" ("emp_id");

ALTER TABLE "departmentemployee" ADD CONSTRAINT "fk_departmentemployee_dept_id" FOREIGN KEY("dept_id")
REFERENCES "departments" ("dept_id");

ALTER TABLE "departmentmanager" ADD CONSTRAINT "fk_departmentmanager_dept_id" FOREIGN KEY("dept_id")
REFERENCES "departments" ("dept_id");

ALTER TABLE "departmentmanager" ADD CONSTRAINT "fk_departmentmanager_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employees" ("emp_id");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_title_id" FOREIGN KEY("title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employees" ("emp_id");

--Confirm the tables existence
select * from "departmentemployee";
select * from "departmentmanager";
select * from "departments";
select * from "employees";
select * from "salaries";
select * from "titles";