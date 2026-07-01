use
mydb;

-- 10 statements for updating.
Update addresses
set country = 'Turkey',
    city='Istanbul'
where id = 1;

Update contact_infos
set email='changed@gmail.com'
where id = 1;

Update customers
set name ='Nino'
where id = 1;

Update employees
set name='Gvantsa'
where id = 1;

Update online_markets
set name='Fake market'
where id = 1;

Update orders
set paid= true
where id = 1;

Update reviews
set score=7,
    comment = 'flower withered too quickly'
where id = 1;

Update problems
set description = 'solving this is not urgent'
where id = 1;

Update products
set price = 6.6
where id = 1;

Update sellers
set name='Nuca'
where id = 1;

-- 10 statements for deletions.
delete
from orders_has_products
where order_id = 1;
Delete
from orders_has_products
where product_id in (1, 3);
Delete
from orders
where customer_id = 1;
delete
from reviews
where product_id in (1, 3);
Delete
from reviews
where customer_id = 1;
Delete
from customers
where id = 1;
Delete
from employees
where id = 1;
Delete
from problems
where id = 1;
Delete
from products
where seller_id = 1;
Delete
from sellers
where id = 1;
Delete
from online_markets
where id = 1;
Delete
from addresses
where id = 1;
Delete
from contact_infos
where id = 1;

-- 1 big statement to join all tables in the database.
select om.id          as market_id,
       om.name        as market_name,
       om.founded_at_date,

       ci.id          as contact_id,
       ci.email,
       ci.phone_number,

       e.id           as employee_id,
       e.name         as employee_name,
       e.surname      as employee_surname,

       a.id           as address_id,
       a.country,
       a.city,
       a.street,
       a.zipCode,

       ps.id          as passport_id,
       ps.expiration_date,

       c.id           as customer_id,
       c.name         as customer_name,
       c.surname      as customer_surname,
       c.verified,

       o.id           as order_id,
       o.total_price,
       o.paid,
       o.created_at_date,

       pd.id          as product_id,
       pd.name        as product_name,
       pd.price,
       pd.stock,

       s.id           as seller_id,
       s.name         as seller_name,
       s.surname      as seller_surname,

       r.id           as review_id,
       r.score,
       r.comment,
       r.rated_at_date,

       pb.id          as problem_id,
       pb.title       as problem_title,
       pb.description as problem_description,
       pb.resolved
from online_markets om
         left join contact_infos ci
                   on om.contact_info_id = ci.id
         left join employees e
                   on om.id = e.online_market_id
         left join addresses a
                   on e.address_id = a.id
         left join passports ps
                   on e.passport_id = ps.id
         left join customers c
                   on om.id = c.online_market_id
         left join orders o
                   on c.id = o.customer_id
         left join orders_has_products ohp
                   on o.id = ohp.order_id
         left join products pd
                   on ohp.product_id = pd.id
         left join sellers s
                   on pd.seller_id = s.id
         left join reviews r
                   on pd.id = r.product_id
         left join problems pb
                   on om.id = pb.online_market_id
order by om.id asc, pd.id desc;

-- 5 statements with left, right, inner, full joins.
select c.id as customer_id,
       c.name,
       o.id as order_id,
       o.total_price
from customers c
         left join orders o
                   on c.id = o.customer_id;

select c.id as customer_id,
       c.name,
       o.id as order_id,
       o.total_price
from customers c
         right join orders o
                    on c.id = o.customer_id;

select c.id as customer_id,
       c.name,
       p.id as passport_id,
       p.expiration_date
from customers c
         cross join passports p;

select c.id as customer_id,
       c.name,
       o.id as order_id,
       o.total_price
from customers c
         inner join orders o
                    on c.id = o.customer_id;

select c.id as customer_id,
       c.name,
       o.id as order_id,
       o.total_price
from customers c
         left join orders o
                   on c.id = o.customer_id
union
select c.id as customer_id,
       c.name,
       o.id as order_id,
       o.total_price
from customers c
         right join orders o
                    on c.id = o.customer_id;

-- 7 statements with aggregate functions and group by and without having.
select online_market_id, count(*)
from customers c
group by online_market_id;

select seller_id, avg(price)
from products
group by seller_id;

select customer_id, sum(total_price)
from orders
group by customer_id;

select paid, count(*)
from orders
group by paid;

select product_id, avg(score)
from reviews
group by product_id;

select online_market_id, count(*)
from employees
group by online_market_id;

select resolved, count(*)
from problems
group by resolved;

-- 7 statements with aggregate functions and group by and with having.
select online_market_id, count(*)
from customers c
group by online_market_id
having count(*) > 0;

select seller_id, avg(price)
from products
group by seller_id
having avg(price) > 3;

select customer_id, sum(total_price)
from orders
group by customer_id
having sum(total_price) > 40;

select paid, count(*)
from orders
group by paid
having count(*) >= 1;

select product_id, avg(score)
from reviews
group by product_id
having avg(score) >= 8;

select online_market_id, count(*)
from employees
group by online_market_id
having count(*) > 0;

select resolved, count(*)
from problems
group by resolved
having count(*) >= 1;