with cte as(
SELECT category,product,sum(spend)as total_spend,
row_number()over(PARTITION BY category order by sum(spend) desc) as rnk
FROM product_spend
where EXTRACT(year FROM transaction_date)=2022
group by category,product)

select category,product,total_spend
from cte
where rnk <=2