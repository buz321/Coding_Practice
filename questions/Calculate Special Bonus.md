## Write an SQL query to calculate the bonus of each employee. The bonus of an employee is 100% of their salary if the ID of the employee is an odd number and the employee name does not start with the character 'M'. The bonus of an employee is 0 otherwise.

Return the result table ordered by employee_id.

```SAS
PROC SQL;
SELECT employee_id, 
CASE 
WHEN employee_id%2 != 0 AND name NOT LIKE 'M%' THEN salary
    ELSE 0
END AS bonus
FROM employees ORDER BY employee_id;
QUIT;
```

### Example:
<img width="303" alt="스크린샷 2022-10-25 오전 7 06 19" src="https://user-images.githubusercontent.com/107760647/197638912-de0a344c-d98c-46de-b233-5915d872851c.png">

Reference:
https://leetcode.com/problems/calculate-special-bonus/


### Note:
* In 'employee_id%2', % indicates the remainder. Therefore, 'employee_id%2 != 0' means anything except for numbers that have 0 as remainder, which is odd numbers.
