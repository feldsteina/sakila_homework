use sakila;

select first_name as "First Name", last_name as "Last Name"
from actor;

select concat(
	upper(first_name),
    " ",
    upper(last_name)
)
as "Actor Name"
from actor;

select actor_id as "Actor ID", first_name as "First Name", last_name as "Last Name"
from actor
where first_name = "Joe";

select first_name as "First Name", last_name as "Last Name"
from actor
where last_name
like "%gen%";

select first_name as "First Name", last_name as "Last Name"
from actor
where last_name
like "%li%"
group by last_name, first_name;

select country_id as "Country ID", country as "Country"
from country
where country
in ("Afghanistan", "Bangladesh", "China");

alter table actor
add column description blob after last_update;

alter table actor
drop column description;

select last_name as "Last Name", count(last_name) as "People with this Last Name"
from actor
group by last_name;

select last_name as "Last Name", count(last_name) as "People with this Last Name"
from actor
group by last_name
having count(last_name) >= 2;

update actor
set first_name = "HARPO"
where first_name = "groucho"
and last_name = "Williams";

update actor
set first_name = "GROUCHO"
where first_name = "Harpo"
and last_name = "Williams";

show create table actor;

select s.first_name as "First Name", s.last_name as "Last Name", a.address as "Address"
from staff as s
join address as a
on s.address_id = a.address_id;

select s.first_name as "First Name", s.last_name as "Last Name", sum(p.amount) as "Total Payment"
from staff as s
join payment as p
on s.staff_id = p.staff_id
where payment_date >= "2005-08-01 00:00:00"
and payment_date < "2005-09-01 00:00:00"
group by s.staff_id;

select f.title as "Title", count(fa.actor_id) as "Number of actors"
from film as f
inner join film_actor as fa
on f.film_id = fa.film_id
group by f.film_id;

select f.title as "Title", count(i.film_id) as "Number in inventory"
from inventory as i
join film as f
on i.film_id = f.film_id
where f.title = "Hunchback Impossible";

select c.first_name as "First Name", c.last_name as "Last Name", sum(p.amount) as "Total amount paid"
from customer as c
join payment as p
on c.customer_id = p.customer_id
group by c.last_name;

select title as "Title"
from film
where (title like "k%" or title like "q%") and language_id in (
	select language_id
    from language
    where name = "English"
);

select first_name as "First Name", last_name as "Last Name"
from actor
where actor_id in (
	select actor_id
	from film_actor
	where film_id in (
		select film_id
		from film
		where title = "Alone Trip"
	)
);

select cu.first_name as "First Name", cu.last_name as "Last Name", cu.email as "Email"
from customer as cu
join address as a
on cu.address_id = a.address_id
join city as ci
on a.city_id = ci.city_id
join country as co
on ci.country_id = co.country_id
where co.country = "Canada";

select f.title as "Title"
from film as f
where film_id in (
	select fc.film_id
    from film_category as fc
    where category_id in (
		select c.category_id
        from category as c
        where c.name = "Family"
    )
);

select f.title, count(f.title)
from film as f
join inventory as i
on f.film_id = i.film_id
join rental as r
on i.inventory_id = r.inventory_id
group by title
order by count(f.title) desc;

select sto.store_id as "Store ID", sum(p.amount) as "Total income"
from store as sto
join staff as sta
on sto.store_id = sta.store_id
join payment as p
on sta.staff_id = p.staff_id
group by sto.store_id;

select * from store;
select * from address;
select * from city;
select * from country;

select s.store_id as "Store ID", ci.city as "City", co.country as "Country"
from store as s
join address as a
on s.address_id = a.address_id
join city as ci
on a.city_id = ci.city_id
join country as co
on ci.country_id = co.country_id;

