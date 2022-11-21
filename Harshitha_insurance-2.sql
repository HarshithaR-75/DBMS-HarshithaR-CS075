use harshitha_insurance;
show tables;
select * from person;
select * from car;
select * from owns;
select * from accident;
select * from participated;
update participated
set damage_amount= 25000
where report_num=12;
insert into accident values(
16,'2015-05-05',"JP Nagar");
select * from car
order by year;
select count(C.reg_num)
from car C, participated P
where P.reg_num = C.reg_num AND C.model="Honda";
select count(P.driver_id)
from accident A, participated P
where  P.report_num=A.report_num AND year(A.accident_date)='2008';
select avg(damage_amount)
from participated;
delete from participated
where damage_amount< 13600;

