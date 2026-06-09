-- 1. Hangi üye hangi kitabı ödünç aldı?
SELECT Uye.Ad, Uye.Soyad, Kitap.KitapAdi, OduncAlma.AlmaTarihi, OduncAlma.CezaTutari
FROM OduncAlma
JOIN Uye ON OduncAlma.UyeID = Uye.UyeID
JOIN Kopya ON OduncAlma.KopyaID = Kopya.KopyaID
JOIN Kitap ON Kopya.KitapID = Kitap.KitapID

-- 2. Ceza ödeyen üyeler
SELECT *
FROM OduncAlma
JOIN Uye ON OduncAlma.UyeID = Uye.UyeID
WHERE CezaTutari > 0

-- 3. İade edilmemiş kitaplar
SELECT *
FROM OduncAlma
WHERE IadeTarihi IS NULL

-- 4. Belirli şubedeki kitaplar
SELECT *
FROM Kitap
JOIN Kopya ON Kopya.KitapID = Kitap.KitapID
JOIN Sube ON Kopya.SubeID = Sube.SubeID
WHERE SubeAdi = 'Ankara Merkez'

-- 5. Kitapları basım tarihine göre sırala
SELECT *
FROM Kitap
ORDER BY BasimTarihi ASC

-- 6. En son eklenen 2 kitap
SELECT TOP 2 *
FROM Kitap
ORDER BY KitapID DESC

-- 7. Tekrarsız yazar listesi
SELECT DISTINCT YazarID FROM Kitap

-- 8. Toplam kitap sayısı
SELECT COUNT(*) FROM Kitap

-- 9. Toplam ceza tutarı
SELECT SUM(CezaTutari) FROM OduncAlma

-- 10. Ortalama gecikme günü
SELECT AVG(GecikmeGunu) FROM OduncAlma

-- 11. Her yazarın kitap sayısı
SELECT YazarID, COUNT(*)
FROM Kitap
GROUP BY YazarID

-- 12. 1'den fazla kitabı olan yazarlar
SELECT YazarID, COUNT(*)
FROM Kitap
GROUP BY YazarID
HAVING COUNT(*) > 1

-- 13. Her şubede kaç kopya kitap var?
SELECT COUNT(*) , SubeAdi
FROM Kopya
JOIN Sube ON Kopya.SubeID = Sube.SubeID
GROUP BY SubeAdi

-- 14. En çok ödünç alınan kitap hangisi?
SELECT Kitap.KitapAdi , COUNT(*)
FROM OduncAlma
JOIN Kopya ON OduncAlma.KopyaID = Kopya.KopyaID
JOIN Kitap ON Kopya.KitapID = Kitap.KitapID
GROUP BY Kitap.KitapAdi
ORDER BY COUNT(*) DESC