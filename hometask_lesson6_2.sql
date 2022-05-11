USE vk;


SELECT COUNT(*) FROM likes WHERE media_id IN (
	SELECT id FROM media WHERE user_id IN ( -- id медиазаписей, для подсчета лайков.(8, 14, 6, 18)
		SELECT user_id    -- id  людей младше 10(3, 11, 16)
		FROM (
			SELECT user_id, (YEAR(CURRENT_DATE)-YEAR(birthday))-(RIGHT(CURRENT_DATE,5)<RIGHT(birthday,5)) as age 
			FROM profiles
			) as user_age 
		WHERE age < 10
	)
);







