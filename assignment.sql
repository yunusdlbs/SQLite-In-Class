SELECT SUM(total) AS Total_Amount
FROM invoices
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2013-12-31';

SELECT customers.FirstName,customers.LastName, 
       invoices.InvoiceDate,invoices.Total
FROM invoices
LEFT JOIN customers
ON customers.CustomerId=invoices.CustomerId;

SELECT tracks.Name,tracks.TrackId,genres.Name 
FROM tracks
LEFT JOIN genres
ON tracks.GenreId=genres.GenreId;


SELECT artists.ArtistId,artists.Name,
       albums.Title,albums.AlbumId
FROM artists
LEFT JOIN albums
ON artists.ArtistId=albums.ArtistId;

-- kaç farklı yıl olduğunu yazan sorgu...
SELECT COUNT (DISTINCT strftime('%Y',InvoiceDate)) AS Different_Years 
FROM invoices;
