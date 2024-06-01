# Digital Music Store Analysis  
<p align="center">
  <img width="460" height="360" src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/037eed76-0b69-4896-a989-d79dc5bac2da">
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
Beatbox is a digital music store company that sells digital audio files of music recordings over the Internet. Collecting data on album, artist, customer, employee, genre and playlist has allowed Beatbox to provide customers gain ownership of a license to use the music files. Jason Furtado, Beatbox’s cofounder and Chief Creative Officer believes that an analysis of music playlist data would reveal more opportunities for growth.  

## Tools Used  
- Microsoft Excel: Data Cleaning
- SQL: Data Transformation
- SQL: Data Analysis
- Tableau: Data Visualization

## Data Analysis Process  
### Ask:
The "ask" phase of the data analysis process involves recognizing the current problem, understanding stakeholder expectations, defining the business task, and identifying how insights will benefit stakeholders.  

**Business Task:**  
Analyze music playlist data in order to gain insights that will help guide the company in understanding its business growth.

**Key Stakeholders**  
The key stakeholders for this project include:
- Jason Furtado: Beatbox’s cofounder and Chief Creative Officer  
- Beatbox Management team: A management team, a group of high-level associates hired by a owner to take on essential responsibilities within the business
- Beatbox Analytics team: A team of data analysts responsible for collecting, analyzing, and reporting data that helps guide Beatbox’s business strategy

**Specific questions provided by Jason Furtado, co-founder and Chief Creative Officer of Beatbox, to answer in order to gain insights**  
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
The datasets were in a zip file containing 11 CSV files, representing 18 distinct datasets.  

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
- Checked for Duplicates  
- Checked for Blanks  
- Sort the Data  
  Arranged the dataset in ascending order based on the Ids.  

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
1. **Who is the senior most employee based on job title**
   ```sql
   -- Who is the senior most employee based on job title

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
   ```
   <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/c1131091-6b37-449a-be87-8c9da217c4e5">  

2. **Which countries have the most Invoices**
   ```sql
   -- Which countries have the most Invoices

   SELECT
     billing_country,
     COUNT(*) AS count_countries
   FROM
     `alien-program-424600-g6.Music_store.invoice`
   GROUP BY
     billing_country
   ORDER BY
     count_countries DESC
   ```
   <img src="https://github.com/aakash-patidar/Digital-Music-Store-Analysis-using-SQL-and-Tableau/assets/171103471/f573ed30-8067-4309-b780-b7863359e6cb">  

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
   -- Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals

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
   First, we will find the common columns between the customer and invoice tables in the Music_store dataset to determine how to join these two tables. This will help us identify the common key for the join operation. To achieve this, we will use INFORMATION_SCHEMA.COLUMNS to identify the common column between these two tables.  
   
   ```sql
   -- Checking to see which column names are common between the customer and invoice tables
   
   WITH customer_columns AS (
   SELECT
     column_name
   FROM
     `alien-program-424600-g6.Music_store.INFORMATION_SCHEMA.COLUMNS`
   WHERE
     table_name = 'customer'
   ),
   invoice_columns AS (
   SELECT
     column_name
   FROM
     `alien-program-424600-g6.Music_store.INFORMATION_SCHEMA.COLUMNS`
   WHERE
     table_name = 'invoice'
   )
   SELECT
     c.column_name
   FROM
     customer_columns AS c
   JOIN
     invoice_columns AS i
   ON
     c.column_name = i.column_name;
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
   -- -- Understanding the relationships between the tables in a Music_store database

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


  
   

   
   
   
   


















8. Let's invite the artists who have written the most rock music in our dataset. Write a query that returns the Artist name and total track count of the top 10 rock bands
9. Return all the track names that have a song length longer than the average song length. Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first
10. Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent
11. We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where the maximum number of purchases is shared return all Genres
12. Write a query that determines the customer that has spent the most on music for each country. Write a query that returns the country along with the top customer and how much they spent. For countries where the top amount spent is shared, provide all customers who spent this amount







   





