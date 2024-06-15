# Beatbox Music Store Analysis  
<p align="center">
  <img width="300" height="300" src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/21113d3c-439c-4dee-8437-9b67f56aa9cd">
</p>  

## Scenario
I am a junior data analyst working on the analyst team at Beatbox, a digital music store business that sells digital audio files of music recordings over the Internet. Customers gain ownership of a license to use the files, in contrast to a music streaming service, where they listen to recordings without gaining ownership. Beatbox is a successful small company, but they have the potential to become a larger player in the global music store market. Jason Furtado, cofounder and Chief Creative Officer of Beatbox, believes that analyzing music playlist data could help unlock new growth opportunities for the company.  

The key steps followed in the analysis:  
- Ask
- Prepare
- Process
- Analyze
- Share
- Act

## About the company  
Beatbox is a pioneering digital music store company that offers a vast collection of digital audio files from various albums and artists, providing customers with licensed ownership of their favorite music. By meticulously gathering data on albums, artists, customers, genres, and playlists, Beatbox aims to enhance user experience and discover new growth opportunities. Jason Furtado, the cofounder and Chief Creative Officer, is particularly interested in analyzing music playlist data to uncover emerging trends and tailor personalized recommendations for their diverse user base.  

## Tools Used  
- Microsoft Excel: Data Cleaning
- SQL: Data Transformation
- SQL: Data Analysis
- Tableau: Data Visualization

## Data Analysis Process  
### Ask:
The "ask" phase of the data analysis process involves recognizing the current problem, understanding stakeholder expectations, defining the business task, and identifying how insights will benefit stakeholders.  

**Business Task:**  
Analyze music playlist data to gain insights into customer preferences, guiding the company in understanding and driving its business growth.  

**Key Stakeholders**  
The key stakeholders for this project include:
- Jason Furtado: Beatbox’s cofounder and Chief Creative Officer  
- Beatbox Management team: A management team, a group of high-level associates hired by a owner to take on essential responsibilities within the business
- Beatbox Analytics team: A team of data analysts responsible for collecting, analyzing, and reporting data that helps guide Beatbox’s business strategy

**To address Beatbox's business objectives and gain valuable insights, the following questions will guide the analysis:**  
1. Who is the senior most employee based on job title
2. Which countries have the most Invoices
3. What are top 3 values of total invoice
4. Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals
5. Who is the best customer? The customer who has spent the most money will be declared the best customer. Write a query that returns the person who has spent the most money
6. Write a query to return the email, first name, last name, & Genre of all Rock Music listeners. Return your list ordered alphabetically by email starting with A
7. Let's invite the artists who have written the most rock music in our dataset. Write a query that returns the Artist name and total track count of the top 10 rock bands
8. Return all the track names that have a song length longer than the average song length. Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first
9. Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent
10. We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where the maximum number of purchases is shared return all Genres
11. Write a query that determines the customer that has spent the most on music for each country. Write a query that returns the country along with the top customer and how much they spent. For countries where the top amount spent is shared, provide all customers who spent this amount

### Prepare:  
The "prepare" phase of the data analysis process involves collecting and preparing the necessary data for analysis. Key steps include identifying data sources such as databases, spreadsheets, or external sources, and then extracting the relevant information.    

Jason Furtado, Beatbox’s cofounder and Chief Creative Office encourages to use music playlist data which includes information about artist, album, playlist, track, media type, genre, invoice line, invoice, customer and employee.  
The datasets were in a zip file containing 11 CSV files, representing 11 distinct data tables.  

**The following datasets were used for the analysis:**  
```
album.csv
artist.csv
customer.csv
employee.csv
genre.csv
invoice.csv
invoive_line.csv
media_type.csv
playlist.csv
playlist_track.csv
track.csv
```  

### Process:
The "process" step in data analysis involves cleaning, transforming, and integrating data to make sure it is accurate, consistent, and ready for analysis. This includes tasks like handling missing values, correcting errors, standardizing formats, and merging data from different sources. These steps are essential to ensure the quality and reliability of the data for meaningful analysis.  

**Data cleaning: Microsoft Excel**  
- Checked for Duplicates: Used Excel's built-in Remove Duplicates tool   
- Checked for Blanks: Utilized the Filter option and Conditional Formatting to identify and handle blank or missing values   
- Sort the Data: Arranged the dataset in ascending order based on the Ids  

