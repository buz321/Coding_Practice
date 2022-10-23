## Write an SQL query to report all customers who never order anything.

Return the result table in any order.

```SAS
PROC SQL;
SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o ON c.id=o.customerId
WHERE o.customerId is NULL;
QUIT;
```

### Example:
<img width="164" alt="스크린샷 2022-10-24 오전 5 52 36" src="https://user-images.githubusercontent.com/107760647/197417794-d276e99e-18d9-455c-9e8a-34b5c8101ef9.png">



Reference:
https://leetcode.com/problems/customers-who-never-order/
