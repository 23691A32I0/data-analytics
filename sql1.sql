create database dataanalytics;
show databaseS;
use dataanalytics;
show tables;
create table siva(name varchar(30),age int,studentid int, marks float(4));
insert into siva values('siva',22,99);
insert into siva values('prabhas',21,12,99),('ram',20,13,98);
select * from siva;
update siva set age=22 where name='siva';
set sql_safe_updates=0;
delete from siva where name='ram';

create table movies(movie_id int primary key auto_increment,name varchar(25),release_year int,language varchar(20));

insert into movies(name, release_year, language) values('rrr',2024,'telugu'),('bahubali',2015,'telugu'),('jawan',2025,'hindi');
drop table boxoffice;
select * from movies;

create table boxoffice(boxoffice_id int primary key auto_increment,movie_id int,budget bigint,foreign key(movie_id) references movies(movie_id) on delete cascade);

INSERT INTO boxoffice (movie_id, budget) VALUES(1, 1200000000),(2, 1800000000),(3, 900000000);
select * from boxoffice order by movie_id asc;
select m.name,b.budget from movies m inner join boxoffice b where m.movie_id=b.movie_id;
select m.name,b.budget from movies m left join boxoffice b on m.movie_id=b.movie_id;
describe table movies;
delete from movies where movie_id in (4,5,6);
INSERT INTO boxoffice (movie_id, budget) VALUES(1, 1200000000);
update boxoffice set boxoffice_id=1 where movie_id =1;
select * from boxoffice;
drop table movies;


