## Write an SQL query to fix the names so that only the first character is uppercase and the rest are lowercase.

Return the result table ordered by user_id.

``` SAS
PROC SQL
SELECT user_id , CONCAT(UPPER(SUBSTR(name,1,1)),LOWER(SUBSTR(name,2))) AS name 
FROM Users
ORDER BY Users.user_id ASC;
QUIT;
```

### Example:
<img width="172" alt="스크린샷 2022-10-25 오전 6 55 16" src="https://user-images.githubusercontent.com/107760647/197637269-d02ae954-1826-4cef-b0b0-8b23f33fe243.png">


Reference:
https://leetcode.com/problems/fix-names-in-a-table/
