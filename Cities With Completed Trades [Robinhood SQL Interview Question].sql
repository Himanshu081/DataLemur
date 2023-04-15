
--Cities With Completed Trades [Robinhood SQL Interview Question]
SELECT city,count(1) as total_orders FROM
trades t inner join users u 
on t.user_id=u.user_id
where status ='Completed'
group by city
order by total_orders DESC
LIMIT 3
