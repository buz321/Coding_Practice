## 동물 보호소에 들어온 동물 이름 중 두 번 이상 쓰인 이름과 해당 이름이 쓰인 횟수를 조회하는 SQL문을 작성해주세요. 이때 결과는 이름이 없는 동물은 집계에서 제외하며, 결과는 이름 순으로 조회해주세요.


``` SAS
PROC SQL;
SELECT NAME, COUNT(NAME) AS count
FROM ANIMAL_INS
GROUP BY NAME
HAVING COUNT(NAME) >=2
ORDER BY 1;
QUIT;
```

### Example:
<img width="886" alt="스크린샷 2022-10-14 오전 7 05 30" src="https://user-images.githubusercontent.com/107760647/195719573-4dffc9d8-5150-48bd-ad24-f74af81cb526.png">


Reference: 
https://school.programmers.co.kr/learn/courses/30/lessons/59041
