# Introduction to SQL JOINs and Querying Multiple Tables
# N0rmalization & Cardinality
#Normalization-to minimize redundancy and preserve data integrity,Benefits:
# Eliminating duplicate data 
# Reducing erros and anomalies (restrictions around data structure help to prevent human errors)
#Duplicate - having two ids or two identical names and 

# INNER JOIN=Return records from BOTH tables when there is a match, and excludes unmatched records
# INNER JOIN rightTableName ON leftTable.columnName=rightTable.columnName
# Example:
/*
use mavenmovies;
FROM rental 
INNER JOIN customer 
ON rental.customer_id=customer.customer_id*/
/*select distinct 
		inventory.inventory_id 
from inventory 
			INNER JOIN rental
            on inventory.inventory_id=rental.inventory_id
limit 5000 *

select distinct 
rental.rental_id 
from inventory 
inner join rental
on inventory.inventory_id=rental.inventory_id
limit 5000*/


/*select distinct inventory_id 
from inventory
limit 5000;
select *
from inventory
where inventory_id=5*/
/*
select distinct
inventory.inventory_id,
rental.inventory_id
from inventory
inner join rental
on inventory.inventory_id=rental.inventory_id
limit 5000;*/
 # Assignment 
 # INNER JOIN=Return records from BOTH tables when there is a match, and excludes unmatched records
# INNER JOIN rightTableName ON leftTable.columnName=rightTable.columnName

#  “Can you pull for me a list of each
# film we have in inventory?
# I would like to see the film’s title, description, and the store_id value associated with each item, and its inventory_id. Thanks!”
/*
select 
inventory.inventory_id,
inventory.store_id,
film.title,
film.description
from inventory
inner join film
on film.film_id=inventory.film_id
limit 5000*/

# LEFT JOIN :Returns all records from the LEFT table,and any matched records from the RIGHT table
# LEFT JOIN rightTableName ON leftTable.columnName=rightTable.columnName
# In this example, we are looking for a count of all films in which each actor appeared
/*
select 
actor.first_name,
actor.last_name,
count(film_actor.film_id) as number_of_films
from actor
left join film_actor
on actor.actor_id=film_actor.actor_id
group by 
actor.first_name,
actor.last_name*/
-- select distinct inventory_id from inventory limit 5000
/*
select distinct inventory.inventory_id,
rental.inventory_id
from inventory
inner join rental
on inventory.inventory_id=rental.inventory_id
limit 5000;*/

-- Assignment 
 -- “One of our investors is interested in the films we carry and how many actors are listed for each film title.
-- Can you pull a list of all titles, and figure out how many actors are associated with each title?”
/*
select film.title,
count(film_actor.actor_id) as number_of_actors
from film
left join film_actor
on film.film_id=film_actor.film_id
group by 
film.title;*/

-- RIGHT JOIN Returns all recvords from the RIGHT table, and any matched records from the LEFT table
-- RIGHT JOIN rightTableName ON leftTable.columnName=rightTable.columnName

-- select * from actor
-- select * from actor_award

# Bridging    
   -- When you need to connect two tables which do not directly relate, look for a third table containing keys common to both; this can serve as a “bridge” to join your tables together.
   -- Here we have no key to connect the customer table directly to city, but we can join customer to address (using address_id), and address to city (using city_id). 
--  In this case the address table serves as our bridge.
/*
select
 film.film_id,
film.title,
film_category.category_id,
category.name

from film
inner join film_category
on film.film_id=film_category.film_id
inner join category 
on film_category.category_id=category.category_id
order by film_id*/

-- Assignemnt 
-- “Customers often ask which films
-- their favorite actors appear in.
-- It would be great to have a list of all actors, with each title that they appear in. Could you please pull that for me?”

# actor fist_name,last_name in actor table :actor_id
# title in film,key:film_id
#film_actor keys:actor_id,film_id
/*
use mavenmovies;
select actor.first_name,
actor.last_name,
film.title
from actor 
inner join film_actor on actor.actor_id=film_actor.actor_id
inner join film on film_actor.film_id=film.film_id
order by actor.first_name,
actor.last_name*/

-- Assignemnt 
-- “Customers often ask which films
-- their favorite actors appear in.
-- It would be great to have a list of all actors, with each title that they appear in. Could you please pull that for me?”
/*
select actor.first_name,
actor.last_name,
film.title
from actor
inner join film_actor
on actor.actor_id=film_actor.actor_id
inner join film
on film_actor.film_id=film.film_id
order by actor.first_name,
actor.last_name*/
/*
select 
film.film_id,
film.title,
film.rating,
category.name
from film
inner join film_category
on film.film_id=film_category.film_id
inner join category on film_category.category_id=category.category_id
where category.name='horror'
order by film_id

select 
film.film_id,
film.title,
film.rating,
category.name
from film inner join film_category on film.film_id=film_category.film_id
inner join category
on film_category.category_id=category.category_id
and category.name='horror'
order by film_id*/

/*Assignment
“The Manager from Store 2 is working on expanding our film collection there.
Could you pull a list of distinct titles and their descriptions, currently available in inventory at store 2?”*/
/*
select distinct film.title,
film.description
from film 
inner join inventory on film.film_id=inventory.film_id
and inventory.store_id=2*/

/*Assignment
“The Manager from Store 2 is working on expanding our film collection there.
Could you pull a list of distinct titles and their descriptions, currently available in inventory at store 2?”

select distinct film.title,
film.description
from film
inner join inventory on film.film_id=inventory.film_id
and inventory.store_id=2*/

# UNION: A Different Way to Combine Tables
# Returns all data from the FIRST table,with all data from the SECOND table appended to the end 
#UNION SELECT sameCOlumnName FROM secondTableName
/* Example 
select first_name,last_name FROM advisor 
union 
slect first_name,last_name from investor */
/*
select 'advisor' as type,
first_name,
last_name
from advisor
union
select 'investor' as type,
first_name,
last_name
from investor

select 'advisor' as type,
first_name,
last_name
from advisor
union
select
'investor' as type,
first_name,
last_name
from investor*/

/*Assignment
“We will be hosting a meeting with
all of our staff and advisors soon.
Could you pull one list of all staff and advisor names, and include a column noting whether they are a staff member or advisor? Thanks!”*/
/*
select 'advisor' as type,
first_name,last_name
from advisor
union
select 'staff' as type,
first_name,
last_name
from staff*/

/*Assignment
“We will be hosting a meeting with
all of our staff and advisors soon.
Could you pull one list of all staff and advisor names, and include a column noting whether they are a staff member or advisor? Thanks!”*/

select 'advisor' as type,
first_name,
last_name
from advisor
union
select 'staff' as type,
first_name,
last_name
from staff

























































