--limit kullanımı
SELECT InvoiceDate,InvoiceId,total 
FROM invoices
WHERE total>10
LIMIT 3;
-- order kullanımı
SELECT *
FROM invoices
WHERE total>10
ORDER BY total ASC;  --ASC burada defaulttur yazmasak da olur...

SELECT *
FROM invoices
WHERE total >10
ORDER BY InvoiceDate DESC
LIMIT 10;
-- AND,OR,NOT logic expressions..
SELECT *
FROM invoices
WHERE NOT BillingCountry= "USA"
ORDER BY total DESC;

SELECT *
FROM invoices
WHERE BillingCountry != "USA"
ORDER BY total desc;

SELECT *
FROM invoices
WHERE BillingCountry="USA" OR BillingCountry="Germany"
ORDER BY InvoiceId ASC;

SELECT *
FROM invoices
WHERE InvoiceDate >= "2012-01-01" AND InvoiceDate <= "2013-01-02 00:00:00";
-- BETWEEN logic operator sonrasında iki durum ve AND kullanılır... Her iki ifadeyi de alır, ayrıca tahi kullanırken sonuna 23:59:00 vb.
-- de eklemek geerkir, saat olarak...
SELECT *
FROM invoices
WHERE InvoiceDate BETWEEN "2009-01-01" AND "2011-12-31"
ORDER BY InvoiceDate DESC
LIMIT 1;
-- IN operatörü kullanımı....
SELECT FirstName,LastName,country
FROM customers
WHERE country IN ("Belgium","Norway","USA","Canada");
--- LIKE operatörü kullsnımı...
SELECT name,composer
FROM tracks
WHERE Composer LIKE "%Bach";

SELECT *
FROM albums
WHERE Title LIKE "%Greatest%";

SELECT  *
FROM invoices
WHERE InvoiceDate LIKE "201_-02%";


