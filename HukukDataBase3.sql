BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO Odemeler (MuvekkilID, Tutar, Tarih, OdemeTuru)
    VALUES (1, 4000.00, '2024-12-29', 'Kredi Kartý'); 
    
    UPDATE Davalar
    SET Durum = 'Ödeme Yapýldý'
    WHERE DavaID = 1; 
   
    INSERT INTO Belgeler (DavaID, BelgeTuru, YuklenmeTarihi)
    VALUES (1, 'Ödeme Makbuzu', '2024-12-29');
     
    COMMIT;
    PRINT 'Tüm iþlemler baþarýyla tamamlandý.';

END TRY
BEGIN CATCH
   
    ROLLBACK;
    PRINT 'Bir hata oluþtu. Ýþlem geri alýndý. Hata: ' + ERROR_MESSAGE();
END CATCH;
