CREATE TABLE Patient (
	Patient_ID	INT NOT NULL,
	FName		char(16),
	Minit		char(1),
	LName		char(16),
	Address		char(50),
	Date_of_Birth	DATE,
	PRIMARY KEY (Patient_ID)
);

INSERT INTO Patient(Patient_ID, FName, Minit, LName, Address, Date_of_Birth)
VALUES(1111,"Lebron","L","James","123 Obama Ave - Akron, OH", DATE '1984-12-30'),
			(1112,"Chris","J","Paul","4182 Jefferson St - Los Angeles, CA", DATE '2003-06-21'),
			(1113,"James","E","Harden","1234 Franklin Ave - Bronx, NY", DATE '2009-08-26'),
			(1114,"Paul","C","George","1911 Python Blvd- Palmdale, CA", DATE '2015-05-02'),
			(1115,"Russel",NULL,"Westbrook","4707 North St W - Long Beach, CA", DATE '1988-11-12'),
			(1116,"Kevin","W","Durant","2021 121st St - Suitland, MD", DATE '1988-09-29'),
			(1117,"Carmel","K","Anthony","1933 Java St NW - Red Hook, NY", DATE '1984-05-29');

CREATE TABLE Visit
(
	Patient_ID INT NOT NULL,
	Visit_Date DATE NOT NULL,
	PRIMARY KEY(Patient_ID, Visit_Date),
	FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);

INSERT INTO Visit
	(Patient_ID, Visit_Date)
VALUES
	(1111, DATE
'2017-10-29'),
(1112, DATE '2017-10-30'),
(1113, DATE '2017-11-03'),
(1114, DATE '2017-12-11'),
(1115, DATE '2017-10-29'),
(1116, DATE '2017-08-15'),
(1117, DATE '2017-10-29');

CREATE TABLE Provider_Diag_Visit
(
  Patient_ID INT NOT NULL,
  ICD_10_CM_Code VARCHAR(10) NOT NULL,
  Provider_Visit_Date DATE NOT NULL,
  Employee_ID INT NOT NULL,
  Primary_Provider VARCHAR(32),
  Referred_To VARCHAR(32),
  PRIMARY KEY(Patient_ID, ICD_10_CM_Code,Provider_Visit_Date,Employee_ID),
  FOREIGN KEY (Employee_ID) REFERENCES Service_Provider(Employee_ID),
  FOREIGN KEY (ICD_10_CM_Code) REFERENCES Diagnosis(ICD_10_CM_Code),
  FOREIGN KEY (Provider_Visit_Date) REFERENCES Visit(Visit_Date),
  FOREIGN KEY (Patient_ID) REFERENCES Visit(Patient_ID)
);

INSERT INTO Provider_Diag_Visit
  (Patient_ID, ICD_10_CM_Code, Provider_Visit_Date, Employee_ID, Referred_To)
VALUES
  (1111, "ABC1234567", DATE '2017-10-29',2117,"Ref. by Dr. Smith");