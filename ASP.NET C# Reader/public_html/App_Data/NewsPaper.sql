 
 ALTER PROCEDURE dbo.NewsPaperGetAll
 AS 
 BEGIN
	SELECT IdNewsPaper,Codigo,Nombre  
	FROM NewsPaper 
	WHERE Codigo!='GENERICO'
 END



CREATE PROCEDURE dbo.NewsPaperGetById
 @IdNewsPaper INT
 AS 
 BEGIN
	 SELECT IdNewsPaper,Codigo,Nombre,Descripcion,RssNodeName
	 FROM NewsPaper 
	 WHERE IdNewsPaper=@IdNewsPaper 
 END

	
 
 CREATE PROCEDURE dbo.NewsGetByIdNewsPaper
 @IdNewsPaper INT
 AS 
 BEGIN
	SELECT  TOP (400) *
	FROM News
	WHERE IdNewsPaper=@IdNewsPaper 
	ORDER BY IdNew DESC
 END

 	
 