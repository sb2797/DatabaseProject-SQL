CREATE TABLE Nurse (
	Employee_ID	INT NOT NULL,
	FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
	)
