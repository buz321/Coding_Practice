## Write an SQL query to report the first login date for each player.

Return the result table in any order.

```SAS
PROC SQL;
SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
        WHERE games|_played > 0
        GROUP BY player_id 
        ORDER BY player_id ASC;
QUIT;
```
# Example:
<img width="478" alt="스크린샷 2022-10-13 오전 7 22 57" src="https://user-images.githubusercontent.com/107760647/195459024-0138d3c3-6b00-426b-b816-dc58e2d0b902.png">

Reference:
https://leetcode.com/problems/game-play-analysis-i/
