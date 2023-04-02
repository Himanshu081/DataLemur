--Top 5 Artists [Spotify SQL Interview Question]

with cte as(
SELECT artist_name,count(rank)as rnk
FROM
artists a 
inner join 
songs s on a.artist_id = s.artist_id
inner join 
global_song_rank gs on gs.song_id=s.song_id
where gs.rank<=10
group by artist_name),cte2 as(
select artist_name,dense_rank()over(order by rnk desc)as artist_rank
from cte)
select * from cte2 where artist_rank<=5
order by artist_rank asc,artist_name;