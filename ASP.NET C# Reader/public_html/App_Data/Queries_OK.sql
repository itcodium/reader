DROP PROCEDURE dbo.adm_Tables_Get_pk;
DROP PROCEDURE dbo.adm_Tables_Get_fk;
DROP PROCEDURE dbo.adm_Tables_Get;
DROP PROCEDURE dbo.adm_Select_Query_Create;	
DROP PROCEDURE dbo.adm_Select_Query_Get;	
DROP PROCEDURE dbo.adm_Select_Table_Data;
DROP PROCEDURE dbo.adm_Columns_Get;
DROP PROCEDURE dbo.adm_Create_Table_Select_join;
DROP PROCEDURE dbo.adm_ControlColumns_Refresh;
DROP PROCEDURE dbo.adm_ControlTables_Refresh;
DROP PROCEDURE dbo.adm_TableNavigator;
DROP PROCEDURE dbo.adm_Columns_Enabled;
DROP PROCEDURE dbo.adm_Database_Schema_Get
DROP FUNCTION [dbo].[fnSplit]
DROP FUNCTION [dbo].getTablePK


GO
		IF OBJECT_ID ( 'dbo.adm_Tables_Get_pk', 'P' ) IS NOT NULL 
			DROP PROCEDURE dbo.adm_Tables_Get_pk;
GO
		CREATE PROCEDURE dbo.adm_Tables_Get_pk
		@schema nvarchar(128)='dbo',
    	@name nvarchar(128)=NULL,
    	@Object_id INT=NULL
    	AS
	BEGIN
    
        	DECLARE @TABLE_NAME NVARCHAR(128)
        	DECLARE @error_message VARCHAR(255)
         	BEGIN TRY
            	SELECT  SC.object_id,schema_name(SO.schema_id) schema_name, OBJECT_Name(SC.object_id)table_name,  SC.name
            	FROM sys.objects SO
                	INNER JOIN sys.columns SC
                	ON SO.OBJECT_ID = SC.OBJECT_ID
            	WHERE SO.TYPE = 'U'
                	AND SO.OBJECT_ID=OBJECT_ID(@name)
					AND schema_name(SO.schema_id)=@schema
                	AND SC.is_identity=1
          	END TRY
         	BEGIN CATCH
                	SET @error_message = error_message()
                 	RAISERROR (@error_message ,16,1 );
          	END CATCH
         	 
	END  
	
 GO
	------------------------------------------------------------------------------------
GO
		IF OBJECT_ID ( 'dbo.adm_Tables_Get_fk', 'P' ) IS NOT NULL 
			DROP PROCEDURE dbo.adm_Tables_Get_fk;
GO
		CREATE PROCEDURE dbo.adm_Tables_Get_fk
				@schema nvarchar(128)='dbo',
    			@name nvarchar(128)=NULL,
    			@Object_id INT=NULL
    			AS
			BEGIN
					SET XACT_ABORT ON
    
        			DECLARE @TABLE_NAME NVARCHAR(128)
        			DECLARE @error_message VARCHAR(255)
        			  
        	 
         			BEGIN TRY
                 			SELECT    
                 				schema_name(SO.schema_id) schema_name,
                    			OBJECT_Name(FK.PARENT_OBJECT_ID) [table],
                    			OBJECT_Name(referenced_object_id) [referended_table],
                    			C.name [column],
                    			OBJECT_Name(FK.parent_object_id) as parent_object_name,
                    			OBJECT_Name(constraint_object_id) fk
                    			--OBJECT_Name(parent_object_id) parent_object_id_45345345,*
            			FROM sys.foreign_key_columns FK
            			INNER JOIN sys.columns C
                			ON C.column_id=FK.parent_column_id
                    			AND C.OBJECT_ID=FK.parent_object_id
                    	INNER JOIN sys.objects SO
                			ON SO.OBJECT_ID = FK.PARENT_OBJECT_ID
            				AND SO.TYPE = 'U'
            			WHERE FK.PARENT_OBJECT_ID=OBJECT_ID(@name)
            		     AND schema_name(SO.schema_id)=@schema
           	 
          			END TRY
         			BEGIN CATCH
                			SET @error_message = error_message()
                 			RAISERROR (@error_message ,16,1 );
          			END CATCH
    	 
			END    
