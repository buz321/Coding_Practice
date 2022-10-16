## Write an SQL query to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.

Return the result table in any order.


``` SAS
PROC SQL;
SELECT p.firstName, p.lastName, a.city, a.state
FROM Person p 
    LEFT JOIN   
        Address a ON a.personId = p.personId
;
QUIT
```

### Example:
<img width="435" alt="스크린샷 2022-10-17 오전 4 53 38" src="https://user-images.githubusercontent.com/107760647/196055258-a7db0239-ce6c-469f-905b-2904e58a1429.png">

Reference:
https://leetcode.com/problems/combine-two-tables/
