/*View Table*/
select * from orders

/*No Of Orders*/
select count(*) from orders

/*No Of Orders From Each Restarant*/
select 
    Restaurant_id, 
    count(*) as number_of_orders 
from orders 
group by Restaurant_id

/*Number of orders each from each restaurant by cuisine*/
select 
    Restaurant_id,cuisine, count(*) no_of_cuisine from orders group by Restaurant_id, Cuisine  
ORDER BY Restaurant_id, Cuisine

/*Number Of Orders By Their Status*/
select Order_status, count(*) count from orders group by Order_status

/*Break of order status by Restraurant*/
select Order_status,Restaurant_id, count(*) count from orders group by Order_status, Restaurant_id

/*Orders Placed by Using Promo Code or not?*/
select 
    SUM(CASE WHEN Promo_code_Name IS NULL THEN 1 END) AS 'NULL', 
    SUM(CASE WHEN Promo_code_Name IS NOT NULL THEN 1 END) AS 'PROMO CODE ORDER' 
from orders 



/*1.	Find top 3 outlets by cuisine type without limit and top function*/
with cte as(select Restaurant_id,Cuisine,count(*) count from orders group by Restaurant_id,Cuisine)
,cte2 as(select *,ROW_NUMBER() over(partition by cuisine order by count) rn from cte)
select * from cte2 where rn<4

/*2.	Find the daily new customer count from launch date(Every day how many customers are we aquiring?)*/
select First_order_date,count(*) new_users from (select 
    Customer_code,
    cast(min(Placed_at) as date) as First_order_date
from orders
group by Customer_code)A
group by First_order_date

/*3. count all users who were aquired in Jan 2025 and only placed one order in Jan and did not place any other order*/
with cte as(select Customer_code, min(Placed_at) first_order_date from orders GROUP by Customer_code)
, jan_aquired_users as(select * from cte
where month(first_order_date) = 1 and year(first_order_date) = 2025
)
, customer_orders as(select Customer_code, count(*) as order_count from orders group by Customer_code)
select * from jan_aquired_users ju join customer_orders co on co.Customer_code = ju.Customer_code and order_count = 1

/*4.  List all the customer with no orders in last seven days but where aquired one month ago with their order on promo */
DECLARE @date DATE = getdate() ;

with cte as(
select 
    Customer_code, 
    min(Placed_at) first_order_date, 
    max(Placed_at) last_order_date 
from orders 
group by Customer_code
having 
    min(Placed_at) < dateadd(month,-1,@date) AND
    max(Placed_at) < dateadd(day,-7,@date))
select * from cte c join orders o on o.Customer_code = c.Customer_code and c.first_order_date=o.Placed_at
where o.Promo_code_Name is not null


/*5. Growth team is planning to create a trigger that will target customers after 
their every third order with personilized communication and they have asked you to create query for this*/

with cte as(select Order_id,Customer_code,Placed_at,ROW_NUMBER() over(PARTITION by customer_code order by Placed_at) rn from orders)
select * from cte where rn%3=0 and cast(Placed_at as date) = cast(getdate() as date)

/*6.  list all customer who made more than one order all all orders on promo only*/

select Customer_code,count(*) total_orders,count(Promo_code_Name) promo_orders from orders group by Customer_code
having COUNT(*) > 1 and COUNT(Promo_code_Name) = COUNT(*)

/*7. What percentage of cumtomer where organically required in jan 2025.(Placed their first order without any promo code)*/
with janmonthuser as (
select customer_code, min(Placed_at) first_order_date 
from orders 
group by Customer_code having month(min(Placed_at)) = 1 and year(min(Placed_at)) = 2025
)
, cte as(
select case when Promo_code_Name is null then 1 else 0 end as promo_orders from orders o join janmonthuser j on o.customer_code = j.customer_code
and first_order_date = Placed_at
)
select sum(promo_orders)*100.0/count(*) from cte
