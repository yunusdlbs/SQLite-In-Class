--veritabanından tracks daki her şarkının türünü bulan sorgulama...
SELECT t.Name Track_Name, g.Name Genre_Name
FROM tracks t
JOIN genres g ON t.GenreId==g.GenreId;

SELECT c.FirstName,c.LastName, i.InvoiceDate,i.Total
FROM invoices i
JOIN customers c ON c.CustomerId==i.CustomerId;

SELECT c.FirstName,c.LastName, i.InvoiceDate,SUM(i.total)
FROM invoices i
JOIN customers c ON c.CustomerId==i.CustomerId
GROUP BY c.FirstName;  
--- nnil hanım

SELECT ar.ArtistId,ar.name,al.Title,al.AlbumId
FROM artists ar
JOIN albums al
ON ar.ArtistId=al.ArtistId;
-- aşağıdaki komutta NULL olanları da verir....
SELECT ar.ArtistId,ar.name,al.Title,al.AlbumId
FROM artists ar
LEFT JOIN albums al
ON ar.ArtistId=al.ArtistId;

-- album title ıfaceless olan olan albumün trackıd  ve name bilgilerini getirdik...
SELECT TrackId,name,AlbumId
FROM tracks
WHERE AlbumId=(SELECT AlbumId FROM albums WHERE Title='Faceless');

-- üstteki örneğin JOIN ile yapılışı
SELECT t.TrackId,t.name,t.AlbumId
FROM tracks t
JOIN albums a
ON t.AlbumId=a.AlbumId
WHERE a.Title='Faceless';

SELECT TrackId,name,AlbumId
FROM tracks
WHERE AlbumId IN (SELECT AlbumId FROM albums WHERE title IN ('Let There Be Rock','Faceless'));

CREATE TABLE Personel(First_Name VARCHAR(15),
Last_Name TEXT, Age INT, Hire_Date DATE);

CREATE TABLE vacation_plan(
			place_id INTEGER,
			country TEXT,
			hotel_name TEXT,
			employee_id INT,
			vacation_length INT,
			budget REAL);
			
-- DROP TABLE komutu ile var olan tablo silinebilir...
DROP TABLE Personel;

--INSERT INTO ekleme yapar..
INSERT INTO vacation_plan
VALUES(48,'TR','Happy Hotel',1,7,4950);
--çoklu veri girişi...
INSERT INTO vacation_plan
VALUES(49,'GER','Happy Hotel',3,8,4050),
(25,'EN','Life Hotel',2,9,5420);

--NULL veri girişi
INSERT INTO vacation_plan
VALUES(44,'FRA','Hayy Hotel',4,8,NULL);

--veri belirterek giriş yapma, belirtilmeyenler NULL olarak kabul edilir..
INSERT INTO vacation_plan(country,hotel_name,employee_id)
VALUES('BRA','Rayx Hotel',5);

-- Constraints ler kullanılarak tablo oluşturma...
CREATE TABLE workers (id INT PRIMARY KEY,
			id_number VARCHAR(15) UNIQUE NOT NULL,
			name TEXT DEFAULT 'No Name',
			salary INT NOT NULL);
			
INSERT INTO workers VALUES(1, '12345678910','AHMET CAN', 7000 );
INSERT INTO workers VALUES( 2, '12345678910', 'MUSTAFA ALİ', 12000);  -- HATA (UNIQUE)
INSERT INTO workers  (id,	id_number, salary) VALUES(3, '12345223465', 5000);
INSERT INTO workers VALUES(4, '44343323465' , 'AYHAN BAK',NULL); -- HATA (NOT NULL)

CREATE table vacation_plan2 (
		id INT,
		place_id INTEGER,
		country TEXT,
		hotel_name TEXT,
		employee_id INTEGER,
		vacation_lenght INT,
		budget REAL,
		PRIMARY KEY(id),
		FOREIGN KEY(employee_id) REFERENCES employees(EmployeeId)
	);

	/* Employees tablosundaki EmployeeId'si 1 olan kişi için bir tatil planı giriniz.*/
	INSERT INTO vacation_plan2 VALUES(1,34,'TR',	'HAPPY HOTEL',1,5,5660);
	
	/* Employees tablosunda bulunmayan bir kişi için (EmployeeId=9) olan kişi için bir tatil planı giriniz.*/
	INSERT INTO vacation_plan2 VALUES(2,48,'TR',	'COMFORT HOTEL',9,10,7000);  --HATA verir, 9 nolu Id employee içinde yok...
	INSERT INTO vacation_plan2 VALUES(2,48,'TR',	'COMFORT HOTEL',8,10,7000);  --HATA VERMEZ
	INSERT INTO vacation_plan2 VALUES(3,48,'TR',	'SAHIN PARADISE HOTEL',1,10,7000); --1 Id nolu vatandaş 2 farklı yerde tatil yapabilir...
	
	/*JOIN işlemi ile 2 tablodan veri çekme*/
	SELECT e.FirstName,e.LastName,v.hotel_name, v.vacation_lenght
	FROM employees e
	JOIN vacation_plan2 v
	ON e.EmployeeId=v.employee_id;
	
	--Tabloya yeni bir sütüun (column) ekleme...
	ALTER TABLE vacation_plan2
	ADD person_quantity INT DEFAULT NULL;
	
	ALTER TABLE vacation_plan2
	ADD rate_for_vacation INT DEFAULT 'Not Decided';
	
	ALTER TABLE vacation_plan2
	DROP COLUMN rate_for_vacation;
	
	--Tabloda veri değiştirme..
	UPDATE vacation_plan2
	SET hotel_name='Komagene Hotel'
	WHERE id=2;
	
	--maaşı 6000 den fazlaolanlara %10 zam yapan sorgu..
	UPDATE workers
	SET salary=salary*1.1
	WHERE salary>6000;
			
			


