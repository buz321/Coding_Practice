proc sql;
    select var1, var2, mean(var3) as mean_var3
    from my_data
    group by var1, var2;
quit;