GO
 
	------------------------------------------------------------------------------------
GO
	IF OBJECT_ID ( 'dbo.adm_Tables_Get', 'P' ) IS NOT NULL 
		DROP PROCEDURE dbo.adm_Tables_Get;
GO			
	CREATE PROCEDURE dbo.adm_Tables_Get 
		@schema nvarchar(128)=NULL,
    	@name nvarchar(128)=NULL
    	AS
    	BEGIN
         	SELECT schema_name(o.schema_id) schema_name,o.name,o.object_id,o.principal_id, o.schema_id,   
         			o.parent_object_id, o.type, o.type_desc,o.create_date,o.modify_date,o.is_ms_shipped,
         			o.is_published, o.is_schema_published
        	FROM sys.objects o
        	INNER JOIN ctr_Tables c 
        		on c.object_id=o.object_id
        		and c.enabled=1
        	WHERE TYPE='U'
            	AND (o.name like '%'+ISNULL(@name,o.name )+'%'
            	AND schema_name(o.schema_id) like '%'+ISNULL(@schema,schema_name(o.schema_id) )+'%')
        	ORDER BY schema_name(o.schema_id),o.name,o.modify_date
    	
    	END	 

	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
GO
	IF OBJECT_ID ( 'dbo.adm_Select_Query_Create', 'P' ) IS NOT NULL 
		DROP PROCEDURE dbo.adm_Select_Query_Create;
 
	
GO
	CREATE PROCEDURE dbo.adm_Select_Query_Create
			@schema nvarchar(128)=NULL,
    		@name nvarchar(128),
    		@alias varchar(20)='',
    		@filter varchar(max)='', 
			@sql nvarchar(max) OUTPUT
    		AS
		BEGIN
    		SET NOCOUNT ON
   	 
    		DECLARE @TABLE_NAME NVARCHAR(128)
    		DECLARE @error_message VARCHAR(255)
    		DECLARE @alias_aux varchar(20) 
    	
    		SET @alias_aux=''
    		SET @TABLE_NAME= @name
    		 IF @alias!='' 
    		 BEGIN
    			SET @alias_aux=@alias+'.'  
    		 END
    		 ELSE
    		 BEGIN
    			SET @alias='a'
    			SET @alias_aux=@alias+'.'  
    		 END
    	 
     		BEGIN TRY
        		 
       	 
        		SELECT SC.column_id,SC.name,is_identity,CC.Islink,CC.LinkText,CC.enabled
            		INTO #Columns
        		FROM sys.objects SO
            		INNER JOIN sys.columns SC
            		ON SO.OBJECT_ID = SC.OBJECT_ID
					inner join ctr_Columns CC
                		on CC.OBJECT_ID=SO.OBJECT_ID
                		and CC.column_id=SC.column_id
        		WHERE SO.TYPE = 'U'
        		AND    	SO.OBJECT_ID=OBJECT_ID(@name)
					AND CC.enabled=1
        		ORDER BY column_id
   	 
   	 
        		DECLARE @COLUMNS VARCHAR(MAX)
        		DECLARE @SELECT  VARCHAR(MAX)
        		DECLARE @WHERE  VARCHAR(MAX)
        		
        		
        		SET @COLUMNS=''
        		
        		SET @WHERE=''
        		
        		IF (@filter IS NOT NULL) AND ( RTRIM(LTRIM(@filter))!='')
        		BEGIN
        			SET @WHERE=' WHERE '
        			SELECT @WHERE=@WHERE+@alias_aux+item +' and '  
        			FROM dbo.fnSplit(@filter,'&')
        			SET @WHERE= LEFT(@WHERE, LEN(@WHERE) - 3)
        		END

        		SELECT @COLUMNS=@COLUMNS+@alias_aux+name+','
        		FROM dbo.#Columns
        		

        		SET @COLUMNS= LEFT(@COLUMNS, LEN(@COLUMNS) - 1)
        		SET @SELECT=N'SELECT '+@COLUMNS+CHAR(13) + CHAR(10) +'FROM '+ @TABLE_NAME +' '+@alias
        		SELECT @sql=@SELECT +@WHERE
				PRINT @WHERE
     		END TRY
     		BEGIN CATCH
            		SET @error_message = error_message()
             		RAISERROR (@error_message ,16,1 );
      		END CATCH
  		END
