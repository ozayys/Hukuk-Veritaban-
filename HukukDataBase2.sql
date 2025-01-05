
CREATE PROCEDURE YeniOdemeEkle
    @MuvekkilID INT,
    @Tutar DECIMAL(10, 2),
    @Tarih DATE,
    @OdemeTuru NVARCHAR(50)
AS
BEGIN
    INSERT INTO Odemeler (MuvekkilID, Tutar, Tarih, OdemeTuru)
    VALUES (@MuvekkilID, @Tutar, @Tarih, @OdemeTuru);

    PRINT 'Yeni ödeme baþarýyla eklendi.';
END;
GO


EXEC YeniOdemeEkle @MuvekkilID = 1, @Tutar = 2000.00, @Tarih = '2024-12-29', @OdemeTuru = 'Kredi Kartý';
GO


CREATE TABLE OdemeGecmisi (
    MuvekkilID INT PRIMARY KEY,
    ToplamTutar DECIMAL(15, 2),
    SonOdemeTarihi DATE,
    FOREIGN KEY (MuvekkilID) REFERENCES Muvekkiller(MuvekkilID)
);
GO


CREATE TRIGGER OdemeGuncelleTrigger
ON Odemeler
AFTER INSERT
AS
BEGIN
   
    UPDATE OdemeGecmisi
    SET 
        ToplamTutar = ToplamTutar + INSERTED.Tutar,
        SonOdemeTarihi = INSERTED.Tarih
    FROM OdemeGecmisi
    INNER JOIN INSERTED ON OdemeGecmisi.MuvekkilID = INSERTED.MuvekkilID;

   
    INSERT INTO OdemeGecmisi (MuvekkilID, ToplamTutar, SonOdemeTarihi)
    SELECT MuvekkilID, Tutar, Tarih
    FROM INSERTED
    WHERE NOT EXISTS (
        SELECT 1
        FROM OdemeGecmisi
        WHERE OdemeGecmisi.MuvekkilID = INSERTED.MuvekkilID
    );
END;
GO
EXEC YeniOdemeEkle 
    @MuvekkilID = 3, 
    @Tutar = 1500.00, 
    @Tarih = '2024-12-30', 
    @OdemeTuru = 'Havale';
SELECT * FROM OdemeGecmisi;


