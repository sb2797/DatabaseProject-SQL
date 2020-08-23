CREATE TABLE Diagnosis (
  ICD_10_CM_Code	VARCHAR(10) PRIMARY KEY,
  Diagnosis_Date DATE PRIMARY KEY,
	FOREIGN KEY (D_Date) REFERENCES Visit(Visit_Date),
	);