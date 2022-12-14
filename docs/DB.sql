CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Production_Date] [datetime] NULL,
	[Is_Error] [bit] NULL,
	[Price] [decimal](18, 1) NULL,
	[Address] [nvarchar](100) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Usp_InsertUpdateDelete_Customer]    Script Date: 11/16/2022 10:58:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[Usp_InsertUpdateDelete_Customer]   
 @ID int
,@Name NVARCHAR(200) = NULL
,@Query INT  
AS  
BEGIN  
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
IF (@Query = 1)  
BEGIN  

INSERT INTO [dbo].[Product]
           ([Name])
     VALUES
           (@Name) 


IF (@@ROWCOUNT > 0)  
BEGIN  
SELECT 'Insert'  
END  
END  

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
IF (@Query = 2)  
BEGIN  

UPDATE [dbo].[Product]
   SET [Name] = @Name
 WHERE ID=@ID

SELECT 'Update'  
END  

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
IF (@Query = 3)  
BEGIN  
DELETE FROM [dbo].[Product] WHERE ID=@ID
SELECT 'Deleted'  
END  

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
IF (@Query = 4)  
BEGIN  
SELECT *  
FROM [dbo].[Product]  
END  
END  

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
IF (@Query = 5)  
BEGIN  
SELECT *  
FROM [dbo].[Product]   
WHERE ID = @ID  
END  
GO
/****** Object:  StoredProcedure [dbo].[Usp_InsertUpdateDelete_Product]    Script Date: 11/16/2022 10:58:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Usp_InsertUpdateDelete_Product] @ID int                  
,                                                      @Name NVARCHAR(200)       = NULL
,                                                      @Production_Date datetime
,                                                      @Is_Error bit            
,                                                      @Price decimal(18,1)     
,                                                      @Address nvarchar(100)      
,                                                      @Query INT                
AS
-- select * from dbo.Product
-- EXEC [dbo].[Usp_InsertUpdateDelete_Product]  0,	N'Milk', '2022-10-9' , 0 , 100000, N'BacNinh', 1
-- EXEC [dbo].[Usp_InsertUpdateDelete_Product]  1,	N'Nguyễn Văn Chiến',	2
-- EXEC [dbo].[Usp_InsertUpdateDelete_Product]  1,	N'Nguyễn Văn Chiến',	3
-- EXEC [dbo].[Usp_InsertUpdateDelete_Product]  0,	N'Nguyễn Văn Chiến',	4
-- EXEC [dbo].[Usp_InsertUpdateDelete_Product]  2,	N'Nguyễn Văn Chiến',	5

BEGIN
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	IF (@Query = 1)
	BEGIN

		INSERT INTO [dbo].[Product] ( [Name], [Production_Date], [Is_Error], [Price], [Address] )
		VALUES                      ( @Name,  @Production_Date,  @Is_Error,  @Price,  @Address  )
		IF (@@ROWCOUNT > 0)
		BEGIN
			SELECT 'Insert'
		END
	END

	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	IF (@Query = 2)
	BEGIN

		UPDATE [dbo].[Product]
		SET [Name] =            @Name
		,   [Production_Date] = @Production_Date
		,   [Is_Error] =        @Is_Error
		,   [Price] =           @Price
		,   [Address] =         @Address
		WHERE ID=@ID

		SELECT 'Update'
	END

	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	IF (@Query = 3)
	BEGIN
		DELETE FROM [dbo].[Product]
		WHERE ID=@ID
		SELECT 'Deleted'
	END

	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	IF (@Query = 4)
	BEGIN
		SELECT *
		FROM [dbo].[Product]
	END
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	IF (@Query = 5)
	BEGIN
		SELECT *
		FROM [dbo].[Product]
		WHERE ID = @ID
	END
END
GO
USE [master]
GO
ALTER DATABASE [Test] SET  READ_WRITE 
GO
