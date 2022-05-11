USE shop;


SELECT products.name, catalog_id, catalogs.name FROM products JOIN catalogs WHERE catalogs.id = products.catalog_id;