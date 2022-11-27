create database harshitha_banking;
show databases;
use harshitha_banking;

create table Branch(
branchname varchar(30),
branchcity varchar(30),
assets float,
Primary key (branchname));

create table BankAccount(
accno int,
branchname varchar(30),
balance float,
Primary key (accno),
Foreign Key (branchname) references Branch(branchname));

create table BankCustomer(
customername varchar(30),
customerstreet varchar(30),
customercity varchar(30),
primary key (customername));

create table Depositor(
customername varchar(30),
accno int,
Primary Key(customername,accno),
foreign key(customername) references BankCustomer(customername),
foreign key(accno) references BankAccount(accno));

create table Loan(
loannumber int,
branchname varchar(30),
amount float,
Primary key (loannumber),
foreign key(branchname) references Branch(branchname));

insert into Branch values(
"SBI_Chamrajpet","Bangalore",50000);
insert into Branch values(
"SBI_ResidencyRoad","Bangalore",10000);
insert into Branch values(
"SBI_ShivajiRoad","Bombay",20000);
insert into Branch values(
"SBI_ParlimentRoad","Delhi",10000);
insert into Branch values(
"SBI_Jantarmantar","Delhi",20000);

insert into BankAccount values(
1,"SBI_Chamrajpet",2000);
insert into BankAccount values(
2,"SBI_ResidencyRoad",5000);
insert into BankAccount values(
3,"SBI_ShivajiRoad",6000);
insert into BankAccount values(
4,"SBI_ParlimentRoad",9000);
insert into BankAccount values(
5,"SBI_Jantarmantar",8000);
insert into BankAccount values(
6,"SBI_ShivajiRoad",4000);
insert into BankAccount values(
8,"SBI_ResidencyRoad",4000);
insert into BankAccount values(
9,"SBI_ParlimentRoad",3000);
insert into BankAccount values(
10,"SBI_ResidencyRoad",5000);
insert into BankAccount values(
11,"SBI_Jantarmantar",2000);

insert into BankCustomer values(
"Avinash","Bull_Temple_Road","Bangalore");
insert into BankCustomer values(
"Dinesh","Bannergatta_Road","Bangalore");
insert into BankCustomer values(
"Mohan","NationalCollege_Road","Bangalore");
insert into BankCustomer values(
"Nikil","Akbar_Road","Delhi");
insert into BankCustomer values(
"Ravi","Prithviraj_Road","Delhi");

insert into depositor values(
"Avinash",1);
insert into depositor values(
"Dinesh",2);
insert into depositor values(
"Nikil",4);
insert into depositor values(
"Ravi",5);
insert into depositor values(
"Avinash",8);
insert into depositor values(
"Nikil",9);
insert into depositor values(
"Dinesh",10);
insert into depositor values(
"Nikil",11);

insert into Loan values(
1,"SBI_Chamrajpet",1000);
insert into Loan values(
2,"SBI_ResidencyRoad",2000);
insert into Loan values(
3,"SBI_ShivajiRoad",3000);
insert into Loan values(
4,"SBI_ParlimentRoad",4000);
insert into Loan values(
5,"SBI_JantarMantar",5000);

select branchname, (Assets/100000) AS Assets_In_Lakhs
from branch;



create view LoanView(Branch_name, Total_loan)
as Select branchname, sum(amount)
from Loan
group by branchname;
select * from LoanView;

select D.customername
from depositor D, BankAccount B
where D.accno=B.accno and
branchname="SBI_ResidencyRoad" 
group by D.customername
having Count(D.accno) >=2;
       
















