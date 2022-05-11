USE vk;

UPDATE profiles SET is_active = 0 WHERE (TIMESTAMPDIFF(YEAR, birthday, curdate())) < '18'; 

