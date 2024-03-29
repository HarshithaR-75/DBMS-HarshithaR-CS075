create database harshitha_supplier;
use harshitha_supplier;

create table suppliers(
sid int,
sname varchar(30),
city varchar(30),
Primary key(sid));

create table parts(
pid int primary key,
pname varchar(20), 
color varchar(10));

create table catalog(
sid int, 
pid int,
cost float(6),
foreign key(sid) references suppliers(sid), 
foreign key(pid) references parts(pid), 
primary key(sid, pid));

desc suppliers;
desc parts;
desc catalog;


insert into suppliers values(10001, "Acme Widget","Bangalore");
insert into suppliers values(10002,"Johns","Kolkata");
insert into suppliers values(10003, "Vimal","Mumbai");
insert into suppliers values(10004, "Reliance","Delhi");
insert into suppliers values(10005, "Mahindra","Mumbai");

insert into parts values(20001,"Book", "Red");
insert into parts values(20002, "Pen", "Red");
insert into parts values(20003, "Pencil", "Green");
insert into parts values(20004, "Mobile" ,"Green");
insert into parts values(20005, "Charger", "Black");

insert into catalog values(10001, 20001,10);
insert into catalog values(10001, 20002,10);
insert into catalog values(10001, 20003,30);
insert into catalog values(10001, 20004,10);
insert into catalog values(10001, 20005,10);
insert into catalog values(10002, 20001,10);
insert into catalog values(10002, 20002,20);
insert into catalog values(10003, 20003,30);
insert into catalog values(10004, 20003,40);

select * from suppliers;

select * from parts;

select * from catalog;

select distinct(pname) 
from parts p, catalog c 
where p.pid=c.pid;

select s.sname 
from suppliers s
where ((select count(p.pid) from parts p)=(select count(c.pid) from catalog c where c.sid = s.sid));

 select distinct(sname) 
 from suppliers s, parts p, catalog c
 where s.sid =c.sid and c.pid=p.pid and 
 p.color="Red";
 
select pname from parts 
where pid in (select pid from catalog 
			   where sid=(select sid from suppliers where sname="Acme Widget") and pid not in (select distinct pid from catalog where sid!=(select sid from suppliers where sname="Acme Widget")));

select sid
from catalog c
where cost > (select Avg(cost) from catalog p
		where c.pid = p.pid
              	group by pid);
                
select pid,sname from suppliers s, catalog c
where s.sid = c.sid and s.sid in (select sid from catalog r
				   where c.pid = r.pid and cost = (select max(cost) from catalog p
								     where r.pid = p.pid
								       group by pid));



 
 
 
 
