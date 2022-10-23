## Write an SQL query to find the employees who earn more than their managers.

Return the result table in any order.


``` SAS
PROC SQL;
SELECT
     a.NAME AS Employee
FROM Employee AS a JOIN Employee AS b
     ON a.ManagerId = b.Id
     AND a.Salary > b.Salary
;
QUIT;
```

### Example: 
<img width="306" alt="스크린샷 2022-10-23 오후 8 41 04" src="https://user-images.githubusercontent.com/107760647/197390058-89ccfb79-55d6-445e-a52a-a84e84d2d890.png">


Reference:
https://leetcode.com/problems/employees-earning-more-than-their-managers/
