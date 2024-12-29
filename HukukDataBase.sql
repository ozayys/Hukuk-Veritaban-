CREATE TABLE Avukatlar (
    AvukatID INT PRIMARY KEY IDENTITY(1,1),
    Ad NVARCHAR(50),
    Soyad NVARCHAR(50),
    UzmanlikAlaný NVARCHAR(100),
    BaroNumarasi NVARCHAR(20)
);

CREATE TABLE Mahkemeler (
    MahkemeID INT PRIMARY KEY IDENTITY(1,1),
    MahkemeAdi NVARCHAR(100),
    Sehir NVARCHAR(50),
    Adres NVARCHAR(250)
);

CREATE TABLE Muvekkiller (
    MuvekkilID INT PRIMARY KEY IDENTITY(1,1),
    Ad NVARCHAR(50),
    Soyad NVARCHAR(50),
    Telefon NVARCHAR(15),
    Eposta NVARCHAR(100),
    Adres NVARCHAR(250)
);

CREATE TABLE Davalar (
    DavaID INT PRIMARY KEY IDENTITY(1,1),
    DavaTuru NVARCHAR(50),
    BaslangicTarihi DATE,
    Durum NVARCHAR(50),
    AvukatID INT,
    MahkemeID INT,
    FOREIGN KEY (AvukatID) REFERENCES Avukatlar(AvukatID),
    FOREIGN KEY (MahkemeID) REFERENCES Mahkemeler(MahkemeID)
);

CREATE TABLE Belgeler (
    BelgeID INT PRIMARY KEY IDENTITY(1,1),
    DavaID INT,
    BelgeTuru NVARCHAR(50),
    YuklenmeTarihi DATE,
    FOREIGN KEY (DavaID) REFERENCES Davalar(DavaID)
);

CREATE TABLE Sikayetler (
    SikayetID INT PRIMARY KEY IDENTITY(1,1),
    DavaID INT,
    SikayetMetni NVARCHAR(MAX),
    SikayetTarihi DATE,
    FOREIGN KEY (DavaID) REFERENCES Davalar(DavaID)
);

CREATE TABLE Odemeler (
    OdemeID INT PRIMARY KEY IDENTITY(1,1),
    MuvekkilID INT,
    Tutar DECIMAL(10, 2),
    Tarih DATE,
    OdemeTuru NVARCHAR(50),
    FOREIGN KEY (MuvekkilID) REFERENCES Muvekkiller(MuvekkilID)
);

INSERT INTO Avukatlar (Ad, Soyad, UzmanlikAlaný, BaroNumarasi)
VALUES 
('Ahmet', 'Yýlmaz', 'Ceza Hukuku', 'BR12345'),
('Elif', 'Demir', 'Aile Hukuku', 'BR23456'),
('Kemal', 'Kaya', 'Ticaret Hukuku', 'BR34567');

INSERT INTO Muvekkiller (Ad, Soyad, Telefon, Eposta, Adres)
VALUES 
('Mehmet', 'Can', '5551234567', 'mehmetcan@example.com', 'Ýstanbul, Kadýköy'),
('Ayþe', 'Öztürk', '5559876543', 'ayseozturk@example.com', 'Ankara, Çankaya'),
('Ali', 'Kurt', '5556543210', 'alikurt@example.com', 'Ýzmir, Karþýyaka');

INSERT INTO Mahkemeler (MahkemeAdi, Sehir, Adres)
VALUES 
('Ýstanbul 5. Aðýr Ceza Mahkemesi', 'Ýstanbul', 'Adliye Sarayý, Çaðlayan'),
('Ankara 2. Aile Mahkemesi', 'Ankara', 'Adliye Sarayý, Sýhhiye'),
('Ýzmir 3. Ticaret Mahkemesi', 'Ýzmir', 'Adliye Sarayý, Bayraklý');

INSERT INTO Davalar (DavaTuru, BaslangicTarihi, Durum, AvukatID, MahkemeID)
VALUES 
('Dolandýrýcýlýk', '2024-01-10', 'Devam Ediyor', 1, 1),
('Boþanma', '2024-02-15', 'Beklemede', 2, 2),
('Haksýz Rekabet', '2024-03-01', 'Tamamlandý', 3, 3);

INSERT INTO Dava_Taraflari (DavaID, MuvekkilID, TarafRol)
VALUES 
(1, 1, 'Davacý'),
(2, 2, 'Davalý'),
(3, 3, 'Davacý');

INSERT INTO Belgeler (DavaID, BelgeTuru, YuklenmeTarihi)
VALUES 
(1, 'Ýddianame', '2024-01-15'),
(2, 'Dilekçe', '2024-02-20'),
(3, 'Karar', '2024-03-10');

INSERT INTO Odemeler (MuvekkilID, Tutar, Tarih, OdemeTuru)
VALUES 
(1, 5000.00, '2024-01-12', 'Nakit'),
(2, 3000.00, '2024-02-18', 'Havale'),
(3, 7000.00, '2024-03-05', 'Kredi Kartý');

INSERT INTO Sikayetler (DavaID, SikayetMetni, SikayetTarihi)
VALUES 
(1, 'Sanýk suçlamalarý reddediyor.', '2024-01-20'),
(2, 'Mahkeme tarihi sürekli erteleniyor.', '2024-02-25'),
(3, 'Avukatýn iletiþimi yetersiz.', '2024-03-15');
