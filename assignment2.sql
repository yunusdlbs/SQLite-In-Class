SELECT COUNT(DISTINCT year(InvoiceDate))
FROM invoices;

SELECT DISTINCT(InvoiceDate) 
FROM invoices;

SELECT DISTINCT(datetime(InvoiceDate)) 
FROM invoices;

SELECT customers.FirstName,customers.LastName, 
       invoices.InvoiceDate,invoices.Total
FROM invoices
LEFT JOIN customers
ON customers.CustomerId=invoices.CustomerId;

SELECT customers.FirstName,customers.LastName, 
       invoices.InvoiceDate,invoices.Total
FROM customers
LEFT JOIN invoices
ON customers.CustomerId=invoices.CustomerId;

SELECT tracks.Name,tracks.TrackId,genres.Name,genres.GenreId 
FROM tracks
LEFT JOIN genres
ON tracks.GenreId=genres.GenreId;

SELECT artists.ArtistId, artists.Name,
       albums.Title, albums.AlbumId
FROM artists
LEFT JOIN albums
ON artists.ArtistId=albums.ArtistId ;

-- kaç farklı yıl olduğunu yazan sorgu...
SELECT COUNT (DISTINCT strftime('%Y',InvoiceDate)) AS Different_Years 
FROM invoices;

SELECT DISTINCT strftime('%Y',InvoiceDate) AS Different_Years 
FROM invoices;

SELECT DISTINCT strftime('%m',InvoiceDate) AS Different_Months 
FROM invoices;

SELECT COUNT (DISTINCT strftime('%d',InvoiceDate)) AS Different_Days 
FROM invoices;



