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
			(NULL,"Carmel","K","Anthony","1933 Java St NW - Red Hook, NY", DATE '1984-05-29');
