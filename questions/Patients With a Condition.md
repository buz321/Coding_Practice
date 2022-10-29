## Write an SQL query to report the patient_id, patient_name all conditions of patients who have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix

Return the result table in any order.

```SAS
PROC SQL;
SELECT patient_id, patient_name, conditions
FROM Patients
WHERE  
conditions LIKE '%DIAB1%' OR
conditions LIKE 'DIAB1%'
ORDER BY patient_id ASC;
QUIT;
```


### Example:
<img width="385" alt="스크린샷 2022-10-30 오전 8 23 38" src="https://user-images.githubusercontent.com/107760647/198856053-0ff033ba-bb2e-492f-822d-085e41e0815a.png">

Reference:
https://leetcode.com/problems/patients-with-a-condition/

#### Note:
* To caputure conditions that have certain words, you can use '%'.
