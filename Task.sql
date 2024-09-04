create table Students (StudentID int Primary key, FirstName  Varchar(50), LastName Varchar(50),  DateOfBirth Date,  EnrollmentDate Date, Email Varchar(100), Age int)
create table Courses (CourseID int Primary Key, CourseName Varchar(100), Credits int, Department Varchar (50))
create table Enrollments (EnrollmentID int Primary Key, StudentID int, CourseID int, Grade char(2), Semester varchar(10))
create table Professors (ProfessorID int Primary Key, FirstName varchar(50), LastName varchar(50), Department varchar(50), Email varchar(100))
create table CourseAssignments (AssignmentID int primary key, ProfessorID int, CourseID int, Semester varchar(10))

insert into Students Values 
(1, 'John', 'Doe', '2000-01-01', '2018-09-01', 'john.doe@example.com',Null),
(2, 'Jane', 'Smith', '1999-05-15', '2017-09-01', 
'jane.smith@example.com',21),
(3, 'Robert', 'Brown', '2001-11-21', '2019-09-01', 
'robert.brown@example.com',25),
(4, 'Emily', 'Jones', '2002-03-03', '2020-09-01', 
'emily.jones@example.com',22),
(5, 'Michael', 'Davis', '1998-07-22', '2016-09-01', 
'michael.davis@example.com',23),
(6, 'Linda', 'Wilson', '2000-12-12', '2018-09-01', 
'linda.wilson@example.com',21),
(7, 'James', 'Taylor', '2001-03-14', '2019-09-01', 
'james.taylor@example.com',22),
(8, 'Sarah', 'Lee', '2002-07-07', '2020-09-01', 
'sarah.lee@example.com',23),
(9, 'David', 'Martin', '1999-11-11', '2017-09-01', 
'david.martin@example.com',24),
(10, 'Susan', 'Clark', '2001-05-05', '2019-09-01', 
'susan.clark@example.com',22)

insert into Courses Values 
(1, 'Introduction to SQL', 3, 'Computer Science'),
(2, 'Data Structures', 4, 'Computer Science'),
(3, 'Database Management Systems', 3, 'Information Technology'),
(4, 'Algorithms', 4, 'Computer Science'),
(5, 'Operating Systems', 3, 'Information Technology'),
(6, 'Web Development', 3, 'Computer Science'),
(7, 'Computer Networks', 3, 'Information Technology');

insert into Enrollments Values 
(1, 1, 2, 'A', 'Fall2020'),
(2, 2, 3, 'B+', 'Spring2021'),
(3, 3, 2, 'A-', 'Fall2021'),
(4, 4, 3, 'B', 'Spring2022'),
(5, 2, 2, 'A', 'Fall2020'),
(6, 5, 1, 'B+', 'Fall2020'),
(7, 6, 4, 'A', 'Spring2021'),
(8, 7, 5, 'B', 'Fall2021'),
(9, 8, 6, 'A-', 'Spring2022'),
(10, 9, 7, 'B+', 'Fall2020'),
(11, 10, 1, 'A', 'Spring2021'),
(12, 1, 3, 'B', 'Spring2021'),
(13, 2, 4, 'A-', 'Fall2021'),
(14, 3, 5, 'B+', 'Spring2022'),
(15, 4, 6, 'A', 'Fall2020');

insert into Professors Values 
(1, 'Dr. Alice', 'Johnson', 'Computer Science', 'alice.johnson@example.com'),
(2, 'Dr. Bob', 'Miller', 'Information Technology', 'bob.miller@example.com'),
(3, 'Dr. Carol', 'Williams', 'Computer Science', 'carol.williams@example.com'),
(4, 'Dr. David', 'Jones', 'Information Technology', 'david.jones@example.com'),
(5, 'Dr. Emma', 'Brown', 'Computer Science', 'emma.brown@example.com');

insert into CourseAssignments Values 
(1, 1, 1, 'Fall2020'),
(2, 1, 2, 'Spring2021'),
(3, 2, 3, 'Fall2020'),
(4, 3, 2, 'Spring2022'),
(5, 4, 4, 'Fall2021'),
(6, 5, 5, 'Spring2022'),
(7, 1, 6, 'Fall2020'),
(8, 2, 7, 'Spring2021');

