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

  
