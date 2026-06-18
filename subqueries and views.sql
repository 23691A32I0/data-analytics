create database da;
use da;

create table salary(
custname varchar(20),
salary int
);

insert into salary values ('sahil',45000),('rajesh',25000),('gitendra',15000),('siva',55000),('ram',50000);
insert into salary values ('rahul',45000);
create table dept(
dept varchar(20),
empid int,
custname varchar(20));

insert into dept values ('csd',1,'sahil'),('mech',2,'rajesh'),('ece',3,'gitendra'),('csd',4,'siva'),('civil',5,'ram'),('ai&ml',6,'janu');
select * from dept;


select custname from salary where salary>(select avg(salary) from salary);
select custname,salary from salary where salary>(select salary from salary where custname='sahil');
select max(salary) as secondhighestsalary from salary where salary<(select max(salary) from salary);
select  distinct salary from salary order by salary desc limit 1 offset 2;


create view  empsalary
as select s.custname,d.dept,s.salary
from salary s 
join dept d 
where s.custname=d.custname 
and s.salary>40000;

create view deptavgsalary 
as select avg(s.salary),dept 
from salary s 
join dept d 
where  s.custname=d.custname 
group by dept ;

create view avgsalary 
as select custname 
from salary 
where salary>(select avg(salary) from salary) ;

select * from empsalary;
select * from deptavgsalary;
select * from avgsalary;  
