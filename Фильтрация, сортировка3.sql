USE SHOP;


TRUNCATE storehouses_products;

INSERT INTO storehouses_products(value) VALUES (RAND()*1000),(0),(RAND()*1000),(0),(RAND()*1000),(RAND()*1000),(RAND()*1000);

SELECT * FROM storehouses_products;

SELECT 
	*
FROM 
	`storehouses_products` 
ORDER BY 
	IF(`value` > 0, 1, 2), `value`;


#SELECT * FROM storehouses_products;
