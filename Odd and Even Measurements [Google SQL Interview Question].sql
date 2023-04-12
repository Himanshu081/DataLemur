--Odd and Even Measurements [Google SQL Interview Question]
with cte AS(SELECT  *,
row_number() over(PARTITION BY date(measurement_time) order by measurement_id)as row_id
FROM measurements
)
select
CAST(measurement_time AS date) AS measurement_day,
sum(case when row_id%2!=0 then measurement_value else 0 end)odd_sum,
sum(case when row_id%2=0 then measurement_value else 0 end)even_sum
FROM cte
group by CAST(measurement_time AS date)
order by measurement_day ;