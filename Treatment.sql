CREATE TABLE Treatment (
	Patient_ID	INT PRIMARY KEY,
  ICD_10_PCS	VARCHAR(10) PRIMARY KEY,
  Treatment_Name VARCHAR(16),
	FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
	);