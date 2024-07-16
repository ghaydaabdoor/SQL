use school;
	CREATE TABLE Teachers(
	TeacherID int PRIMARY KEY,
	TeacherName varchar(50),
	)

	CREATE TABLE TeacherDetails(
	TeacherNationalNum varchar(10) PRIMARY KEY,
	TeacherID int UNIQUE,
	TeacherEmail varchar(50),
	TeacherPhone varchar(15),
	TeacherAddress varchar(100),
	FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID),
	);

	CREATE TABLE Courses(
	CourseID int PRIMARY KEY,
	TeacherID int,
	CourseName varchar(50),
	FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID),
	);

	CREATE TABLE Students(
	StudentID int PRIMARY KEY,
	StudentName varchar(50)
	);

	CREATE TABLE Courses_students(
	CourseID int,
	StudentID int,
	PRIMARY KEY (CourseID,StudentID),
	FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
	FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	);

	insert into Teachers values 
	(1,'Omar Khaled'),
	(2,'Ahmad Raed'),
	(3,'Ali Hussein'),
	(4,'Mohammad Al Ahmad'),
	(5,'Abdullah Al Essa');

	insert into TeacherDetails values 
	(9962055753,1,'omarkhaled@gmail.com',787580676,'Irbid'),
	(9962123457,2,'ahmadraed@gmail.com',787542187,'Aydun'),
	(9962542138,3,'alihussein@gmail.com',787542182,'Irbid'),
	(9962542187,4,'mohammadalahmad@gmail.com',787888547,'Jerash'),
	(9962033687,5,'abdullahalessa@gmail.com',785422487,'Amman');

	insert into Courses values
	(1,1,'Mathmatics'),
	(2,1,'Physics'),
	(3,2,'History'),
	(4,2,'Geography'),
	(5,5,'Chemistry');

	insert into Students values
	(1,'abdulrahman omar'),
	(2,'abdullah kheir al deen'),
	(3,'aref maarouf'),
	(4, 'raafat mahmoud'),
	(5, 'raheem ahmad');

	insert into Courses_students values
	(1,1),(1,2),(3,5),(2,5),(2,3);
	

	select * from Teachers;
	select * from TeacherDetails;
	select * from Courses;
	select * from Students;
	select * from Courses_students;
