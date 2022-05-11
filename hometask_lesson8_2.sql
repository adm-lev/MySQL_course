USE vk;

SELECT COUNT(l.media_id)  
FROM media m JOIN profiles p ON m.user_id = p.user_id  
AND (YEAR(CURRENT_DATE)-YEAR(birthday))-(RIGHT(CURRENT_DATE,5)<RIGHT(birthday,5)) < 10
INNER JOIN likes l ON m.id  = l.media_id;






