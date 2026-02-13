create schema practice_table

use practice_table

create table customer(
cum_id int , 
cum_name varchar (100),
city varchar(100),
email varchar(100),
join_date varchar(100)
)

insert into customer 
values(1,'arun','chennai','arun@gmail.com','2023-01-10'),
(2,'divya','bangalore','divya@yahoo.com','2022-12-15'),
(3,'karthik','munbai','karthik@gmail.com','2023-05-12'),
(4,'meena','delhi','meena@outlook.com','2021-08-25'),
(5,'ravi','chennai','ravi@gmail.com','2023-03-18'),
(6,'sneha','hyderabad','sneha@gmail.com','2022-11-30'),
(7,'ajay','bangalore','ajay@yahoo.com','2023-06-01'),
(8,'priya','mumbai','priya@gmail.com','2021-07-14'),
(9,'vikram','chennai','vikaram@gmail.com','2023-02-20'),
(10,'neha','pune','neha@gmail.com','2022-09-09')



create table order_details(
order_id int,
cum_id int,
order_date varchar(100),
order_atm int,
order_stus varchar(100)
)


insert into order_details
values(101,1,'2023-06-01',12000,'completed'),
(102,1,'2023-06-15',8000,'pending'),
(103,2,'2023-05-20',22000,'completed'),
(104,3,'2023-04-10',15000,'completed'),
(105,3,'2023-07-05',30000,'completed'),
(106,4,'22023-03-12',5000,'cancelled'),
(107,5,'2023-06-25',18000,'completed'),
(108,6,'2023-02-14',7000,'pending'),
(109,7,'2023-07-01',25000,'completed'),
(110,8,'2023-01-30',9000,'completed'),
(111,9,'22023-06-18',16000,'completed'),
(112,9,'2023-06-28',14000,'pending'),
(113,10,'2023-05-05',6000,'completed'),
(114,null,'2023-05-15',11000,'completed'),
(115,2,'2023-07-10',19500,'completed')




create table product(
product_id int,
product_name varchar(100),
category varchar(100),
price int
)

insert into product
values(201,'laptop','electronics',55000),
(202,'mobile','electronics',25000),
(203,'headphones','electronics',3000),
(204,'chair','Furniture',4500),
(205,'table','Furniture',8500),
(206,'pen','Stationery',50),
(207,'notebook','Stationery',120),
(208,'printer','electronics',18000)

create table item (
item_id int,
order_id int,
product_id int,
quantity int
)

insert into item 
values(1,101,202,1),
(2,101,203,2),
(3,102,206,10),
(4,103,201,1),
(5,103,203,1),
(6,104,202,1),
(7,105,201,2),
(8,106,207,5),
(9,107,204,2),
(10,107,205,1),
(11,108,206,20),
(12,109,202,1),
(13,109,208,1)

insert into item 
values(14,110,203,3),
(15,111,205,2),
(16,112,207,10),
(17,113,206,15),
(18,114,204,1),
(19,115,202,1),
(20,115,203,2)

create table employee (
emp_id int,
emp_name varchar(100),
manager_id int,
dpt varchar(100),
salary int
)

insert into employee 
values (1,'ramesh',null,'management',90000),
(2,'suresh',1,'sales',60000),
(3,'mahesh',1,'it',65000),
(4,'anita',2,'sales',45000),
(5,'kiran',2,'sales',48000),
(6,'priya',3,'it',52000),
(7,'vijay',3,'it',50000),
(8,'neethu',null,'hr',55000)

update order_details set order_date = '2023-06-18' where order_id = 111

