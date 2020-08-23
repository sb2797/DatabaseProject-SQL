CREATE TABLE Works_For(
  D_Name VARCHAR(32) PRIMARY KEY,
  Employee_ID INT PRIMARY KEY,
  FOREIGN KEY D_Name REFERENCES DName(Department),
  FOREIGN KEY Employee_ID REFERENCES Employee(Employee_ID)
);