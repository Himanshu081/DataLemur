--Patient Support Analysis (Part 4) [UnitedHealth SQL Interview Question]

with cte as(
SELECT EXTRACT(YEAR FROM call_received)AS yr,EXTRACT(MONTH FROM call_received)as mth
,count(case_id) as curr_call_count,
lag(count(case_id))over(order by EXTRACT(MONTH FROM call_received))as prev_call_count
FROM callers
where call_duration_secs>300 
group by EXTRACT(YEAR FROM call_received),EXTRACT(MONTH FROM call_received)

)

--SELECT YR,MTH,curr_call_count,PREV_CALL_COUNT FROM cte
select
yr,mth,
ROUND(100.0*( curr_call_count- prev_call_count )/prev_call_count, 1) AS growth_pct
from cte
order by yr,mth;



-- ,cte2 as(
-- select yr,mth,call_count,
-- lag(call_count)over(order by mth)as prev_call
-- from cte
-- )

-- SELECT yr,mth,
-- round(((call_count - prev_call)/prev_call)*100,1) as growth_pct
-- from cte2