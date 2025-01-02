# SQL Music Database Project

## Overview
This repository contains a comprehensive SQL project that analyzes a music database by answering a series of beginner, intermediate, and advanced-level questions. The project demonstrates the use of SQL techniques such as queries, subqueries, Common Table Expressions (CTEs), and various SQL functions to extract meaningful insights.

## Objectives
The project aims to:

- Perform detailed analysis on a music-related dataset.
- Answer beginner, intermediate, and advanced questions related to employees, customers, invoices, artists, tracks, and genres.
- Apply SQL techniques like joins, aggregations, subqueries, and CTEs for data analysis.
## Questions Addressed
### Beginner Level
- Who is the senior-most employee based on the job title?
- Which countries have the most invoices?
- What are the top 3 values of total invoice amounts?
### Intermediate Level
- Which city has the best customers?
- Query to find the city with the highest sum of invoice totals, identifying where to host a promotional music festival.
- Who is the best customer?
- Query to determine the customer who has spent the most money overall.
### Advanced Level
- List all rock music listeners.
- Query to return email, first name, last name, and genre of rock music listeners, ordered alphabetically by email.
- Invite top rock artists.
- Query to return the names of artists and the total track count of the most prolific rock bands.
- Find tracks longer than the average song length.
- Query to return tracks with lengths longer than the average, ordered by song length in descending order.
- How much did each customer spend on artists?
- Query to return customer name, artist name, and the total money spent by each customer.
- Identify the most popular music genre for each country.
- Query to determine the top genre by purchase amount for each country, including ties.
- Find the top customer for each country.
- Query to return the country, top customer, and the total amount spent. Include ties where applicable.
## Dataset
The dataset includes information about:

- Employees: Employee details, including job titles and hierarchical information.
- Customers: Customer demographics and purchase details.
- Invoices: Records of transactions, invoice totals, and customer details.
- Artists: Artist information and associated tracks.
- Tracks: Song details, including length and associated genres.
- Genres: Music genres associated with tracks and customer preferences.
## Files
- Dataset: The dataset file will be included for setting up the database.
- SQL Script: The SQL script containing all queries for answering the above questions is included as music_analysis.sql.
## SQL Techniques Used
- Joins: Combining multiple tables for comprehensive analysis.
- Aggregations: Using functions like SUM(), COUNT(), AVG() for summarizing data.
- Subqueries: Extracting intermediate results for further analysis.
- CTEs (Common Table Expressions): Simplifying complex queries for better readability.
- Sorting and Filtering: Ordering results and applying WHERE conditions.

Discover the most popular music genres in different countries.
Analyze spending patterns by customers on artists.
Highlight the longest tracks and prolific artists.
Contribution
Contributions are welcome! If you have suggestions for improving the analysis or additional queries to include, feel free to submit a pull request or open an issue.
