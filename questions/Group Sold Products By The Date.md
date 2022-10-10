## 

``` SAS
PROC SQL;
SELECT sell_date, COUNT(DISTINCT product) as num_sold ,
    
    GROUP_CONCAT(DISTINCT product order by product ASC separator ',') as products
    
        FROM Activities GROUP BY sell_date ORDER BY sell_date ASC;
QUIT;
``` 

Reference:
https://leetcode.com/problems/group-sold-products-by-the-date/
