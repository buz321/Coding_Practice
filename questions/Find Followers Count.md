## Write an SQL query that will, for each user, return the number of followers.

Return the result table ordered by user_id.

```SAS
PROC SQL;
SELECT user_id, COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id ASC;
QUIT;
```

### Example:
<img width="234" alt="스크린샷 2022-10-19 오전 6 41 55" src="https://user-images.githubusercontent.com/107760647/196550256-845bc6ac-827b-4935-a8ec-1a9f097e45ec.png">

Reference:
https://leetcode.com/problems/find-followers-count/
