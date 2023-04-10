
--Page With No Likes [Facebook SQL Interview Question]
SELECT p.page_id from pages p left join page_likes pl
on p.page_id = pl.page_id
where pl.user_id is null
order by p.page_id;