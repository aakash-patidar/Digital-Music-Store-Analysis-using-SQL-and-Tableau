/* 1. Who is the senior most employee based on job title */

SELECT
  employee_id,
  CONCAT(first_name, ' ', last_name) AS name,
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
  COUNT(*) AS count_invoice
FROM
  `alien-program-424600-g6.Music_store.invoice`
GROUP BY
  billing_country
ORDER BY
  count_invoice DESC

  

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


  
/* 5. Who is the best customer? The customer who has spent the most money will be declared the best customer. Write a query that returns the person who has spent the most money */

-- Checking to see which column names are common between the customer and invoice tables

SELECT
  column_name
FROM
  `alien-program-424600-g6.Music_store.INFORMATION_SCHEMA.COLUMNS`
WHERE
  table_name IN ('customer', 'invoice')
GROUP BY
  column_name
HAVING
  COUNT(DISTINCT table_name) = 2;

/* Who is the best customer? The customer who has spent the most money will be declared the best customer. Write a query that returns the person who has spent the most money */

SELECT
  customer.customer_id,
  customer.first_name,
  customer.last_name,
  SUM(invoice.total) AS money_spent
FROM
  `alien-program-424600-g6.Music_store.customer` AS customer
JOIN
  `alien-program-424600-g6.Music_store.invoice` AS invoice
ON customer.customer_id = invoice.customer_id
GROUP BY
  1,2,3
ORDER BY
  money_spent DESC
LIMIT 1


  
/* 6. Write a query to return the email, first name, last name, & Genre of all Rock Music listeners.
Return your list ordered alphabetically by email starting with A */
  
-- Understanding the relationships between the tables in a Music_store database

SELECT
  COLUMN_NAME,
  STRING_AGG(TABLE_NAME, ', ') AS TABLE_NAMES
FROM
  `alien-program-424600-g6.Music_store.INFORMATION_SCHEMA.COLUMNS`
WHERE
  TABLE_NAME IN ('album', 'artist', 'customer', 'employee', 'genre', 'invoice', 'invoice_line', 'media_type', 'playlist', 'playlist_track', 'track')
GROUP BY
  COLUMN_NAME
HAVING
  COUNT(DISTINCT TABLE_NAME) >= 2; 

-- Understanding the relationships between the tables in a Music_store database
-- Instead of ARRAY_TO_STRING(ARRAY_AGG(TABLE_NAME), ', ') AS TABLE_NAMES, we can aslo use STRING_AGG(TABLE_NAME, ', ') AS TABLE_NAMES

SELECT
  COLUMN_NAME,
  STRING_AGG(TABLE_NAME, ', ') AS TABLE_NAMES,
  COUNT(DISTINCT TABLE_NAME) AS TABLE_COUNT
FROM
  `alien-program-424600-g6.Music_store.INFORMATION_SCHEMA.COLUMNS`
WHERE
  TABLE_NAME IN ('album', 'artist', 'customer', 'employee', 'genre', 'invoice', 'invoice_line', 'media_type', 'playlist', 'playlist_track', 'track')
GROUP BY
  COLUMN_NAME
HAVING
  COUNT(DISTINCT TABLE_NAME) >= 2
ORDER BY
  TABLE_COUNT DESC;

-- Write a query to return the email, first name, last name, & Genre of all Rock Music listeners.
-- Return your list ordered alphabetically by email starting with A

-- 1st method

SELECT
  DISTINCT email,
  first_name,
  last_name
FROM
  `alien-program-424600-g6.Music_store.customer` AS customer
JOIN
  `alien-program-424600-g6.Music_store.invoice` AS invoice
  ON customer.customer_id = invoice.customer_id
JOIN
  `alien-program-424600-g6.Music_store.invoice_line` AS invoice_line
  ON invoice.invoice_id = invoice_line.invoice_id
WHERE
  track_id IN(
    SELECT
      track_id
    FROM
      `alien-program-424600-g6.Music_store.track` AS track
    JOIN
      `alien-program-424600-g6.Music_store.genre` AS genre
      ON track.genre_id = genre.genre_id
    WHERE
      genre.name = 'Rock'    -- Instead of genre.name = 'Rock', we can also use genre.name LIKE 'Rock'
  )
ORDER BY
  email;

-- Method 2

SELECT
  DISTINCT email AS Email,
  first_name AS FirstName, 
  last_name AS LastName, 
  genre.name AS Name
FROM customer
JOIN 
  `alien-program-424600-g6.Music_store.invoice` AS invoice
  ON invoice.customer_id = customer.customer_id
