-- tracks daki nameleri sorguladık.
SELECT Name FROM tracks;
-- birden fazla sütun
SELECT composer, name FROM tracks;
---tümünü bbirden sorgulama--
SELECT * FROM tracks;
-- DISTINCT kullanımı 3503 den 853 e düştü sayı...
SELECT DISTINCT Composer FROM tracks;
-- 2 DISTINCT yapımı??
SELECT DISTINCT AlbumId, MediaTypeId FROM tracks;
-- WHERE kullanımı
SELECT name FROM tracks WHERE Composer=="Jimi Hendrix";
-- diğer bir yazılım da
SELECT name
FROM tracks
WHERE Composer="Jimi Hendrix";
--- invoice 10 dolardan büyükler
SELECT *
FROM invoices
WHERE total > 10;
-- deneme