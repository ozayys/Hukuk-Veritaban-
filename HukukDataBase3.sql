BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO Odemeler (MuvekkilID, Tutar, Tarih, OdemeTuru)
    VALUES (1, 4000.00, '2024-12-29', 'Kredi Kart�'); 
    
    UPDATE Davalar
    SET Durum = '�deme Yap�ld�'
    WHERE DavaID = 1; 
   
    INSERT INTO Belgeler (DavaID, BelgeTuru, YuklenmeTarihi)
    VALUES (1, '�deme Makbuzu', '2024-12-29');
     
    COMMIT;
    PRINT 'T�m i�lemler ba�ar�yla tamamland�.';

END TRY
BEGIN CATCH
   
    ROLLBACK;
    PRINT 'Bir hata olu�tu. ��lem geri al�nd�. Hata: ' + ERROR_MESSAGE();
END CATCH;
