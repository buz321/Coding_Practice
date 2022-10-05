/* calculate the average value for rows that contain certain value or name */
proc sql;
    SELECT avg(Arrears_Amt) AS average_arrears_amount
    from 'Table A'
    WHERE Date LIKE '%Oct%'
quit;
