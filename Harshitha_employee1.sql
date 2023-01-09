show databases;
create database harshitha_employee;
use harshitha_employee;

create table dept(
deptno int,
dname varchar(30),
dloc varchar(30),
primary key(deptno));

create table employee(
empno int,
ename varchar(30),
mgr_no int,
hiredate date,
sal double,
deptno int,
primary key (empno),
foreign key (deptno) references dept(deptno));

create table project(
pno int,
ploc varchar(30),
pname varchar(30),
primary key (pno));

create table assignedto(
empno int,
pno int,
jobrole varchar(30),
primary key(empno,pno),
foreign key (empno) references employee(empno),
foreign key (pno) references project(pno));

create table incentives(
empno int,
incentivedate date,
incentiveamount double,
primary key(empno, incentivedate),
foreign key (empno) references employee(empno));

insert into dept 
values(1,"accounts","delhi");
insert into dept 
values(2,"technical","bengaluru");
insert into dept 
values(3,"accounts","kolkata");
insert into dept 
values(4,"maintainence","jaipur");
insert into dept 
values(5,"sales","mumbai");

select * from dept;

insert into employee 
values(21, "abc", 22, '22-10-21', 10000,1);
insert into employee 
values(22, "def", 22, '22-10-20', 15000,2);
insert into employee 
values(23, "ghi", 22, '22-10-19', 20000,3);
insert into employee 
values(24, "jkl", null, '22-10-18', 25000,4);
insert into employee 
values(25, "mno", 24, '22-10-17', 30000,5);
insert into employee 
values(26, "pqr", 24, '22-10-16', 35000,1);

select * from employee;

insert into project
values(11,"jaipur","hex");
insert into project
values(12,"delhi","pqr");
insert into project
values(13,"bengaluru","stu");
insert into project
values(14,"kolkata","vwx");
insert into project
values(15,"jaipur","yz");

insert into assignedto
values(21,15,"sd1");
insert into assignedto
values(22,14,"sd2");
insert into assignedto
values(23,13,"sd3");
insert into assignedto
values(24,12,"sd4");
insert into assignedto
values(25,11,"sd5");
insert into assignedto
values(26,12,"sd6");
insert into assignedto
values(21,13,"sd7");

insert into incentives
values(21,"26-11-21",2000);
insert into incentives
values(22,"27-11-21",2500);
insert into incentives
values(23,"28-11-21",3000);
insert into incentives
values(25,"29-11-21",3500);
insert into incentives
values(26,"30-11-21",4000);

select e.empno
from employee e, project p, assignedto a
where p.pno=a.pno and e.empno=a.empno
and ploc in ("jaipur","delhi","bengaluru");

select empno
from employee
where empno NOT IN (Select empno
                    from incentives);
			
 select ename, e.empno, dname, jobrole, dloc, ploc      
 from employee e, dept d,project p, assignedto a 
 where e.empno=a.empno and a.pno=p.pno
 and e.deptno=d.deptno and ploc=dloc;










