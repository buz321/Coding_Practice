## Write an SQL query to find for each user, the join date and the number of orders they made as a buyer in 2019.

Return the result table in any order.

```SAS
PROC SQL;
SELECT u.user_id AS buyer_id, u.join_date, ifnull(COUNT(o.buyer_id),0) AS orders_in_2019
FROM Users u
LEFT JOIN Orders o ON o.buyer_id = u.user_id AND year(order_date)='2019'
GROUP BY u.user_id
ORDER BY u.user_id ASC;
QUIT;
```


### Example:
<img width="494" alt="스크린샷 2022-10-26 오전 6 37 43" src="https://user-images.githubusercontent.com/107760647/197886981-20ce1372-a04b-462d-948d-ca2d24894ec7.png">

Reference:
https://leetcode.com/problems/market-analysis-i/
