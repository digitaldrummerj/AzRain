/****** Script for SelectTopNRows command from SSMS  ******/

;WITH CTE AS
(SELECT * ,ROW_NUMBER() OVER(PARTITION BY [Zipcode] ORDER BY [StateCityZipID]) AS Row
  FROM [RescuingAnimalsInNeed].[Groups].[StateCityZip])
SELECT * FROM CTE
--WHERE [LocationText] = 'Phoenix, AZ'
----WHERE Zipcode = '85001'
--ORDER BY Zipcode