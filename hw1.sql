--Kelsey O'Brien
--Homework 1
--9/9/13

SELECT * FROM customers;

SELECT name, city FROM agents WHERE name='Smith';

SELECT pid, name, quantity FROM products WHERE priceUSD>1.25;

SELECT ordno, aid FROM orders;

SELECT name, city FROM customers WHERE city<>'Dallas';

SELECT name FROM agents WHERE city='New York' OR city='Newark';

SELECT * FROM products WHERE city<>'New York' AND city<>'Newark' AND priceUSD<=1.00;

SELECT * FROM orders WHERE mon='jan' OR mon='mar';

SELECT * FROM orders WHERE mon='feb' AND dollars<100.00;

SELECT * FROM orders WHERE cid='c005';