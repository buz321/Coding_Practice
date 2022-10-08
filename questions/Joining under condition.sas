
proc sql;

SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
    FROM Employee e 
    JOIN Department d ON e.id = d.id
  where 3 > (select count(distinct(o.Salary)) 
                  from Employee o 
                  where o.Salary > e.Salary 
                  and e.DepartmentId = o.DepartmentId
                  );

quit;


See: https://leetcode.com/problems/department-top-three-salaries/
