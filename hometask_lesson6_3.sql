USE vk;


SELECT (
	SELECT COUNT(user_id) FROM likes WHERE user_id IN (
		SELECT user_id 
			FROM profiles 
			WHERE gender = "F"
	)  
) as "Женщины" , (
	SELECT COUNT(user_id) FROM likes WHERE user_id IN (
		SELECT user_id 
			FROM profiles 
			WHERE gender = "M"
	)
) as "Мужчины" ;

