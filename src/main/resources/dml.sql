USE
mydb;

insert into contact_infos(email, phone_number)
values ('first@mail.com', '+995555555555');

insert into contact_infos(email, phone_number)
values ('second@mail.com', '+995566666666');

insert into contact_infos(email, phone_number)
values ('flower@mail.com', '+995555555555');

insert into contact_infos(email, phone_number)
values ('clock@mail.com', '+995566666666');

insert into addresses(country, city, street, zipCode)
values ('Georgia', 'Tbilisi', 'Agmasheneblis 10', '0000');

insert into addresses(country, city, street, zipCode)
values ('Georgia', 'Tbilisi', 'Agmasheneblis 12', '0000');

insert into addresses(country, city, street, zipCode)
values ('Georgia', 'Tbilisi', 'Agmasheneblis 16', '0000');

insert into addresses(country, city, street, zipCode)
values ('Georgia', 'Tbilisi', 'Agmasheneblis 19', '0000');

insert into passports(expiration_date)
values ('2026-07-01');

insert into passports(expiration_date)
values ('2027-07-01');

insert into passports(expiration_date)
values ('2026-08-01');

insert into passports(expiration_date)
values ('2027-08-01');

insert into online_markets(name, founded_at_date, contact_info_id)
values ('Flower shop', '2026-07-01 14:35:42', 3);

insert into online_markets(name, founded_at_date, contact_info_id)
values ('Clock shop', '2026-07-01 14:35:42', 4);

insert into customers(name, surname, verified, online_market_id, contact_info_id, address_id, passport_id)
values ('Nana', 'Iremashvili', true, 1, 1, 1, 1);

insert into customers(name, surname, verified, online_market_id, contact_info_id, address_id, passport_id)
values ('Irakli', 'Tyesheladze', true, 2, 2, 2, 2);

insert into sellers(name, surname, online_market_id, contact_info_id, passport_id)
values ('Leila', 'Rustamova', 1, 3, 3);

insert into sellers(name, surname, online_market_id, contact_info_id, passport_id)
values ('Radmila', 'Shamilova', 2, 4, 4);

insert into employees(name, surname, online_market_id, contact_info_id, address_id, passport_id)
values ('Barbare', 'Gelashvili', 1, 3, 3, 3);

insert into employees(name, surname, online_market_id, contact_info_id, address_id, passport_id)
values ('Elene', 'Berdzenishvili', 2, 4, 4, 4);

insert into products(name, price, stock, seller_id)
values ('Pink Rose', 3.7, 500, 1);

insert into products(name, price, stock, seller_id)
values ('old Clock', 23.5, 250, 2);

insert into products(name, price, stock, seller_id)
values ('Red Rose', 3.5, 500, 1);

insert into orders(total_price, paid, created_at_date, customer_id)
values (43.6, true, '2026-07-01 14:35:42', 1);

insert into orders(total_price, paid, created_at_date, customer_id)
values (55.7, true, '2026-07-01 14:35:42', 2);

insert into reviews(score, comment, rated_at_date, product_id, customer_id)
values (10, 'Really good service and perfect product', '2026-07-01 14:35:42', 1, 1);

insert into reviews(score, comment, rated_at_date, product_id, customer_id)
values (7, 'Really good service but kind of used product', '2026-07-01 14:35:42', 2, 2);

insert into problems(title, description, resolved, online_market_id)
values ('Cant Purchase balbs when its restocked', 'Cant add balbs to cart, when its restocked', true, 1);

insert into problems(title, description, resolved, online_market_id)
values ('Broken clocks in warehouse', 'Clients say theres broken products', false, 2);

insert into orders_has_products(order_id, product_id)
values (1, 1);

insert into orders_has_products(order_id, product_id)
values (2, 3);

insert into orders_has_products(order_id, product_id)
values (1, 2);
