create database marketing2

create table customer(customer_id numeric(5) primary key, cust_name varchar(100), city varchar(100), grade numeric(3), salesman_id numeric(5) references salesman(salesman_id))

drop table customer

insert into customer values(3002, 'Nick Rimando', 'New York', 100, 5001)
insert into customer values(3007, 'Brad Davis', 'New York', 200, 5001)
insert into customer values (3005, 'Graham Zusi', 'California', 200, 5002)
insert into customer values(3008, 'Julian Green', 'London', 300, 5002)
insert into customer values(3004, 'Fabian Johnson', 'Paris', 300, 5006)
insert into customer values(3009, 'Geoff Cameron', 'Berlin', 100, 5003)
insert into customer values(3003, 'Jozy Altidor', 'Moscow', 200, 5007)

select * from customer
select count(distinct salesman_id) from orders

select count(customer_id) from customer
select city, max(grade) from customer group by city

select customer_id, cust_name, city, grade, salesman_id from customer where grade=200