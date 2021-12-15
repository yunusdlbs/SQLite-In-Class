--1.
SELECT InvoiceId, CustomerId, total
FROM invoices
ORDER BY CustomerId ASC, total DESC;
--2.

SELECT InvoiceId, CustomerId, total
FROM invoices
ORDER BY total DESC, CustomerId ASC;
--3. In the first query, we see the Customer Id starts from 1 and goes on until it becomes 59. 
--After Customer Id we can see total (as dollar). Here, while Customer Id is 1, total value starts from 13.86 and goes 
--onto  0.99 (it decreases). To me the first query is clear to see what happened. But in the second one we did the opposite, 
--here it is a little bit hard to see. For totals we started from the highest money 25.86 (andd this is our priority). 
--If we have same amount of total, then we ordered Customer Id from lowest to highest....

--4. 


SELECT InvoiceId, CustomerId, total
FROM invoices
ORDER BY total DESC, CustomerId ASC;
--5.
SELECT InvoiceId, CustomerId, total
FROM invoices
ORDER BY total DESC, CustomerId ASC;

--6.
SELECT name
FROM tracks
WHERE name LIKE "B%s";
--7.
SELECT *
FROM invoices
WHERE (InvoiceDate  BETWEEN "2010-01-01" AND "2010-12-31")
AND (BillingCountry IN ('USA','Canada','Germany','Norway')); 

