show databases;
use harshitha_banking;
show tables;
select * from loan;
select * from depositor;
create table borrower(
customername varchar(30),
loannumber int,
primary key(customername,loannumber),
foreign key (customername) references bankcustomer(customername),
foreign key(loannumber) references loan(loannumber)
);

insert into borrower
 values("Avinash",1);
 insert into borrower
 values("Dinesh",2);
 insert into borrower
 values("Mohan",3);
 insert into borrower
 values("Nikil",4);
 insert into borrower
 values("Ravi",5);
                                       
  insert into branch values(
  "SBI_MantriMarg", "Delhi", 200000);
  
  insert into bankaccount values(
  12,"SBI_MantriMarg", 2000);
  
  insert into depositor values(
  "Nikil",12);
  
select customername
from depositor
 where accno IN(select accno 
				 from bankaccount
				 where branchname in (select branchname
                                      from branch
                                      where branchcity="Delhi"))
group by customername
having count(customername) > (select count(branchname)
                                      from branch
                                      where branchcity="Delhi");
                                      



select customername from borrower
where customername NOT IN(select customername from depositor);
                           
                           
 
select customername
from borrower 
where loannumber = any(select loannumber 
                       from loan 
                        where branchname= any(select branchname
                                               from branch 
                                                where branchcity="Bangalore")) and customername in (select customername from depositor 
                                                                                                     where customername=any(select customername 
															    from bankcustomer 
															    where city="Bangalore")); 
																						                                    bankcustomer where city="Bangalore"));

                   
select branchname 
from branch
where assets>(select max(assets)
	           from branch 
               where branchcity="Bangalore");
               


delete from bankaccount
where branchname in(select branchname
			        from  branch
                    where branchcity="bombay");
               



update bankaccount
set balance= balance+0.05*balance;
                                      
                                      
  


