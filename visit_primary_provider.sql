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

			
CREATE TABLE Employee
(
  Employee_ID INT NOT NULL,
  FName char(16),
  Minit char(1),
  LName char(16),
  PRIMARY KEY	(Employee_ID)
);

INSERT INTO Employee
  (Employee_ID, FName, Minit, LName)
VALUES(2111, "Tony", "E", "Stark"),
  (2112, "Steve", "A", "Rogers"),
  (2113, "Bruce", "H", "Banner");

CREATE TABLE Service_Provider (
	Employee_ID	INT NOT NULL,
	FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
	);

INSERT INTO Service_Provider (Employee_ID)
    VALUES(2111),(2112);
    
CREATE TABLE Doctor (
	Employee_ID	INT NOT NULL,
	FOREIGN KEY (Employee_ID) REFERENCES Service_Provider(Employee_ID)
	);
	
INSERT INTO Doctor (Employee_ID)
        VALUES(2111);


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
	VALUES
  	(1111, "ABC1234567", '2017-10-29',2111), (1111, "ABC1234567", '2017-10-29',2112);
  
Select PDV.Employee_ID, PDV.Primary_Provider
From Provider_Diag_Visit as PDV, Patient as P
Where P.Patient_ID == PDV.Patient_ID
