USE vk;

SELECT count(id) as how_many, name  FROM (
	SELECT   m.to_user_id  as id , u.lastname as name 
	FROM messages m JOIN users u ON m.from_user_id = '2' AND m.to_user_id = u.id 
	UNION ALL
	SELECT  m.from_user_id as id, u.lastname as name  
	FROM messages m JOIN users u ON m.to_user_id = '2' AND m.from_user_id = u.id 
) as res GROUP BY name ORDER BY  how_many DESC LIMIT 1;