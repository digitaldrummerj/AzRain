USE RescuingAnimalsInNeed;
GO

INSERT INTO [dbo].[GroupSetup]
([StateCityZipID], [GroupName], [Address], [PhoneNumber], [FaxNumber], [WebSite], [501c3Number], [DirectorName], [DirectorPhonNumber], [DirectorFaxNumber], [DirectorEmail])
VALUES (3767, 'I Love Animals', '2700 Hayden Rd.', '1234567890', '0987654321', 'www.I_Love_Animals.com', 'XX-XXXXXXX', 'Directors Name', '1234567890', '0987654321', 'www.Directors_Web.com')
,(3525, 'Rescuing Animals in Need', '1332 W Pampa Av', '4807892320', '4809076055', 'www.AZRain.org', '26-2738822', 'Wayne Miller', '4807892320', '4809076055', 'www.waynewmiller@cox.net')
,(3271, 'Hope for Cats', '1234 Chandler Dr.', '4802246689', '4805234585', 'www.HopeForCats.net', '26-XXXXXXX', 'Mr. Hope Cat', '4805685424', '0987654321', 'www.hope@cat')


INSERT INTO [dbo].[GroupEmergencyNumbers]
(GroupID, ContactName, ContactPhoneNumber)
VALUES (1, 'Emergency Contact 1', '1111111111')
,(1, 'Emergency Contact 2', '2222222222')
,(1, 'Emergency Contact 3', '3333333333')
,(2, 'Emergency Contact 1', '1111111111')
,(2, 'Emergency Contact 2', '2222222222')
,(2, 'Emergency Contact 3', '3333333333')
,(2, 'Emergency Contact 4', '4444444444')
,(3, 'Emergency Contact 1', '1111111111')
,(3, 'Emergency Contact 2', '2222222222')
,(3, 'Emergency Contact 3', '3333333333')


INSERT INTO [dbo].[AnimalIntake]
([GroupID], [IntakeDate], [FelineCanine], [AnimalNumber], [Location], [AnimalName], [DOB], [Sex], [Description], [Microchip])
VALUES (1, '03-01-2016', 'F', 1, '02-AV', 'Fluffy', '01-01-2016', 'M', 'Tabbby', 'THS45U345PO54QW-{}@r')
,(1, '03-01-2016', 'F', 2, '03-AV', 'Puffty', '01-02-2015', 'F', 'Siamese', '12~fdhHervrRHS5189:g')
,(2, '03-01-2016', 'C', 1, '01-AA', 'Ruffy', '07-04-2010', 'M', 'Boxer', '846Kijd&4#hfeiu465SD')
,(3, '03-01-2016', 'C', 1, '99-ZZ', 'Fido', '12-25-2013', 'M', 'Pit Bull', 'KJSiue*&^heir)*49822')
,(3, '03-01-2016', 'C', 2, 'HI-01', 'Spot', '05-05-2005', 'F', 'Chiwawas ', 'IAMTHEFERTOBANDITOOO')


INSERT INTO [dbo].[IntakeRecord]
([AnimalIntakeID], [FirstVacinationDate], [SecondVacinationDate], [ThirdVacinationDate], [Rabies], [FelvFIVTest], [FleaTickTreatment], [Other1], [Other1Description], [Other2], [Other2Description], [Other3], [Other3Description], [Other4], [Other4Description], [SpayNuter])
VALUES (1,		'2015-03-11',			 '2016-03-11',			 '2016-03-11',	 '2016-03-11',		NULL,			NULL,				NULL,		NULL,			NULL,		NULL,				NULL,		NULL,			NULL,		NULL,				 0)
,(	2,			'2015-03-11',			 '2016-03-11',			 NULL,			 '2016-03-11',		'2016-03-11',	NULL,				'2016-03-11',	'Other1',	NULL,		NULL,				NULL,		NULL,			NULL,		NULL,				 1)
,(	3,			'2015-03-11',			 NULL,					 NULL,			 '2016-03-11',		NULL,			'2016-03-11',		NULL,		NULL,			'2016-03-11',	'Other2',		NULL,		NULL,			NULL,		NULL,				 0)
,(	4,			'2015-03-11',			 '2016-03-11',			 NULL,			 NULL,				'2016-03-11',	'2016-03-11',		NULL,		NULL,			NULL,		NULL,				'2016-03-11',	'Other3',	NULL,		NULL,				 1)
,(	5,			'2015-03-11',			 '2016-03-11',			 '2016-03-11',	 '2016-03-11',		NULL,			NULL,				NULL,		NULL,			NULL,		NULL,				NULL,		NULL,			'2016-03-11',	'Other4',		 0)


INSERT INTO [dbo].[DailyRecord]
([AnimalIntakeID], [ObservationDateTime], [WeightInKg], [TemperatureF], [Eyes], [Ears], [Nose], [Body], [Stool], [Urine], [Comment])
VALUES (1, '2016-03-01T14:25:00', 11.34, 101.5, NULL, NULL, NULL, NULL, NULL, NULL, 'All seems good')
,(1, '2016-03-02T09:00:00', 11.00, 101.8, NULL, 'R', NULL, NULL, 'R', NULL, 'Seems a little under the weather')
,(1, '2016-03-03T16:30:00', 10.20, 102.1, NULL, 'R', 'R', NULL, 'R', 'R', 'Seems to be getting worse')
,(2, '2016-03-01T14:25:00', 5.26, 101.5, NULL, NULL, NULL, NULL, NULL, NULL, 'All seems good')
,(2, '2016-03-02T09:00:00', 5.24, 101.8, NULL, 'R', NULL, NULL, 'R', NULL, 'Seems a little under the weather')
,(2, '2016-03-03T16:30:00', 5.29, 102.1, NULL, 'R', 'R', NULL, 'R', 'R', 'Seems to be getting worse')
,(3, '2016-03-01T14:25:00', 12.50, 101.5, 'R', 'R', 'R', 'R', 'R', 'R', 'Ho, my god!')
,(3, '2016-03-02T09:00:00', 12.90, 101.8, 'R', 'R', 'R', 'R', 'R', 'R', 'He''s never going to make it.')
,(3, '2016-03-03T16:30:00', 13.02, 102.1, NULL, NULL, NULL, NULL, NULL, NULL, 'It''s a miracle!!')
,(4, '2016-03-01T14:25:00', 09.52, 101.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
,(4, '2016-03-02T09:00:00', 09.64, 101.8, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
,(4, '2016-03-03T16:30:00', 09.24, 102.1, NULL, NULL, NULL, NULL, NULL, NULL,NULL)
,(5, '2016-03-01T14:25:00', 03.20, 101.5, 'R', NULL, NULL, NULL, NULL, NULL, 'Looks like Pink Eye')
,(5, '2016-03-02T09:00:00', 03.25, 101.8, 'R', NULL, NULL, NULL, NULL, NULL, 'Looks like Pinker Eye')
,(5, '2016-03-03T16:30:00', 03.52, 102.1, 'R', NULL, NULL, NULL, NULL, NULL, 'Now, it''s RED EYE')