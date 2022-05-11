USE shop;


CREATE VIEW name_cat
		AS SELECT p.name as 'Наименование', c.name as 'Раздел' 
		FROM shop.products p JOIN shop.catalogs c 
		ON p.catalog_id = c.id;


SELECT * FROM name_cat;





 