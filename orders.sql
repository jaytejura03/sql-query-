-- (14) Create table as per following and solve the queries.
-- Table: Orders - Ord_no, purch_amt, ord_date, customer_id, salesman_id
-- i. Write a query to display the columns in a specific order like order date, salesman id,
-- order number and purchase amount from for all the orders.
-- ii. Write a query which will retrieve the value of salesman id of all salesman getting
-- orders from the customers in orders table without any repeats.
-- iii. Write a SQL query to display the order number followed by order date and the
-- purchase amount for each order which will be delivered by the salesman who is
-- holding the ID 5001.
-- iv. Write a query to display the orders according to the order number arranged by
-- ascending order

create table orders2 (
    ord_id number(6),
    purch_amt number(5),
    ord_date Date,
    customer_id number(10),
    salesman_id number(10)
);


-- TABLE: ORDERS

-- Ord_no   purch_amt   ord_date     customer_id   salesman_id
-- -------------------------------------------------------------
-- 70001    1500        2026-01-10   3001          5001
-- 70002    2500        2026-01-12   3002          5002
-- 70003    1200        2026-01-15   3003          5001
-- 70004    3000        2026-01-20   3004          5003
-- 70005    1800        2026-02-05   3005          5001
-- 70006    2200        2026-02-10   3001          5002
insert into orders2 values(70001,1500,TO_DATE('2026-01-10','yyyy-mm-dd'),3001,5001);
insert into orders2 values(70002,2500,TO_DATE('2026-01-12','yyyy-mm-dd'),3002,5002);
insert into orders2 values(70003,1200,TO_DATE('2026-01-15','yyyy-mm-dd'),3003,5001);
insert into orders2 values(70004,3000,TO_DATE('2026-01-20','yyyy-mm-dd'),3004,5003);
insert into orders2 values(70005,1800,TO_DATE('2026-02-05','yyyy-mm-dd'),3005,5001);
insert into orders2 values(70006,2200,TO_DATE('2026-02-10','yyyy-mm-dd'),3006,5002);

-- i. Write a query to display the columns in a specific order like order date, salesman id,
-- order number and purchase amount from for all the orders.

select ord_date,salesman_id,ord_id,purch_amt from orders2;

-- ii. Write a query which will retrieve the value of salesman id of all salesman getting
-- orders from the customers in orders table without any repeats.

select distinct salesman_id from orders2;

-- iii. Write a SQL query to display the order number followed by order date and the
-- purchase amount for each order which will be delivered by the salesman who is
-- holding the ID 5001.

select ord_id , ord_date ,purch_amt from orders2 where salesman_id = 5001;

SQL> select ord_id , ord_date ,purch_amt from orders2 where salesman_id = 5001;

--     ORD_ID ORD_DATE   PURCH_AMT
-- ---------- --------- ----------
--      70001 10-JAN-26       1500
--      70003 15-JAN-26       1200
--      70005 05-FEB-26       1800

-- iv. Write a query to display the orders according to the order number arranged by
-- ascending order

select * from orders2 ORDER BY ord_id ASC;


-- (15) Create tables as per following and solve the queries.
-- Table: Customer - C_id, cname, city, grade, salesman_id
-- Table: Salesman - Sid, name, city, commission
-- i. Write a query to display all the information for those customers with a grade of 200.
-- ii. Write a query to display all customers with a grade above 100.
-- iii. Write a query to display all customers in New York who have a grade value above
-- 100.
-- iv. Write a query to display all customers, who are either belongs to the city New York
-- or had a grade above 100.
-- v. Write a query to display customer name, city and grade in such a manner that the
-- customer holding highest grade will come first.
-- vi. Write a query to find out those customer name and salesman name who are

-- situated within the same city.

create table customer4(
    c_id number(5),
    cname varchar2(10),
    city varchar2(10),
    grade number(4),
    salesman_id number(5)
);
-- CUSTOMER TABLE

-- C_id   cname   city        grade   salesman_id
-- 3001   Amit    New York    200     5001
-- 3002   Ravi    London      150     5002
-- 3003   Neha    New York    80      5001
-- 3004   John    Paris       120     5003
-- 3005   Priya   London      200     5002
-- 3006   Sara    Paris       90      5003

insert into customer4 values(3001,'Amit','New York',200,5001);
insert into customer4 values(3002,'Ravi','London',150,5002);
insert into customer4 values(3003,'Neha','New York',80,5003);
insert into customer4 values(3004,'John','Paris',120,5004);
insert into customer4 values(3005,'Priya','London',200,5005);
insert into customer4 values(3006,'Sara','Paris',90,5006);


create table salesman4(
    Sid number(5), 
    name varchar2(10), 
    city varchar2(10), 
    commission number(5,2)
);
-- SALESMAN TABLE
-- Sid    name     city        commission
-- 5001   David    New York    0.15
-- 5002   James    London      0.12
-- 5003   Robert   Paris       0.10

insert into salesman4 values(5001,'David','New York',0.15);
insert into salesman4 values(5002,'James','London',0.12);
insert into salesman4 values(5003,'Robert','Paris',0.10);
-- i. CUSTOMERS WITH GRADE 200

select *from customer4 where grade = 200;

-- C_id   cname   city        grade   salesman_id
-- 3001   Amit    New York    200     5001
-- 3005   Priya   London      200     5002


-- ii. CUSTOMERS WITH GRADE ABOVE 100
select *from customer4 where grade > 100;
-- C_id   cname   city        grade   salesman_id
-- 3001   Amit    New York    200     5001
-- 3002   Ravi    London      150     5002
-- 3004   John    Paris       120     5003
-- 3005   Priya   London      200     5002


-- iii. CUSTOMERS IN NEW YORK WITH GRADE ABOVE 100
select *from customer4 where city = 'New York' and grade > 100;
-- C_id   cname   city        grade   salesman_id
-- 3001   Amit    New York    200     5001


-- iv. CUSTOMERS FROM NEW YORK OR WITH GRADE ABOVE 100
select *from customer4 where city = 'New York' or grade > 100;

--   C_ID CNAME      CITY            GRADE SALESMAN_ID
-- ------ ---------- ---------- ---------- -----------
--   3001 Amit       New York          200        5001
--   3002 Ravi       London            150        5002
--   3003 Neha       New York           80        5003
--   3004 John       Paris             120        5004
--   3005 Priya      London            200        5005



-- v. CUSTOMER NAME, CITY AND GRADE IN DESCENDING GRADE ORDER
SELECT cname ,city,grade from customer4 order by grade desc;
-- CNAME      CITY            GRADE
-- ---------- ---------- ----------
-- Amit       New York          200
-- Priya      London            200
-- Ravi       London            150
-- John       Paris             120
-- Sara       Paris              90
-- Neha       New York           80

-- 6 rows selected.

-- vi. CUSTOMERS AND SALESMEN IN THE SAME CITY
select c.cname as Customer_Name , s.name from  customer4 c inner join salesman4 s on c.city = s.city;
-- CUSTOMER_N NAME
-- ---------- ----------
-- Amit       David
-- Ravi       James
-- Neha       David
-- John       Robert
-- Priya      James
-- Sara       Robert

-- 6 rows selected.


  
