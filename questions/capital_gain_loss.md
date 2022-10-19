## Write an SQL query to report the Capital gain/loss for each stock.

The Capital gain/loss of a stock is the total gain or loss after buying and selling the stock one or many times.

Return the result table in any order.


```SAS
PROC SQL;
SELECT stock_name, SUM(
    CASE
        WHEN operation = 'Buy' THEN -price
        ELSE price
    END
) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name
QUIT;
```


### Example:
<img width="457" alt="스크린샷 2022-10-20 오전 6 52 34" src="https://user-images.githubusercontent.com/107760647/196811839-6d84672a-ecd4-499e-828e-a3b307a833cc.png">


Reference:
https://leetcode.com/problems/capital-gainloss/
