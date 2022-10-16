## Write an SQL query to find the customer_number for the customer who has placed the largest number of orders.

The test cases are generated so that exactly one customer will have placed more orders than any other customer.

```SAS
PROC SQL;
SELECT customer_number
FROM orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1
;
QUIT;
```


### Example:
<img width="284" alt="스크린샷 2022-10-17 오전 5 29 46" src="https://user-images.githubusercontent.com/107760647/196056730-2e5ede62-8d40-48ab-a08a-51c4aafdeb34.png">

Reference:
https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/
