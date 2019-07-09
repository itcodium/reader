-- Trae columnas configuracion de link

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
        		SELECT @COLUMNS=@COLUMNS+'cc.Islink,cc.LinkText'+','
        		

        		SET @COLUMNS= LEFT(@COLUMNS, LEN(@COLUMNS) - 1)
        		SET @SELECT=N'SELECT '+@COLUMNS+CHAR(13) + CHAR(10) +'FROM '+ @TABLE_NAME +' '+@alias
				SET @SELECT=@SELECT+' INNER JOIN ctr_Columns cc
                					on cc.OBJECT_ID='+CAST(OBJECT_ID(@name) AS VARCHAR)
                		
        		SELECT @sql=@SELECT +@WHERE
				PRINT @WHERE
     		END TRY
     		BEGIN CATCH
            		SET @error_message = error_message()
             		RAISERROR (@error_message ,16,1 );
      		END CATCH
  		END