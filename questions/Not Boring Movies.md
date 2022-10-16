## Write an SQL query to report the movies with an odd-numbered ID and a description that is not "boring".

Return the result table ordered by rating in descending order.

``` SAS
PROC SQL;
SELECT * 
FROM Cinema
WHERE id IN (1,3,5) AND description <> 'boring'
ORDER BY rating DESC;
QUIT;
```
### Example:
<img width="357" alt="스크린샷 2022-10-17 오전 4 37 01" src="https://user-images.githubusercontent.com/107760647/196054595-3de5d1c3-07fc-40f3-a5dd-06f51041c319.png">


Reference:
https://leetcode.com/problems/not-boring-movies/
