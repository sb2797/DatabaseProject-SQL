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

CREATE TABLE Department
(
  DName VARCHAR(32) NOT NULL,
  PRIMARY KEY (DName)
);

INSERT INTO Department
  (Dname)
VALUES("Accident & Emergency"),
  ("Accounting"),
  ("Cardiology"),
  ("Diagnostic Imaging"),
  ("General Surgery");

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
CREATE TABLE Works_For
(
  Employee_ID INT NOT NULL,
  D_Name VARCHAR(32) NOT NULL,
  PRIMARY KEY (Employee_ID, D_Name),
  FOREIGN KEY (D_Name) REFERENCES Department(DName),
  FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

INSERT INTO Works_For
  (Employee_ID, D_Name)
VALUES(2111, "Accident & Emergency"),
(2111, "Accounting");

SELECT *
FROM Works_For;

SELECT D_Name
FROM Works_For
WHERE NOT EXISTS (SELECT Employee_ID
                FROM Works_For as WF
                WHERE WF.Employee_ID == Works_For.Employee_ID);
                
DROP DATABASE hospital;
