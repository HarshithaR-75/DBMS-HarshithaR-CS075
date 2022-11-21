use harshitha_insurance;
create table person(
driver_id varchar(10),
 name varchar(20),
 address varchar(40),
 primary key(driver_id));
create table car(
reg_num varchar(10),
model varchar(20),
year int, 
primary key(reg_num));
create table accident(
report_num int,
accident_date date,
 location varchar(30),
 primary key(report_num));
create table owns(
driver_id varchar(10),
reg_num varchar(10), 
primary key(driver_id,reg_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num));
create table participated(
driver_id varchar(10),
reg_num varchar(10),
report_num int,
damage_amount int,
primary key (driver_id, reg_num, report_num),
foreign key (driver_id) references person(driver_id),
foreign key (reg_num) references car(reg_num),
foreign key (report_num) references accident(report_num));
insert into person values
("A01","Richard","Srinivas"),("A02","Pradeep","Rajajinagar"),("A03","Smith","Ashok Nagar"),("A04","Venu","N R Colony"),("A05","Jhon","Hanumanth Nagar");
insert into car values
("KA052250","Indica",1990),("KA031181","Lancer",1957),("KA095477","Toyota",1998),("KA053408","Honda",2008),("KA041702","Audi",2005);
insert into owns values
("A01","KA052250"),("A02","KA053408"),("A03","KA031181"),("A04","KA095477"),("A05","KA041702");
insert into accident values
(11,'2003-01-01',"Mysore Road"),(12,'2004-02-02',"South end circle"),(13,'2003-01-21',"Bull temple road"),(14,'2008-02-17',"Mysore Road"),(15,'2005-03-04',"Kanakpura Road");
insert into participated values
("A01","KA052250",11,10000),("A02","KA053408",12,50000),("A03","KA095477",13,25000),("A04","KA031181",14,3000),("A05","KA041702",15,5000);
select * from person;
select * from car;
select * from accident;
select * from owns;
select * from participated;
select accident_date, location
from accident;
select driver_id 
from participated
where damage_amount >=25000;



 





