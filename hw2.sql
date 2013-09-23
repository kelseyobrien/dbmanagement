--Kelsey O'Brien
--HW 2
--9/18/13

--1
SELECT city
	FROM agents
	WHERE aid in (
		SELECT aid
			FROM orders
			WHERE cid = 'c002'
			);

--2
SELECT pid
	FROM orders
	WHERE aid in (
		SELECT aid
			FROM orders
			WHERE cid in (
				SELECT cid
				FROM customers
				WHERE city = 'Kyoto'
				)
			);

--3
SELECT cid, name
	FROM customers
	WHERE cid NOT in (
		SELECT cid
			FROM orders
			WHERE aid = 'a03'
			);

--4
SELECT cid, name
	FROM customers
	WHERE cid in (
		SELECT cid
			FROM orders
			WHERE pid = 'p01'
			)
	AND cid in (
		SELECT cid
			FROM orders
			WHERE pid = 'p07'
			);

--5
SELECT pid
	FROM orders
	WHERE cid in (
		SELECT cid
			FROM orders
			WHERE aid = 'a03'
			);

--6
SELECT name, discount
	FROM customers
	WHERE cid in (
		SELECT distinct cid
			FROM orders
			WHERE aid in (
				SELECT aid
					FROM agents
					WHERE city = 'Dallas'
					OR    city = 'Duluth'
					)
			);

--7
SELECT * 
	FROM customers
	WHERE cid NOT in (
		SELECT cid
			FROM customers
			WHERE city = 'Dallas'
			OR    city = 'Kyoto'
			)
	AND discount in (
		SELECT discount			
			FROM customers
			WHERE city = 'Dallas'
			OR    city = 'Kyoto'
			);

			