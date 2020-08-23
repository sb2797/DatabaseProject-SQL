CREATE TABLE Test_Procedure (
	Patient_ID	INT PRIMARY KEY,
  ICD_10_PCS	VARCHAR(10) PRIMARY KEY,
  Cost_of_Procedure FLOAT,
	FOREIGN KEY (Patient_ID) REFERENCES Treatment(Patient_ID),
  FOREIGN KEY (Patient_ID) REFERENCES ICD_10_PCS(Treatment)
	);