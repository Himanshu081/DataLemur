
--Duplicate Job Listings [Linkedin SQL Interview Question]
with cte as(
SELECT company_id,lower(title),lower(description),
count(distinct job_id)as duplicate
FROM job_listings
group by company_id,lower(title),lower(description)
having  count(distinct job_id)>1)

select count(company_id) as co_w_duplicate_jobs
from cte