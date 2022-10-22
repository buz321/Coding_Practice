/* calculate the average value for rows that contain certain value or name */
PROC SQL;
   SELECT Account_test, COUNT(Arrears_Amt) AS num_of_account_over_250
    FROM test2
    Where Arrears_Amt > 250
    GROUP BY Account_test
QUIT;
