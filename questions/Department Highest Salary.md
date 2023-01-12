## Write an SQL query to find employees who have the highest salary in each of the departments.

Return the result table in any order.

```SAS
PROC SQL;
SELECT
    Department.name AS 'Department',
    Employee.name AS 'Employee',
    Salary
FROM
    Employee
        JOIN
    Department ON Employee.DepartmentId = Department.Id
WHERE
    (Employee.DepartmentId , Salary) IN
    (   SELECT
            DepartmentId, MAX(Salary)
        FROM
            Employee
        GROUP BY DepartmentId
    )
;
```


### Example:
<img width="1147" alt="스크린샷 2023-01-13 오전 5 30 42" src="https://user-images.githubusercontent.com/107760647/212174633-5c395ce9-17ec-42ba-985d-4eb3c9f0048b.png">


Reference:
[https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/](https://leetcode.com/problems/department-highest-salary/)
