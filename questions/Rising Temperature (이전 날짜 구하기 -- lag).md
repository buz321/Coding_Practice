## Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.

``` SAS
PROC SQL;
SELECT a.id AS 'Id'
FROM
    weather a
        JOIN
    weather b ON DATEDIFF(a.recordDate, b.recordDate) = 1
        AND a.temperature > b.temperature
ORDER BY a.id ASC;
QUIT;
```

### Example:
<img width="275" alt="스크린샷 2022-10-29 오전 7 22 29" src="https://user-images.githubusercontent.com/107760647/198742201-b842aafb-43df-4533-8adf-a54b82539570.png">

Reference:
https://leetcode.com/problems/rising-temperature/

#### Note:
* you can refer to lag syntax.
