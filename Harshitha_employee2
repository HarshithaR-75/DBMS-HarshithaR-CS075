select * from incentives;
select ename from employee
where EmpNo = (select MGR_No from Employee
				Group by Mgr_No
				having count(Ename) = (select  max(aa) from ( Select count(*) as aa
																from employee
																group by mgr_no) a ));
                                                                
select m.ename
from employee m
where sal >=  (Select avg(e.sal)
				from employee e
                where m.empno = e.mgr_no
                group by e.mgr_no);
                
select e.mgr_no
from Employee e
group by mgr_no
having 1 = any (select count(*)
			from Employee m
            where e.deptno = m.deptno
            group by deptno);


select ename from employee
where EmpNo = (select MGR_No from Employee
				Group by Mgr_No
				having count(Ename) = (select  max(aa) from ( Select count(*) as aa
																from employee
																group by mgr_no) a ));
update 
set deptno = 1
where deptno = 4;
