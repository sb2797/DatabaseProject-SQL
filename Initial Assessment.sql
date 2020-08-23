CREATE TABLE Initial_Assessment (
  Employee_ID INT PRIMARY KEY,
  Nurse_ID INT PRIMARY KEY,
	Patient_Height FLOAT,
  Patient_Weight FLOAT,
  Patient_Blood_Pressure FLOAT,
  Patient_Heart_Rate FLOAT,
  Patient_ID	INT,
  Assessment_Date DATE,
	FOREIGN KEY (Employee_ID) REFERENCES Nurse(Employee_ID),
  FOREIGN KEY (Nurse_ID) REFERENCES Nurse(Employee_ID)
	);