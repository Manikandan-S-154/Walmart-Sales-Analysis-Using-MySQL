-- --------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------Walmart Sales Analysis Project-------------------------------------------------------------------
-- -------------------------------------time_of_date column upodate----------------------------------------------------------------------
update sales set time_of_date=(
CASE
        WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END
);

select * from sales;
 

-- --------------------------------------day_name---------------------------------------------------------------------------------------

select date ,dayname(date) as day_name from sales;


alter table sales add column day_name varchar(10);


update sales set day_name=dayname(date);

select * from sales;

-- ------------------------------------month_name--------------------------------------------------------------------------------------

select date ,monthname(date) as day_name from sales;


alter table sales add column month varchar(10);



update sales set month=monthname(date);

select * from sales;



-- --------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------- -------------------------Generic------------------------------------------------------------------------

-- ---------------------------------------------------how many unique cities------------------------------------------------------------
select distinct city from sales;




-- -----------unique branches---------
select distinct branch,city from sales;


-- -----------------------------------------------------------------------------------------------------------------------------------


-- ------------------------------------------------------product-----------------------------------------------------------------------

-- how many unique product lines?--------------

select count(distinct product_line) from sales;


-- ----------most common payment method---------

select count(payment_method),payment_method as cunt from sales group by(payment_method) order by cunt desc ; 






--   what is most selling product line?----------

select count(product_line),product_line from sales group by(product_line) order by count(product_line) desc ;


-- --total revenue by month----------------------



select sum(total),month from sales group by(month) order by month desc; 





--  what month has largest COGS?-----------------


select month,sum(cogs) from sales group by(month) order by month desc;


-- what product line had the largest revenue ?---


select product_line,sum(total) from sales group by product_line order by sum(total) desc limit 1;



--  city with largest revenue--------------------



select city,sum(total) from sales group by city order by sum(total) desc limit 1;


-- product_line with largest VAT?-----------------


select product_line,sum(VAT) from sales group by product_line order by sum(VAT) desc limit 1;



-- what is average rating of each product---------

select round(avg(rating),2),product_line from sales group by product_line order by avg(rating) desc limit 1;



-- which branch sold more products than average productsold?


select branch,sum(quantity) from sales group by(branch) having sum(quantity)>(select avg(quantity) from sales);


-- what is the most common product line by gender?-------------

select count(gender),gender,product_line from sales group by gender,product_line order by count(gender) desc;