JOIN 
  `alien-program-424600-g6.Music_store.invoice_line` AS invoice_line 
  ON invoiceline.invoice_id = invoice.invoice_id
JOIN 
  `alien-program-424600-g6.Music_store.track` AS track 
  ON track.track_id = invoiceline.track_id
JOIN 
  `alien-program-424600-g6.Music_store.genre` AS genre 
  ON genre.genre_id = track.genre_id
WHERE 
  genre.name LIKE 'Rock'
ORDER BY
  email;



/* 7. Let's invite the artists who have written the most rock music in our dataset. Write a query that returns the Artist name and total track count of the top 10 rock bands */

SELECT
  artist.artist_id,
  artist.name,
  COUNT(artist.artist_id) AS number_of_songs
FROM
  `alien-program-424600-g6.Music_store.track` AS track
JOIN
  `alien-program-424600-g6.Music_store.album` AS album
  ON album.album_id = track.album_id
JOIN
  `alien-program-424600-g6.Music_store.artist` AS artist
  ON artist.artist_id = album.artist_id
JOIN
  `alien-program-424600-g6.Music_store.genre` AS genre
  ON genre.genre_id = track.genre_id
WHERE
  genre.name LIKE 'Rock'    -- Instead of genre.name LIKE 'Rock', you can also use genre.name = 'Rock'
GROUP BY
  artist.artist_id,
  artist.name
ORDER BY
  number_of_songs DESC
LIMIT 10;



/* 8. Return all the track names that have a song length longer than the average song length.
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first */
SELECT
  name,
  milliseconds AS song_length
FROM
  `alien-program-424600-g6.Music_store.track`
 WHERE
  milliseconds > (
    SELECT
      AVG(milliseconds)
    FROM
    `alien-program-424600-g6.Music_store.track`
  )
ORDER BY
  milliseconds DESC;



/* 9. Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent */

/* Steps to Solve: First, find which artist has earned the most according to the InvoiceLines. Now use this artist to find 
which customer spent the most on this artist. For this query, you will need to use the Invoice, InvoiceLine, Track, Customer, 
Album, and Artist tables. Note, this one is tricky because the Total spent in the Invoice table might not be on a single product, 
so you need to use the InvoiceLine table to find out how many of each product was purchased, and then multiply this by the price
for each artist. */

WITH best_selling_artist AS (
  SELECT
    artist.artist_id AS artist_id,
    artist.name AS artist_name,
    SUM(invoice_line.unit_price*invoice_line.quantity) AS total_sales
  FROM
    `alien-program-424600-g6.Music_store.invoice_line` AS invoice_line
  JOIN
    `alien-program-424600-g6.Music_store.track` AS track
    ON track.track_id = invoice_line.track_id
  JOIN 
   `alien-program-424600-g6.Music_store.album` AS album
    ON album.album_id = track.album_id
  JOIN
    `alien-program-424600-g6.Music_store.artist` AS artist
    ON artist.artist_id = album.artist_id
  GROUP BY
    1,2
  ORDER BY
    3 DESC
  LIMIT 1
)
SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  bsa.artist_name,
  SUM(il.unit_price*il.quantity) AS amount_spent
FROM
  `alien-program-424600-g6.Music_store.invoice` AS i
JOIN
  `alien-program-424600-g6.Music_store.customer` AS c
    ON c.customer_id = i.customer_id
JOIN
  `alien-program-424600-g6.Music_store.invoice_line` AS il
  ON il.invoice_id = i.invoice_id
JOIN
  `alien-program-424600-g6.Music_store.track` AS t
  ON t.track_id = il.track_id
JOIN
  `alien-program-424600-g6.Music_store.album` AS alb
  ON alb.album_id = t.album_id
JOIN
  best_selling_artist AS bsa
  ON bsa.artist_id = alb.artist_id
GROUP BY
  1,2,3,4
ORDER BY
  5 DESC; 



/* 10. We want to find out the most popular music Genre for each country.
We determine the most popular genre as the genre with the highest amount of purchases.
Write a query that returns each country along with the top Genre. For countries where the maximum number of purchases is shared return all Genres */

/* Steps to Solve:  There are two parts in question- first most popular music genre and second need data at country level. */

-- 1st method

