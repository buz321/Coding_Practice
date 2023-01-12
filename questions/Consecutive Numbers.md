## Write an SQL query to find all numbers that appear at least three times consecutively.

Return the result table in any order.

```SAS
PROC SQL;
SELECT DISTINCT
    l1.num AS ConsecutiveNums
FROM
    Logs l1,
    Logs l2,
    Logs l3
WHERE
    l1.id = l2.id - 1
    AND l2.id = l3.id - 1
    AND l1.num = l2.num
    AND l2.num = l3.num
;
```


### Example:
<img width="751" alt="스크린샷 2023-01-13 오전 5 15 28" src="https://user-images.githubusercontent.com/107760647/212171375-b6b3a7fc-0c3a-4753-a817-3534e9175233.png">


Reference:
[https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/](https://leetcode.com/problems/consecutive-numbers/)
