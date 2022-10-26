## Write an SQL query that reports the products that were only sold in the first quarter of 2019. That is, between 2019-01-01 and 2019-03-31 inclusive.

Return the result table in any order.

``` SAS
PROC SQL;
SELECT p.product_id, p.product_name
FROM Product p
LEFT JOIN Sales s ON p.product_id = s.product_id
GROUP BY product_id
HAVING min(s.sale_date) >= '2019-01-01' 
    and max(s.sale_date) <= '2019-03-31'
;
QUIT;
```

### Example:
<img width="563" alt="스크린샷 2022-10-27 오전 6 56 38" src="https://user-images.githubusercontent.com/107760647/198146166-9fc6cc68-23c5-41da-964d-bc33ee68b6ee.png">

Reference:
https://leetcode.com/problems/sales-analysis-iii/
