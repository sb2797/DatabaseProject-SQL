CREATE TABLE Patient (
	Patient_ID	INT NOT NULL,
	FName		char(16),
	Minit		char(1),
	LName		char(16),
	Age         INT NOT NULL,
	Address		char(50),
	PRIMARY KEY (Patient_ID)
);

INSERT INTO Patient(Patient_ID, FName, Minit, LName, Age,Address)
VALUES(1111,"Lebron","L","James",13,"123 Obama Ave - Akron, OH"),
			(1112,"Chris","J","Paul",43,"4182 Jefferson St - Los Angeles, CA"),
			(1113,"James","E","Harden",22,"1234 Franklin Ave - Bronx, NY"),
			(1117,"Paul","C","George",18,"1911 Python Blvd- Palmdale, CA");

 CREATE TABLE Treatment (
	Patient_ID	INT NOT NULL,
    ICD_10_PCS	VARCHAR(10) PRIMARY KEY,
    Treatment_Name VARCHAR(16),
	FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
	);
	
INSERT INTO Treatment(Patient_ID, ICD_10_PCS, Treatment_Name)
    VALUES(1111,"1234567890","Basketballsectom"),(1112,"0987654321","Super Courage");
	
CREATE TABLE Followup (
	Patient_ID	INT NOT NULL,
    ICD_10_PCS	VARCHAR(10) PRIMARY KEY,
    FLocation VARCHAR(16),
    FPhone VARCHAR(10),
	FOREIGN KEY (Patient_ID) REFERENCES Treatment(Patient_ID),
    FOREIGN KEY (Patient_ID) REFERENCES ICD_10_PCS(Treatment)
	);
	
INSERT INTO Followup(Patient_ID, ICD_10_PCS, FLocation, FPhone)
    VALUES(1111, "1234567890", "Boston","7631120808");

CREATE TABLE Test_Procedure (
	Patient_ID	INT NOT NULL,
    ICD_10_PCS	VARCHAR(10) PRIMARY KEY,
    Cost_of_Procedure FLOAT,
	FOREIGN KEY (Patient_ID) REFERENCES Treatment(Patient_ID),
    FOREIGN KEY (Patient_ID) REFERENCES ICD_10_PCS(Treatment)
	);
	
INSERT INTO Test_Procedure(Patient_ID, ICD_10_PCS, Cost_of_Procedure)
    VALUES(1112, "0987654321", 32456.11);
  
  
Select Followup.*
From Followup, Treatment
where Followup.Patient_ID == Treatment.Patient_ID;

Select Test_Procedure.*
From Test_Procedure, Treatment
where Test_Procedure.Patient_ID == Treatment.Patient_ID;
