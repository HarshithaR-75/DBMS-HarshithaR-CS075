create database harshitha_flights;
use harshitha_flights;

create table flights
(flno int,
 fromm varchar(30),
 too varchar(30),
 distance int,
 departs time,
 arrives time,
 price int,
 Primary key (flno));
 
create table aircraft
(aid int,
aname varchar(30),
cruisingrange int,
primary key (aid));

create table employee
(eid int,
ename varchar(30),
salary int,
primary key(eid));

create table certified
(eid int,
aid int,
foreign key (eid) references employee(eid),
foreign key (aid) references aircraft(aid));

insert into flights values(
1,"Bengaluru","New Delhi",500,'6:00', '9:00', 5000);
insert into flights values(
2,"Bengaluru","Chennai",300,'7:00', '8:30', 3000);
insert into flights values(
3,"Trivandrum","New Delhi",800,'8:00', '11:30', 6000);
insert into flights values(
4,"Bengaluru","Frankfurt",10000,'6:00', '23:30', 50000);
insert into flights values(
5,"Kolkata","New Delhi",2400,'11:00', '3:30', 9000);
insert into flights values(
6,"Bengaluru","Frankfurt",8000,'9:00', '23:00', 40000);

select * from flights;

insert into aircraft values
(1, "Airbus",2000);
insert into aircraft values
(2, "Boeing",700);
insert into aircraft values
(3, "JetAirways",550);
insert into aircraft values
(4, "Indigo",5000);
insert into aircraft values
(5, "Boeing",4500);
insert into aircraft values
(6, "Airbus",2200);

select * from aircraft;

insert into employee values
(101, "Avinash",50000);
insert into employee values
(102, "Lokesh",60000);
insert into employee values
(103, "Rakesh",70000);
insert into employee values
(104, "Santhosh",82000);
insert into employee values
(105, "Tilak",5000);

select * from employee;

insert into certified values
(101,2);
insert into certified values
(101,4);
insert into certified values
(101,5);
insert into certified values
(101,6);
insert into certified values
(102,1);
insert into certified values
(102,3);
insert into certified values
(102,5);
insert into certified values
(103,2);
insert into certified values
(103,3);
insert into certified values
(103,5);
insert into certified values
(103,6);
insert into certified values
(104,6);
insert into certified values
(104,1);
insert into certified values
(104,3);
insert into certified values
(105,3);

select * from certified;

select a.aname
from aircraft a, certified c, employee e
where a.aid=c.aid and c.eid=e.eid
and e.salary>80000;

select c.eid, max(cruisingrange)
from certified c, aircraft a
where c.aid= a.aid
group by c.eid
having count(c.aid)>=3;

select ename 
from employee
where salary< (select min(price)
               from flights
               where fromm="Bengaluru" and too="Frankfurt");
               
select a.aid, a.aname, avg(e.salary)
from employee e , certified c, aircraft a 
where c.aid=a.aid and c.eid=e.eid
and a.cruisingrange>1000
group by a.aid, a.aname;

select distinct(e.ename)
from employee e , certified c, aircraft a 
where c.aid=a.aid and c.eid=e.eid
and a.aname= "Boeing";

select distinct a.aid
from aircraft a
where a.cruisingrange > (select min(f.distance)
                         from flights f
                         where f.fromm="Bengaluru" and f.too="New Delhi");

           


drop table certified;

























 