So, the data cleaning process has done using Microsoft Excel.  
**For further processes, including Data Transformation, Data Analysis, and Data Visualization, SQL and Tableau were used:**
- **SQL**  
Data Transformation: SQL is highly efficient for querying and transforming large datasets. It allows for complex data manipulation, filtering, and aggregation, which are essential for preparing data for analysis.  
Data Analysis: SQL can quickly perform analytical tasks such as calculating averages, sums, and other statistical measures directly within the database.  
- **Tableau**  
Data Visualization: Tableau is a powerful tool for creating interactive and visually appealing data visualizations. It can handle large datasets and provides a wide range of chart types and customization options.

*Using SQL for data transformation and analysis ensures that the data is properly structured and cleaned before being imported into Tableau for visualization, allowing for more accurate and insightful visual representations.*  

#### Importing Data
A platform called "Big Query" was used for the analysis. To import the cleaned CSV files into BigQuery for data analysis, a database named 'Music_store' was created. New tables were then set up within this database for each of the CSV files, with table names corresponding to the respective files.  

<img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/ed8905ef-f643-49cf-81a2-a4d08d0f53db">  

Now that the datasets are imported into BigQuery, let's analyze the data to answer our questions, gain insights, and draw conclusions.  

### Analyze:  
The "Analyze" phase in the data analysis process involves examining the cleaned and prepared data to uncover meaningful insights and trends.  
1. **Who is the senior most employee based on job title**
   ```sql
   -- Who is the senior most employee based on job title

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
   ```
   <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/6dc16005-f171-46db-9f30-c08e5bb50609">  

2. **Which countries have the most Invoices**
   ```sql
   -- Which countries have the most Invoices

   SELECT
     billing_country,
     COUNT(*) AS count_invoice
   FROM
     `alien-program-424600-g6.Music_store.invoice`
   GROUP BY
     billing_country
   ORDER BY
     count_invoice DESC
   ```
   <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/45a85f8b-5fd0-46ff-ba67-736030dffaf2">  

3. **What are top 3 values of total invoice**
   ```sql
   -- What are top 3 values of total invoice

   SELECT
     total
   FROM
     `alien-program-424600-g6.Music_store.invoice`
   ORDER BY
     total DESC
   LIMIT 3
   ```
   <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/4c3021b5-78e4-4879-b90d-fabecf1a29c8">  

4. **Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals**
   ```sql
   -- Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money.
   -- Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals

   SELECT
     billing_city,
     SUM(total) AS invoice_total
   FROM
     `alien-program-424600-g6.Music_store.invoice`
   GROUP BY
     billing_city
   ORDER BY
     invoice_total DESC
   ```
   <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/5e7e3839-3c82-4fbb-854b-1ba3189f7ea3">  

5. **Who is the best customer? The customer who has spent the most money will be declared the best customer. Write a query that returns the person who has spent the most money**  

   We want to identify the customer who has spent the most money. To do this, we need to look at the customer table. However, the customer table does not have a column named 'total'. Therefore, we need to join the customer table with the invoice table to obtain the information we need.  
   First, we will find the common column between the customer and invoice tables in the Music_store dataset to determine how to join these two tables. This will help us identify the common key for the join operation. To achieve this, we will use INFORMATION_SCHEMA.COLUMNS to identify the common column between these two tables.  
   
   ```sql
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
   ```  
   <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/a5ce8466-0886-4426-b38d-ec34549718ef">  

   Now that we know the common column betweeen the customer and invoice tables in the Music_store database, we can easily join these two tables using a common key.  
   ```sql
   -- Who is the best customer? The customer who has spent the most money will be declared the best customer. Write a query that returns the person who has spent the most money

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
   ```  
   <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/40f19090-c60f-4c99-bf04-619324a201c7">  
  
