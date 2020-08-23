CREATE TABLE Parent_Guardian_Information (

	Patient_ID	INT PRIMARY KEY,
  PG_ID	INT PRIMARY KEY,
  Relationship VARCHAR(16),
  PG_FName VARCHAR(16),
  PG_LName VARCHAR(16),
  PG_Phone VARCHAR(10),
  PG_Address VARCHAR(64),
	FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
	);