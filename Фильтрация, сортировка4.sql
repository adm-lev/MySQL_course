USE shop;

TRUNCATE users;
ALTER TABLE users MODIFY COLUMN birthday_at VARCHAR(20);
INSERT INTO users(name, birthday_at, created_at, updated_at) VALUES 
('Max','febfuary', NULL, NULL),('Max0','january',NULL, NULL),
('Max1','march',NULL, NULL),
('Max2','april',NULL, NULL),
('Max3','august',NULL, NULL),
('Max4','may',NULL, NULL);

SELECT * FROM users WHERE birthday_at='may'OR birthday_at='august' ;