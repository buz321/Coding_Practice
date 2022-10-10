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
<img width="458" alt="스크린샷 2022-10-11 오전 6 17 47" src="https://user-images.githubusercontent.com/107760647/194953727-6e032c64-dbd5-45e1-b7ab-18237a984e38.png">

Reference:
https://leetcode.com/problems/group-sold-products-by-the-date/
