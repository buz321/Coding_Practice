## Write an SQL query to rank the scores. The ranking should be calculated according to the following rules:

The scores should be ranked from the highest to the lowest.
If there is a tie between two scores, both should have the same ranking.
After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.
Return the result table ordered by score in descending order.

The query result format is in the following example.
``` SAS
SELECT
  S.score,
  DENSE_RANK() OVER (
    ORDER BY
      S.score DESC
  ) AS 'rank'
FROM
  Scores S;
QUIT;
```

### Example:
<img width="207" alt="스크린샷 2023-01-12 오전 7 32 12" src="https://user-images.githubusercontent.com/107760647/211932131-32e1e171-11f8-4e0c-aed3-c17cb45ff03e.png">


Reference:
[https://leetcode.com/problems/tree-node/](https://leetcode.com/problems/rank-scores/)


(Note)
* Use DENSE_RANK() for ranking
