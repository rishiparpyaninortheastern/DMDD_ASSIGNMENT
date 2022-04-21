---VIEW ALL SHARES---
CREATE OR REPLACE VIEW ALL_SHARES AS
SELECT CS.SEC_DESC AS SECURITY_NAME, SI.MARKET_VAL FROM 
(select stock_id,market_val from
(SELECT stock_id,market_val, rank() over (partition by stock_id order by as_of_date desc) as rank from stockinfo)
stock_curr 
where stock_curr.rank=1) SI
join COMPANYSECURITY CS
on  CS.SECURITY_ID = SI.STOCK_ID;

SELECT * FROM ALL_SHARES;