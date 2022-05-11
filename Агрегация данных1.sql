USE shop;


TRUNCATE users;
INSERT INTO users(name, birthday_at, created_at, updated_at) VALUES 
('Max','1990-04-09 02:21:14', NULL, NULL),('Max0','1996-04-09 02:21:14',NULL, NULL),
('Max1','1990-04-09 02:21:14',NULL, NULL),
('Max2','1990-04-09 02:21:14',NULL, NULL),
('Max3','1996-04-09 02:21:14',NULL, NULL),
('Max4','1996-04-09 02:21:14',NULL, NULL);


SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, curdate())) as `average age` FROM users;