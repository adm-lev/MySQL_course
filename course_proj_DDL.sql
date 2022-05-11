DROP DATABASE IF EXISTS inventory1; 
CREATE DATABASE IF NOT EXISTS inventory1;

USE inventory1;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id SERIAL PRIMARY KEY,
    login VARCHAR(50),
    is_active BOOLEAN DEFAULT TRUE,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
)COMMENT 'Пользователи';

DROP TABLE IF EXISTS departments;
CREATE TABLE departments(
	id SERIAL PRIMARY KEY,
    name VARCHAR(50)
)COMMENT 'Отделы';

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles(
	user_id BIGINT UNSIGNED,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    thirdname VARCHAR(50),
    department_id BIGINT UNSIGNED,
    birthday_at DATETIME,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE CASCADE
)COMMENT 'Профили пользователей';

DROP TABLE IF EXISTS software;
CREATE TABLE software(
	id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    version VARCHAR(50),
    license VARCHAR(50),
    info TEXT
)COMMENT 'Программное обеспечение';

DROP TABLE IF EXISTS workstations;
CREATE TABLE workstations(
	id SERIAL PRIMARY KEY,
    hostname VARCHAR(50),
    user_id BIGINT UNSIGNED,
    cpu VARCHAR(50),
    ram VARCHAR(50),
    hdd VARCHAR(50),
    motherboard VARCHAR(50),
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
)COMMENT 'Рабочие станции';

DROP TABLE IF EXISTS certificates;
CREATE TABLE certificates(
	id SERIAL PRIMARY KEY,
    owner_id BIGINT UNSIGNED,
    release_date DATE,
    end_date DATE,
    info TEXT,
    
    FOREIGN KEY (owner_id) REFERENCES users(id) ON DELETE CASCADE
)COMMENT 'Сертификаты ЭП';

DROP TABLE IF EXISTS installed;
CREATE TABLE installed(
	id BIGINT UNSIGNED,
    soft_id BIGINT UNSIGNED,
    pc_id BIGINT UNSIGNED,
    cert_id BIGINT UNSIGNED,
    info TEXT,
    
    FOREIGN KEY (soft_id) REFERENCES software(id) ON DELETE CASCADE,
    FOREIGN KEY (pc_id) REFERENCES workstations(id) ON DELETE CASCADE,
    FOREIGN KEY (cert_id) REFERENCES certificates(id) ON DELETE CASCADE
)COMMENT 'Установленные программы';

DROP TABLE IF EXISTS printers;
CREATE TABLE printers(
	id SERIAL PRIMARY KEY,
    model VARCHAR(50),
    department_id BIGINT UNSIGNED,
    last_service_date DATE,
    
    FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE CASCADE
)COMMENT 'Принтеры';

DROP TABLE IF EXISTS warehouse;
CREATE TABLE warehouse(
	id SERIAL PRIMARY KEY,
    type VARCHAR(50),
    model VARCHAR(50),
    quantity INT
)COMMENT 'Склад';

DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
	id SERIAL PRIMARY KEY,
    model_id BIGINT UNSIGNED,
    salesman VARCHAR(50),
    quantity INT,
    order_date DATETIME ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (model_id) REFERENCES warehouse(id) ON DELETE CASCADE
)COMMENT 'Заказы';












