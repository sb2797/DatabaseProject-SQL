CREATE TABLE Accounts_For (
	Employee_ID	INT PRIMARY KEY,
  Item_ID INT PRIMARY KEY,
  Cost_of_Procedure FLOAT,
	FOREIGN KEY (Employee_ID) REFERENCES Nurse(Employee_ID),
  FOREIGN KEY (Item_ID) REFERENCES Supply(Item_ID)
	);