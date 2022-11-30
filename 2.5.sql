-- LAB 1
-- 1 Select all the actors with the first name ‘Scarlett’.

Select *
from actor
where first_name="Scarlett";

-- 2 How many films (movies) are available for rent and how many films have been rented?
select count(distinct title)
from film;

select count(rental_id)
from rental;

-- 3 What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select MIN(length) as "min_duration", MAX(length) as "max_duration"
from film;

-- 4 What's the average movie duration expressed in format (hours, minutes)?

SELECT left((AVG(length) / 60),1)  AS hours, ROUND(AVG(length) % 60,0) AS minutes
FROM film;

-- 5 How many distinct (different) actors' last names are there?
Select count(distinct last_name)
from actor;

-- 6 Since how many days has the company been operating (check DATEDIFF() function)?

select DATEDIFF(left(MAX(last_update),10), LEFT(MIN(payment_date),10)) as "operating years"
from payment;

-- 7 Show rental info with additional columns month and weekday. Get 20 results.
SELECT * , date_format(rental_date, '%M') AS 'month', date_format(rental_date, '%a') AS 'weekday'
 FROM rental;

-- 8 Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT * , date_format(rental_date, '%M') AS 'month', date_format(rental_date, '%a') AS 'weekday',
  CASE
  WHEN date_format(rental_date, '%a') = 'Sat' or 'Sun' then 'Weekend'
  WHEN date_format(rental_date, '%a') != 'Sat' or 'Sun' then 'Weekday'
  ELSE 'No status'
  END AS 'day_type'
  FROM rental;

-- 9 Get release years.
select distinct(release_year)
FROM film;

-- 10 Get all films with ARMAGEDDON in the title.
select distinct(release_year)
FROM film;

-- 11 Get all films which title ends with APOLLO.
SELECT *
    FROM film
    WHERE title LIKE '%APOLLO';

-- 12 Get 10 the longest films.
SELECT title
FROM film
ORDER BY length ASC
LIMIT 10;

-- 13 How many films include Behind the Scenes content?
SELECT COUNT(title)
FROM film
WHERE special_features LIKE '%Behind the Scenes%';