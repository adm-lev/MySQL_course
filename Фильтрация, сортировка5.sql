USE shop;



TRUNCATE catalogs;




insert ignore into catalogs values
	(default, 'Процессоры'),
    (default, 'Матплаты'),
    (default, 'power supply'),
    (default, 'RAM'),
    (default, 'SSD'),
    (default, 'HDD'),
    (default, 'monitors'),
    (default, 'cases'),
    (default, 'keyboard'),
    
	(default, 'Видеокарты');

#ORDER BY FIELD(id, 3, 11, 7, 1)

SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5,1,2);
