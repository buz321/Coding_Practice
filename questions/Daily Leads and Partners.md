## make distinct sum values 
``` SAS
PROC SQL;
SELECT data_id, make_name, DISTINCT(SUM(lead_id)) AS unique_leads, DISTINCT(SUM(partne_id)) AS unique_partners
    FROM DailySales
    GROUP BY date_id, make_name;\
QUIT;
``` 

### Example:
<img width="484" alt="스크린샷 2022-10-17 오전 5 30 53" src="https://user-images.githubusercontent.com/107760647/196056784-db3c5fab-0444-4a6b-b50b-6446ce959f30.png">

Reference:
https://leetcode.com/problems/daily-leads-and-partners/
