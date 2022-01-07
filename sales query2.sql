

create table orders(ord_no numeric(5) primary key, purch_amt decimal(8,2), ord_date date, customer_id numeric(5) references customer(customer_id), salesman_id numeric(5) references salesman(salesman_id))

drop table orders

insert into orders values(70001, 150.5, '2012-10-05', 3005, 5002)
insert into orders values(70002, 65.26, '2012-10-05', 3002, 5001)
insert into orders values(70004, 110.5, '2012-08-17', 3009, 5003)
insert into orders values(70007, 948.5, '2012-09-10', 3005, 5002)
insert into orders values(70005, 2400.6, '2012-07-27', 3007, 5001)
insert into orders values(70008, 5760, '2012-09-10', 3002, 5001)
insert into orders values(70010, 1983.43, '2012-10-10', 3004, 5006)
insert into orders values(70003, 2480.4, '2012-10-10', 3009, 5003)
insert into orders values(70012, 250.45, '2012-06-27', 3008, 5002)
insert into orders values(70011, 75.29, '2012-08-17', 3003, 5007)
insert into orders values(70013, 3045.6, '2012-04-25', 3002, 5001)

select * from orders

select avg(purch_amt) from orders
select max(purch_amt) from orders
select customer_id, max(purch_amt) from orders group by customer_id

select ord_no, ord_date, purch_amt from orders where salesman_id=5001

select ord_date, salesman_id, ord_no, purch_amt from orders
select name, city from salesman where city= 'Paris'
select name, commission from salesman 
