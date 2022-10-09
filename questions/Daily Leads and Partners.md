## make distinct sum values 
``` SAS
PROC SQL;
SELECT data_id, make_name, DISTINCT(SUM(lead_id)) AS unique_leads, DISTINCT(SUM(partne_id)) AS unique_partners
    FROM DailySales
    GROUP BY date_id, make_name;\
QUIT;
``` 

Reference:
https://leetcode.com/problems/daily-leads-and-partners/
