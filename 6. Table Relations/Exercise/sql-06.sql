CREATE TABLE Students
(
StudentID INT PRIMARY KEY,
StudentNumber VARCHAR(50) NOT NULL,
StudentName VARCHAR(50) NOT NULL,
MajorID INT NOT NULL
)

CREATE TABLE Majors
(
MajorID INT PRIMARY KEY,
[Name] VARCHAR(50) NOT NULL
)

CREATE TABLE Payments
(
PaymentID INT PRIMARY KEY,
PaymentDate DATE NOT NULL,
PaymentAmount FLOAT NOT NULL,
StudentID INT NOT NULL UNIQUE
)

CREATE TABLE Agenda
(
StudentID INT NOT NULL,
SubjectID INT NOT NULL,
CONSTRAINT PK_Agenda PRIMARY KEY (StudentID, SubjectID)
)

CREATE TABLE Subjects
(
SubjectID INT PRIMARY KEY,
SubjectName VARCHAR(50)
)

ALTER TABLE Agenda
ADD CONSTRAINT FK_Agenda_Students FOREIGN KEY (StudentID)
REFERENCES Students(StudentID)

ALTER TABLE Agenda
ADD CONSTRAINT FK_Agenda_Subjects FOREIGN KEY (SubjectID)
REFERENCES Subjects(SubjectID)

ALTER TABLE Students
ADD CONSTRAINT FK_Students_Majors FOREIGN KEY (MajorID)
REFERENCES Majors(MajorID)

ALTER TABLE Payments
ADD CONSTRAINT FK_Payments_Students FOREIGN KEY (StudentID)
REFERENCES Students(StudentID)