GO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
GO 
	IF OBJECT_ID ( 'dbo.adm_Select_Query_Get', 'P' ) IS NOT NULL 
		DROP PROCEDURE dbo.adm_Select_Query_Get;
GO
	CREATE PROCEDURE dbo.adm_Select_Query_Get
		@schema nvarchar(128)=NULL,
    	@name nvarchar(128),
    	@alias varchar(20)='',
    	@filter varchar(max)
    	
    AS
	BEGIN
    	SET NOCOUNT ON
   		DECLARE @sql NVARCHAR(MAX)
		EXECUTE  adm_Select_Query_Create @schema, @name,@alias,@filter,@sql  output
		SELECT @sql [query]
  	END
GO
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
GO
	IF OBJECT_ID ( 'dbo.adm_Select_Table_Data', 'P' ) IS NOT NULL 
		DROP PROCEDURE dbo.adm_Select_Table_Data;
GO
	CREATE PROCEDURE dbo.adm_Select_Table_Data
		@schema nvarchar(128)=NULL,
    	@name nvarchar(128),
    	@alias varchar(20)='',
    	@filter nvarchar(MAX)
    AS
	BEGIN
    	SET NOCOUNT ON
   		DECLARE @sql NVARCHAR(MAX)
		EXECUTE  adm_Select_Query_Create @schema, @name,@alias,@filter,@sql  output
		EXECUTE sp_executesql @sql
  	END
 
GO
GO
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
GO
	IF OBJECT_ID ( 'dbo.adm_Columns_Get', 'P' ) IS NOT NULL 
		DROP PROCEDURE dbo.adm_Columns_Get;
GO
	CREATE PROCEDURE dbo.adm_Columns_Get
		@schema nvarchar(128)='dbo',
    	@name nvarchar(128)=NULL
    	AS
	BEGIN
        	DECLARE @TABLE_NAME NVARCHAR(128)
        	DECLARE @error_message VARCHAR(255)
        	SET @TABLE_NAME= @name
        	 
         	BEGIN TRY
            	
      		SELECT  	SC.object_id,SC.name,SC.column_id,type_name(system_type_id) [type_name],SC.system_type_id,
							SC.user_type_id,SC.max_length,SC.precision,SC.scale,SC.collation_name,SC.is_nullable,
							SC.is_ansi_padded,SC.is_rowguidcol,SC.is_identity,SC.is_computed,SC.is_filestream,SC.is_replicated,
							SC.is_non_sql_subscribed,SC.is_merge_published,SC.is_dts_replicated,SC.is_xml_document,
							SC.xml_collection_id,SC.default_object_id,SC.rule_object_id,
							CC.Enabled
            	FROM sys.objects SO
                	INNER JOIN sys.columns SC
                	ON SO.OBJECT_ID = SC.OBJECT_ID
                	inner join ctr_Columns CC
                		on CC.OBJECT_ID=SO.OBJECT_ID
                		and CC.column_id=SC.column_id
            	WHERE SO.TYPE = 'U'
            	AND SO.OBJECT_ID=OBJECT_ID(@name)
            	ORDER BY Sc.column_id
          	END TRY
         	BEGIN CATCH
                	SET @error_message = error_message()
                 	RAISERROR (@error_message ,16,1 );
          	END CATCH
	END

GO
	------------------------------------------------------------------------------------
GO 
	IF OBJECT_ID ( 'dbo.adm_Create_Table_Select_join', 'P' ) IS NOT NULL 
		DROP PROCEDURE dbo.adm_Create_Table_Select_join;
