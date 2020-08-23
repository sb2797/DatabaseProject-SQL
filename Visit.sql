CREATE TABLE Visit (
	Patient_ID	INT PRIMARY KEY,
  Visit_Date	DATE PRIMARY KEY,
	FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
	);