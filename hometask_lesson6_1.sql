USE vk;
 
SELECT MAX(messages), `with_id` 
FROM (
		SELECT COUNT(from_user_id) as messages, from_user_id as `with_id` 
        FROM (
				SELECT from_user_id 
                FROM messages 
                WHERE to_user_id = 2
				UNION ALL
				SELECT to_user_id 
                FROM messages 
                WHERE from_user_id = 2) as alias 
GROUP BY from_user_id) as counts;

