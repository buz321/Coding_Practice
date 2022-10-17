## Write a SQL query for a report that provides the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.

Return the result table in any order.

```SAS
PROC SQL;
SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(timestamp) >=3;
QUIT;
```


### Example:
<img width="364" alt="스크린샷 2022-10-18 오전 6 25 14" src="https://user-images.githubusercontent.com/107760647/196286506-7dcd3c1b-1af0-4ff0-8309-1e7a86ec44da.png">


Reference:
https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/
