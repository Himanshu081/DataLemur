--Histogram of Tweets [Twitter SQL Interview Question]

with cte as(SELECT user_id, count(1)as tweet_count  FROM 
tweets
where EXTRACT(year from tweet_date)=2022
group by user_id)
select tweet_count as tweet_bucket ,count(user_id) as users_num
from cte group by tweet_count