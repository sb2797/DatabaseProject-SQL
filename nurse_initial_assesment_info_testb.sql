CREATE DATABASE hospital;
use hospital;
CREATE TABLE Employee
(
  Employee_ID INT NOT NULL,
  FName char(16),
  Minit char(1),
  LName char(16),
  PRIMARY KEY	(Employee_ID)
);

INSERT INTO Employee
  (Employee_ID, FName, Minit, LName)
VALUES(2111, "Tony", "E", "Stark"),
  (2112, "Steve", "A", "Rogers"),
  (2113, "Bruce", "H", "Banner"),
  (2114, "Nathasha", "B", "Romanoff"),
  (2115, "Thor", NULL, "Odinson"),
  (2116, "Nick", "J", "Fury"),
  (2117, "Peter", "J", "Quill"),
  (2118, "Clint", "F", "Barton"),
  (2119, "Gamora", "Z", "Whoberi Ben"),
  (2120, "Peter", NULL, "Parker"),
  (2121, "Stephen", NULL, "Strange"),
  (2122, "Scott", NULL, "Lang"),
  (2124, "James", "R", "Rhodes"),
  (2125, "Samuel", "T", "Wilson"),
  (2127, "Wanda", NULL, "Maximoff"),
  (2126, "Loki", NULL, "Odinson"),
  (2123, "James", "B", "Barnes");

CREATE TABLE Nurse
(
  Employee_ID INT NOT NULL,
  FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

INSERT INTO Nurse
  (Employee_ID)
VALUES(2122),
  (2119),
  (2118),
  (2120),
  (2114);

CREATE TABLE Patient
(
  Patient_ID INT NOT NULL,
  FName char(16),
  Minit char(1),
  LName char(16),
  Address char(50),
  Date_of_Birth DATE,
  PRIMARY KEY (Patient_ID)
);

INSERT INTO Patient
  (Patient_ID, FName, Minit, LName, Address, Date_of_Birth)
VALUES(1111, "Lebron", "L", "James", "123 Obama Ave - Akron, OH", DATE
'1984-12-30'),
(1112,"Chris","J","Paul","4182 Jefferson St - Los Angeles, CA", DATE '2003-06-21'),
(1113,"James","E","Harden","1234 Franklin Ave - Bronx, NY", DATE '2009-08-26'),
(1114,"Paul","C","George","1911 Python Blvd- Palmdale, CA", DATE '2015-05-02'),
(1115,"Russel",NULL,"Westbrook","4707 North St W - Long Beach, CA", DATE '1988-11-12'),
(1116,"Kevin","W","Durant","2021 121st St - Suitland, MD", DATE '1988-09-29'),
(1117,"Carmel","K","Anthony","1933 Java St NW - Red Hook, NY", DATE '1984-05-29');

CREATE TABLE Initial_Assessment
(
  Nurse_ID INT NOT NULL,
  Patient_Height FLOAT,
  Patient_Weight FLOAT,
  Patient_Blood_Pressure FLOAT,
  Patient_Heart_Rate FLOAT,
  Patient_ID INT NOT NULL,
  Assessment_Date DATE,
  PRIMARY KEY(Nurse_ID, Patient_ID),
  FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
  FOREIGN KEY (Nurse_ID) REFERENCES Nurse(Employee_ID)
);
INSERT INTO Initial_Assessment
  (Nurse_ID, Patient_Height, Patient_Weight, Patient_Blood_Pressure, Patient_Heart_Rate,Patient_ID, Assessment_Date)
VALUES(2122, 6.8, 220, 80, 4.5, 1111, DATE
'2018-12-07'),
(2122, 6.5,210,90,8.5,1112, DATE '2018-12-07'),
(2119, 6.3,190,85,7.5,1113, DATE '2018-11-22'),
(2118, 6.5,200,80,7.0,1114, DATE '2018-11-23'),
(2118, 6.4,196,84,7.0,1115, DATE '2018-11-22'),
(2120, 6.3,190,85,7.5,1116, DATE '2018-11-24'),
(2119, 6.7,280,89,7.5,1117, DATE '2018-11-22');

SELECT Initial_Assessment.Nurse_ID, Fname, LName, Patient_ID
FROM Initial_Assessment, Employee
WHERE Initial_Assessment.Nurse_ID = Employee.Employee_ID;

DROP DATABASE hospital;