## total payments for each month for everyone who is 20 or older 

``` SAS
proc sql;
SELECT a.Account_test, b.Name_test, sum(Monthly_Payment) AS total_payment, TIMESTAMPDIFF (YEAR, c.birthday, a.payday) AS AGE
	FROM test2 a
		JOIN
	tableb b on a.Account_test = b.Account_test
		JOIN
	tablec c on b.Name_test = c.Name_test
   GROUP BY a.Account_test, b.Name_test, age Having AGE >=20;
quit;
```
      
