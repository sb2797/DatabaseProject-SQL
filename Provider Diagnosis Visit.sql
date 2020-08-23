CREATE TABLE Provider_Diag_Visit (
	Patient_ID	INT PRIMARY KEY,
  ICD_10_CM_Code	VARCHAR(10) PRIMARY KEY,
  Provider_Visit_Date DATE PRIMARY KEY,
  Employee_ID INT PRIMARY KEY,
  Primary_Provider VARCHAR(32),
  Referred_To VARCHAR(32),
	FOREIGN KEY (Employee_ID) REFERENCES Service_Provider(Employee_ID),
  FOREIGN KEY (ICD_10_CM_Code) REFERENCES Diagnosis(ICD_10_CM_Code),
  FOREIGN KEY (Provider_Visit_Date) REFERENCES Visit(Visit_Date),
  FOREIGN KEY (Patient_ID) REFERENCES Visit(Patient_ID)
	);