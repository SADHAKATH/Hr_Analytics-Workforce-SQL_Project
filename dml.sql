/* DATA MANUPULATION LANGUAGE(DML):
1.INSERT ---->
2.UPDATE ---->
3.DELETE ---->
 
*/

create database new;         ---- create a database ----
use new;       				 ---- use database ----

create table student(
id int primary key,
name varchar(50),
department int
);										---- create a table ----

select * from student;


insert into student(id,name,department)
values(1,"anand",101),(2,"babu",102),(3,"charu",103);  			---- insert table + values ----

update student set department=103 where id=1;   				---- update a table data ----

set sql_safe_update=0;    										#-----> disable

set sql_safe_update=1;    										#------> enable

delete from student where id=1;									---- delete from table values ----




