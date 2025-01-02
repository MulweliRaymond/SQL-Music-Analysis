-- Who is the senior most employee based of the job title?
SELECT *
FROM employee
ORDER BY levels DESC
LIMIT 1;

--Which countries have the most invoices?
SELECT COUNT(billing_country) AS Total_invoices, billing_country
FROM invoice
GROUP BY billing_country
ORDER BY Total_invoices DESC
LIMIT 3;

--What are top 3 values of total invoice?
SELECT total
FROM invoice
ORDER BY total DESC
LIMIT 3;

-- Which city has the best customers? we would like to throw a promotional Music Festival in the city we have made the most money. Write a query that return one city that has the highest sum of invoice totals. Return both the city name and sum of all invoice totals. 
SELECT SUM(total) as Total, billing_city
FROM invoice
GROUP BY billing_city
ORDER BY Total DESC
LIMIT 1;

-- Who is the best custumer? The customerwho has spent the most money will be declared the best customer. Write a query that returns the person who spent the most money.

SELECT customer.customer_id, first_name, last_name, SUM(total) AS Total
FROM customer
JOIN invoice
	ON customer.customer_id=invoice.customer_id
	GROUP BY customer.customer_id
	ORDER BY Total DESC
	LIMIT 1;


-- write query to return the email, first name, last name, and genre of all rock music listeners and return  your list orderd alphabetically by email starting with A

SELECT DISTINCT first_name, last_name, email 
FROM customer
JOIN invoice
	ON customer.customer_id=invoice.customer_id
JOIN invoice_line
	ON invoice_line.invoice_id=invoice.invoice_id
WHERE invoice_line.track_id IN (
	SELECT track_id
	FROM track
	JOIN genre
		ON genre.genre_id=track.genre_id
	WHERE genre.name LIKE 'Rock'
)
ORDER BY email;

-- Lets invite the artists who have written the most rock music in our dataset.
-- Write a query that returns Artist name and total track count of the top rock bands
SELECT *
FROM artist;

SELECT *
FROM genre;

SELECT *
FROM track;

SELECT artist.name, count(artist.name) AS Total_songs
FROM track
JOIN genre
	ON genre.genre_id=track.genre_id
JOIN album
	ON album.album_id=track.album_id
JOIN artist
	ON artist.artist_id=album.artist_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.name
ORDER BY Total_songs DESC
LIMIT 10;

-- Return all the track that have a song length longer than the average song length and return the name and milliseconds, 
-- order by songs with longest song listed first
SELECT name, milliseconds
FROM track
WHERE milliseconds> (SELECT AVG(milliseconds)
FROM track)
ORDER BY milliseconds DESC;


-- Find how much amount spent by each customer on artists? 
-- write query to return customer name, artist name and total money spent
SELECT customer.customer_id,customer.first_name,customer.last_name, artist.name, SUM(invoice.total) AS Money_spent_on_artist
FROM customer
JOIN invoice
	ON customer.customer_id=invoice.customer_id
JOIN invoice_line
	ON invoice.invoice_id=invoice_line.invoice_id
JOIN track
	ON invoice_line.track_id=track.track_id
JOIN album
	ON track.album_id=album.album_id
JOIN artist
	ON album.artist_id=artist.artist_id
GROUP BY customer.customer_id, artist.name
ORDER BY Money_spent_on_artist DESC;
-- We want to find out the most popular musix genre for each country, 
-- we determine the most popular genre as the genre with the highest amount of purchases. 
-- Write a query that returns each country along with the top genre. 
-- For countries where maximum number of purchases is shared return all genres.
WITH Country AS(
  WITH popul_arity AS (
    SELECT invoice.billing_country, genre.name , COUNT(invoice.total) As pop
    FROM invoice
    JOIN invoice_line
	    ON invoice.invoice_id=invoice_line.invoice_id
    JOIN track
	    ON invoice_line.track_id=track.track_id
    JOIN genre
	    ON track.genre_id=genre.genre_id
    GROUP BY invoice.billing_country, genre.name 
    ORDER BY pop DESC
  )
  SELECT *, ROW_NUMBER() OVER( PARTITION BY billing_country ORDER BY pop DESC) --billing_country, MAX(pop), 
  FROM popul_arity
 )
SELECT *
FROM Country
WHERE Row_number=1;

-- Write a query that determines the customer that has spent the most on music for each country.
-- Write a query that returns the country along with the top customer and how much they much spent.
--For countries where the top amount spent is shared, provide all customers who spent this amount.

SELECT Distinct billing_country
From invoice;

WITH top_amount AS (
  SELECT  first_name, last_name, customer.customer_id, billing_country, SUM(total) AS Total, ROW_NUMBER() OVER(PARTITION BY billing_country) AS Po
  FROM customer
  JOIN invoice
	  ON customer.customer_id=invoice.customer_id
  GROUP BY customer.customer_id, billing_country
  ORDER BY billing_country, Total DESC
)
SELECT first_name, last_name, billing_country, Total
FROM top_amount
WHERE po=1;