-- THE CASE STATEMENT
# CASE : Allows you to process a series of IF/THEN logical operators in a specific order.
-- CASE WHEN logic1 THEN value1 WHEN logic2 THEN value2 ELSE value3 END
#### EXAMPLE 
/* CASE 
			WHEN category IN('horror','suspense')THEN 'too scary'
            WHEN length>90 THEN  'too long'
            ELSE 'we should see it'
END
# CASE STATEMENTS
-- CASE Statements allow you to use conditional logic to specify how your results should be calculates for various cases.*/
 -- use mavenmovies;
SELECT DISTINCT
length,
CASE 
WHEN length<60 THEN 'under 1 hr'
WHEN length BETWEEN 60 and 90 THEN '1-1.5 hrs'
WHEN length >90 THEN 'over 1.5 hrs'
ELSE 'Uh Oh....check logic !'
END AS length_bucket
FROM film*/

# CASE WITH ELSE 

SELECT DISTINCT 
length,
CASE 
WHEN length < 60 THEN 'Under 1 hr'
WHEN length< 90 THEN '1-1.5 hrs'
WHEN length>120 THEN 'Over 2 hrs'
ELSE 'uh oh...check logic!'
END AS LENGTH_BUCKET 
FROM Film*/

SELECT DISTINCT 
title,
CASE 
WHEN rental_duration<=4 THEN 'rental_too_expensive'
WHEN rental_rate>=3.99 THEN 'too_expensive'
WHEN rating IN('NC-17','R') THEN 'too_adult'
WHEN length NOT BETWEEN 60 AND 90 THEN 'too_short_or_too_long'
WHEN description LIKE '%Shark%' THEN 'nope_has_sharks'
ELSE  'great_reco_for_my_neice'
END AS fit_for_recommendation
FROM film */
-- Assignment

 # “I’d like to know which store each customer goes to, and whether or not they are active.
# Could you pull a list of first and last names of all customers, and label them as either ‘store 1 active’, ‘store 1 inactive’, ‘store 2 active’, or ‘store 2 inactive’?

use mavenmovies;
select first_name,last_name,
case 
when store_id=1 and active=1 then 'store 1 active'
when store_id=1 and active=0 then 'store 1 inactive'
when store_id=2 and active=1 then 'store 2 active'
when store_id=2 and active=0 then 'store 2 inactive'
else ' error'
end as store_and_status
from customer*/
-- CASE and COUNT
select 'film_id',
COUNT(CASE WHEN store_id=1 then inventory_id else null end) as store_1_copies,
COUNT(CASE WHEN store_id=2 then inventory_id else null end) as store_2_copies,
COUNT(inventory_id ) as total_copies
FROM inventory
GROUP BY film_id 
ORDER BY film_id;*/
/*“I’m curious how many inactive
customers we have at each store.
Could you please create a table to
count the number of customers broken down by store_id (in rows), and active status (in columns)?”*/

select store_id ,
count(case when active=1 then  store_id else null end)as active,
count(case when active=0  then store_id else null end)as inactive
from customer 
group by store_id
order by store_id



 

