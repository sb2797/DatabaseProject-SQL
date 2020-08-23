CREATE TABLE Emergency_Contact (

	Patient_ID	INT PRIMARY KEY,
  EContact_ID	INT PRIMARY KEY,
  EC_FName VARCHAR(16),
  EC_LName VARCHAR(16),
  EC_Phone VARCHAR(10),
  EC_Address VARCHAR(64),
	FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
	);