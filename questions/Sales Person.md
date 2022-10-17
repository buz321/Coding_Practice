## Write an SQL query to report the names of all the salespersons who did not have any orders related to the company with the name "RED".

Return the result table in any order.

```SAS
PROC SQL;
SELECT name
FROM salesperson
WHERE sales_id NOT IN (
	SELECT o.sales_id
	FROM orders o
	JOIN company c ON o.com_id = c.com_id
	WHERE c.name = 'red'
)
QUIT;
```


### Example:
<img width="476" alt="스크린샷 2022-10-18 오전 6 34 50" src="https://user-images.githubusercontent.com/107760647/196288168-db00db1c-bb9f-4fd7-9a93-684194d69f4a.png">

<img width="92" alt="스크린샷 2022-10-18 오전 6 35 03" src="https://user-images.githubusercontent.com/107760647/196288202-bc4a0c51-aaa7-4716-bec7-7b189bd995af.png">


Reference:
https://leetcode.com/problems/sales-person/
