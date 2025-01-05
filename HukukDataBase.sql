--CREATE TABLE Avukatlar (
--    AvukatID INT PRIMARY KEY IDENTITY(1,1),
--    Ad NVARCHAR(50) NOT NULL,
--    Soyad NVARCHAR(50) NOT NULL,
--    UzmanlikAlan� NVARCHAR(100),
--    BaroNumarasi NVARCHAR(20)
--);

--CREATE TABLE Muvekkiller (
--    MuvekkilID INT PRIMARY KEY IDENTITY(1,1),
--    Ad NVARCHAR(50) NOT NULL,
--    Soyad NVARCHAR(50) NOT NULL,
--    Telefon NVARCHAR(15),
--    Eposta NVARCHAR(100),
--    Adres NVARCHAR(200)
--);

--CREATE TABLE Mahkemeler (
--    MahkemeID INT PRIMARY KEY IDENTITY(1,1),
--    MahkemeAdi NVARCHAR(100) NOT NULL,
--    Sehir NVARCHAR(50),
--    Adres NVARCHAR(200)
--);

--CREATE TABLE Davalar (
--    DavaID INT PRIMARY KEY IDENTITY(1,1),
--    DavaTuru NVARCHAR(100),
--    BaslangicTarihi DATE NOT NULL,
--    Durum NVARCHAR(50),
--    MahkemeID INT,
--    FOREIGN KEY (MahkemeID) REFERENCES Mahkemeler(MahkemeID) ON DELETE CASCADE
--);

--CREATE TABLE Avukat_Dava (
--    AvukatID INT,
--    DavaID INT,
--    PRIMARY KEY (AvukatID, DavaID),
--    FOREIGN KEY (AvukatID) REFERENCES Avukatlar(AvukatID) ON DELETE CASCADE,
--    FOREIGN KEY (DavaID) REFERENCES Davalar(DavaID) ON DELETE CASCADE
--);

--CREATE TABLE Dava_Taraflari (
--    DavaID INT,
--    MuvekkilID INT NOT NULL,
--    AvukatID INT NOT NULL,
--    TarafRol NVARCHAR(50),
--    PRIMARY KEY (DavaID, MuvekkilID, AvukatID),
--    FOREIGN KEY (DavaID) REFERENCES Davalar(DavaID) ON DELETE CASCADE,
--    FOREIGN KEY (MuvekkilID) REFERENCES Muvekkiller(MuvekkilID) ON DELETE CASCADE,
--    FOREIGN KEY (AvukatID) REFERENCES Avukatlar(AvukatID) ON DELETE CASCADE
--);

--CREATE TABLE Muvekkil_Avukat (
--    MuvekkilID INT,
--    AvukatID INT,
--    IliskiBaslangicTarihi DATE,
--    PRIMARY KEY (MuvekkilID, AvukatID),
--    FOREIGN KEY (MuvekkilID) REFERENCES Muvekkiller(MuvekkilID) ON DELETE CASCADE,
--    FOREIGN KEY (AvukatID) REFERENCES Avukatlar(AvukatID) ON DELETE CASCADE
--);

--CREATE TABLE Belgeler (
--    BelgeID INT PRIMARY KEY IDENTITY(1,1),
--    DavaID INT,
--    BelgeTuru NVARCHAR(50),
--    YuklenmeTarihi DATE NOT NULL,
--    FOREIGN KEY (DavaID) REFERENCES Davalar(DavaID) ON DELETE CASCADE
--);

--CREATE TABLE Odemeler (
--    OdemeID INT PRIMARY KEY IDENTITY(1,1),
--    MuvekkilID INT,
--    Tutar DECIMAL(10, 2) NOT NULL,
--    Tarih DATE NOT NULL,
--    OdemeTuru NVARCHAR(50),
--    FOREIGN KEY (MuvekkilID) REFERENCES Muvekkiller(MuvekkilID) ON DELETE CASCADE
--);

--CREATE TABLE Sikayetler (
--    SikayetID INT PRIMARY KEY IDENTITY(1,1),
--    DavaID INT,
--    SikayetMetni NVARCHAR(MAX) NOT NULL,
--    SikayetTarihi DATE NOT NULL,
--    FOREIGN KEY (DavaID) REFERENCES Davalar(DavaID) ON DELETE CASCADE
--);

INSERT INTO Avukatlar (Ad, Soyad, UzmanlikAlan�, BaroNumarasi)
VALUES 
('Ahmet', 'Y�lmaz', 'Ceza Hukuku', 'BR12345'),
('Elif', 'Demir', 'Aile Hukuku', 'BR23456'),
('Kemal', 'Kaya', 'Ticaret Hukuku', 'BR34567');
INSERT INTO Muvekkiller (Ad, Soyad, Telefon, Eposta, Adres)
VALUES 
('Mehmet', 'Can', '5551234567', 'mehmetcan@example.com', '�stanbul, Kad�k�y'),
('Ay�e', '�zt�rk', '5559876543', 'ayseozturk@example.com', 'Ankara, �ankaya'),
('Ali', 'Kurt', '5556543210', 'alikurt@example.com', '�zmir, Kar��yaka');
INSERT INTO Mahkemeler (MahkemeAdi, Sehir, Adres)
VALUES 
('�stanbul 5. A��r Ceza Mahkemesi', '�stanbul', 'Adliye Saray�, �a�layan'),
('Ankara 2. Aile Mahkemesi', 'Ankara', 'Adliye Saray�, S�hhiye'),
('�zmir 3. Ticaret Mahkemesi', '�zmir', 'Adliye Saray�, Bayrakl�');
INSERT INTO Davalar (DavaTuru, BaslangicTarihi, Durum, MahkemeID)
VALUES 
('Doland�r�c�l�k', '2024-01-10', 'Devam Ediyor', 1),
('Bo�anma', '2024-02-15', 'Beklemede', 2),
('Haks�z Rekabet', '2024-03-01', 'Tamamland�', 3);
INSERT INTO Avukat_Dava (AvukatID, DavaID)
VALUES 
(1, 1),
(2, 2),
(3, 3);
INSERT INTO Dava_Taraflari (DavaID, MuvekkilID, AvukatID, TarafRol)
VALUES 
(1, 1, 1, 'Davac�'),
(2, 2, 2, 'Daval�'),
(3, 3, 3, 'Davac�');
INSERT INTO Muvekkil_Avukat (MuvekkilID, AvukatID, IliskiBaslangicTarihi)
VALUES 
(1, 1, '2023-01-01'),
(2, 2, '2023-02-01'),
(3, 3, '2023-03-01');
INSERT INTO Belgeler (DavaID, BelgeTuru, YuklenmeTarihi)
VALUES 
(1, '�ddianame', '2024-01-15'),
(2, 'Dilek�e', '2024-02-20'),
(3, 'Karar', '2024-03-10');
INSERT INTO Odemeler (MuvekkilID, Tutar, Tarih, OdemeTuru)
VALUES 
(1, 5000.00, '2024-01-12', 'Nakit'),
(2, 3000.00, '2024-02-18', 'Havale'),
(3, 7000.00, '2024-03-05', 'Kredi Kart�');
INSERT INTO Sikayetler (DavaID, SikayetMetni, SikayetTarihi)
VALUES 
(1, 'San�k su�lamalar� reddediyor.', '2024-01-20'),
(2, 'Mahkeme tarihi s�rekli erteleniyor.', '2024-02-25'),
(3, 'Avukat�n ileti�imi yetersiz.', '2024-03-15');




