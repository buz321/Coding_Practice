## Write an SQL query to find all the authors that viewed at least one of their own articles.

Return the result table sorted by id in ascending order.

``` SAS
PROC SQL;
SELECT author_id AS id
    FROM Views
        Where author_id = viewer_id
        Group by author_id
        order by id;
QUIT;
```

### Example:
<img width="460" alt="스크린샷 2022-10-14 오전 3 28 46" src="https://user-images.githubusercontent.com/107760647/195677337-592010eb-58b3-4707-afac-c56b78e59d0b.png">


Reference:
https://leetcode.com/problems/article-views-i/
