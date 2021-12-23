SELECT name,TrackId
FROM tracks
WHERE Composer = 'Jorge Ben';

SELECT * 
FROM invoices
WHERE total > 25;

SELECT *
FROM invoices
WHERE total<15
LIMIT 5;

SELECT *
FROM invoices
WHERE total>10
ORDER BY total DESC
LIMIT 2;

SELECT *
FROM invoices
WHERE NOT BillingCountry = 'Canada'
ORDER BY total ASC
LIMIT 10;

SELECT InvoiceId,CustomerId,total
FROM invoices
ORDER BY CustomerId ASC, total DESC;

SELECT *
FROM tracks
WHERE name LIKE 'B%S';

SELECT InvoiceDate
FROM invoices
WHERE InvoiceDate BETWEEN '2008-01-01' AND '2011-12-31'
ORDER BY InvoiceDate DESC
LIMIT 1;

SELECT FirstName,LastName, country
FROM customers
WHERE country IN ('Norway','Belgium');

SELECT *
FROM tracks
WHERE Composer LIKE '%Zappa%';

SELECT COUNT (TrackId)
FROM tracks;
SELECT COUNT (InvoiceId)
FROM invoices;

SELECT COUNT(DISTINCT composer)
FROM tracks;




