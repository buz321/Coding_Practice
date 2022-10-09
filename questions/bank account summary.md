## Join and conditioning

``` SAS
PROC SQL;
SELECT u.name, sum(t.amount) as balance
    FROM Users u 
        JOIN Transactions t 
            ON u.account = t.account
            group by u.account
        HAVING balance > 10000;
QUIT;
```


Reference:
https://leetcode.com/problems/bank-account-summary-ii/ 
