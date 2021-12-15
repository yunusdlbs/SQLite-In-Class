SELECT FirstName,LastName,City,Address
FROM customers
WHERE FirstName LIKE "___";

SELECT FirstName,LastName,City
FROM customers
WHERE LastName LIKE 'Sch%' OR LastName LIKE 'Go%';

--AGGREGATE functions...
--COUNT 
SELECT COUNT (InvoiceId)
FROM invoices;

SELECT COUNT (*)
FROM invoices;

SELECT COUNT (BillingState)  -- burada NULL olanları saymadığı için cevap 210 çıktı...
FROM invoices;

SELECT COUNT(DISTINCT Composer) AS Composer_Name_As_Distinct
FROM tracks;

SELECT COUNT(Composer) AS Composer_Name_As_Distinct  -- tekrarlı toplam sayısı
FROM tracks;

--MIN/MAX fonksiyonu kullanımı...
SELECT name AS Song_Name,MIN(Milliseconds) AS Duration_second
FROM tracks;

SELECT MIN(Grade) AS Min_Grade, MAX(Grade) AS Max_Grade
FROM students;

SELECT SUM(total) AS Total_Amount
FROM invoices;

SELECT ROUND(AVG (total),2) AS Ortalama_Değer
FROM invoices;

SELECT Name, Milliseconds
FROM tracks
WHERE Milliseconds > (SELECT ROUND(AVG(Milliseconds))
FROM tracks);    -- Burada içiçe query kullandık...

-- GROUP BY kullanımı....

SELECT Composer, COUNT(name) AS Song_Count
FROM tracks
GROUP BY Composer;

SELECT Composer, COUNT(name) AS Song_Count
FROM tracks
WHERE Composer IS NOT NULL
GROUP BY Composer;

-- customer tablosundaki müşterilerin ülkelerine göre gruplandırılıp müşteri sayısı azalana göre sıralanması...
SELECT country, COUNT(FirstName) AS Num_Of_Cust
FROM customers
GROUP BY country
ORDER BY Num_Of_Cust DESC;

-- müşterilerin sayısnı ülke ve şehirlerine göre gruplandır...
SELECT country,City, COUNT(FirstName) AS nu_of_cust
FROM customers
GROUP BY country, City;

--invvo,cedeki her ülkenin fatura ort hesapla ve ülke bilg listele
SELECT BillingCountry, ROUND(AVG(total),2) AS Ort_Fatura
FROM invoices
GROUP BY BillingCountry;

SELECT BillingCountry, ROUND(AVG(total),2) AS Ort_Fatura
FROM invoices
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2011-12-31 23.59.59'
GROUP BY BillingCountry;

--JOINS
--====================================================*/
    
--     Join islemleri farkli tablolardan secilen sutunlar ile yeni bir tablo 
--     olusturmak icin kullanilabilir.
--     
--     JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
--    	Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
--     icin JOIN islemleri kullanilabilir.

--     Standart SQL'de en çok kullanılan Join islemleri:
--   	1) FULL JOIN:  Tablodaki tum sonuclari gosterir
--     2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
--     3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
--     4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir.

--		NOT: SQLite Sadece INNER, LEFT VE CROSS JOIN İşlemlerini desteklemektedir.
 
 /*===================================================*/   

  /* araclar.db adındaki veritabanını kullanarak Markalar ve Siparisler tablolarındaki 
 marka_id'si ayni olan kayıtların marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
 bilgilerini  listeleyen bir sorgu yaziniz.*/

SELECT araclar.markalar.marka_adi, araclar.markalar.marka_id, 
		araclar.siparisler.siparis_adedi, araclar.siparisler.siparis_tarihi
FROM markalar
INNER JOIN siparisler 
ON markalar.marka_id=siparisler.marka_id;

SELECT araclar.markalar.marka_adi, araclar.markalar.marka_id, 
		araclar.siparisler.siparis_adedi, araclar.siparisler.siparis_tarihi
FROM markalar
LEFT JOIN siparisler 
ON markalar.marka_id=siparisler.marka_id;
 