GO
	CREATE PROCEDURE dbo.adm_Create_Table_Select_join
    	@name nvarchar(128),
    	@sql nvarchar(max)=NULL OUTPUT
    	AS
	BEGIN
    	SET NOCOUNT ON
    	DECLARE @error_message VARCHAR(255)
    	
    	 
     	BEGIN TRY
    	 
       	 DECLARE  @schema_name nvarchar(128),
   				 @SELECT  VARCHAR(MAX),
   				 @FROM  VARCHAR(MAX),
   				 @INNER  VARCHAR(MAX)    
   		 DECLARE @tab VARCHAR(128)
   		 SET @tab =''
   		 SET @INNER=''
   		 
   		 SET @FROM=''
   		 
   		 SET @schema_name=(SELECT dbo.FN_Table_Schema_Get(@name))
   		 DECLARE @foreign_key TABLE(
   			 REFERENCED_TABLE   nvarchar(128),
   			 COLUMN_NAME    	nvarchar(128),
   			 REFERENCED_OBJECT_ID INT
   			)
   			    
   		 DECLARE @ResultSql TABLE(Id INT IDENTITY(1,1),sql NVARCHAR(MAX))   

   		 INSERT INTO @foreign_key   	    
   			 SELECT REFERENCED_TABLE,COLUMN_NAME,REFERENCED_OBJECT_ID
   			 FROM dbo.FN_Tables_Get_fk(@name)
   			 
   			 
   			 SET @SELECT='SELECT '+RTRIM(LTRIM(dbo.FN_Table_Column_List(@name)))+CHAR(13) + CHAR(10)
   			 
   			 INSERT INTO @ResultSql(Sql) VALUES(@SELECT)
   			 
   			 SET @FROM = 'FROM '+@schema_name+'.'+ @name+CHAR(13) + CHAR(10)
   			 INSERT INTO @ResultSql(Sql) VALUES(@FROM )
   	        	 
   			 DECLARE @REFERENCED_OBJECT_ID INT,
   					 @REFERENCED_TABLE nvarchar(128),
   					 @COLUMN_NAME nvarchar(128)
   			 WHILE EXISTS (SELECT * FROM @foreign_key)
   			 BEGIN
   				 SET @tab=@tab+ '  '
   				 
   				 SELECT TOP 1 @REFERENCED_OBJECT_ID=REFERENCED_OBJECT_ID,
   							  @REFERENCED_TABLE =REFERENCED_TABLE,
   							  @COLUMN_NAME =COLUMN_NAME
   				 FROM @foreign_key
   				 
   				 SET @INNER=@tab+N'INNER JOIN '+ @REFERENCED_TABLE+ CHAR(13)
   				 SET @INNER=@INNER+@tab+@tab+'ON '+@name+'.'+@COLUMN_NAME+'='+ @REFERENCED_TABLE+'.'+@COLUMN_NAME+ CHAR(13)
   				 
   				 INSERT INTO @ResultSql(Sql) VALUES(@INNER)
   				 
        			 DELETE FROM @foreign_key
   				 WHERE REFERENCED_OBJECT_ID =@REFERENCED_OBJECT_ID
   				 
   			 END
   		 -- SELECT sql FROM @ResultSql
   		  DECLARE @temp_sql NVARCHAR(MAX)
   		  SET @temp_sql=''
   		  SELECT @temp_sql=@temp_sql+sql FROM @ResultSql
   		 
   			 SET @sql=@temp_sql
   			 PRINT @temp_sql
   		  --EXECUTE sp_executesql @temp_sql    
   	 
     	END TRY
     	BEGIN CATCH
            	SET @error_message = error_message()
             	RAISERROR (@error_message ,16,1 );
      	END CATCH
  	END
GO
	------------------------------------------------------------------------------------
GO
	IF OBJECT_ID ( 'dbo.adm_Database_Schema_Get', 'P' ) IS NOT NULL 
		DROP PROCEDURE dbo.adm_Database_Schema_Get;
GO
	CREATE PROCEDURE dbo.adm_Database_Schema_Get
    AS
	BEGIN
		SELECT * FROM INFORMATION_SCHEMA.SCHEMATA
		WHERE schema_owner like 'dbo'
	END  
