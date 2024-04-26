# MySQL for Data Analysis 
#​ SQL is the standard lagnuage for relation database management.
# Can load, query, and analyze massive data sets using SQL.

# Analyzing Single Tables 
# The Big 6 Elements of a SQL Statement 
 SELECT columnName,
FROM tableName
WHERE logicalCondition
GROUP BY columnName
HAVING logicalCondition
ORDER BY ColumnName */

-- The SELECT statemet : Identifies the columns you want your  query to select for your results.
-- SELECT columnName, otherColumnName
-- FROM : Identifies the tables your query will select data from
-- SELECT * FROM tells SQL to select all columns from the specified table
 -- Running SELECT * FROM {table} without using a WHERE clause will return the entire table (all columns, all rows)
 
 use mavenmovies;
 select * from rental;
 -- select data from multiple columns 
 select customer_id,rental_date 
 from rental; 
 
 # Assignment 
 # “I’m going to send an email letting our customers know there has been a management change.
# Could you pull a list of the first name, last name, and email of each of our customers?”
SELECT first_name, last_name , email 
FROM customer;

SELECT Distinct : Return just the distinct (or unique) values in those columns.
SELECT DISTINCT rating 
FROM film;

# Assignmnet : My understanding is that we have titles that we rent for durations of 3, 5, or 7 days.
# Could you pull the records of our films and see if there are any other rental durations?” 

SELECT DISTINCT rental_duration 
FROM film;

-- THE WHERE Clause
-- WHERE (optional) Specifies criteria for filtering the records of your result set
-- WHERE logicalCondition
-- WHERE clauses can filter records using any of these logical operators: = , < >,>,<,>=,<=,BETWEEN , LIKE , IN(Equals one of These Values)

SELECT 
customer_id,rental_id, amount , payment_date 
FROM payment 
WHERE amount=0.99*/

# Pulling records before or after a date , or between two dates 
SELECT customer_id,rental_id,amount,payment_date
FROM payment 
WHERE payment_date >'2006-01-01';*/

# Assignment : “I’d like to look at payment records for our long-term customers to learn about their purchase patterns.
# Could you pull all payments from our first 100 customers (based on customer ID)?”
select customer_id, rental_id,amount, payment_date 
from payment 
where customer_id<=100;*/

-- WHERE & AND 
select customer_id, rental_id,amount, payment_date 
from payment 
where amount =0.99 and payment_date>'2006-01-01'*/
-- Assignment 
# “The payment data you gave me on our first 100 customers was great – thank you!
# Now I’d love to see just payments over $5 for those same customers, since January 1, 2006.”
select customer_id,rental_id,amount,payment_date 
from payment 
where amount > 5 and payment_date>'2006-01-01';
select customer_id,rental_id,amount,payment_date 
from payment 
where customer_id=5 or customer_id=11 or customer_id=29;
# Assignment 
# “The data you shared previously on customers 42, 53, 60, and 75 was good to see.
#Now, could you please write a query to pull all payments from those specific customers, along with payments over $5, from any customer?”
select customer_id,rental_id,amount, payment_date 
from payment 
where  amount >5 and customer_id=42 or customer_id=53 or customer_id=60 and customer_id=75
-- anotheer way with WHERE & IN
select customer_id,rental_id,amount,payment_date 
from payment 
where amount>5 or customer_id IN (42,53,60,75)*/

# The LIKE OPERATOR 
# LIKE allows to use pattern matching in your logical operators (instead of exact of matching )
# LIKE 'Denise%' -starts with Denise with any number of characters after
# LIKE '%fancy% - records that contains 'fancy' with any characters before or after
# LIKE '%Johnson' - records that end with Johnson, with any number of characters before 
# LIKE '_erry' - records that end with 'erry' , with exactly one charcter before (i.e. Terry, Jerry)

/*select 
title,
description
from film
where description like '%Dentist%*/

-- Assignment
-- “We need to understand the special features in our films. Could you pull a list of films which include a Behind the Scenes special feature?”
select title,special_features 
from film
where special_features  like '%Behind the Scenes%';*/

-- The Group By Cluase : (Optional ) Specifies how to group the data in your results
-- Group by columnName, otherColumnName
-- Combine Group with aggregate functions like (COUNT or SUM ) to specify how values are summarized for each group 
select 
rating ,count(film_id)
from film
group by rating;
## Comments and Aliases 
SELECT 
rating,
COUNT(FILM_ID),
COUNT(FILM_ID) AS films_with_this_rating
FROM film
GROUP BY
rating;
-- ASSIGNMENT 
## I need to get a quick overview of how long our movies tend to be rented out for.
## Could you please pull a count of titles sliced by rental duration?”

SELECT rental_duration,
COUNT(FILM_ID) AS FILMS_WITH_THIS_RENTAL_DURATION
from film
group by rental_duration

-- Multiple Group By
select rating, rental_duration,
count(film_id ) as count_of_films
from film 
group by 
rating,rental_duration

-- Aggregate Functions :COUNT(),COUNT DISTINCT(),MIN(),MAX(),AVG(),SUM()
select 
rating, 
count(film_id) as count_of_films,
min(length) as shortest_film,
max(length) as longest_film,
avg(length) as average_length_of_film,
avg(rental_duration) as average_rental_duration
from film
group by rating
-- Assignment 
# “I’m wondering if we charge more for a rental when the replacement cost is higher.
# Can you help me pull a count of films, along with the average, min, and max rental rate, grouped by replacement cost?”
select 
replacement_cost,
count(film_id) as number_of_films,
min(rental_rate) as cheapest_rental,
max(rental_rate) as most_expensive_rental,
avg(rental_rate) as average_rental
from film
group by 
replacement_cost;

# THe HAVING CLAUSE 
# HAVING : (OPTIONAL) SPECIFIES GROUP-FILTERING CRITERIA FOR FILTERING YOUR RESULTS
# HAVING LOGICALCONDITION;
# Having only after Group by
select customer_id,
count(*) as total_rental
from rental
group by customer_id
having count(*)>=30

# Assignmnet 
## “I’d like to talk to customers that have not rented much from us to understand if there is something we could be doing better.
## Could you pull a list of customer_ids with less than 15 rentals all-time?”
select customer_id ,
count(*) as total_rentals
from rental
group by customer_id 
having count(*)<15;

# The Order By Cluase 
## ORDER BY (Optional) Specifies the order in which your query results are displayed
# ORDER BY columnName, otherColumnName
select customer_id,
rental_id, amount,payment_date 
from payment 
#group by customer_id 
order by amount desc;

# Assignment 
# “I’d like to see if our longest films also tend to be our most expensive rentals.
# Could you pull me a list of all film titles along with their lengths and rental rates, and sort them from longest to shortest?”
select title,length,rental_rate 
from film 
order by length desc;



