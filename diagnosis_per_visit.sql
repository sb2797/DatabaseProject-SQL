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
			
CREATE TABLE Visit (
	Patient_ID	INT NOT NULL,
    Visit_Date	DATE PRIMARY KEY,
	FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
	);

CREATE TABLE Diagnosis (
  ICD_10_CM_Code	VARCHAR(10) PRIMARY KEY,
  Diagnosis_Date    DATE NOT NULL,
	FOREIGN KEY (Diagnosis_Date) REFERENCES Visit(Visit_Date)
	);
	
INSERT INTO Diagnosis (ICD_10_CM_COde, Diagnosis_Date)
    VALUES("1234567890", "1492-32-01"),("0987654321", "1969-07-24");


CREATE TABLE Provider_Diag_Visit (
	Patient_ID	INT NOT NULL,
    ICD_10_CM_Code	VARCHAR(10) NOT NULL,
    Provider_Visit_Date DATE NOT NULL,
    Employee_ID INT NOT NULL,
    Primary_Provider VARCHAR(32),
    Referred_To VARCHAR(32),
	FOREIGN KEY (Employee_ID) REFERENCES Service_Provider(Employee_ID),
    FOREIGN KEY (ICD_10_CM_Code) REFERENCES Diagnosis(ICD_10_CM_Code),
    FOREIGN KEY (Provider_Visit_Date) REFERENCES Visit(Visit_Date),
    FOREIGN KEY (Patient_ID) REFERENCES Visit(Patient_ID)
	);

INSERT INTO Provider_Diag_Visit
  (Patient_ID, ICD_10_CM_Code, Provider_Visit_Date, Employee_ID)
    VALUES (1111, "1234567890", "2018-03-01",2111), (1111, "0987654321", "2018-03-01",2111);
  
Select PDV.Patient_ID, PDV.Provider_Visit_Date, PDV.ICD_10_CM_Code, D.Diagnosis_Date
From Provider_Diag_Visit as PDV, Diagnosis as D
Where PDV.ICD_10_CM_Code == D.ICD_10_CM_Code
