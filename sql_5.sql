use da;
create table players(
player_id int,
player_name varchar(40),
country varchar(30),
goals int
);
select * from players;
insert into players values(1,'sunilchethry','india',800),
(2,'Cristiano Ronaldo','portugal',900),
(3,'messi','argentina',840),
(4,'pele','brazil',762),
(5,'romario','brazil',756);

#1
delimiter &&
create procedure top_players()
begin
select player_name,country,goals from players where goals>=800;
end&&
delimiter ;
call top_players();

#2
delimiter &&
create procedure top_players_sorted_by_goal(in num int)
begin
select player_name,country,goals from players order by goals limit num;
end&&
delimiter ;
call top_players_sorted_by_goal(4);

#3
set sql_safe_updates=0;
delimiter &&
create procedure update_goals_for_player(in num int,in player varchar(40))
begin
update players set goals=num where player_name=player;
end&&
delimiter ;
call update_goals_for_player(850,'sunilchethry');

#4
delimiter &&
create procedure players_count_on_country(in var varchar(40),out total_player int)
begin
select count(*) from players where country=var into total_player;
end&&
delimiter ;
call players_count_on_country('brazil',@total_player);
select @total_player;

use dataanalytics;
select * from telecom;

select a.internetservice,a.*,avg(a.monthlycharges)
over(partition by a.internetservice) as
avg_charges from telecom a;

select a.paymentmethod,a.*,avg(a.totalcharges)
over(partition by a.paymentmethod) as
avg_paymentmethods from telecom a;
select a.contract,a.*,avg(a.tenure)
over(partition by a.contract)as
avg_contract from telecom a;


select row_number() over(order by internetservice)
as rownum, internetservice from
telecom order by internetservice;

select row_number() over(order by paymentmethod)
as row_num ,paymentmethod from
telecom order by paymentmethod;

select internetservice,
rank() over (order by paymentmethod)as tt
from telecom;

select *,first_value(customerid)over
(order by totalcharges desc)as
highest_totalcharges from telecom;






DELIMITER //

CREATE TRIGGER before_player_insert
BEFORE INSERT
ON players
FOR EACH ROW
BEGIN
    IF NEW.goals < 0 THEN
        SET NEW.goals = 0;
    END IF;
END //

DELIMITER ;
INSERT INTO players VALUES(6,'Ronaldo','Portugal',-5);
select * from players;

CREATE TABLE player_log(
    message VARCHAR(100)
);

DELIMITER //

CREATE TRIGGER after_player_insert
AFTER INSERT
ON players
FOR EACH ROW
BEGIN
    INSERT INTO player_log
    VALUES(CONCAT('Added player: ',NEW.player_name));
END //

DELIMITER ;

INSERT INTO players VALUES(3,'Neymar','Brazil',450);
select * from player_log;


DELIMITER //

CREATE TRIGGER check_goal_update
BEFORE UPDATE
ON players
FOR EACH ROW
BEGIN
    IF NEW.goals < OLD.goals THEN
        SET NEW.goals = OLD.goals;
    END IF;
END //

DELIMITER ;
UPDATE players
SET goals=100
WHERE player_id=2;
SELECT  * from players;

CREATE TABLE player_history(
    old_goals INT,
    new_goals INT,
    player_id INT
);
DELIMITER //

CREATE TRIGGER after_goal_update
AFTER UPDATE
ON players
FOR EACH ROW
BEGIN
    INSERT INTO player_history
    VALUES(OLD.goals,NEW.goals,OLD.player_id);
END //

DELIMITER ;
UPDATE players
SET goals=500
WHERE player_id=2;
SELECT * from player_history;