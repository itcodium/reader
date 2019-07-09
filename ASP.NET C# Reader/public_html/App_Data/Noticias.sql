CREATE TABLE [dbo].[News](
	[IdNew] [int] IDENTITY(1,1) NOT NULL,
	[IdNewsPaper] [int] NOT NULL,
	[Title] [varchar](300) NOT NULL,
	[Description] [varchar](8000) NULL,
	[PublishDate] [datetime] NOT NULL,
	[Link] [varchar](1200) NULL,
	[Author] [varchar](500) NULL,
	[Created] [datetime] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[IdNew] ASC
)ON [PRIMARY]
) ON [PRIMARY]

GO





ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_NewsPaper] FOREIGN KEY([IdNewsPaper])
REFERENCES [dbo].[NewsPaper] ([IdNewsPaper])
GO

ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_NewsPaper]
GO

-- -----------------------------------------------------------------------------------------------
GO

CREATE TABLE [dbo].[NewsPaper](
	[IdNewsPaper] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](20) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[Descripcion] [varchar](4000) NULL,
 CONSTRAINT [PK_NewsPaper] PRIMARY KEY CLUSTERED 
(
	[IdNewsPaper] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- ---------------------------------------------------------------------------------------
GO
CREATE PROCEDURE News_Insert
@IdNewsPaper INT,
@Title varchar(300),
@Description varchar(8000),
@PublishDate datetime,
@Link varchar(1200),
@Author varchar(500)
AS
BEGIN
	INSERT INTO News(IdNewsPaper,Title,Description,PublishDate,Link,Author)
	VALUES (@IdNewsPaper,@Title,@Description ,@PublishDate,@Link,@Author)
END
GO
CREATE PROCEDURE News_Get_All
AS
BEGIN
	SELECT IdNewsPaper,Title,Description,PublishDate,Link,Author 
	FROM News
	
END
GO

ALTER PROCEDURE News_Insert
@IdNewsPaper INT,
@IdChannel INT,
@Title varchar(300),
@Description varchar(8000),
@PublishDate datetime,
@Link varchar(1200),
@Author varchar(500)
AS
BEGIN
	INSERT INTO News(IdNewsPaper,IdChannel,Title,Description,PublishDate,Link,Author)
	VALUES (@IdNewsPaper,@IdChannel,@Title,@Description ,@PublishDate,@Link,@Author)
END


GO
/*
	Channel: 1	INDV
			 2	GENR
*/

	INSERT INTO ChannelType(Codi,[Description])
		 VALUES('INDV',	'Individual')
	INSERT INTO ChannelType(Codi,[Description])
	VALUES('GENR',	'Generico')

-- Creacion de diarios 
	INSERT INTO NewsPaper ([Codigo],[Nombre],[Descripcion])
	VALUES ('GENERICO','Genérico','Diario inexistente utilizado para agrupar canales genericos a otros diarios')

	INSERT INTO NewsPaper ([Codigo],[Nombre],[Descripcion])
	VALUES ('CLARIN','Clarin','Diario clarin online')
	
	INSERT INTO NewsPaper ([Codigo],[Nombre],[Descripcion])
	VALUES ('NACION','La Nación','Diario La Nación')

	INSERT INTO NewsPaper ([Codigo],[Nombre],[Descripcion])
	VALUES ('INFOBAE','Infobae','Diario Infobae')

-- Creacion de canales
 
	INSERT Channel(IdChannelType,IdNewsPaper,Codi, [Description])
	VALUES(2,5,'POLCA', 'Política')

	INSERT Channel(IdChannelType,IdNewsPaper,Codi, [Description])
	VALUES(2,5,'ECONO','Economía')

	INSERT Channel(IdChannelType,IdNewsPaper,Codi, [Description])
	VALUES(2,5,'DEPOR','Deportes')
	
	INSERT Channel(IdChannelType,IdNewsPaper,Codi, [Description])
	VALUES(2,5,'MUNDO','El Mundo')
	
	INSERT Channel(IdChannelType,IdNewsPaper,Codi, [Description])
	VALUES(2,5,'SOCIEDAD','Sociedad')
	
	INSERT Channel(IdChannelType,IdNewsPaper,Codi, [Description])
	VALUES(1,6,'POLIC','Policiales')
	
	

GO 
-- Newspaper-Channel-Url

-- Clarin
	INSERT NewsPaperUrl(IdNewsPaper,IdChannel,url)
		VALUES(6,19,'http://www.clarín.com/rss/politica/')
	INSERT NewsPaperUrl(IdNewsPaper,IdChannel,url)
		VALUES(6,20,'http://www.clarin.com/rss/economia/')
	INSERT NewsPaperUrl(IdNewsPaper,IdChannel,url)
		VALUES(6,21,'http://www.clarin.com/rss/deportes/')
	INSERT NewsPaperUrl(IdNewsPaper,IdChannel,url)
		VALUES(6,22,'http://www.clarin.com/rss/mundo/')		
	INSERT NewsPaperUrl(IdNewsPaper,IdChannel,url)
		VALUES(6,24,'http://www.clarin.com/rss/policiales/')
	
		
		
-- La Nacion	
	INSERT NewsPaperUrl(IdNewsPaper,IdChannel,url)
		VALUES(3,19,'http://contenidos.lanacion.com.ar/herramientas/rss/categoria_id=30')
	INSERT NewsPaperUrl(IdNewsPaper,IdChannel,url)
		VALUES(3,20,'http://contenidos.lanacion.com.ar/herramientas/rss/categoria_id=272')
	INSERT NewsPaperUrl(IdNewsPaper,IdChannel,url)
		VALUES(3,21,'http://contenidos.lanacion.com.ar/herramientas/rss/categoria_id=131')
	INSERT NewsPaperUrl(IdNewsPaper,IdChannel,url)
		VALUES(3,22,'http://contenidos.lanacion.com.ar/herramientas/rss/categoria_id=7')		

-- Infobae 		

	INSERT NewsPaperUrl(IdNewsPaper,IdChannel,url)
		VALUES(4,19,'http://cdn01.ib.infobae.com/adjuntos/162/rss/politica.xml')
	INSERT NewsPaperUrl(IdNewsPaper,IdChannel,url)
		VALUES(4,20,'http://cdn01.ib.infobae.com/adjuntos/162/rss/economia.xml')
	INSERT NewsPaperUrl(IdNewsPaper,IdChannel,url)
		VALUES(4,21,'http://cdn01.ib.infobae.com/adjuntos/162/rss/deportes.xml')		
	INSERT NewsPaperUrl(IdNewsPaper,IdChannel,url)
		VALUES(4,23,'http://cdn01.ib.infobae.com/adjuntos/162/rss/sociedad.xml')
GO
SELECT c.IdChannel,p.Nombre,c.[Description], u.url
 FROM NewsPaperUrl u
	INNER JOIN NewsPaper  p 
		ON  u.IdNewsPaper=p.IdNewsPaper
	INNER JOIN Channel c 
		ON 	c.IdChannel=u.IdChannel
		
GO	
	SELECT * FROM ChannelType
	SELECT * FROM Channel
	SELECT * FROM NewsPaper
	SELECT * FROM NewsPaperUrl
	SELECT * FROM News
	
		
-- Parche

/*	
	UPDATE c
	SET IdChannelType=2, -- Generico
		IdNewsPaper=2	 -- Diario generico 	
	FROM Channel c	
	
	UPDATE n
	SET IdChannel=(select Idchannel from Channel where Codi='depor')
	FROM News n
	
	update NewsPaperUrl
	set enabled=1
*/	
select *
from News


select IdNewsPaper, IdChannel,count(1)  
from News
group by IdNewsPaper, IdChannel 


NewsPaper
-- Tomar FK IdNewsPaper
-- De las tablas que usan esta FK seleccionar los datos



 