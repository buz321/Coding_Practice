## Write an SQL query to report the IDs of all the employees with missing information. 

The information of an employee is missing if:

The employee's name is missing, or The employee's salary is missing.

Return the result table ordered by employee_id in ascending order.

```SAS
PROC SQL;
SELECT employee_id FROM Employees WHERE employee_id NOT IN (SELECT employee_id FROM Salaries)
UNION 
SELECT employee_id FROM Salaries WHERE employee_id NOT IN (SELECT employee_id FROM Employees)

ORDER BY employee_id ASC;

QUIT;
```

### Example:
<img width="225" alt="스크린샷 2022-10-13 오전 5 35 16" src="https://user-images.githubusercontent.com/107760647/195442611-59f12d7e-1217-4a36-9157-c4174294ab75.png">


Reference:
https://leetcode.com/problems/employees-with-missing-information/
