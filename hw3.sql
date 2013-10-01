--Kelsey O'Brien
--9/25/13
--Queries HW 3

--1
select city
	from agents
	where aid in (
		select aid
			from orders
			where cid = 'c002'
			);

--2
select a.city
	from agents a, orders o
	where o.cid = 'c002'
	and o.aid = a.aid;

--3
select distinct pid
	from orders
	where aid in (select aid
			from orders o, customers c
			where o.cid = c.cid
			and c.city = 'Kyoto')
		order by pid

--4
select o2.pid
	from orders o1 inner join customers c on o1.cid = c.cid
			inner join orders o2 on o1.aid = o2.aid
	group by o2.pid, c.city
	having c.city = 'Kyoto'
	order by o2.pid
--5
select name
	from customers
	where cid not in(
		select cid
			from orders
		);

--6
select c.name
	from customers c left outer join orders o
		on o.cid = c.cid
	where o.cid is null;



--7
select distinct c.name as "Customer Name", a.name as "Agent Name"
	from customers c, agents a, orders o
	where c.city = a.city
	and c.cid = o.cid
	and a.aid = o.aid;

--8
select c.name as "Customer Name", a.name as "Agent Name", c.city as "City Name"
	from customers c, agents a
	where c.city = a.city;

--9	
select c.name, c.city, count(p.name)
	from customers c inner join products p on c.city = p.city
	group by c.city, c.name
	having count(p.name) = (select min("countProducts") 
				from (select c.name, c.city, count(p.name) as "countProducts"
					from customers c inner join products p on c.city = p.city
						group by c.city, c.name) sub1)				

--10



--11
select c.name, c.city, count(p.name)
	from customers c inner join products p on c.city = p.city
	group by c.city, c.name
	having count(p.name) = (select max("countProducts")
				from (select count(name) as "countProducts", city
						from products
						group by city) sub1)


--12
select name as "Product Name"
	from products
	where priceUSD > (select avg(priceUSD)
				from products);

--13
select c.name, o.pid, o.dollars
	from orders o, customers c
	where o.cid = c.cid
	order by dollars desc;

--14
select c.name, sum(dollars)
	from orders o inner join customers c on o.cid = c.cid
	group by c.name, c.cid
	order by c.name,
	coalesce(c.name)


--15
select c.name, p.name, a.name
	from orders o inner join agents a on o.aid = a.aid
		inner join customers c on o.cid = c.cid
		inner join products p on o.pid = p.pid
	group by o.ordno, a.aid, c.cid, p.pid
	having a.city = 'New York'

--16
create view "Calculations"
as 
select o.cid, o.pid, ((o.qty * p.priceUSD) - ((o.qty * p.priceUSD) * (c.discount * .01))) as "Calculated Total"
				from orders o left join products p on o.pid = p.pid
					left join customers c on o.cid = c.cid

select * from "Calculations"

select o.ordno as "Order Number", o.pid as "Product ID", o.dollars "Given Total", "Calculated Total"
	from orders o, "Calculations" c
	where o.cid = c.cid
	and o.pid = c.pid
	and o.dollars = "Calculated Total"

--17

--Orders for customer w/ cid = 'c004' should no longer show
update orders
set dollars = 500.00
where cid = 'c004'