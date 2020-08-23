CREATE TABLE Service_Provider (
	Employee_ID	INT NOT NULL,
	FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
	)