1
select cum_name,join_date as joining from customer 
where join_date > '2023-01-01'
2
select distinct city from customer
3
select * from customer where email like '%@gmail.com'
4
select * from customer where city = 'chennai' or city = 'bangalore'
5
select * from customer where join_date between '2022-01-01' and '2023-06-01'
6
select * from customer order by join_date desc
7
select cum_name as client_name from customer
8
select * from order_details where order_atm > 15000
9
select * from order_details where order_stus = 'completed' and order_date like '2023-06%'
10
select * from order_details order by order_atm desc limit 5
11
select * from order_details where order_stus = 'pending' or order_stus = 'cancelled'
12
select *,
case
when order_atm >= 20000 then 'high'
when order_atm between 10000 and 19999 then 'medium'
when order_atm < 10000 then 'low'
else 'no amount'
end price_range
from order_details
13
select * from order_details where cum_id is null
14
select * from product where category = 'electronics'
15
select * from product where price between 5000 and 30000
16
select product_name,price from product
group by product_name,price
having price = max(price) limit 1
17
select category,count(*) as product_count 
from product group by category
18
select * from product order by price desc
19
select product_id,sum(quantity) as total_quantity
from item group by product_id
order by product_id asc
20
select product_id,sum(quantity) as total_quantity
from item group by product_id
having total_quantity > 3
21
select order_id,sum(quantity) as total_items
from item group by order_id
22
select c.cum_name,r.order_date,order_atm from customer 
as c right join order_details as r
on c.cum_id = r.cum_id 
23
select c.cum_name from customer as c
left join order_details as r
on c.cum_id = r.cum_id 
where r.order_id is null
24
select * from customer 
as c right join order_details as r
using (cum_id)
-- where c.cum_id is null
25
select * from customer as c
right join order_details as r
using (cum_id)
26
select r.order_id,i.quantity, p.product_name
from order_details as r right join 
item as i on r.order_id = i.order_id
left join product as p 
on p.product_id = i.product_id
27
select p.product_name,sum(p.price*i.quantity) as total_sale
from order_details as r right join 
item as i on r.order_id = i.order_id
left join product as p 
on p.product_id = i.product_id
group by p.product_name
28
select p.category,sum(quantity) as total_quantity
from order_details as r right join 
item as i on r.order_id = i.order_id
left join product as p 
on p.product_id = i.product_id
group by p.category
29
select p.product_name,max(i.quantity*p.price) as highest_revenue
from order_details as r right join 
item as i on r.order_id = i.order_id
left join product as p 
on p.product_id = i.product_id 
group by p.product_name 
order by highest_revenue desc limit 1 
30
select e.emp_name,
case 
when e.manager_id is not null then s.emp_name
else 'no manager'
end as manager_name
from employee as e left join
employee as s 
on e.manager_id = s.emp_id 
31
select * from employee where manager_id is null
32
select e.emp_name,
s.emp_name as m_name
from employee as e left join 
employee as s
on e.manager_id = s.  emp_id 
where s.emp_name = 'suresh'
33
select c.cum_name,
sum(i.quantity*p.price) as total_order_atm
from order_details as r
right join item as i 
on r.order_id = i.order_id
left join product as p 
on p.product_id = i.product_id
left join customer as c
on c.cum_id = r.cum_id
group by c.cum_name
34
select c.cum_name,sum(i.quantity*p.price) as total_order_atm
from order_details as r
right join item as i 
on r.order_id = i.order_id
left join product as p 
on p.product_id = i.product_id
left join customer as c
on c.cum_id = r.cum_id
group by c.cum_name
having total_order_atm > 25000
35
select c.city,avg(i.quantity*p.price) as total_order_atm
from order_details as r
right join item as i 
on r.order_id = i.order_id
left join product as p 
on p.product_id = i.product_id
left join customer as c
on c.cum_id = r.cum_id
group by c.city
having total_order_atm > 15000

36
SELECT 
    c.cum_name,
    COUNT(DISTINCT r.order_id)       AS total_orders,
    SUM(i.quantity)                  AS total_items,
    SUM(i.quantity * p.price)        AS total_amount
FROM customer c
JOIN order_details r ON c.cum_id = r.cum_id
JOIN item i ON r.order_id = i.order_id
JOIN product p ON i.product_id = p.product_id
GROUP BY c.cum_name;

37
select c.cum_name  from customer as c
where exists (
select 1 from item as i left join
product as p using(product_id)
where c.cum_id = i.cum_id
group by c.cum_id
having count(r.order_id) > 1
)

38
select c.cum_name
from customer c
join order_details o
on c.cum_id = o.cum_id
group by  c.cum_name
having count(o.order_id) > 1;

39
select c.cum_name
from customer c
join order_details o on c.cum_id = o.cum_id
join item i on o.order_id = i.order_id
group by c.cum_id, c.cum_name
having count(distinct o.order_id) > 1;









