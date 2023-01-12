## Write an SQL query to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on someday if they made at least one activity on that day.

Return the result table in any order.

```SAS
PROC SQL;
SELECT activity_date AS day, COUNT(DISTINCT(session_id)) AS active_users
FROM Activity
WHERE activity_date > "2019-06-27" AND activity_date <= "2019-07-27"
GROUP BY activity_date;
```


### Example:
<img width="666" alt="스크린샷 2023-01-13 오전 6 50 23" src="https://user-images.githubusercontent.com/107760647/212188650-e3b52d82-08c0-413e-81a3-01dfd9848fc8.png">


Reference:
https://leetcode.com/problems/user-activity-for-the-past-30-days-i/
