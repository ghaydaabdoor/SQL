use master;
create database JaradatTech;

-- following tables : ( Books , Authors , Sections , Categories , Employees , Users )
use JaradatTech;
go

create table Authors(
AuthorsID int primary key,
AuthorsName varchar(50) not null,
AuthorNationality varchar(50),
);

create table Sections(
SectionID int primary key,
SectionName varchar(50),
);

create table Categories(
CategoryID int primary key,
SectionID int,
CategoryName varchar(50),
foreign key (SectionID) references Sections(SectionID),
);

create table Books(
BookID int primary key,
AuthorsID int,
CategoryID int,
BookName varchar(50),
PublishedYear int,
CopiesAvailable int,
foreign key (AuthorsID) references Authors(AuthorsID),
foreign key (CategoryID) references Categories(CategoryID),
);

CREATE TABLE Employees (
    EmployeeID int PRIMARY KEY,
    EmployeeName varchar(50),
    EmployeeRole varchar(50),
    EmployeePhone varchar(15),
    EmployeeHiredate date
);



create table Users(
UsersID int primary key,
UsersName varchar(50),
UserPhone varchar(15),
UserBorrowDate date,
);

create table Employees_Users(
EmployeeID int,
UsersID int,
primary key (EmployeeID,UsersID),
foreign key (EmployeeID) references Employees(EmployeeID),
foreign key (UsersID) references Users(UsersID),
);

create table Books_Users(
BookID int,
UsersID int,
primary key (BookID,UsersID),
foreign key (BookID) references Books(BookID),
foreign key (UsersID) references Users(UsersID),
);

insert into Authors values 
(1, 'J.K. Rowling', 'British'),
(2, 'George Orwell', 'British'),
(3, 'Gabriel Garcia Marquez', 'Colombian'),
(4, 'Haruki Murakami', 'Japanese'),
(5, 'Chinua Achebe', 'Nigerian');

insert into Books values
(1, 1, 2, 'Harry Potter and the Philosophers Stone', 1997, 5),
(2, 1, 2, '1984', 1949, 3),
(3, 3, 4, 'One Hundred Years of Solitude', 1967, 2),
(4, 3, 4, 'Norwegian Wood', 1987, 4),
(5, 5, 5, 'Things Fall Apart', 1958, 3);


insert into Sections values
(1, 'Fiction'),
(2, 'Non-Fiction'),
(3, 'Childrens Books'),
(4, 'Reference'),
(5, 'Periodicals');

insert into Categories values 
(1, 1, 'Romance'),
(2, 1, 'Science Fiction'),
(3, 3, 'Biography'),
(4, 3, 'History'),
(5, 2, 'Young Adult');

insert into Users values 
(1, 'Ghayda Bdoor', '0784567890', '2024-07-01'),
(2, 'Suha Khaled', '0785678901', '2024-07-02'),
(3, 'Hadeel Al Zoubi', '0786789012', '2024-07-03'),
(4, 'Tuqa Harahsheh', '0777890123', '2024-07-04'),
(5, 'Sarah Mohammad', '0798901234', '2024-07-05');

insert into Employees values
(1, 'Omar Khaled', 'Librarian', '1234567890', '2022-01-15'),
(2, 'Mohammad Amer', 'Assistant', '2345678901', '2023-03-10'),
(3, 'Omran Raafat', 'Manager', '3456789012', '2021-06-20'),
(4, 'Sura Khalil', 'Clerk', '4567890123', '2024-02-25'),
(5, 'Rama Ali', 'Technician', '5678901234', '2020-11-30');

insert into Employees_Users values 
(1,1),(1,2),(1,3),(2,3),(1,4);

insert into Books_Users values 
(2,3),(2,4),(3,4),(1,3),(5,5);

select * from Authors;
select * from Books;
select * from Sections;
select * from Categories;
select * from Users;
select * from Employees;
select * from Employees_Users;
select * from Books_Users;

update Books set AuthorsID=1 where BookID=2;
update Books set AuthorsID=3 where BookID=4;

-- one to many relationship: Authors to Books
-- inner join
select * from Authors;
select * from Books;
select Authors.AuthorsID, AuthorsName, BookID, BookName
from Authors inner join Books
on Authors.AuthorsID=Books.AuthorsID;

-- left join
select * from Authors;
select * from Books;
select Authors.AuthorsID, AuthorsName, BookID, BookName
from Authors left join Books
on Authors.AuthorsID=Books.AuthorsID;

-- right join
select * from Authors;
select * from Books;
select Authors.AuthorsID, AuthorsName, BookID, BookName
from Authors right join Books
on Authors.AuthorsID=Books.AuthorsID;

-- full join
select * from Authors;
select * from Books;
select Authors.AuthorsID, AuthorsName, BookID, BookName
from Authors full join Books
on Authors.AuthorsID=Books.AuthorsID;

-- many to many relationship: Books to Users
-- inner join
select * from Books;
select * from Users;
select * from Books_Users;
select Books.BookID, Books.BookName, Users.UsersID, Users.UsersName, Users.UserPhone
from Books_Users
inner join Books
on Books_Users.BookID=Books.BookID
inner join Users
on Books_Users.UsersID=Users.UsersID;

-- left join
select * from Books;
select * from Users;
select * from Books_Users;
select Books.BookID, Books.BookName, Users.UsersID, Users.UsersName, Users.UserPhone
from Books_Users 
left join Books 
on Books_Users.BookID=Books.BookID
left join Users
on Books_Users.UsersID=Users.UsersID;

-- right join
select * from Books;
select * from Users;
select * from Books_Users;
select Books.BookID, Books.BookName, Users.UsersID, Users.UsersName, Users.UserPhone
from Books_Users 
right join Books 
on Books_Users.BookID=Books.BookID
right join Users
on Books_Users.UsersID=Users.UsersID;

-- full join
select * from Books;
select * from Users;
select * from Books_Users;
select Books.BookID, Books.BookName, Users.UsersID, Users.UsersName, Users.UserPhone
from Books_Users 
full join Books 
on Books_Users.BookID=Books.BookID
full join Users
on Books_Users.UsersID=Users.UsersID;