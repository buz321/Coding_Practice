# to get a age as of today given the birth of date # 
# '0' needs to be added to make the result look more natural # 
SELECT ID, DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), DATE_OF_BIRTH)), '%Y') + 0 AS age
FROM customers
ORDER BY customer_ID ASC;