update Students 
Set email = 'john.doe@newmail.com'
where StudentID = 1;

Delete from Students 
where StudentID = 5;

Select * 
From Students

Select FirstName, LastName
From Students
Where EnrollmentDate > '2018-01-01';

Select Count(*)
From Students

Select *
From Enrollments

Select CourseName, Credits
From Courses
Where Department = 'Computer Science'

SELECT SUM(Credits) AS TotalCredits
FROM Courses
WHERE Department = 'Information Technology';

Select FirstName, LastName, CourseName
From Students s
Join Enrollments e
on s.StudentID = e.StudentID
Join Courses c
on e.CourseID = c.CourseID

Select c.CourseName, Count(e.StudentID) as num_of_stud
from Courses c
Join Enrollments e
on c.CourseID = e.CourseID
Group by CourseName
Having Count(e.StudentID) >1

Select *
From Students
Order by EnrollmentDate DESC;

14/
Select FirstName, LastName
From Students s
left join Enrollments e
on s.StudentID = e.StudentID
where EnrollmentID is Null

Select Avg(Credits) as Avg_Cred, Department
From Courses
group by Department

Select s.FirstName, s.LastName, c.CourseName, e.Grade
From Courses c
join Enrollments e
on c.CourseID = e.CourseID
join Students s
on e.StudentID = s.StudentID
Where e.Semester= 'Fall2020';

Select c.CourseName, Count(e.StudentID)
From Enrollments e
Left join Courses c
on e.CourseID = c.CourseID
group by c.CourseName

Select s.FirstName, s.LastName, c.CourseName, e.Grade
From Students s
Join Enrollments e
on s.StudentID = e.StudentID
join Courses c
on e.CourseID = c.CourseID
Where Grade Not in ('B','B+','A-','A','A+')

Select s.StudentID, s.FirstName, s.LastName, count(e.EnrollmentID) as total
From Students s
Left Join Enrollments e
on s.StudentID = e.StudentID
group by s.StudentID

SELECT s.StudentID, s.FirstName, s.LastName, COUNT(e.EnrollmentID) AS TotalEnrollments
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
GROUP BY s.StudentID, s.FirstName, s.LastName

select CourseName
from Courses c
Left join Enrollments e
on c.CourseID = e.CourseID 
where EnrollmentID is null

Select top 3 s.StudentID, s.FirstName, s.LastName, Count(e.EnrollmentID) as Total_enrollment
from Students s
Left join Enrollments e
on s.StudentID = e.StudentID
group by s.StudentID, s.FirstName, s.LastName
Order By Count(e.EnrollmentID) Desc

SELECT p.FirstName, p.LastName, c.CourseName
FROM Professors p
JOIN CourseAssignments ca 
ON p.ProfessorID = ca.ProfessorID
JOIN Courses c 
ON ca.CourseID = c.CourseID

SELECT Department, COUNT(ProfessorID) AS NumberOfProfessors
FROM Professors
GROUP BY Department;

Select *
From Courses
Order by Credits Asc;

Select FirstName, LastName, COUNT(ca.CourseID) as Num_of_courses
from Professors p
Left Join CourseAssignments ca
on p.ProfessorID = ca.ProfessorID
join Courses c
on ca.CourseID = c.CourseID
Group by FirstName, LastName
Having COUNT(ca.CourseID) > 1;


SELECT s.FirstName,s.LastName,c.CourseName
FROM Students s
JOIN Enrollments e 
ON s.StudentID = e.StudentID
JOIN Courses c 
ON e.CourseID = c.CourseID
JOIN CourseAssignments ca 
ON c.CourseID = ca.CourseID
JOIN Professors p 
ON ca.ProfessorID = p.ProfessorID
WHERE p.FirstName = 'Dr.Alice' AND p.LastName = 'Johnson'

SELECT s.StudentID, s.FirstName, s.LastName, SUM(c.Credits) AS TotalCredits
FROM Students s
JOIN Enrollments e 
ON s.StudentID = e.StudentID
JOIN Courses c 
ON e.CourseID = c.CourseID
GROUP BY s.StudentID, s.FirstName, s.LastName;

