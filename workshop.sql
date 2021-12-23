--1
SELECT Name,Composer
FROM tracks;

--2
SELECT *
FROM tracks;

--3
SELECT DISTINCT(Composer)
FROM tracks;

--4
SELECT DISTINCT AlbumId, MediaTypeId
FROM tracks;

--5
SELECT Name,TrackId
FROM tracks
WHERE Composer='Jorge Ben';

--6
SELECT *
FROM invoices
WHERE Total>25;

--7
SELECT *
FROM invoices
WHERE Total<15
LIMIT 5;

--8
SELECT *
FROM invoices
WHERE Total>10
ORDER BY Total DESC
LIMIT 2;

--9
SELECT *
FROM invoices
WHERE BillingCountry <> 'Canada'
ORDER BY Total ASC
LIMIT 10;

--10
SELECT InvoiceId,CustomerId,Total
FROM invoices
ORDER BY CustomerId ASC, Total DESC;

--11
SELECT Name
FROM tracks
WHERE Name LIKE 'B%S';

--12
SELECT InvoiceDate
FROM invoices
WHERE InvoiceDate BETWEEN '2008-01-01' AND'2011-12-31'
ORDER BY InvoiceDate DESC
LIMIT 1;

--13
SELECT FirstName,LastName
FROM customers
WHERE country='Belguim' OR country='Norway';

--14
SELECT *
FROM tracks
WHERE Composer LIKE '%Zappa';

--15
SELECT COUNT(tracks.Name) AS Quantity_Of_Tracks
FROM tracks;
SELECT COUNT(invoices.InvoiceDate) AS Quantity_Of_Invoices
FROM invoices;

--16
SELECT AlbumId, COUNT(AlbumId) AS Total_Amount
FROM tracks
GROUP BY AlbumId
ORDER BY Total_Amount DESC;

--17
SELECT COUNT(DISTINCT Composer) AS Quantity_Of_Composers
FROM tracks;

--18
SELECT *, MAX(Milliseconds)
FROM tracks;
SELECT *, MiN(Milliseconds)
FROM tracks;

--19
SELECT Name, Milliseconds
FROM tracks
WHERE Milliseconds < 393599.21;

SELECT AVG(Milliseconds) FROM tracks;

--20
SELECT tracks.TrackId,tracks.Name,genres.Name
FROM tracks
LEFT JOIN genres ON genres.GenreId==tracks.GenreId;

--21
SELECT artists.ArtistId, artists.Name, 
       albums.AlbumId, albums.Title
FROM artists
LEFT JOIN albums ON artists.ArtistId==albums.ArtistId;

--22
SELECT albums.AlbumId,albums.Title,tracks.Milliseconds
FROM albums
LEFT JOIN tracks ON albums.AlbumId==tracks.AlbumId;

SELECT albums.AlbumId,albums.Title,MIN(milliseconds)
FROM albums
LEFT JOIN tracks ON albums.AlbumId==tracks.AlbumId
GROUP BY Title
ORDER BY Milliseconds DESC;

--23?????
SELECT albums.Title, SUM(milliseconds) AS Total_Duration
FROM albums
LEFT JOIN tracks ON albums.AlbumId==tracks.AlbumId
GROUP BY albums.Title
HAVING Total_Duration>36000000
ORDER BY Total_Duration DESC;

--24
SELECT tracks.TrackId, tracks.Name, tracks.AlbumId,albums.Title
FROM albums
LEFT JOIN tracks ON albums.AlbumId==tracks.AlbumId
WHERE albums.Title IN ('Prenda Minha','Heart of the Night',  'Out Of Exile');

SELECT Trackid, Name, Albumid
FROM tracks
WHERE albumid IN (
 SELECT AlbumId
 FROM albums
 WHERE Title IN ('Prenda Minha', 'Heart of the Night', 'Out Of Exile'));