GO
	------------------------------------------------------------------------------------

-- 2014-09-29 nueva funcion



CREATE FUNCTION [dbo].[fnSplit](
@sParametroList VARCHAR(MAX) -- Cadena de datos a separar
,@cDelimitador VARCHAR(8000) = ',' -- Separador de Datos
) RETURNS @ListaTemporal TABLE (item VARCHAR(MAX))
BEGIN
DECLARE @sItem VARCHAR(8000)
WHILE CHARINDEX(@cDelimitador,@sParametroList,0) <> 0
BEGIN
SELECT
@sItem=RTRIM(LTRIM(SUBSTRING(@sParametroList,1,
CHARINDEX(@cDelimitador,@sParametroList,0)-1))),
@sParametroList=RTRIM(LTRIM(SUBSTRING(@sParametroList,
CHARINDEX(@cDelimitador,@sParametroList,0)
+LEN(@cDelimitador),LEN(@sParametroList))))
IF LEN(@sItem) > 0
INSERT INTO @ListaTemporal SELECT @sItem
END
IF LEN(@sParametroList) > 0
INSERT INTO @ListaTemporal SELECT @sParametroList -- Coloca luego del último elemento
RETURN
END


/*
GO
	
	-- Crear tabla para guardar tablas, columnas
	-- Metodo para actualizar columnas por object_id & name: 165575628 IdChannelType

 
GO
 
CREATE TABLE [dbo].[ctr_Tables](
	[name] [sysname] NOT NULL,
	[object_id] [int] NOT NULL,
	[schema_id] [int] NOT NULL,
	[schema_name] [nvarchar](128) NULL,
	[create_date] [datetime] NOT NULL,
	[modify_date] [datetime] NOT NULL,
	[enabled] [bit] NOT NULL,
	[created] [datetime] NOT NULL,
 CONSTRAINT [PK_ctr_Tables] PRIMARY KEY CLUSTERED 
(
	[object_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ctr_Tables] ADD  CONSTRAINT [DF_ctr_Tables_enabled]  DEFAULT ((0)) FOR [enabled]
GO
ALTER TABLE [dbo].[ctr_Tables] ADD  CONSTRAINT [DF_ctr_Tables_created]  DEFAULT (getdate()) FOR [created]
GO

CREATE TABLE [dbo].[ctr_Columns](
	[object_id] [int] NOT NULL,
	[column_id] [int] NOT NULL,
	[name] [sysname] NOT NULL,
	[enabled] [bit] NOT NULL,
	[created] [datetime] NOT NULL
) ON [PRIMARY]
 
 

ALTER TABLE [dbo].[ctr_Columns]  WITH CHECK ADD  CONSTRAINT [FK_ctr_Columns_ctr_Tables] FOREIGN KEY([object_id])
REFERENCES [dbo].[ctr_Tables] ([object_id])
ALTER TABLE [dbo].[ctr_Columns] CHECK CONSTRAINT [FK_ctr_Columns_ctr_Tables]
ALTER TABLE [dbo].[ctr_Columns] ADD  CONSTRAINT [DF_ctr_Columns_object_id]  DEFAULT ((1)) FOR [object_id]
ALTER TABLE [dbo].[ctr_Columns] ADD  CONSTRAINT [DF_ctr_Columns_enabled]  DEFAULT ((1)) FOR [enabled]
ALTER TABLE [dbo].[ctr_Columns] ADD  CONSTRAINT [DF_ctr_Columns_created]  DEFAULT (getdate()) FOR [created]

 */
 
 GO
	IF OBJECT_ID ( 'dbo.adm_ControlTables_Refresh', 'P' ) IS NOT NULL 
		DROP PROCEDURE dbo.adm_ControlTables_Refresh;
