## Using CASE to swap values

``` SAS
PROC SQL;
UPDATE Salary SET sex =

CASE WHEN 'm' THEN 'f' 
    ELSE 'm'
    
END;
QUIT;
``` 


Reference:
https://leetcode.com/problems/swap-salary/
