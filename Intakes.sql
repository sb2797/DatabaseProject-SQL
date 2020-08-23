CREATE TABLE Intakes (
	Patient_ID	INT PRIMARY KEY,
  Insurance_ID	INT PRIMARY KEY,
  Employee_ID INT PRIMARY KEY,
  Medical_Info VARCHAR(1028),
  Copays FLOAT,
	FOREIGN KEY (Employee_ID) REFERENCES Clerk(Employee_ID),
  FOREIGN KEY (Insurance_ID) REFERENCES Insurance_Information(Insurance_ID),
  FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
	);