GO			
	CREATE PROCEDURE dbo.adm_ControlTables_Refresh
	AS
	BEGIN
         	update c
         	set c.object_id=o.object_id
        	FROM sys.objects o
        	inner JOIN ctr_Tables c 
        		on c.name=o.name
        			and  c.schema_id=o.schema_id
        			and  c.object_id!=o.object_id
        	WHERE o.TYPE='U'
        	
			INSERT INTO ctr_Tables(
				      name,   object_id,  schema_id,schema_name,               create_date,  modify_date)
	 		SELECT  o.name, o.object_id,o.schema_id,schema_name(o.schema_id),o.create_date,o.modify_date
        		FROM sys.objects o
        		left JOIN ctr_Tables c 
        			on c.object_id=o.object_id
        				and  c.schema_id=o.schema_id
        		WHERE o.TYPE='U'
        		and c.object_id is null
        		ORDER BY schema_name(o.schema_id),o.name,o.modify_date
 	END
 GO
	 IF OBJECT_ID ( 'dbo.adm_ControlColumns_Refresh', 'P' ) IS NOT NULL 
		DROP PROCEDURE dbo.adm_ControlColumns_Refresh;
GO		
	CREATE PROCEDURE dbo.adm_ControlColumns_Refresh
	AS
	BEGIN
			INSERT INTO ctr_Columns(
				      object_id,  column_id,name)
	 		
	 		 SELECT   o.object_id,sc.column_id,sc.name
        		FROM sys.objects o
        		left JOIN ctr_Tables c 
        			on c.object_id=o.object_id
        				and  c.schema_id=o.schema_id
        				
         		INNER JOIN sys.columns sc
    					 ON o.OBJECT_ID = sc.OBJECT_ID	
    					 left JOIN  ctr_Columns cc
    					   on cc.OBJECT_ID=sc.OBJECT_ID
    					   --and c.object_id=cc.object_id
        		WHERE o.TYPE='U'
        		  and cc.name is null
        		ORDER BY schema_name(o.schema_id),o.name,sc.column_id asc,o.modify_date
 	END
GO



	IF OBJECT_ID ( 'dbo.adm_Columns_Enabled', 'P' ) IS NOT NULL 
		DROP PROCEDURE dbo.adm_Columns_Enabled;
GO		
	CREATE PROCEDURE dbo.adm_Columns_Enabled
	@object_id INT,
	@name varchar(128),
	@Enabled BIT
	AS
	BEGIN
		UPDATE  c
		SET c.Enabled= @Enabled 
		FROM ctr_Columns c
		WHERE object_id=@object_id
			and name=@name
	END

GO
-- Modificado 2014-09-29

	IF OBJECT_ID ( 'dbo.adm_TableNavigator', 'P' ) IS NOT NULL 
		DROP PROCEDURE dbo.adm_TableNavigator;
GO	
	CREATE PROCEDURE dbo.adm_TableNavigator
			@schema nvarchar(128)='dbo',
    		@name nvarchar(128)=NULL
		AS
		BEGIN
	 
		DECLARE @RelatedTables TABLE (
			schema_name varchar(128),
			[table] varchar(128),
			 referended_table varchar(128),
			[column] varchar(128),
			 parent_object_name varchar(128), 
			 fk varchar(128))
		 
		 INSERT INTO @RelatedTables 
			EXEC dbo.adm_Tables_Get_fk  @schema,@name
			
			
			IF NOT EXISTS (SELECT 'NAVIGATE' NAVIGATE, [schema_name], referended_table [table] FROM @RelatedTables )
			BEGIN
				SELECT '' NAVIGATE, 
						@schema [schema_name], @name [table],
						dbo.getTablePK (@schema,@name) pk 
			END 
			ELSE BEGIN
				SELECT 'NAVIGATE' NAVIGATE, [schema_name], referended_table [table],dbo.getTablePK (@schema,@name) pk  
				FROM @RelatedTables 
			END 					
		END



/*	
 
--	ACTUALIZACIONES
	
	exec dbo.adm_Tables_Get_pk @schema='dbo',@name='news'
	exec dbo.adm_TableNavigator @schema='dbo',@name='News'

	exec ControlTables_Refresh
	exec ControlColumns_Refresh

	UPDATE  c
	SET c.Enabled= 0
	FROM ctr_Tables c
	WHERE name in ('News_old', 'ctr_Tables','ctr_Columns','NewsPaper_old')
	or name like 'sys%' 
		
	select * from ctr_Columns
	*/

