## Write an SQL query to report the second highest salary from the Employee table. If there is no second highest salary, the query should report null.

The query result format is in the following example.



```SAS
SELECT IFNULL(
      (SELECT DISTINCT Salary
       FROM Employee
       ORDER BY Salary DESC
        LIMIT 1 OFFSET 1),
    NULL) AS SecondHighestSalary
QUIT;
```


### Example:
<img width="1251" alt="스크린샷 2023-01-12 오전 7 20 36" src="https://user-images.githubusercontent.com/107760647/211930323-992e2946-6d77-491a-b9cc-2d8d328f2bb9.png">



Reference:
[https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/](https://leetcode.com/problems/second-highest-salary/)
