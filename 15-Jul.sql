create Table Books(
BookID int,
Title varchar(50),
AuthorID int,
PublishedYear int,
CopiesAvailable int,
BookCategory varchar(20),
);

create Table Authors(
AuthorID int,
FirstName varchar(10),
LastName varchar(10),
BirthYear int,
);

insert into Books values 
(1,'A Tale of Two Cities',1000,1859,20,'History'),
(2,'The Little Prince',1010,1943,30,'Fantasy'),
(3,'The Alchemist ',1020,1988,50,'Fantasy'),
(4,'Harry Potter and the Philosophers Stone',1030,1997,100,'Fantasy'),
(5,'And Then There Were None',1040,1939,36,'Mystery');

insert into Authors values
(1,'Charles', 'Dickens',1910),
(2,'Antonio','De Saint',1928),
(3,'Paulo','Coelho',1930),
(4,'JK','Rowling',1919),
(5,'Agatha','Christie',1923);

SELECT * FROM Books;
SELECT * FROM Authors;
SELECT * FROM Books WHERE CopiesAvailable = (SELECT MIN(CopiesAvailable) FROM Books);
SELECT * FROM Books WHERE CopiesAvailable = (SELECT max(CopiesAvailable) FROM BOOKS);
SELECT avg(PublishedYear) as avgPublishedYear FROM Books;
SELECT count(*) as totalBooksNumber FROM Books;
TRUNCATE TABLE Books;
DROP TABLE Authors;
