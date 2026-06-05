CREATE TABLE [Yazar] (
  [YazarID] int PRIMARY KEY IDENTITY(1, 1),
  [Ad] varchar(50),
  [Soyad] varchar(50)
)
GO

CREATE TABLE [Yayinevi] (
  [YayineviID] int PRIMARY KEY IDENTITY(1, 1),
  [YayineviAdi] varchar(50)
)
GO

CREATE TABLE [Kategori] (
  [KategoriID] int PRIMARY KEY IDENTITY(1, 1),
  [KategoriAdi] varchar(50)
)
GO

CREATE TABLE [Sube] (
  [SubeID] int PRIMARY KEY IDENTITY(1, 1),
  [SubeAdi] varchar(50),
  [Adres] varchar(50)
)
GO

CREATE TABLE [Kitap] (
  [KitapID] int PRIMARY KEY IDENTITY(1, 1),
  [KitapAdi] varchar(50),
  [BasimTarihi] date,
  [YazarID] int,
  [YayineviID] int,
  [KategoriID] int
)
GO

CREATE TABLE [Kopya] (
  [KopyaID] int PRIMARY KEY IDENTITY(1, 1),
  [Durum] varchar(50),
  [KitapID] int,
  [SubeID] int
)
GO

CREATE TABLE [Uye] (
  [UyeID] int PRIMARY KEY IDENTITY(1, 1),
  [Ad] varchar(50),
  [Soyad] varchar(50),
  [Email] varchar(50),
  [SonGirisTarihi] date,
  [KayitTarihi] date
)
GO

CREATE TABLE [OduncAlma] (
  [OduncID] int PRIMARY KEY IDENTITY(1, 1),
  [AlmaTarihi] date,
  [IadeTarihi] date,
  [GecikmeGunu] int,
  [CezaTutari] int,
  [UyeID] int,
  [KopyaID] int
)
GO

ALTER TABLE [Kitap] ADD FOREIGN KEY ([YazarID]) REFERENCES [Yazar] ([YazarID])
GO

ALTER TABLE [Kitap] ADD FOREIGN KEY ([YayineviID]) REFERENCES [Yayinevi] ([YayineviID])
GO

ALTER TABLE [Kitap] ADD FOREIGN KEY ([KategoriID]) REFERENCES [Kategori] ([KategoriID])
GO

ALTER TABLE [Kopya] ADD FOREIGN KEY ([KitapID]) REFERENCES [Kitap] ([KitapID])
GO

ALTER TABLE [Kopya] ADD FOREIGN KEY ([SubeID]) REFERENCES [Sube] ([SubeID])
GO

ALTER TABLE [OduncAlma] ADD FOREIGN KEY ([UyeID]) REFERENCES [Uye] ([UyeID])
GO

ALTER TABLE [OduncAlma] ADD FOREIGN KEY ([KopyaID]) REFERENCES [Kopya] ([KopyaID])
GO

ALTER TABLE [Kitap] ADD FOREIGN KEY ([BasimTarihi]) REFERENCES [Kitap] ([YayineviID])
GO

ALTER TABLE [Sube] ADD FOREIGN KEY ([SubeAdi]) REFERENCES [Sube] ([SubeID])
GO
