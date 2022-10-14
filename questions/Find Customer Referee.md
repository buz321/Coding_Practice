## Write an SQL query to report the names of the customer that are not referred by the customer with id = 2.

Return the result table in any order.

``` SAS
PROC SQL;
SELECT NAME
FROM CUSTOMER 
WHERE referee_id IS NULL OR referee_id <>2;
QUIT;
```

### Example:
<img width="247" alt="스크린샷 2022-10-15 오전 7 24 11" src="https://user-images.githubusercontent.com/107760647/195952577-9bc362e9-e0fa-4f39-b882-650c166c06d1.png">

Reference:
https://leetcode.com/problems/find-customer-referee/
