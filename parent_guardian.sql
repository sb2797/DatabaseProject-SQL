CREATE TABLE Patient (
	Patient_ID	INT NOT NULL,
	FName		char(16),
	Minit		char(1),
	LName		char(16),
	Age         INT NOT NULL,
	Address		char(50),
	PRIMARY KEY (Patient_ID)
);

INSERT INTO Patient(Patient_ID, FName, Minit, LName, Address, Date_of_Birth)
VALUES(1111,"Lebron","L","James",13,"123 Obama Ave - Akron, OH", DATE '1984-12-30'),
			(1112,"Chris","J","Paul",43,"4182 Jefferson St - Los Angeles, CA", DATE '2003-06-21'),
			(1113,"James","E","Harden",22,"1234 Franklin Ave - Bronx, NY", DATE '2009-08-26'),
			(1114,"Paul","C","George",18,"1911 Python Blvd- Palmdale, CA", DATE '2015-05-02');	

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
	
Select *
From Patient, Parent_Guardian_Information
WHERE Patient.Patient_ID == Parent_Guardian_Information.Patient_ID;
	
Select *
From Patient;

INSERT INTO Parent_Guardian_Information (Patient_ID, PG_ID, Relationship, PG_FName, PG_LName, PG_Phone, PG_Address)
VALUES(1111, 100, "Father", "Papa", "James", "1234567890", "everywhere street");

Select *
From Patient, Parent_Guardian_Information
WHERE Patient.Patient_ID == Parent_Guardian_Information.Patient_ID;

INSERT INTO Parent_Guardian_Information (Patient_ID, PG_ID, Relationship, PG_FName, PG_LName, PG_Phone, PG_Address)
VALUES(1112, 101, "Mother", "Mama", "Paul", "0987654321", "nowhere street");

Select *
From Patient, Parent_Guardian_Information
WHERE Patient.Patient_ID == Parent_Guardian_Information.Patient_ID;
