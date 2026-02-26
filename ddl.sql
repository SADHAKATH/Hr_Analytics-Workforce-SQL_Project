/* DATA DEFINITION LANGUAGE(DDL):

1.CREATE ----> database,table
2.ALTER -----> table modification
3.DROP -----> delete database, table. alter.alter

*/

CREATE DATABASE DB;           ---- create a database ----

SHOW DATABASES;              ---- show database ----

USE DB;                      ---- use database ---- 

create table students(
id int,
name varchar(50),
courseid int); ---- create a table students ----

show tables;

describe students;

select * from students;

describe students;

alter table students add column course_name varchar(50);   ---- alter + add ----

alter table students modify column name char(10);    ---- alter + modify change datatype ---

alter table students rename column name to student_name;   ---- alter + rename change the column name ----

alter table students drop column course_name;   ---- alter + drop ----

rename table students to students_data;   ---- change the table name ----

drop table student_data;    ---- drop a table ----

drop database db;    ---- drop a database ----

create database data;
use data;
drop database data;
