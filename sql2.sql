show databaseS;
use dataanalytics;
show tables;
create table employee(
first_name varchar(20),
last_name varchar(20),
id int not null primary key,
age int,
city varchar(20),
state varchar(20)
);
desc employee;
insert into employee values('naruto','uzumaki',1,18,'leaf village','japan'),
('hinata','uzumaki',2,17,'leaf village','japan'),
('sasuke','uchiha',3,20,'leaf village','japan'),
('itachi','uchiha',4,30,'leaf village','japan'),
('rock','lee',5,19,'rock village','japan');
select * from employee;
select first_name as firstname,last_name as lastname from employee;
alter table employee rename column state to country;
select * from employee where city like"r%";
select * from employee where last_name like"%k%";
select * from employee where age>=20;
select count(*) from employee where last_name='uzumaki';
select * from employee where age in (18,17);
select * from employee where last_name like "uzu____";


create table emp2(
first_name varchar(20),
last_name varchar(20),
designation varchar(30),
age int,
salary float);
insert into emp2 values('venkat','chetan','manager',25,100000),
('naruto','uzumaki','bug detector',20,75000),
('sung','jingho','system developer',28,80000),
('loid','forger','team leader',30,85000);
select * from emp2;
insert into emp2 values('hinata','huga','cyber security',20,75000),
('itachi','uchiha','secretary',30,55000),
('senjumaru','retsau','secretary',27,80000);
set sql_safe_updates=0;
update emp2 set last_name='uzumaki' where first_name='hinata';
update emp2 set age=age+1 where first_name='loid';
update emp2 set designation='administrative assistant' where designation='secretary';
update emp2 set salary=salary+5000 where salary<=75000;
update emp2 set salary=salary+8000 where salary>75000;
update emp2 set designation='developer' where designation in ('bug detector','system developer');
delete from emp2 where first_name='senjumaru';
CALL emp2('Venkat','chandan','asst.Manager',24,50000);