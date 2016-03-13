USE RescuingAnimalsInNeed;
GO


IF OBJECT_ID ('vGroupIntake', 'V') IS NOT NULL
DROP VIEW vGroupIntake;
GO

CREATE VIEW vGroupIntake
AS 

SELECT GS.[GroupID]
      ,GS.[GroupName]
      ,GS.[Address]
      ,GS.[StateCityZipID]
	  ,SCZ.[City]
	  ,SCZ.[State]
	  ,SCZ.[Zipcode]
      ,GS.[PhoneNumber]
      ,GS.[FaxNumber]
      ,GS.[WebSite]
      ,GS.[501c3Number]
      ,GS.[DirectorName]
      ,GS.[DirectorPhonNumber]
      ,GS.[DirectorFaxNumber]
      ,GS.[DirectorEmail]
	  ,GEN.[ContactName]
	  ,GEN.[ContactPhoneNumber]
  FROM dbo.GroupEmergencyNumbers AS GEN
  LEFT JOIN dbo.GroupSetup AS GS
  ON GEN.GroupID = GS.GroupID
  LEFT JOIN dbo.StateCityZip AS SCZ
  ON GS.StateCityZipID = SCZ.StateCityZipID

GO

IF OBJECT_ID ('vAnimalIntake', 'V') IS NOT NULL
DROP VIEW vAnimalIntake;
GO

CREATE VIEW vAnimalIntake
AS 

SELECT AI.AnimalIntakeID
	,GS.GroupName
    ,AI.[FelineCanine]
	,GS.GroupID
    ,AI.AnimalNumber
    ,AI.IntakeDate
    ,AI.[FelineCanine] + '-' + CAST(GS.GroupID AS VARCHAR(20)) + '-' +  CAST(AI.AnimalNumber AS VARCHAR(2)) + '-' + REPLACE(CONVERT(VARCHAR(10), AI.IntakeDate, 1), '/', '') AS [AnimalID]
    ,AI.ExitDate
    ,AI.Location
    ,AI.AnimalName
    ,AI.DOB
    ,AI.Sex
    ,AI.[Description]
    ,AI.Microchip
  FROM dbo.AnimalIntake AS AI
  LEFT JOIN  dbo.GroupSetup AS GS
  ON AI.GroupID = GS.GroupID

GO

IF OBJECT_ID ('vIntakeHealthRecord', 'V') IS NOT NULL
DROP VIEW vIntakeHealthRecord;
GO

CREATE VIEW vIntakeHealthRecord
AS

  SELECT R.IntakeHealthRecordID
      ,AI.Photo
	  ,AI.AnimalIntakeID
	  ,AI.Location
	  ,AI.FelineCanine
      ,AI.AnimalName
      ,AI.DOB
      ,AI.Sex
      ,AI.[Description]
      ,AI.Microchip
	  ,GS.GroupName
      ,R.FirstVacinationDate
      ,R.SecondVacinationDate
      ,R.ThirdVacinationDate
      ,R.Rabies
      ,R.FelvFIVTest
      ,R.FleaTickTreatment
      ,R.Other1
	  ,R.Other1Description
      ,R.Other2
	  ,R.Other2Description
      ,R.Other3
	  ,R.Other3Description
      ,R.Other4
	  ,R.Other4Description
      ,CASE R.SpayNuter
		WHEN 0 THEN 'No'
		WHEN 1 THEN 'Yes'
		ELSE 'Unknown'
	  END AS [Spay/Nuter]
  FROM dbo.IntakeRecord AS R
  LEFT JOIN dbo.AnimalIntake AS AI
  ON R.AnimalIntakeID = AI.AnimalIntakeID
  LEFT JOIN dbo.GroupSetup AS GS
  ON AI.GroupID = GS.GroupID

GO

IF OBJECT_ID ('vDailyHealthRecord', 'V') IS NOT NULL
DROP VIEW vDailyHealthRecord;
GO

CREATE VIEW vDailyHealthRecord
AS

  SELECT AI.AnimalName
      ,AI.[FelineCanine] + '-' + CAST(GS.GroupID AS VARCHAR(20)) + '-' +  CAST(AI.AnimalNumber AS VARCHAR(2)) + '-' + REPLACE(CONVERT(VARCHAR(10), AI.IntakeDate, 1), '/', '') AS [AnimalID]
	  ,R.FirstVacinationDate
      ,R.SecondVacinationDate
      ,R.ThirdVacinationDate
      ,R.Rabies
      ,R.FelvFIVTest
      ,R.FleaTickTreatment
      ,R.Other1
	  ,R.Other1Description
      ,R.Other2
	  ,R.Other2Description
      ,R.Other3
	  ,R.Other3Description
      ,R.Other4
	  ,R.Other4Description
      ,CASE R.SpayNuter
		WHEN 0 THEN 'No'
		WHEN 1 THEN 'Yes'
		ELSE 'Unknown'
	  END AS [Spay/Nuter]
	  ,DR.DailyHealthRecordID
      ,DR.AnimalIntakeID
      ,DR.ObservationDateTime
      ,DR.WeightInKg
      ,DR.TemperatureF
      ,DR.Eyes
      ,DR.Ears
      ,DR.Nose
      ,DR.Body
      ,DR.Stool
      ,DR.Urine
      ,DR.Comment
  FROM dbo.DailyRecord AS DR
  LEFT JOIN dbo.IntakeRecord AS R
  ON DR.AnimalIntakeID = R.AnimalIntakeID
  LEFT JOIN dbo.AnimalIntake AS AI
  ON DR.AnimalIntakeID = AI.AnimalIntakeID
  LEFT JOIN  dbo.GroupSetup AS GS
  ON AI.GroupID = GS.GroupID

GO