6. **Write a query to return the email, first name, last name, & Genre of all Rock Music listeners. Return your list ordered alphabetically by email starting with A**  

   The email, first name, and last name columns can be retrieved from the customer table in the Music_store database, and the Genre Rock music information can be obtained from the genre table. However, these tables are not directly related as they do not share a common column. So, to achieve our desired result, we can either use a Schema diagram to see the relationships between the tables or write a query to understand the relationships among all tables in the Music_store database.
   
   Firstly, we will understand the relationships between the tables using a Schema diagram.
   
   <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/435019aa-edff-4ac9-8ad1-8c4990302cec">
   
   We know that we want to join our customer table to the genre table. From the schema diagram, we can see that the customer table can be connected to the invoice table using the common column customer_id. The invoice table can then be connected to the invoice_line table using the common column invoice_id. The invoice_line table can be connected to the track table using the common column track_id. Finally, the track table can be connected to the genre table using the common column genre_id. Using these relationships, we can write a query that connects all the tables.

   However, sometimes we don't have access to a schema diagram. In that case, it is better to write a query to understand the relationships between the tables. Let's write a query to understand the relationships between the tables in a Music_store database.  
   ```sql
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
   ```
   <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/2d6f7eb4-3f2c-404d-b678-81acb1a0df6e">  

   let's make this query to identify the relationships between the tables in a Music_store database more clear by adding table count
   ```sql
   -- Understanding the relationships between the tables in a Music_store database
   -- Instead of ARRAY_TO_STRING(ARRAY_AGG(TABLE_NAME), ', ') AS TABLE_NAMES, we can aslo use STRING_AGG(TABLE_NAME, ', ') AS TABLE_NAMES

   WITH column_table AS (
     SELECT
       COLUMN_NAME,
       TABLE_NAME
     FROM
       `alien-program-424600-g6.Music_store.INFORMATION_SCHEMA.COLUMNS`
     WHERE
       TABLE_NAME IN ('album', 'artist', 'customer', 'employee', 'genre', 'invoice', 'invoice_line', 'media_type', 'playlist', 'playlist_track', 'track')
   )
   SELECT
     COLUMN_NAME,
     ARRAY_TO_STRING(ARRAY_AGG(TABLE_NAME), ', ') AS TABLE_NAMES,
     COUNT(DISTINCT TABLE_NAME) AS TABLE_COUNT
   FROM
     column_table
   GROUP BY
     COLUMN_NAME
   HAVING
     TABLE_COUNT >= 2
   ORDER BY
     TABLE_COUNT DESC;
   ```  
   <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/49166512-c143-415b-a996-756ef9b61689">
   
   Finally, we will write the query to obtain the desired answer for our question
   ```sql
   -- Write a query to return the email, first name, last name, & Genre of all Rock Music listeners.
   -- Return your list ordered alphabetically by email starting with A

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
         genre.name LIKE 'Rock'    -- Instead of genre.name LIKE 'Rock', you can also use genre.name = 'Rock'
     )
   ORDER BY
     email;
   ```  
   <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/803a7613-c90e-4a2d-b157-3d9fafc66a31">  
   
7. **Let's invite the artists who have written the most rock music in our dataset. Write a query that returns the Artist name and total track count of the top 10 rock bands**  

   In this case, we want to join our artist table to the genre table, but there are no direct relationships between these two tables. So, we will look at our schema diagram to understand the relationships of the tables and write the query to get the answers we want.

   <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/d7dd8aab-d4d4-4a2c-b557-6462012baf66">  

   By looking at the schema diagram, we understand that the artist table is connected to the album table, the album table is connected to the track table, and the track table is connected to the genre table. To join the artist table to the genre table, we need to connect all these tables. Now that we understand the relationships between the tables, let's write a query to get the desired results.

   ```sql
   -- Let's invite the artists who have written the most rock music in our dataset. Write a query that returns the Artist name and total track count of the top 10 rock bands

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
   ```
   <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/feb4fddb-0fe3-497c-8640-5d4b415f17a4">

8. **Return all the track names that have a song length longer than the average song length. Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first**  

   ```sql
   -- Return all the track names that have a song length longer than the average song length.
   -- Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first
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
   ```
   <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/d5fe2840-8fe8-4c49-9395-5c585d3d32a0">
   
9. **Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent**  

   In this case, to find the desired answers, we need data from three tables: artist, customer, and invoice_line. We can't use the total column from the invoice table to calculate the total spent because we want to determine the money spent by each customer on each artist, not the total spent per invoice, which represents the total spent at a product level. For instance, if a customer bought a song from a particular artist, we will use the quantity (1) and the price of that song, multiplying them to calculate the total. However, if the customer bought an album that contains four songs, we need to multiply the unit price by the quantity (4) to get the total.  
   First, we will determine which artist has earned the most according to the invoice_line table. Then, using this artist, we will find which customer spent the most on this particular artist. To perform this query, we need to utilize data from the invoice, invoice_line, track, customer, album, and artist tables. Since the total spent in the invoice table might not correspond to a single product, we need to use the invoice_line table to find out how many of each product was purchased and then multiply this by the price for each artist.  

   ```sql
   -- Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent

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
   ```
   <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/1496b500-0de4-460e-a2f9-1df81af46298">  

