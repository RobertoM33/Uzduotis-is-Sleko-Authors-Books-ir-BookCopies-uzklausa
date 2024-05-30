CREATE TABLE Authors(
[Id] INT PRIMARY KEY CLUSTERED  IDENTITY, --pirminis raktas butinas
[FirstName] NVARCHAR(100) NOT NULL, --autoriaus vardas
[LastName] NVARCHAR(100) NOT NULL, --autoriaus pavarde
[BirthDate] DATE NOT NULL, --autoriaus gimimo data
[Country] NVARCHAR(50) NOT NULL,--salis is kurios autorius yra kiles
);
GO



SET IDENTITY_INSERT authors ON --Kai leidziu sau redaguoti raktus
INSERT INTO Authors([FirstName],[LastName],[BirthDate], [Country])
VALUES 
(1, 'Balzakas', 'Onore', '1856-05-17','Prancuzija'),
(2, 'Konoras', 'Maklainas', '1952-09-18', 'JAV'),
(3, 'Bartonas', 'Kentas', '1945-08-17', 'Anglija'),
(4, 'Eitonas', 'Vatas', '1974-08-18', 'Anglija'),
(5,'Bridzas', 'Lukas', '1981-07-19', 'Vokietija');

INSERT INTO Authors([FirstName],[LastName],[BirthDate], [Country])
VALUES 
( 'Balzakas', 'Onore', '1856-05-17','Prancuzija'),
('Konoras', 'Maklainas', '1952-09-18', 'JAV'),
( 'Bartonas', 'Kentas', '1945-08-17', 'Anglija'),
( 'Eitonas', 'Vatas', '1974-08-18', 'Anglija'),
('Bridzas', 'Lukas', '1981-07-19', 'Vokietija');



CREATE TABLE Books(
[Id] INT PRIMARY KEY CLUSTERED IDENTITY,  --pirminis raktas butinas
[Title] NVARCHAR(255), --knygos pavadinimas
[PublicationYear] INT, --autoriaus pavarde
[Genre] NVARCHAR(50), --knygos zanras
[AuthorID] INT, --kadangi susietas su lentele Authors taspats tipas
FOREIGN KEY (AuthorID) REFERENCES Authors(Id) --kadangi id yra kitoje lenteleje itraukiam aprase
);

INSERT INTO Books ([Title], [PublicationYear], [Genre])
VALUES
('Smelio Kurantai', 1870, 'Istorija'),
('Tarnaite', 1895, 'Istorinis'),
('Akmuo', 1965, 'Vesternas'),
('Uzutekio slenis', 1985, 'Drama'),
('Saulelidzio vaikai', 1999, 'SinceFiction');

CREATE TABLE BookCopies(
[Id] INT PRIMARY KEY clustered Identity(1,1), --pirminis raktas butinas
[BookId] INT, --raktas susijes su Books lenteles BookID
[Condition] NVARCHAR (50), --knygos bukle
[Price] DECIMAL(10,2), --knygos kaina
[InStock] INT,  --kiekis sandelyje
FOREIGN KEY (BookId) REFERENCES Books (Id) --kadangi id yra kitoje lenteleje itraukiam aprase
);

INSERT INTO BookCopies ([Condition], [Price], [InStock])
VALUES
( 'Nauja', '15.25', '4587'),
( 'Nauja', '25.25', '45887'),
( 'Nauja', '35.25', '4587'),
( 'Nauja', '25.80', '4987'),
('Nauja', '17.25', '5587');