SELECT c.CourseID, c.CourseName, COUNT(e.StudentID) AS Num_of_student
FROM Courses c
JOIN Enrollments e 
ON c.CourseID = e.CourseID
WHERE e.Semester = 'Spring2021'
GROUP BY c.CourseID, c.CourseName;

SELECT CourseName, Department
from Courses c
join Enrollments e
on c.CourseID = e.CourseID
WHERE e.Semester = 'Spring2021'


SELECT s.StudentID, s.FirstName, s.LastName, MAX(s.EnrollmentDate) AS LastEnrollmentDate
FROM Students s
JOIN Enrollments e 
ON s.StudentID = e.StudentID
GROUP BY s.StudentID, s.FirstName, s.LastName;

SELECT s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e 
ON s.StudentID = e.StudentID
WHERE e.CourseID = 2


SELECT s.StudentID, s.FirstName, s.LastName, COUNT(e.CourseID) AS TotalCourses
FROM Students s
LEFT JOIN Enrollments e 
ON s.StudentID = e.StudentID
GROUP BY s.StudentID, s.FirstName, s.LastName


SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName, e.Grade
FROM Students s
JOIN Enrollments e 
ON s.StudentID = e.StudentID
JOIN Courses c 
ON e.CourseID = c.CourseID


SELECT s.StudentID, s.FirstName, s.LastName, COUNT(e.EnrollmentID) AS TotalEnrollments
FROM Students s
LEFT JOIN Enrollments e 
ON s.StudentID = e.StudentID
GROUP BY s.StudentID, s.FirstName, s.LastName

CREATE VIEW EnrollmentSummary AS
SELECT s.StudentID, s.FirstName, s.LastName, e.CourseID, c.CourseName, e.Grade
FROM Enrollments e
JOIN Students s 
ON e.StudentID = s.StudentID
JOIN Courses c 
ON e.CourseID = c.CourseID;


SELECT c.CourseID, c.CourseName, AVG(s.Age) AS Average_Age
FROM Courses c
JOIN Enrollments e 
ON c.CourseID = e.CourseID
JOIN Students s 
ON e.StudentID = s.StudentID
GROUP BY c.CourseID, c.CourseName;

SELECT c.CourseID, c.CourseName, MAX(e.Grade) AS HighestGrade, MIN(e.Grade) AS LowestGrade
FROM Courses c
JOIN Enrollments e 
ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName;

SELECT c.CourseID, c.CourseName, 
	AVG(CASE 
            WHEN e.Grade = 'A' THEN 4.0
            WHEN e.Grade = 'B+' THEN 3.5
            WHEN e.Grade = 'B' THEN 3.0
            WHEN e.Grade = 'C+' THEN 2.5
            WHEN e.Grade = 'C' THEN 2.0
            WHEN e.Grade = 'D+' THEN 1.5
            WHEN e.Grade = 'D' THEN 1.0
            WHEN e.Grade = 'F' THEN 0.0
            ELSE NULL
        END) AS AvgGrade
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName



SELECT p.Department,
    SUM(CASE 
            WHEN e.Grade = 'A' THEN 4.0
            WHEN e.Grade = 'B+' THEN 3.5
            WHEN e.Grade = 'B' THEN 3.0
            WHEN e.Grade = 'C+' THEN 2.5
            WHEN e.Grade = 'C' THEN 2.0
            WHEN e.Grade = 'D+' THEN 1.5
            WHEN e.Grade = 'D' THEN 1.0
            WHEN e.Grade = 'F' THEN 0.0
            ELSE NULL
        END) AS TotalGrades
FROM Enrollments e
JOIN Students s 
ON e.StudentID = s.StudentID
JOIN Courses c 
ON e.CourseID = c.CourseID
JOIN Professors p 
ON c.Department = p.Department
GROUP BY p.Department


SELECT s.FirstName, s.LastName, c.CourseName
FROM Enrollments e
JOIN Students s 
ON e.StudentID = s.StudentID
JOIN Courses c 
ON e.CourseID = c.CourseID
JOIN CourseAssignments ca 
ON e.CourseID = ca.CourseID
JOIN Professors p 
ON ca.ProfessorID = p.ProfessorID