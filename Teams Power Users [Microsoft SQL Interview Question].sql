--Teams Power Users [Microsoft SQL Interview Question]

SELECT sender_id,count( DISTINCT message_id) as	message_count
FROM messages
where extract( month from sent_date)=8 and extract(year from sent_date)=2022
group by sender_id 
order by count(message_id) desc
LIMIT 2;