WITH popular_genre AS (
  SELECT
    COUNT(invoice_line.quantity) AS purchases,   -- we can take count of any column in the invoice_line table
    customer.country,
    genre.name,
    genre.genre_id,
    ROW_NUMBER() OVER(PARTITION BY customer.country ORDER BY COUNT(invoice_line.quantity) DESC) AS RowNo
  FROM
    `alien-program-424600-g6.Music_store.invoice_line` AS invoice_line
  JOIN
    `alien-program-424600-g6.Music_store.invoice` AS invoice
    ON invoice.invoice_id = invoice_line.invoice_id
  JOIN
    `alien-program-424600-g6.Music_store.customer` AS customer
    ON customer.customer_id = invoice.customer_id
  JOIN
    `alien-program-424600-g6.Music_store.track` AS track
    ON track.track_id = invoice_line.track_id
  JOIN
    `alien-program-424600-g6.Music_store.genre` AS genre
    ON genre.genre_id = track.genre_id
  GROUP BY
    2,3,4
  ORDER BY
    2 ASC,
    1 DESC
)
SELECT
  *
FROM
  popular_genre
WHERE
  RowNo <= 1

-- 2nd method: Using Recursive 

WITH RECURSIVE
	sales_per_country AS (
    SELECT 
      COUNT(*) AS purchases_per_genre, 
      customer.country, 
      genre.name, 
      genre.genre_id
		FROM 
      `alien-program-424600-g6.Music_store.invoice_line` AS invoice_line
		JOIN 
      `alien-program-424600-g6.Music_store.invoice` AS invoice 
      ON invoice.invoice_id = invoice_line.invoice_id
		JOIN 
      `alien-program-424600-g6.Music_store.customer` AS customer 
      ON customer.customer_id = invoice.customer_id
		JOIN 
      `alien-program-424600-g6.Music_store.track` AS track 
      ON track.track_id = invoice_line.track_id
		JOIN 
      `alien-program-424600-g6.Music_store.genre` AS genre 
      ON genre.genre_id = track.genre_id
		GROUP BY 
      2,3,4
		ORDER BY 
      2
	),
	max_genre_per_country AS (
    SELECT 
      MAX(purchases_per_genre) AS max_genre_number, 
      country
		FROM 
      sales_per_country
		GROUP BY 
      2
		ORDER BY 
      2
  )

SELECT 
  sales_per_country.* 
FROM 
  sales_per_country
JOIN 
  max_genre_per_country 
  ON sales_per_country.country = max_genre_per_country.country
WHERE 
  sales_per_country.purchases_per_genre = max_genre_per_country.max_genre_number;



/* 11. Write a query that determines the customer that has spent the most on music for each country.
Write a query that returns the country along with the top customer and how much they spent.
For countries where the top amount spent is shared, provide all customers who spent this amount */

/* Steps to Solve:  Similar to the above question. There are two parts in question- 
first find the most spent on music for each country and second filter the data for respective customers. */

-- 1st method

WITH Customter_with_country AS (
  SELECT 
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    invoice.billing_country,
    SUM(total) AS total_spending,
    ROW_NUMBER() OVER(PARTITION BY billing_country ORDER BY SUM(total) DESC) AS RowNo 
	  FROM 
    `alien-program-424600-g6.Music_store.invoice` AS invoice
  JOIN 
    `alien-program-424600-g6.Music_store.customer` AS customer 
    ON customer.customer_id = invoice.customer_id
	  GROUP BY 
    1,2,3,4
	  ORDER BY 
    4 ASC,
    5 DESC
)
SELECT
  *
FROM
  Customter_with_country
WHERE
  RowNo <= 1

-- 2nd method: Using Recursive */

WITH RECURSIVE 
	customter_with_country AS (
    SELECT 
      customer.customer_id,
      first_name,last_name,
      billing_country,
      SUM(total) AS total_spending
		FROM 
      `alien-program-424600-g6.Music_store.invoice` AS invoice
		JOIN 
      `alien-program-424600-g6.Music_store.customer` AS customer
      ON customer.customer_id = invoice.customer_id
		GROUP BY 
      1,2,3,4
		ORDER BY 
      2,3 DESC),

	country_max_spending AS(
		SELECT 
      billing_country,
      MAX(total_spending) AS max_spending
		FROM 
      customter_with_country
		GROUP BY 
      billing_country)

SELECT 
  cc.billing_country, 
  cc.total_spending, 
  cc.first_name, 
  cc.last_name, 
  cc.customer_id
FROM 
  customter_with_country AS cc
JOIN 
  country_max_spending AS ms
  ON cc.billing_country = ms.billing_country
WHERE 
  cc.total_spending = ms.max_spending
ORDER BY 
  1;






