USE shop;

;
TRUNCATE users;
INSERT INTO users(name, birthday_at, created_at, updated_at) VALUES 
('Max','1995-04-09 02:21:14', NULL, NULL),('Max0','1994-04-09 02:21:14',NULL, NULL),
('Max1','1996-04-09 02:21:14',NULL, NULL),
('Max2','1997-04-09 02:21:14',NULL, NULL),
('Max3','1998-04-09 02:21:14',NULL, NULL),
('Max4','1999-04-09 02:21:14',NULL, NULL);

UPDATE users SET created_at = NOW(), updated_at = NOW();

 SELECT * FROM users;
