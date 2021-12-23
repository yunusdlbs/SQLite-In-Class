--1)
SELECT albums.AlbumId, COUNT(tracks.name) AS Total_Num
FROM albums
LEFT JOIN tracks ON albums.AlbumId == tracks.AlbumId
GROUP BY albums.AlbumId
ORDER BY Total_Num DESC;
--2)
SELECT tracks.Name,albums.Title
FROM tracks
JOIN albums ON albums.AlbumId == tracks.AlbumId;
--3)
SELECT albums.AlbumId,albums.Title,
       MIN(tracks.Milliseconds) AS Min_Duration
FROM tracks
JOIN albums ON albums.AlbumId == tracks.AlbumId
GROUP BY albums.Title 
ORDER BY Min_Duration DESC;
--4)
SELECT albums.AlbumId,albums.Title,
       SUM(tracks.Milliseconds) AS Total_Duration
FROM albums
JOIN tracks ON albums.AlbumId == tracks.AlbumId
GROUP BY albums.Title
ORDER BY Total_Duration DESC;
--5)
SELECT albums.Title,
       SUM(tracks.Milliseconds) AS Total_Duration
FROM albums
JOIN tracks ON albums.AlbumId == tracks.AlbumId
GROUP BY albums.Title
HAVING Total_Duration > 4200000
ORDER BY Total_Duration DESC;