10. **We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where the maximum number of purchases is shared return all Genres**  

    As we can observe from the schema diagram, our genre-related data is stored in the genre table, while country-related data is located in the invoice table under a column called "billing_country". However, these two tables are not directly related. Therefore, we need to write a query to connect these tables, including invoice and genre. Hence, to perform this query, we need to utilize data from the invoice, invoice_line, track, customer, and genre tables to obtain the desired answers.  
    Also, in this case, they asked for the highest purchases, not the total purchases. Therefore, to determine the highest purchase, we will use the count instead of multiplying the quantity by the unit price, which represents the total amount spent.
    ```sql
    -- We want to find out the most popular music Genre for each country.
    -- We determine the most popular genre as the genre with the highest amount of purchases.
    -- Write a query that returns each country along with the top Genre. For countries where the maximum number of purchases is shared return all Genres

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
    ```
    <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/eb476431-619c-4515-a2a5-90365dce1967">   

11. **Write a query that determines the customer that has spent the most on music for each country. Write a query that returns the country along with the top customer and how much they spent. For countries where the top amount spent is shared, provide all customers who spent this amount**  
    As we can see from the schema diagram, we need only two tables to solve this particular question: the customer and invoice tables. We can easily find customer information from the customer table, country information from the invoice table (in the column called "billing_country"), and total spending from the total column in the invoice table. Also, we know these two tables, customer and invoice, are directly linked to each other. Let's run a query to get the desired answer from the database.  
    ```sql
    -- Write a query that determines the customer that has spent the most on music for each country.
    -- Write a query that returns the country along with the top customer and how much they spent.
    -- For countries where the top amount spent is shared, provide all customers who spent this amount

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
    ``` 
    <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/bbc26bb9-fd8d-4897-8392-e9b6398279cf">   

### Share:
The "Share" phase of the data analysis process involves communicating the results and insights derived from the analysis to stakeholders. This includes summarizing key findings, creating visualizations to present data trends, and providing actionable recommendations for decision-making. Effective communication ensures that stakeholders understand the implications of the data analysis and can use it to inform strategic decisions.  

- **Who is the senior most employee based on job title**    
   
  <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/f4daa491-52c3-4c0a-9839-f498596ed37d">   

- **Which countries have the most Invoices**      
   
  <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/edc8f314-afea-421b-90a2-10d846710420">   
 
- **Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals**      

  <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/c40ff395-952c-4dbb-b8eb-dddf6e376329">   

- **Who is the best customer? The customer who has spent the most money will be declared the best customer. Write a query that returns the person who has spent the most money**  
    
  <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/b935a9cb-51cf-438e-9334-0ea725fe87a4">     
 
- **Let's invite the artists who have written the most rock music in our dataset. Write a query that returns the Artist name and total track count of the top 10 rock bands**
  
  <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/f10d6010-462f-4422-84dd-683686df9ca3">       
  
- **We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where the maximum number of purchases is shared return all Genres**  

  <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/bca762df-ec54-4b7a-843f-f4bd285a0314">     
 
- **Write a query that determines the customer that has spent the most on music for each country. Write a query that returns the country along with the top customer and how much they spent. For countries where the top amount spent is shared, provide all customers who spent this amount**  
  
  <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/b3cfbf01-05f1-4b40-aa48-81a20d917fbe">   

### Act:  
The "Act" phase of the data analysis process is a crucial step where insights derived from data analysis are translated into actionable strategies and decisions. This phase focuses on implementing the findings to achieve business objectives, improve processes, and drive positive outcomes.  

**Key takeaways:**  
- Patterns in sales data: Identify key patterns in sales data, such as the most popular genres, peak purchasing times, and customer demographics.
- Customer Preferences: Determine patterns in customer preferences, such as favored genres, frequently purchased artists or albums, and the types of playlists created.
- Identify the most popular albums, including the number of times they are purchased, and the common genres,cand songs within these albums.

#### Recommendations to improve business growth   
- Enhanced Recommendations: Implement algorithms to generate personalized music recommendations based on playlist data.
- Marketing Initiatives: Launch targeted marketing campaigns promoting popular playlists, genres, and artists.
- Product Offerings: Introduce new product offerings like playlist-based bundles and discounts on popular combinations of tracks and albums.
- Customer Feedback: Collect customer feedback to gauge satisfaction with new features and marketing efforts

**Conclusion**  
By leveraging the insights gained from analyzing music data, Beatbox can implement strategic actions that enhance customer experience, boost sales, and position the company for growth in the competitive digital music store market. This iterative process of data-driven decision-making will help Beatbox remain agile and responsive to market trends and customer preferences, driving long-term success.






 






    




    







   





