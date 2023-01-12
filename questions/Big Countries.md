## Write an SQL query to report the name, population, and area of the big countries.

A country is big if:
* it has an area of at least three million (i.e., 3000000 km2), or
* it has a population of at least twenty-five million (i.e., 25000000).

Return the result table in any order.

``` SAS
PROC SQL;
SELECT name, population, area
FROM World
WHERE population >= 25000000 OR area >= 3000000;
QUIT;
```

### Example:
<img width="542" alt="스크린샷 2022-10-17 오전 4 29 53" src="https://user-images.githubusercontent.com/107760647/196054285-2c03a6b2-2cd1-461d-a131-d00ebc5992e3.png">


Reference:
https://leetcode.com/problems/big-countries/
