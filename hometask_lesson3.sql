USE vk;
DROP TABLE IF EXISTS gifts;
CREATE TABLE gifts(
	id SERIAL,
    gift_type JSON,
    from_user_id BIGINT UNSIGNED NOT NULL,
    to_user_id BIGINT UNSIGNED NOT NULL,
    gift_cost INT,
    
    FOREIGN KEY (from_user_id) REFERENCES users(id),
    FOREIGN KEY (to_user_id) REFERENCES users(id) 
	
)COMMENT='Подарки';

DROP TABLE IF EXISTS mood;
CREATE TABLE mood(
	id SERIAL,
    user_id BIGINT UNSIGNED NOT NULL,
    message VARCHAR(100),	
    
    FOREIGN KEY (user_id) REFERENCES users(id)
)COMMENT='Настроение(статус дня)';

DROP TABLE IF EXISTS vallet;
CREATE TABLE vallet(
	id SERIAL,
    user_id BIGINT UNSIGNED NOT NULL,
    value INT,
    
    FOREIGN KEY (user_id) REFERENCES users(id)
	
)COMMENT='Кошелек';