-- Add PK 
	ALTER TABLE dbo.ctr_Tables ADD CONSTRAINT
		PK_ctr_Tables PRIMARY KEY CLUSTERED 
		(
		object_id
		) ON [PRIMARY]

	ALTER TABLE dbo.ctr_Tables SET (LOCK_ESCALATION = TABLE)
GO 	
 
	ALTER TABLE [dbo].[ctr_Columns] DROP CONSTRAINT [FK_ctr_Columns_ctr_Tables]

	ALTER TABLE [dbo].[ctr_Columns]  WITH CHECK ADD  CONSTRAINT [FK_ctr_Columns_ctr_Tables] FOREIGN KEY([object_id])
	REFERENCES [dbo].[ctr_Tables] ([object_id])
GO
	ALTER TABLE [dbo].[ctr_Columns] CHECK CONSTRAINT [FK_ctr_Columns_ctr_Tables] 

GO

-- 2014-09-29 Nueva Clave tabla NewsLog
	ALTER TABLE [dbo].[NewsLog]  WITH CHECK ADD  CONSTRAINT [FK_NewsLog_Channel] FOREIGN KEY([IdChannel])
	REFERENCES [dbo].[Channel] ([IdChannel])
	GO
	ALTER TABLE [dbo].[NewsLog] CHECK CONSTRAINT [FK_NewsLog_Channel]
	GO
	ALTER TABLE [dbo].[NewsLog]  WITH CHECK ADD  CONSTRAINT [FK_NewsLog_NewsPaper] FOREIGN KEY([IdNewsPaper])
	REFERENCES [dbo].[NewsPaper] ([IdNewsPaper])
	GO
	ALTER TABLE [dbo].[NewsLog] CHECK CONSTRAINT [FK_NewsLog_NewsPaper]

-- Creado 2014-09-29

	CREATE FUNCTION dbo.getTablePK (
		@schema nvarchar(128),
		@name nvarchar(128)
	)
	RETURNS nvarchar(128)
	AS
	BEGIN
		 DECLARE @table_pk nvarchar(128);
			SELECT  @table_pk=SC.name
            		FROM sys.objects SO
                		INNER JOIN sys.columns SC
                		ON SO.OBJECT_ID = SC.OBJECT_ID
            		WHERE SO.TYPE = 'U'
                		AND SO.OBJECT_ID=OBJECT_ID(@name)
						AND schema_name(SO.schema_id)=@schema
                		AND SC.is_identity=1
		 RETURN(ISNULL(@table_pk,''));
	END;



/*
truncate table ctr_Tables
truncate table ctr_Columns	

select * from ctr_Tables
select * from ctr_Columns	


select t.name,c.* from ctr_Tables t
inner join ctr_Columns	c
ON t.object_id=c.object_id
where t.name='news'


	declare @sql nvarchar(max) 
	exec dbo.adm_Select_Query_Create 'dbo','News','', '',@sql OUTPUT
	SELECT @sql 	

SELECT IdNewsPaperUrl,IdNewsPaper,IdChannel,Url,Enabled  
FROM NewsPaperUrl 
WHERE IdNewsPaper= 6 
*/


-- 2014-10-12

-- Column Link

	ALTER TABLE ctr_Columns
	ADD IsLink bit default(0)

	ALTER TABLE ctr_Columns
	ADD LinkText varchar(256) default('')

--  Update para quitar nulls
	update c
		set Islink=0,
		LinkText=''
	from ctr_Tables t
	inner join ctr_Columns	c
		ON t.object_id=c.object_id
	
	 
-- Modificado para que traiga link

	dbo.adm_Select_Query_Create

-- Consulta para crear link
--	Islink,LinkText

	update c
		set Islink=1,
		LinkText='Title'
	from ctr_Tables t
	inner join ctr_Columns	c
	ON t.object_id=c.object_id
	where t.name='news'
	and c.name='Link'


 

