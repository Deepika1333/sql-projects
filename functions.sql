create database functions

--ASCII
SELECT ASCII('A') AS A, ASCII('B') AS B,   
ASCII('a') AS a, ASCII('b') AS b,  
ASCII(1) AS [1], ASCII(2) AS [2];

SELECT ASCII('P') AS [ASCII], ASCII('æ') AS [Extended_ASCII];

SELECT NCHAR(80) AS [CHARACTER], NCHAR(195) AS [CHARACTER];

SELECT UNICODE('æ') AS [Extended_ASCII], NCHAR(230) AS [CHARACTER];

--char

SET TEXTSIZE 0;  
-- Create variables for the character string and for the current   
-- position in the string.  
DECLARE @position INT, @string CHAR(8);  
-- Initialize the current position and the string variables.  
SET @position = 1;  
SET @string = 'New Moon';  
WHILE @position <= DATALENGTH(@string)  
   BEGIN  
   SELECT ASCII(SUBSTRING(@string, @position, 1)),   
      CHAR(ASCII(SUBSTRING(@string, @position, 1)))  
   SET @position = @position + 1  
   END;  
GO

SELECT CHAR(65) AS [65], CHAR(66) AS [66],   
CHAR(97) AS [97], CHAR(98) AS [98],   
CHAR(49) AS [49], CHAR(50) AS [50];

SELECT CHAR(188) AS single_byte_representing_complete_character, 
  CHAR(0xBC) AS single_byte_representing_complete_character;  
GO

SELECT CHAR(129) AS first_byte_of_double_byte_character, 
  CHAR(0x81) AS first_byte_of_double_byte_character;  
GO

CREATE DATABASE [multibyte-char-context]
  COLLATE Japanese_CI_AI
GO
USE [multibyte-char-context]
GO
SELECT NCHAR(0x266A) AS [eighth-note]
  , CONVERT(CHAR(2), 0x81F4) AS [context-dependent-convert]
  , CAST(0x81F4 AS CHAR(2)) AS [context-dependent-cast]

  ; WITH uni(c) AS (
    -- BMP character
    SELECT NCHAR(9835)
    UNION ALL
    -- non-BMP supplementary character or, under downlevel collation, NULL
    SELECT NCHAR(127925)
  ),
  enc(u16c, u8c) AS (
    SELECT c, CONVERT(VARCHAR(4), c COLLATE Latin1_General_100_CI_AI_SC_UTF8)
    FROM uni
  )
  SELECT u16c AS [Music note]
    , u8c AS [Music note (UTF-8)]
    , UNICODE(u16c) AS [Code Point]
    , CONVERT(VARBINARY(4), u16c) AS [UTF-16LE bytes]
    , CONVERT(VARBINARY(4), u8c)  AS [UTF-8 bytes]
  FROM enc

  DECLARE @document VARCHAR(64);  
SELECT @document = 'Reflectors are vital safety' +  
                   ' components of your bicycle.';  
SELECT CHARINDEX('bicycle', @document);  
GO

DECLARE @document VARCHAR(64);  
  
SELECT @document = 'Reflectors are vital safety' +  
                   ' components of your bicycle.';  
SELECT CHARINDEX('vital', @document, 5);  
GO

DECLARE @document VARCHAR(64);  
  
SELECT @document = 'Reflectors are vital safety' +  
                   ' components of your bicycle.';  
SELECT CHARINDEX('bike', @document);  
GO

USE tempdb;  
GO  
--perform a case sensitive search  
SELECT CHARINDEX ( 'TEST',  
       'This is a Test'  
       COLLATE Latin1_General_CS_AS);

USE tempdb;  
GO  
SELECT CHARINDEX ( 'Test',  
       'This is a Test'  
       COLLATE Latin1_General_CS_AS);

USE tempdb;  
GO  
SELECT CHARINDEX ( 'TEST',  
       'This is a Test'  
       COLLATE Latin1_General_CI_AS);  
GO

SELECT CHARINDEX('is', 'This is a string');

SELECT CHARINDEX('is', 'This is a string', 4);

SELECT TOP(1) CHARINDEX('at', 'This is a string') FROM dbo.DimCustomer;