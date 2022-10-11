## Write an SQL query to report the latest login for all users in the year 2020. Do not include the users who did not login in 2020. Return the result table in any order.

``` SAS
PROC SQL;
SELECT user_id, MAX(time_stamp) AS last_stamp 
  FROM Logins
    WHERE YEAR(time_stamp) = 2020 #or WHERE time_stamp like '2020%' (which works the same)
      GROUP BY user_id;
QUIT;
```
### Example:
<img width="284" alt="스크린샷 2022-10-12 오전 7 15 01" src="https://user-images.githubusercontent.com/107760647/195208061-d90d9f07-ab41-459f-aec9-77dc3d1e3ad4.png">


Reference:
https://leetcode.com/problems/the-latest-login-in-2020/
