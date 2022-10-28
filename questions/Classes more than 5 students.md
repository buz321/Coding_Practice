## Write an SQL query to report all the classes that have at least five students.


``` SAS
PROC SQL;
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >=5;
QUIT;
```


### Example:
<img width="211" alt="스크린샷 2022-10-29 오전 7 13 35" src="https://user-images.githubusercontent.com/107760647/198741176-15de890a-270d-4ddb-9102-18479b18f66f.png">

Reference:
https://leetcode.com/problems/classes-more-than-5-students/
