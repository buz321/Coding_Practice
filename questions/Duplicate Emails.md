## Write an SQL query to report all the duplicate emails.

Return the result table in any order.

``` SAS
PROC SQL;
SELECT email AS Email
FROM Person
GROUP BY email
HAVING count(email)>1;
QUIT;
```

### Example:
<img width="146" alt="스크린샷 2022-10-23 오전 8 44 30" src="https://user-images.githubusercontent.com/107760647/197366383-fd20ee4c-9e32-4414-b81d-36ce6526be52.png">


Reference:
https://leetcode.com/problems/duplicate-emails/
