
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

CREATE TABLE Clerk
(
  Employee_ID INT NOT NULL,
  FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

INSERT INTO Clerk
  (Employee_ID)
VALUES(2124),
  (2125),
  (2126),
  (2127);

CREATE TABLE Insurance_Information
(
  Insurance_ID INT NOT NULL,
  start_date DATE,
  end_date DATE,
  PRIMARY KEY (Insurance_ID)
);

INSERT INTO Insurance_Information
  (Insurance_ID, start_date, end_date)
VALUES(7894561, DATE
'2017-12-30', DATE '2018-12-30'),
(7894562, DATE '2018-11-30', DATE '2019-11-30'),
(7894563, DATE '2015-12-30', DATE '2020-12-30'),
(7894564, DATE '2015-12-25', DATE '2020-12-25');

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


CREATE TABLE Intakes
(
  Patient_ID INT NOT NULL,
  Insurance_ID INT NOT NULL,
  Employee_ID INT NOT NULL,
  Medical_Info VARCHAR(1028),
  Copays FLOAT,
  PRIMARY KEY(Patient_ID, Insurance_ID, Employee_ID),
  FOREIGN KEY (Employee_ID) REFERENCES Clerk(Employee_ID),
  FOREIGN KEY (Insurance_ID) REFERENCES Insurance_Information(Insurance_ID),
  FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);

INSERT INTO Intakes
  (Patient_ID, Insurance_ID, Employee_ID, Medical_Info, Copays)
VALUES(1111, 7894561, 2124, "Cholesterol is a fat chemical (lipid) that is made in the cells in your body. Many different cells make cholesterol but cells in the liver make about a quarter of the total. You need some cholesterol to keep healthy.", 2300),
  (1112, 7894562, 2125, "Type 2 diabetes occurs mostly in people aged over 40 years. ", 5300.50),
  (1113, 7894563, 2126, "The first-line treatment is diet, weight control and physical activity.", 1520.60),
  (1117, 7894564, 2126, "Insulin injections are needed in some cases.", 1520.60);

SELECT Intakes.Employee_ID, Fname, LName, Patient_ID
FROM Intakes, Employee
WHERE Intakes.Employee_ID = Employee.Employee_ID;

DROP DATABASE hospital;