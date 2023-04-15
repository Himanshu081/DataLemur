
--App Click-through Rate (CTR) [Facebook SQL Interview Question]
SELECT app_id, 
--count(case when event_type='impression' then 1 end) as imp_count,
--count(case when event_type='click' then 1 end) as click_count,
round(1.0 * count(case when event_type='click' then 1 end)/count(case when event_type='impression' then 1 end)*100.0,2) as ctr
FROM events
where EXTRACT( year from timestamp)=2022
GROUP BY app_id