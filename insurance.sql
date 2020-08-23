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
			(1114,"Paul","C","George",18,"1911 Python Blvd- Palmdale, CA");
			
			
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

CREATE TABLE Clerk (
	Employee_ID	INT NOT NULL,
	FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

INSERT INTO Clerk(Employee_ID)
VALUES(2124),
			(2125),
			(2126),
			(2127);

CREATE TABLE Insurance_Information (
	Insurance_ID	INT NOT NULL,
	start_date	DATE,
	end_date	DATE,
	PRIMARY KEY (Insurance_ID)
);

INSERT INTO Insurance_Information(Insurance_ID, start_date, end_date)
VALUES(7894561, DATE '2017-12-30', DATE '2018-12-30'),
			(7894562, DATE '2018-11-30', DATE '2019-11-30'),
			(7894563, DATE '2015-12-30', DATE '2020-12-30'),
			(7894564, DATE '2015-12-25', DATE '2020-12-25');
    
    
CREATE TABLE Intakes (
	Patient_ID	INT NOT NULL,
  Insurance_ID	INT NOT NULL,
  Employee_ID INT NOT NULL,
  Medical_Info VARCHAR(1028),
  Copays FLOAT,
	PRIMARY KEY(Patient_ID, Insurance_ID, Employee_ID),
	FOREIGN KEY (Employee_ID) REFERENCES Clerk(Employee_ID),
  FOREIGN KEY (Insurance_ID) REFERENCES Insurance_Information(Insurance_ID),
  FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
	);
	
Select *
From Patient
Where exists (select *
                From patient as P, Intakes, Insurance_Information as I
                Where patient.Patient_ID == Intakes.Patient_ID and
                    I.Insurance_ID == Intakes.Insurance_ID);
	

INSERT INTO Intakes(Patient_ID, Insurance_ID, Employee_ID, Medical_Info, COPAYS)
    VALUES(1111,7894561,2124,"Cholesterol is a fat chemical (lipid) that is made in the cells in your body. Many different cells make cholesterol but cells in the liver make about a quarter of the total. You need some cholesterol to keep healthy.", 2300),
				(1112,7894562,2125,"Type 2 diabetes occurs mostly in people aged over 40 years. ", 5300.50),
				(1113,7894563,2126,"The first-line treatment is diet, weight control and physical activity.", 1520.60),
				(1117,7894564,2126,"Insulin injections are needed in some cases.", 1520.60);

Select *
From Patient
Where exists (select *
                From patient as P, Intakes, Insurance_Information as I
                Where patient.Patient_ID == Intakes.Patient_ID and
                    I.Insurance_ID == Intakes.Insurance_ID and
                    I.end_date != NULL);

INSERT INTO Intakes(Patient_ID, Insurance_ID, Employee_ID, Medical_Info, COPAYS)
    VALUES(1111,7894562,2125,"Cholesterol is a fat chemical (lipid) that is made in the cells in your body. Many different cells make cholesterol but cells in the liver make about a quarter of the total. You need some cholesterol to keep healthy.", 2300),
				(1112,7894563,2126,"Type 2 diabetes occurs mostly in people aged over 40 years. ", 5300.50);

/*For test_id 3*/	
Select P.FName, I.Insurance_ID, I.start_date, I.end_date
From Patient as P, Intakes, Insurance_Information as I
Where P.Patient_ID == Intakes.Patient_ID and
        I.Insurance_ID == Intakes.Insurance_ID
