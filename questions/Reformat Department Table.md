##Write an SQL query to reformat the table such that there is a department id column and a revenue column for each month. Return the result table in any order.

``` MySQL
PROC SQL;
SELECT id, 
	SUM(CASE WHEN month = 'jan' THEN revenue ELSE NULL end) AS Jan_Revenue,
	SUM(CASE WHEN month = 'feb' THEN revenue ELSE NULL end) AS Feb_Revenue,
	SUM(CASE WHEN month = 'mar' THEN revenue ELSE NULL end) AS Mar_Revenue,
	SUM(CASE WHEN month = 'apr' THEN revenue ELSE NULL end) AS Apr_Revenue,
	SUM(CASE WHEN month = 'may' THEN revenue ELSE NULL end) AS May_Revenue,
	SUM(CASE WHEN month = 'jun' THEN revenue ELSE NULL end) AS Jun_Revenue,
	SUM(CASE WHEN month = 'jul' THEN revenue ELSE NULL end) AS Jul_Revenue,
	SUM(CASE WHEN month = 'aug' THEN revenue ELSE NULL end) AS Aug_Revenue,
	SUM(CASE WHEN month = 'sep' THEN revenue ELSE NULL end) AS Sep_Revenue,
	SUM(CASE WHEN month = 'oct' THEN revenue ELSE NULL end) AS Oct_Revenue,
	SUM(CASE WHEN month = 'nov' THEN revenue ELSE NULL end) AS Nov_Revenue,
	SUM(CASE WHEN month = 'dec' THEN revenue ELSE NULL end) AS Dec_Revenue
FROM department
GROUP BY id;
QUIT;
```
###Example
<img width="589" alt="스크린샷 2022-10-12 오전 3 41 59" src="https://user-images.githubusercontent.com/107760647/195173333-b410a38f-ffef-4859-8e0d-6c6e64a629d1.png">


Reference:
https://leetcode.com/problems/reformat-department-table/
