-- Create table statements for WorldsBestLibrary database
-- Also index and trigger statements

-- Create table1 book
CREATE TABLE book(
	bookID INT IDENTITY(1000, 1),
	ISBN VARCHAR(13) NOT NULL,
	PRIMARY KEY(bookID)
);


-- Create table2 movie
CREATE TABLE movie(
	movieID INT IDENTITY(2000, 1),
	rating VARCHAR(13),
	PRIMARY KEY(movieID)
);


-- Create table3 DVD_CD
CREATE TABLE DVD_CD(
	discID INT IDENTITY(3000, 1),
	medium VARCHAR(50) NOT NULL,
	PRIMARY KEY(discID)
);


-- Create table4 media
CREATE TABLE media(
	mediaID INT IDENTITY(4000, 1),
	type VARCHAR(50) NOT NULL,
bookID INT,
movieID INT,
discID INT,
loanStatus VARCHAR(20) NOT NULL,
condition VARCHAR(50) NOT NULL,
title VARCHAR(230) NOT NULL,
releaseDate DATE NOT NULL,
	
PRIMARY KEY(mediaID),
	FOREIGN KEY(bookID) REFERENCES book (bookID),
	FOREIGN KEY(movieID) REFERENCES movie (movieID),
	FOREIGN KEY(discID) REFERENCES DVD_CD(discID),
	
	CHECK (loanStatus IN ('available', 'unavailable')),
	CHECK ((bookID IS NOT NULL AND movieID IS NULL AND discID IS NULL)
OR (movieID IS NOT NULL AND bookID IS NULL AND discID IS NULL) 
OR (discID IS NOT NULL AND bookID IS NULL AND movieID IS NULL))
);


-- Create table5 genre
CREATE TABLE genre (
	genreID INT IDENTITY(5000,1),
	genreName VARCHAR(100) NOT NULL,
   	PRIMARY KEY(genreID)

);


-- Create table6 mediaGenre
CREATE TABLE mediaGenre (
	mediaID INT,
	genreID INT,

PRIMARY KEY(mediaID, genreID),
FOREIGN KEY(mediaID) REFERENCES media(mediaID),
FOREIGN KEY(genreID) REFERENCES genre(genreID)
ON DELETE CASCADE
);



-- Create table7 member
CREATE TABLE member (
	memberID INT IDENTITY(6000,1),
	fname VARCHAR(16) NOT NULL,
	lname VARCHAR(16) NOT NULL,
	membershipStart DATE NOT NULL,
	status VARCHAR(16) NOT NULL,
	email VARCHAR(500) NOT NULL,
	dob DATE NOT NULL,

PRIMARY KEY(memberID),
CHECK(status IN('active', 'inactive'))
);


-- Create table8 review
CREATE TABLE review(
	reviewID INT IDENTITY(7000, 1),
	rating INT NOT NULL,
	description VARCHAR(8000),
	memberID INT,
	date DATE NOT NULL,
	mediaID INT,
	
PRIMARY KEY(reviewID),
FOREIGN KEY(memberID) REFERENCES member(memberID),
FOREIGN KEY(mediaID) REFERENCES media(mediaID),
CHECK (rating BETWEEN 1 AND 5)
);


-- Previous table9 was eliminated, so there is actually only 11 tables


-- Create table10 loan
CREATE TABLE loan(
	loanID INT IDENTITY(8000, 1),
loanDate DATE NOT NULL,
returnDate Date,
mediaID INT NOT NULL,
memberID INT NOT NULL,
overdue VARCHAR(16) NOT NULL,
	
PRIMARY KEY(loanID),
CHECK (overdue IN ('true','false')),
FOREIGN KEY(mediaID) REFERENCES media (mediaID),
FOREIGN KEY(memberID) REFERENCES member(memberID),
);


-- Create table11 creator
CREATE TABLE creator(
	creatorID INT IDENTITY(9000,1),
fname VARCHAR (60) NOT NULL,
lname VARCHAR (60) NOT NULL,
dob DATE NOT NULL,
PRIMARY KEY(creatorID)
);


-- Create table12 mediaCreator
CREATE TABLE mediaCreator(
	mediaID INT,
	creatorID INT,
	description VARCHAR(8000) NOT NULL,
	
PRIMARY KEY(mediaID, creatorID),
FOREIGN KEY(mediaID) REFERENCES media (mediaID)
ON DELETE CASCADE,
FOREIGN KEY(creatorID) REFERENCES creator(creatorID)
);


--Create Index for frequent searches on titles and availabilities
CREATE INDEX media_title_loanStatus ON media (title, loanStatus);

--Index for book ISBN lookup
CREATE INDEX ISBN_lookup ON book (ISBN);

--Index for member search by last name
CREATE INDEX member_lname ON member (lname);

--Index for genre-based media search
CREATE INDEX mediaGenre_mediaID_genreID ON mediaGenre(mediaID, genreID);

--Index for overdue loans
CREATE INDEX loan_overDue ON loan(overdue);

--Index for item search by title
CREATE INDEX media_title ON media(title);



-- When an item gets borrowed (i.e. new loan), set the borrowed item to unavailable.
CREATE TRIGGER setAvail_on_loan
ON loan
AFTER insert
AS
BEGIN
	UPDATE media
	SET loanStatus = 'unavailable'
	FROM media
	INNER JOIN inserted on media.mediaID = inserted.mediaID
END;


/* When an item gets returned (returnDate of loan gets set from null to an actual date), set the
 * returned item to available. */
CREATE TRIGGER setAvail_on_return
ON loan
AFTER update
AS
BEGIN
	UPDATE media
	SET loanStatus = 'available'
	FROM media
INNER JOIN inserted on media.mediaID = inserted.mediaID
INNER JOIN deleted on deleted.loanID = inserted.loanID
where deleted.returnDate IS NULL
	AND inserted.returnDate IS NOT NULL;
END;
