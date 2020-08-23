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

	INSERT INTO Intakes(Patient_ID, Insurance_ID, Employee_ID, Medical_Info, Copays)
	VALUES(1111,7894561,2124,"Cholesterol is a fat chemical (lipid) that is made in the cells in your body. Many different cells make cholesterol but cells in the liver make about a quarter of the total. You need some cholesterol to keep healthy.", 2300),
				(1112,7894562,2125,"Type 2 diabetes occurs mostly in people aged over 40 years. ", 5300.50),
				(1113,7894563,2126,"The first-line treatment is diet, weight control and physical activity.", 1520.60),
				(1117,7894564,2126,"Insulin injections are needed in some cases.", 1520.60);
