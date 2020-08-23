CREATE TABLE Physician_Assistant (
	Employee_ID	INT NOT NULL,
	FOREIGN KEY (Employee_ID) REFERENCES Service_Provider(Employee_ID)
	)
