USE shop;

TRUNCATE users;
INSERT INTO users(name, birthday_at, created_at, updated_at) VALUES 
('Max','1990-04-09 02:21:14', NULL, NULL),('Max0','1996-04-09 02:21:14',NULL, NULL),
('Max1','1990-04-09 02:21:14',NULL, NULL),
('Max2','1990-04-09 02:21:14',NULL, NULL),
('Max3','1996-04-09 02:21:14',NULL, NULL),
('Max3','1996-04-10 02:21:14',NULL, NULL),
('Max3','1996-04-11 02:21:14',NULL, NULL),
('Max3','1996-04-12 02:21:14',NULL, NULL),
('Max4','1996-04-09 02:21:14',NULL, NULL);


SELECT 

dayname(DATE_ADD(birthday_at, INTERVAL TIMESTAMPDIFF(YEAR, birthday_at, NOW())+1 YEAR)) day, 
COUNT(*) as count 
FROM 
users 
GROUP BY day;



