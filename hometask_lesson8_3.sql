USE vk;


SELECT COUNT(l.user_id),  p.gender  FROM likes l INNER JOIN  profiles p ON  l.user_id = p.user_id GROUP BY gender ;


