## GROUP_CONCAT = to arrange coloum to row

``` SAS
PROC SQL;
SELECT sell_date, COUNT(DISTINCT (product)) as num_sold ,
    
    GROUP_CONCAT(DISTINCT product order by product ASC) as products
    
        FROM Activities GROUP BY sell_date ORDER BY sell_date ASC;
QUIT;
``` 

## Answer
Output: 
+------------+----------+------------------------------+
| sell_date  | num_sold | products                     |
+------------+----------+------------------------------+
| 2020-05-30 | 3        | Basketball,Headphone,T-shirt |
| 2020-06-01 | 2        | Bible,Pencil                 |
| 2020-06-02 | 1        | Mask                         |
+------------+----------+------------------------------+

Reference:
https://leetcode.com/problems/group-sold-products-by-the-date/
