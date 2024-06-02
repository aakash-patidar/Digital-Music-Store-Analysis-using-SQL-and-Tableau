/* 1. Who is the senior most employee based on job title */

SELECT
  employee_id,
  last_name,
  first_name,
  title,
  levels 
FROM
  `alien-program-424600-g6.Music_store.employee`
ORDER BY
  levels DESC
LIMIT 1
  

/* 2. Which countries have the most Invoices */

SELECT
  billing_country,
  COUNT(*) AS count_countries
FROM
  `alien-program-424600-g6.Music_store.invoice`
GROUP BY
  billing_country
ORDER BY
  count_countries DESC
  

/* 3. What are top 3 values of total invoice */

SELECT
  total
FROM
  `alien-program-424600-g6.Music_store.invoice`
ORDER BY
  total DESC
LIMIT 3


/* 4. Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals */

SELECT
  billing_city,
  SUM(total) AS invoice_total
FROM
  `alien-program-424600-g6.Music_store.invoice`
GROUP BY
  billing_city
ORDER BY
  invoice_total DESC




















