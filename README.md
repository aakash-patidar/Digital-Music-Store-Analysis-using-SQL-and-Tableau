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
6. Write query to return the email, first name, last name, & Genre of all Rock Music listeners. Return your list ordered alphabetically by email starting with A
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
   













3. Which countries have the most Invoices
4. What are top 3 values of total invoice
5. Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals
6. Who is the best customer? The customer who has spent the most money will be declared the best customer. Write a query that returns the person who has spent the most money
7. Write query to return the email, first name, last name, & Genre of all Rock Music listeners. Return your list ordered alphabetically by email starting with A
8. Let's invite the artists who have written the most rock music in our dataset. Write a query that returns the Artist name and total track count of the top 10 rock bands
9. Return all the track names that have a song length longer than the average song length. Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first
10. Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent
11. We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where the maximum number of purchases is shared return all Genres
12. Write a query that determines the customer that has spent the most on music for each country. Write a query that returns the country along with the top customer and how much they spent. For countries where the top amount spent is shared, provide all customers who spent this amount







   





