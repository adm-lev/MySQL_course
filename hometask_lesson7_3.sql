USE shop;



SELECT flights.id, flights.from, cities.name FROM flights JOIN cities WHERE flights.to = cities.label ORDER BY id;