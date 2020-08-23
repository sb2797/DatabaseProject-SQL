CREATE TABLE Uses (
	Patient_ID	INT PRIMARY KEY,
  Use_Date	DATE PRIMARY KEY,
  Item_ID INT PRIMARY KEY,
  Employee_ID INT PRIMARY KEY,
	FOREIGN KEY (Employee_ID) REFERENCES Nurse(Employee_ID),
  FOREIGN KEY (Item_ID) REFERENCES Supply(Item_ID),
  FOREIGN KEY (Use_Date) REFERENCES Visit(Visit_Date),
  FOREIGN KEY (Patient_ID) REFERENCES Visit(Patient_ID)
	);