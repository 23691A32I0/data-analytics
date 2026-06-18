use dataanalytics;
create table cust(
cust_id int not null primary key,
cust_name varchar(20),
city varchar(20),
state varchar(20)
);
insert into cust values(1,'ravi','hyd','tg'),
(2,'varma','vizag','ap'),
(3,'raja','chennai','tn'),
(4,'ram','lucknow','up'),
(5,'mohan','bhopal','mp'),
(6,'lal','meghalaya','hp');
select * from cust;

create table ord(
ord_id int not null primary key,
ord_pieces int,
ord_date varchar(50),
cu_id int,foreign key(cu_id) references cust(cust_id)
);
desc ord;
insert into ord values(1001,20,sysdate(),2),
(1011,10,sysdate(),4),
(1521,5,sysdate(),5),
(1769,2,sysdate(),1),
(1997,9,sysdate(),3),
(1093,15,sysdate(),6);
select * from ord;

SELECT c.cust_id,c.cust_name,o.ord_id,o.ord_pieces FROM cust c LEFT JOIN ord o ON c.cust_id = o.cu_id;
SELECT o.cu_id,c.cust_name,o.ord_id,o.ord_pieces FROM cust c RIGHT JOIN ord o ON c.cust_id = o.cu_id;
SELECT c.cust_id,c.cust_name,o.ord_id,o.ord_pieces FROM cust c INNER JOIN ord o ON c.cust_id = o.cu_id;
SELECT c.cust_id,c.cust_name,o.ord_id,o.ord_pieces FROM cust c LEFT JOIN ord o ON c.cust_id = o.cu_id union SELECT o.cu_id,c.cust_name,o.ord_id,o.ord_pieces FROM cust c RIGHT JOIN ord o ON c.cust_id = o.cu_id;
SELECT c.cust_id,c.cust_name,o.ord_id,o.ord_pieces FROM cust c LEFT OUTER JOIN ord o ON c.cust_id = o.cu_id;
SELECT o.cu_id,o.ord_id,o.ord_pieces,c.cust_name FROM ord o RIGHT OUTER JOIN cust c ON c.cust_id = o.cu_id;

SELECT * FROM TELECOM;
select gender,count(gender) from telecom group by gender;
select gender,paymentmethod,count(paymentmethod) from telecom group by gender, paymentmethod;
select gender,internetservice,count(internetservice)from telecom group by gender,internetservice;
select gender,churn,count(churn) from telecom group by gender,churn;
select round(max(totalcharges),4) from telecom;
select round(avg(totalcharges),4) from telecom;
select round(min(totalcharges),4) from telecom;

select * from emp2;
select concat(first_name,last_name) from emp2;
select trim(concat(first_name,last_name)) from emp2;
select substr(designation,1,8) from emp2;
select concat(upper(first_name),lower(last_name)) from emp2;
select length(first_name) from emp2;
select first_name,mid(first_name,1,4) from emp2;