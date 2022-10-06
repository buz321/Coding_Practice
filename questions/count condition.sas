/* Count the number of months under condition */
proc sql;
SELECT Date, COUNT(Arrears_Amt) AS num_of_account_over_250
    FROM 'Table A'
    Where Arrears_Amt > 250
    GROUP BY Date, Account
quit;
