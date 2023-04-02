--Y-on-Y Growth Rate [Wayfair SQL Question]

with cte as(
SELECT transaction_id,product_id,extract(year from transaction_date) as year,
spend as curr_year_spend,
lag(spend,1)over(PARTITION BY product_id order by transaction_date) as prev_year_spend
FROM user_transactions)

select year,product_id,curr_year_spend,prev_year_spend,
round(((curr_year_spend - prev_year_spend)/prev_year_spend)*100,2)as yoy_rate
from cte