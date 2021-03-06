drop table dbo.DateDimension
DROP TABLE #dim
GO

CREATE TABLE dbo.DateDimension
(
  [id] [int]			IDENTITY(1,1) NOT NULL,
  [Date]              DATE        NOT NULL,
  [Day]               TINYINT     NOT NULL,
  DaySuffix           CHAR(2)     NOT NULL,
  [Weekday]           TINYINT     NOT NULL,
  WeekDayName         VARCHAR(10) NOT NULL,
  IsWeekend           BIT         NOT NULL,
  IsHoliday           BIT         NOT NULL,
  HolidayText         VARCHAR(64) SPARSE,
  DOWInMonth          TINYINT     NOT NULL,
  [DayOfYear]         SMALLINT    NOT NULL,
  WeekOfMonth         TINYINT     NOT NULL,
  WeekOfYear          TINYINT     NOT NULL,
  ISOWeekOfYear       TINYINT     NOT NULL,
  [Month]             TINYINT     NOT NULL,
  [MonthName]         VARCHAR(10) NOT NULL,
  [Quarter]           TINYINT     NOT NULL,
  QuarterName         VARCHAR(6)  NOT NULL,
  [Year]              INT         NOT NULL,
  MMYYYY              CHAR(6)     NOT NULL,
  MonthYear           CHAR(7)     NOT NULL,
  FirstDayOfMonth     DATE        NOT NULL,
  LastDayOfMonth      DATE        NOT NULL,
  FirstDayOfQuarter   DATE        NOT NULL,
  LastDayOfQuarter    DATE        NOT NULL,
  FirstDayOfYear      DATE        NOT NULL,
  LastDayOfYear       DATE        NOT NULL,
  FirstDayOfNextMonth DATE        NOT NULL,
  FirstDayOfNextYear  DATE        NOT NULL,
  copy_date			  datetime			  , 	
  copy_count		  int,
  table_count		  int,
   CONSTRAINT [PK_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
ON [PRIMARY]

);
GO

DECLARE @StartDate DATE = '2014-09-01', @NumberOfYears INT = 20;
SET DATEFIRST 7;
SET DATEFORMAT mdy;
SET LANGUAGE SPANISH; -- US_ENGLISH;

DECLARE @CutoffDate DATE = DATEADD(YEAR, @NumberOfYears, @StartDate);


-- this is just a holding table for intermediate calculations:

CREATE TABLE #dim
(
  [date]       DATE PRIMARY KEY, 
  [day]        AS DATEPART(DAY,      [date]),
  [month]      AS DATEPART(MONTH,    [date]),
  FirstOfMonth AS CONVERT(DATE, DATEADD(MONTH, DATEDIFF(MONTH, 0, [date]), 0)),
  [MonthName]  AS DATENAME(MONTH,    [date]),
  [week]       AS DATEPART(WEEK,     [date]),
  [ISOweek]    AS DATEPART(ISO_WEEK, [date]),
  [DayOfWeek]  AS DATEPART(WEEKDAY,  [date]),
  [quarter]    AS DATEPART(QUARTER,  [date]),
  [year]       AS DATEPART(YEAR,     [date]),
  FirstOfYear  AS CONVERT(DATE, DATEADD(YEAR,  DATEDIFF(YEAR,  0, [date]), 0)),
  Style112     AS CONVERT(CHAR(8),   [date], 112),
  Style101     AS CONVERT(CHAR(10),  [date], 101)
);

-- use the catalog views to generate as many rows as we need


INSERT #dim([date]) 
SELECT d
FROM
(
  SELECT d = DATEADD(DAY, rn - 1, @StartDate)
  FROM 
  (
    SELECT TOP (DATEDIFF(DAY, @StartDate, @CutoffDate)) 
      rn = ROW_NUMBER() OVER (ORDER BY s1.[object_id])
    FROM sys.all_objects AS s1
    CROSS JOIN sys.all_objects AS s2
    -- on my system this would support > 5 million days
    ORDER BY s1.[object_id]
  ) AS x
) AS y;

 

INSERT dbo.DateDimension WITH (TABLOCKX)
SELECT
  --DateKey     = CONVERT(INT, Style112),
  [Date]        = [date],
  [Day]         = CONVERT(TINYINT, [day]),
  DaySuffix     = CONVERT(CHAR(2), CASE WHEN [day] / 10 = 1 THEN 'th' ELSE 
                  CASE RIGHT([day], 1) WHEN '1' THEN 'st' WHEN '2' THEN 'nd' 
	              WHEN '3' THEN 'rd' ELSE 'th' END END),
  [Weekday]     = CONVERT(TINYINT, [DayOfWeek]),
  [WeekDayName] = CONVERT(VARCHAR(10), DATENAME(WEEKDAY, [date])),
  [IsWeekend]   = CONVERT(BIT, CASE WHEN [DayOfWeek] IN (1,7) THEN 1 ELSE 0 END),
  [IsHoliday]   = CONVERT(BIT, 0),
  HolidayText   = CONVERT(VARCHAR(64), NULL),
  [DOWInMonth]  = CONVERT(TINYINT, ROW_NUMBER() OVER 
                  (PARTITION BY FirstOfMonth, [DayOfWeek] ORDER BY [date])),
  [DayOfYear]   = CONVERT(SMALLINT, DATEPART(DAYOFYEAR, [date])),
  WeekOfMonth   = CONVERT(TINYINT, DENSE_RANK() OVER 
                  (PARTITION BY [year], [month] ORDER BY [week])),
  WeekOfYear    = CONVERT(TINYINT, [week]),
  ISOWeekOfYear = CONVERT(TINYINT, ISOWeek),
  [Month]       = CONVERT(TINYINT, [month]),
  [MonthName]   = CONVERT(VARCHAR(10), [MonthName]),
  [Quarter]     = CONVERT(TINYINT, [quarter]),
  QuarterName   = CONVERT(VARCHAR(6), CASE [quarter] WHEN 1 THEN 'First' 
                  WHEN 2 THEN 'Second' WHEN 3 THEN 'Third' WHEN 4 THEN 'Fourth' END), 
  [Year]        = [year],
  MMYYYY        = CONVERT(CHAR(6), LEFT(Style101, 2)    + LEFT(Style112, 4)),
  MonthYear     = CONVERT(CHAR(7), LEFT([MonthName], 3) + LEFT(Style112, 4)),
  FirstDayOfMonth     = FirstOfMonth,
  LastDayOfMonth      = MAX([date]) OVER (PARTITION BY [year], [month]),
  FirstDayOfQuarter   = MIN([date]) OVER (PARTITION BY [year], [quarter]),
  LastDayOfQuarter    = MAX([date]) OVER (PARTITION BY [year], [quarter]),
  FirstDayOfYear      = FirstOfYear,
  LastDayOfYear       = MAX([date]) OVER (PARTITION BY [year]),
  FirstDayOfNextMonth = DATEADD(MONTH, 1, FirstOfMonth),
  FirstDayOfNextYear  = DATEADD(YEAR,  1, FirstOfYear),
  copy_date			  = NULL, 	
  copy_count	      = NULL,
  copy_publishDate	  = NULL
FROM #dim
OPTION (MAXDOP 1);

 


GO
	ALTER PROCEDURE [dbo].[News_GetToExport] 
	@cantidad INT=10
	AS
	BEGIN
		DECLARE @today datetime
		IF @cantidad >50
		BEGIN
			 RAISERROR('Se supero la cantidad maxima permitida.', 16, 1);
			 RETURN;
		END
		SET @today =getdate()
		SELECT TOP(@cantidad) CONVERT(VARCHAR,[date],112) Fecha
		FROM dbo.DateDimension 
		WHERE copy_date IS NULL AND [date]<@today 
		ORDER BY [date] ASC
	END
	
GO
	ALTER PROCEDURE [dbo].[News_ToExportGetByDate]
		@fecha INT
	AS
	BEGIN
  		SELECT  a.IdNew,a.IdNewsPaper,a.IdChannel,a.Title, 
		a.Description,convert (VARCHAR,a.PublishDate,112)  PublishDate,
		a.Link, a.Author, convert (VARCHAR,a.Created,112)  Created,
		b.nombre Diario, c.Description as Categoria
		from News  a
		inner join NewsPaper b
			on a.IdNewsPaper=b.IdNewsPaper
			inner join [dbo].[Channel] c
				on a.IdChannel=c.IdChannel
		where convert (varchar,a.PublishDate ,112)=@fecha
		ORDER BY  a.idNew ASC
	END
 
GO
	
	ALTER PROCEDURE [dbo].[News_ExportDateUpdate] 
		@publishData int,
		@total int
	AS
	BEGIN
		UPDATE a
		SET a.copy_date=GETDATE(),
			a.copy_count=@total,
			a.table_count=(SELECT  COUNT(1) FROM News WHERE convert (varchar,PublishDate ,112)=@publishData)
		FROM dbo.DateDimension a
		WHERE  convert (VARCHAR,a.[date],112)=@publishData 
	END
GO
	ALTER PROCEDURE [dbo].[News_GetExported] 
	AS
	BEGIN
		SELECT a.table_count TableCount, a.copy_count CopyCount, CONVERT(VARCHAR,a.date,112) CopyDate,  
		CONVERT(VARCHAR,a.copy_date,112)+' '+CONVERT(VARCHAR(10), a.copy_date, 108) ProcessDate
		FROM dbo.DateDimension a
		WHERE  a.copy_date IS NOT NULL
		ORDER BY date DESC

	END

	
	 
GO 
	UPDATE a
	SET a.copy_date=NULL,
		a.copy_count=NULL,
		a.table_count=NULL
	FROM dbo.DateDimension a
GO
	EXEC [News_GetToExport] 5
	EXEC [News_ToExportGetByDate] 20141215
	EXEC [News_ExportDateUpdate]  20140910, 277
	EXEC [News_GetExported] 
	
select sum(copy_count)
	FROM dbo.DateDimension 
	where copy_count!=table_count

	select top 0 * from News
	
	-- 
	SELECT max(PublishDate) FROM news   
	
	SELECT count(1) FROM news where PublishDate<='2016-01-01' -- 290115

	SELECT a.idNew,count(1) total	FROM news a
	where a.PublishDate<='2014-12-01' and a.PublishDate<='2014-12-21'
	GROUP BY a.idNew 
	having count(1) >1
	
	
	SELECT a.idNew,count(1) total	FROM `news` a
	where a.PublishDate<='2019-03-13 00:00:00'
	and a.idNew=(SELECT min(b.idNew) FROM `news` b where b.PublishDate<='2019-03-13 00:00:00' and b.idNew=a.idNew)
	GROUP BY a.idNew 
	having count(1) >1
	

	

-------------------------------------------------------------------------
-- control	Datos 
-------------------------------------------------------------------------

-- Borrar 
	delete
	FROM news  
	where PublishDate>='2019-05-01' and PublishDate<='2019-07-31'; 


	UPDATE a
	SET a.copy_date=NULL,
		a.copy_count=NULL,
		a.table_count=NULL
	FROM dbo.DateDimension a
	where [Date]>='2019-05-01' and [Date]<='2019-07-31' 

 




-- MSSQL SERVER (Month)			
	SELECT convert (VARCHAR(6),PublishDate,112),  count(1) 
	FROM news a
	where CONVERT(VARCHAR(10), PublishDate, 112) >='20190101' and 
			CONVERT(VARCHAR(10), PublishDate, 112)<='20191231'
	group by convert (VARCHAR(6),PublishDate,112)	
	order by CAST(convert (VARCHAR(6),PublishDate,112) as INT) asc	

-- MSSQL SERVER (day)			
	SELECT convert (VARCHAR(8),PublishDate,112),  count(1) 
	FROM news a
	where CONVERT(VARCHAR(10), PublishDate, 112) >='20190101' and 
			CONVERT(VARCHAR(10), PublishDate, 112)<='20191231'
	group by convert (VARCHAR(8),PublishDate,112)	
	order by CAST(convert (VARCHAR(8),PublishDate,112) as INT) asc	



-- MYSQL (Month)
	SELECT DATE_FORMAT( PublishDate, "%Y%m") publish,  count(1) 
	FROM news a
	where PublishDate>='2019-01-01' and PublishDate<='2019-12-31'
	group by DATE_FORMAT( PublishDate, "%Y%m")
	order by CAST(DATE_FORMAT( PublishDate, "%Y%m") as INT) asc	

-- MYSQL (Day)
	SELECT DATE_FORMAT( PublishDate, "%Y%m%d") publish,  count(1) 
	FROM news a
	where PublishDate>='2019-01-01' and PublishDate<='2019-12-31'
	group by DATE_FORMAT( PublishDate, "%Y%m%d")
	order by CAST(DATE_FORMAT( PublishDate, "%Y%m%d") as INT) asc
