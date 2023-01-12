## Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id. Note that you are supposed to write a DELETE statement and not a SELECT one.

After running your script, the answer shown is the Person table. The driver will first compile and run your piece of code and then show the Person table. The final order of the Person table does not matter.

```SAS
PROC SQL;
DELETE per1 
FROM Person per1, Person per2
WHERE
per1.Email = per2.Email AND per1.Id > per2.Id;
```


### Example:
<img width="887" alt="스크린샷 2023-01-13 오전 5 38 01" src="https://user-images.githubusercontent.com/107760647/212175937-ef848037-454b-47b6-afcd-1c4ccd4c7ba1.png">


Reference:
https://leetcode.com/problems/delete-duplicate-emails/
