-- Test data
-- This our DML file

-- Insert data into book
INSERT INTO book (ISBN)
VALUES
('9780333791035'),
('9781477508480'),
('9781477508481'),
('9781477508488'),
('9781477508489');


-- Insert data into movie
INSERT INTO movie (rating)
VALUES
('R'),
('G'),
('G'),
('PG-13');


-- Insert data into DVD_CD
INSERT INTO DVD_CD (medium)
VALUES
('Blu-Ray'),
('DVD'),
('CD');


-- Insert data into genre
INSERT INTO genre
VALUES
('fiction'),
('novel'),
('narrative'),
('comedy'),
('horror'),
('action'),
('drama'),
('adventure'),
('pop'),
('jazz'),
('documentary');


-- When add an item to the library's media collection, loanStatus should be available

-- Insert books into media
INSERT INTO media (type, bookID, movieID, discID, loanStatus, condition, title, releaseDate)
VALUES
('book', (SELECT bookID FROM book WHERE ISBN = '9780333791035'), NULL, NULL, 'available', 'new', 'The Great Gatsby', '1925-04-10'),
('book', (SELECT bookID FROM book WHERE ISBN = '9780333791035'), NULL, NULL, 'available', 'good', 'The Great Gatsby', '1925-04-10'),
('book', (SELECT bookID FROM book WHERE ISBN = '9780333791035'), NULL, NULL, 'available', 'fair', 'The Great Gatsby', '1925-04-10'),
('book', (SELECT bookID FROM book WHERE ISBN = '9781477508480'), NULL, NULL, 'available', 'new', 'Romance In Paris', '2012-05-27'),
('book', (SELECT bookID FROM book WHERE ISBN = '9781477508481'), NULL, NULL, 'available', 'new', 'Life In China', '2008-05-10'),
('book', (SELECT bookID FROM book WHERE ISBN = '9781477508488'), NULL, NULL, 'available', 'fair', 'Survivor', '2020-01-10');


-- Insert movies into media
INSERT INTO media (type, bookID, movieID, discID, loanStatus, condition, title, releaseDate)
VALUES
('movie', NULL, (SELECT movieID FROM movie WHERE movieID = 2000), NULL, 'available', 'fair', 'See You Tomorrow', '2024-01-15'),
('movie', NULL, (SELECT movieID FROM movie WHERE movieID = 2000), NULL, 'available', 'fair', 'See You Tomorrow', '2024-01-15'),
('movie', NULL, (SELECT movieID FROM movie WHERE movieID = 2001), NULL, 'available', 'new', 'Things Under Your Bed', '2000-10-04'),
('movie', NULL, (SELECT movieID FROM movie WHERE movieID = 2002), NULL, 'available', 'fair', 'Afraid', '1994-01-25');

/* Hard coded movieID stuff and my ids were different because I deleted data previously
-- Insert movies into media
INSERT INTO media (type, bookID, movieID, discID, loanStatus, condition, title, releaseDate)
VALUES
('movie', NULL, (SELECT movieID FROM movie WHERE movieID = 2008), NULL, 'available', 'fair', 'See You Tomorrow', '2024-01-15'),
('movie', NULL, (SELECT movieID FROM movie WHERE movieID = 2008), NULL, 'available', 'fair', 'See You Tomorrow', '2024-01-15'),
('movie', NULL, (SELECT movieID FROM movie WHERE movieID = 2009), NULL, 'available', 'new', 'Things Under Your Bed', '2000-10-04'),
('movie', NULL, (SELECT movieID FROM movie WHERE movieID = 2010), NULL, 'available', 'fair', 'Afraid', '1994-01-25');
*/


-- Insert discs into media
INSERT INTO media (type, bookID, movieID, discID, loanStatus, condition, title, releaseDate)
VALUES
('DVD_CD', NULL, NULL, (SELECT discID FROM DVD_CD WHERE discID = 3000), 'available', 'fair', 'Hear', '1995-01-20'),
('DVD_CD', NULL, NULL, (SELECT discID FROM DVD_CD WHERE discID = 3000), 'available', 'fair', 'Hear', '1995-01-20'),
('DVD_CD', NULL, NULL, (SELECT discID FROM DVD_CD WHERE discID = 3001), 'available', 'new', 'Up To the Sky', '2024-03-12');

/* Hard disc discID stuff and my ids were different because I deleted data previously
INSERT INTO media (type, bookID, movieID, discID, loanStatus, condition, title, releaseDate)
VALUES
('DVD_CD', NULL, NULL, (SELECT discID FROM DVD_CD WHERE discID = 3006), 'available', 'fair', 'Hear', '1995-01-20'),
('DVD_CD', NULL, NULL, (SELECT discID FROM DVD_CD WHERE discID = 3006), 'available', 'fair', 'Hear', '1995-01-20'),
('DVD_CD', NULL, NULL, (SELECT discID FROM DVD_CD WHERE discID = 3007), 'available', 'new', 'Up To the Sky', '2024-03-12');
*/



-- Insert data into mediaGenre using mediaID and genreID
INSERT INTO mediaGenre (mediaID, genreID)
VALUES
((SELECT mediaID FROM media WHERE mediaID = 4000), (SELECT genreID FROM genre WHERE genreID = 5000)),
((SELECT mediaID FROM media WHERE mediaID = 4001), (SELECT genreID FROM genre WHERE genreID = 5000)),
((SELECT mediaID FROM media WHERE mediaID = 4002), (SELECT genreID FROM genre WHERE genreID = 5000)),
((SELECT mediaID FROM media WHERE mediaID = 4000), (SELECT genreID FROM genre WHERE genreID = 5001)),
((SELECT mediaID FROM media WHERE mediaID = 4001), (SELECT genreID FROM genre WHERE genreID = 5001)),
((SELECT mediaID FROM media WHERE mediaID = 4002), (SELECT genreID FROM genre WHERE genreID = 5001)),
((SELECT mediaID FROM media WHERE mediaID = 4003), (SELECT genreID FROM genre WHERE genreID = 5001)),
((SELECT mediaID FROM media WHERE mediaID = 4004), (SELECT genreID FROM genre WHERE genreID = 5002)),
((SELECT mediaID FROM media WHERE mediaID = 4005), (SELECT genreID FROM genre WHERE genreID = 5002)),
((SELECT mediaID FROM media WHERE mediaID = 4006), (SELECT genreID FROM genre WHERE genreID = 5003)),
((SELECT mediaID FROM media WHERE mediaID = 4007), (SELECT genreID FROM genre WHERE genreID = 5003)),
((SELECT mediaID FROM media WHERE mediaID = 4008), (SELECT genreID FROM genre WHERE genreID = 5004)),
((SELECT mediaID FROM media WHERE mediaID = 4009), (SELECT genreID FROM genre WHERE genreID = 5004)),
((SELECT mediaID FROM media WHERE mediaID = 4010), (SELECT genreID FROM genre WHERE genreID = 5009)),
((SELECT mediaID FROM media WHERE mediaID = 4011), (SELECT genreID FROM genre WHERE genreID = 5009)),
((SELECT mediaID FROM media WHERE mediaID = 4012), (SELECT genreID FROM genre WHERE genreID = 5008));


/* Hard coded ids in test data and had to account for different ones
INSERT INTO mediaGenre (mediaID, genreID)
VALUES
((SELECT mediaID FROM media WHERE mediaID = 4013), (SELECT genreID FROM genre WHERE genreID = 5022)),
((SELECT mediaID FROM media WHERE mediaID = 4014), (SELECT genreID FROM genre WHERE genreID = 5022)),
((SELECT mediaID FROM media WHERE mediaID = 4015), (SELECT genreID FROM genre WHERE genreID = 5022)),
((SELECT mediaID FROM media WHERE mediaID = 4013), (SELECT genreID FROM genre WHERE genreID = 5023)),
((SELECT mediaID FROM media WHERE mediaID = 4014), (SELECT genreID FROM genre WHERE genreID = 5023)),
((SELECT mediaID FROM media WHERE mediaID = 4015), (SELECT genreID FROM genre WHERE genreID = 5023)),

((SELECT mediaID FROM media WHERE mediaID = 4016), (SELECT genreID FROM genre WHERE genreID = 5023)),
((SELECT mediaID FROM media WHERE mediaID = 4017), (SELECT genreID FROM genre WHERE genreID = 5024)),
((SELECT mediaID FROM media WHERE mediaID = 4018), (SELECT genreID FROM genre WHERE genreID = 5024)),

((SELECT mediaID FROM media WHERE mediaID = 4021), (SELECT genreID FROM genre WHERE genreID = 5025)),
((SELECT mediaID FROM media WHERE mediaID = 4022), (SELECT genreID FROM genre WHERE genreID = 5025)),
((SELECT mediaID FROM media WHERE mediaID = 4023), (SELECT genreID FROM genre WHERE genreID = 5026)),
((SELECT mediaID FROM media WHERE mediaID = 4024), (SELECT genreID FROM genre WHERE genreID = 5026)),

((SELECT mediaID FROM media WHERE mediaID = 4025), (SELECT genreID FROM genre WHERE genreID = 5031)),
((SELECT mediaID FROM media WHERE mediaID = 4026), (SELECT genreID FROM genre WHERE genreID = 5031)),
((SELECT mediaID FROM media WHERE mediaID = 4027), (SELECT genreID FROM genre WHERE genreID = 5030));
*/


-- Insert data into the member table
INSERT INTO member (fname, lname, membershipStart, status, email, dob)
VALUES
('Dandan', 'Li', '1999-10-10', 'active', 'dandanli@gmail.com', '1995-01-10'),
('Ethan', 'Que', '1995-01-11', 'inactive', 'ethanque@gmail.com', '1957-06-27'),
('Max', 'Katzman', '2010-01-20', 'active', 'maxkatzman@gmail.com', '2006-07-12'),
('Hart', 'Williams', '2023-11-03', 'active', 'hartwilliams@gmail.com', '2007-07-08'),
('Julie', 'Smith', '2024-01-24', 'active', 'juliesmith@gmail.com', '2015-05-15');


-- Insert data into the review table
INSERT INTO review (rating, description, memberID, date, mediaID)
VALUES
(5, 'This is such a great book.', (SELECT memberID FROM member where memberID = 6000), '2000-10-10', (SELECT mediaID FROM media WHERE mediaID = 4000)),
(1, 'Too boring.', (SELECT memberID FROM member where memberID = 6000), '2002-03-24', (SELECT mediaID FROM media WHERE mediaID = 4004)),
(3, 'I love it!', NULL, '2000-10-12', (SELECT mediaID FROM media WHERE mediaID = 4004));

/*
INSERT INTO review (rating, description, memberID, date, mediaID)
VALUES
(5, 'This is such a great book.', (SELECT memberID FROM member where memberID = 6000), '2000-10-10', (SELECT mediaID FROM media WHERE mediaID = 4013)),
(1, 'Too boring.', (SELECT memberID FROM member where memberID = 6000), '2002-03-24', (SELECT mediaID FROM media WHERE mediaID = 4017)),
(3, 'I love it!', NULL, '2000-10-12', (SELECT mediaID FROM media WHERE mediaID = 4017));
*/



-- Insert data into the loan table. When creating a new loan, returnDate should be null at the start, and overdue should be false.
-- A return date and overdue can be changed in a subsequent update statement.
INSERT INTO loan (loanDate, returnDate, mediaID, memberID, overdue)
VALUES
('2000-10-01', NULL, (SELECT mediaID FROM media WHERE mediaID = 4000), (SELECT memberID FROM member WHERE memberID = 6000), 'false');
UPDATE loan
SET returnDate = '2000-10-10'
where loanID = 8000;

INSERT INTO loan (loanDate, returnDate, mediaID, memberID, overdue)
VALUES
('2024-01-20' NULL, (SELECT mediaID FROM media WHERE mediaID = 4000), (SELECT memberID FROM member WHERE memberID = 6001), 'false');

INSERT INTO loan (loanDate, returnDate, mediaID, memberID, overdue)
VALUES
('2024-10-01', NULL, (SELECT mediaID FROM media WHERE mediaID = 4004), (SELECT memberID FROM member WHERE memberID = 6002), 'false');
UPDATE loan
SET returnDate = '2024-10-11'
where loanID = 8002;

INSERT INTO loan (loanDate, returnDate, mediaID, memberID, overdue)
VALUES
('2024-11-20', NULL, (SELECT mediaID FROM media WHERE mediaID = 4004), (SELECT memberID FROM member WHERE memberID = 6000), 'false');


/*
INSERT INTO loan (loanDate, returnDate, mediaID, memberID, overdue)
VALUES
('2000-10-01', NULL, (SELECT mediaID FROM media WHERE mediaID = 4013), (SELECT memberID FROM member WHERE memberID = 6000), 'false');
UPDATE loan
SET returnDate = '2000-10-10'
where loanID = 8000;

INSERT INTO loan (loanDate, returnDate, mediaID, memberID, overdue)
VALUES
('2024-01-20', NULL, (SELECT mediaID FROM media WHERE mediaID = 4013), (SELECT memberID FROM member WHERE memberID = 6001), 'false');

INSERT INTO loan (loanDate, returnDate, mediaID, memberID, overdue)
VALUES
('2024-10-01', NULL, (SELECT mediaID FROM media WHERE mediaID = 4017), (SELECT memberID FROM member WHERE memberID = 6002), 'false');
UPDATE loan
SET returnDate = '2024-10-11'
where loanID = 8002;

INSERT INTO loan (loanDate, returnDate, mediaID, memberID, overdue)
VALUES
('2024-11-20', NULL, (SELECT mediaID FROM media WHERE mediaID = 4017), (SELECT memberID FROM member WHERE memberID = 6000), 'false');
*/



create or alter procedure searchItem
	@title as varchar(230)
as
begin
	select title, condition, loanStatus
	from media
	where title = @title;
end


USE WorldsBestLibrary
GRANT EXECUTE ON OBJECT::searchItem
TO dbuser;


-- Insert data into the creator table
INSERT INTO creator (fname, lname, dob)
VALUES
('Scott', 'Fitzgerald', '1896-09-24'),
('Mike', 'Delfino', '1923-04-05'),
('Susan', 'Mayer', '1924-05-05'),
('Lynette', 'Scavo', '1956-04-05'),
('Andrew', 'Williams', '1994-02-03'),
('Paul', 'Young', '1997-02-03'),
('Penny', 'Solis', '1997-09-18'),
('Chunk', 'Vance', '1945-03-03');



-- Insert data into the mediaCreator table
INSERT INTO mediaCreator (mediaID, creatorID, description)
VALUES
((SELECT mediaID FROM media WHERE mediaID = 4000), (SELECT creatorID FROM creator WHERE creatorID = 9000), 'author'),
((SELECT mediaID FROM media WHERE mediaID = 4001), (SELECT creatorID FROM creator WHERE creatorID = 9000), 'author'),
((SELECT mediaID FROM media WHERE mediaID = 4002), (SELECT creatorID FROM creator WHERE creatorID = 9000), 'author'),
((SELECT mediaID FROM media WHERE mediaID = 4003), (SELECT creatorID FROM creator WHERE creatorID = 9001), 'author'),
((SELECT mediaID FROM media WHERE mediaID = 4003), (SELECT creatorID FROM creator WHERE creatorID = 9002), 'author'),
((SELECT mediaID FROM media WHERE mediaID = 4004), (SELECT creatorID FROM creator WHERE creatorID = 9000), 'author'),
((SELECT mediaID FROM media WHERE mediaID = 4005), (SELECT creatorID FROM creator WHERE creatorID = 9003), 'author'),
((SELECT mediaID FROM media WHERE mediaID = 4006), (SELECT creatorID FROM creator WHERE creatorID = 9004), 'actor'),
((SELECT mediaID FROM media WHERE mediaID = 4007), (SELECT creatorID FROM creator WHERE creatorID = 9005), 'actor'),
((SELECT mediaID FROM media WHERE mediaID = 4008), (SELECT creatorID FROM creator WHERE creatorID = 9006), 'actor'),
((SELECT mediaID FROM media WHERE mediaID = 4009), (SELECT creatorID FROM creator WHERE creatorID = 9007), 'actor'),
((SELECT mediaID FROM media WHERE mediaID = 4010), (SELECT creatorID FROM creator WHERE creatorID = 9007), 'singer'),
((SELECT mediaID FROM media WHERE mediaID = 4011), (SELECT creatorID FROM creator WHERE creatorID = 9007), 'singer'),
((SELECT mediaID FROM media WHERE mediaID = 4012), (SELECT creatorID FROM creator WHERE creatorID = 9007), 'singer');


/*
INSERT INTO mediaCreator (mediaID, creatorID, description)
VALUES
((SELECT mediaID FROM media WHERE mediaID = 4013), (SELECT creatorID FROM creator WHERE creatorID = 9000), 'author'),
((SELECT mediaID FROM media WHERE mediaID = 4014), (SELECT creatorID FROM creator WHERE creatorID = 9000), 'author'),
((SELECT mediaID FROM media WHERE mediaID = 4015), (SELECT creatorID FROM creator WHERE creatorID = 9000), 'author'),
((SELECT mediaID FROM media WHERE mediaID = 4016), (SELECT creatorID FROM creator WHERE creatorID = 9001), 'author'),
((SELECT mediaID FROM media WHERE mediaID = 4016), (SELECT creatorID FROM creator WHERE creatorID = 9002), 'author'),
((SELECT mediaID FROM media WHERE mediaID = 4017), (SELECT creatorID FROM creator WHERE creatorID = 9000), 'author'),
((SELECT mediaID FROM media WHERE mediaID = 4018), (SELECT creatorID FROM creator WHERE creatorID = 9003), 'author'),
((SELECT mediaID FROM media WHERE mediaID = 4021), (SELECT creatorID FROM creator WHERE creatorID = 9004), 'actor'),
((SELECT mediaID FROM media WHERE mediaID = 4022), (SELECT creatorID FROM creator WHERE creatorID = 9005), 'actor'),
((SELECT mediaID FROM media WHERE mediaID = 4023), (SELECT creatorID FROM creator WHERE creatorID = 9006), 'actor'),
((SELECT mediaID FROM media WHERE mediaID = 4024), (SELECT creatorID FROM creator WHERE creatorID = 9007), 'actor'),
((SELECT mediaID FROM media WHERE mediaID = 4025), (SELECT creatorID FROM creator WHERE creatorID = 9007), 'singer'),
((SELECT mediaID FROM media WHERE mediaID = 4026), (SELECT creatorID FROM creator WHERE creatorID = 9007), 'singer'),
((SELECT mediaID FROM media WHERE mediaID = 4027), (SELECT creatorID FROM creator WHERE creatorID = 9007), 'singer');
*/

create or alter procedure selectCreator (
    @fname varchar(60),
    @lname varchar(60)
)
AS
BEGIN
    SELECT 
        m.mediaID, 
        m.type,
        m.title, 
        m.condition, 
        m.loanStatus
    FROM 
        creator c
    JOIN 
        mediaCreator mc ON c.creatorID = mc.creatorID
    JOIN 
        media m ON mc.mediaID = m.mediaID
    WHERE 
		c.fname = @fname AND c.lname = @lname
    ORDER BY 
        m.title;
END;


USE WorldsBestLibrary
GRANT EXECUTE ON OBJECT::selectCreator
TO dbuser;





CREATE OR ALTER PROCEDURE selectGenre (
    @genreName VARCHAR(100)
)
AS
BEGIN
    SELECT 
        m.mediaID, 
        m.type,
        m.title, 
        m.condition, 
        m.loanStatus
    FROM 
        genre g
    JOIN 
        mediaGenre mg ON g.genreID = mg.genreID
    JOIN 
        media m ON mg.mediaID = m.mediaID
    WHERE 
        g.genreName = @genreName
    ORDER BY 
        m.title;
END;


USE WorldsBestLibrary
GRANT EXECUTE ON OBJECT::selectGenre
TO dbuser;



CREATE OR ALTER PROCEDURE borrowItem (
    @mediaID INT,
    @memberID INT
)
AS
BEGIN
    -- Check if the memberID exists in the member table
    IF NOT EXISTS (SELECT 1 FROM member WHERE memberID = @memberID)
    BEGIN
        PRINT 'Error: The specified memberID does not exist.';
        RETURN;
    END;

    -- Check if the mediaID exists in the media table
    IF NOT EXISTS (SELECT 1 FROM media WHERE mediaID = @mediaID)
    BEGIN
        PRINT 'Error: The specified mediaID does not exist.';
        RETURN;
    END;

	-- Check if the media item is available
    IF NOT EXISTS (SELECT 1 FROM media WHERE mediaID = @mediaID AND loanStatus = 'available')
    BEGIN
        PRINT 'Error: The specified media item is not available for borrowing.';
        RETURN;
    END;

    -- Insert the loan record if both inputs are valid, then output the inserted tuple
    DECLARE @output TABLE (
        loanDate date, 
        returnDate date,
        mediaID int,
        memberID int,
        overdue varchar(16)
    );

    INSERT INTO loan (loanDate, returnDate, mediaID, memberID, overdue)
    OUTPUT INSERTED.loanDate, INSERTED.returnDate, INSERTED.mediaID, INSERTED.memberID, INSERTED.overdue
    INTO @output
    VALUES (GETDATE(), NULL, @mediaID, @memberID, 'false');

    -- Output the newly added tuple
    SELECT * FROM @output;
END;


USE WorldsBestLibrary
GRANT EXECUTE ON OBJECT::borrowItem
TO dbuser;



CREATE PROCEDURE AddLibraryMember
	@fname VARCHAR(16),
	@lname VARCHAR(16),
	@email VARCHAR(500),
	@dob DATE
AS
BEGIN
	-- Declare the variables
	DECLARE @new_memberID INT;
 
	-- Start a transaction
	BEGIN TRY
    	BEGIN TRANSACTION;
 
    	-- Insert the new member information into the member table
    	INSERT INTO member (fname, lname, email, dob, membershipStart, status)
    	VALUES (@fname, @lname, @email, @dob, GETDATE(), 'active');
 
    	-- Get the newly inserted memberID
    	SET @new_memberID = SCOPE_IDENTITY();
 
    	-- Return all the details of the newly added member
    	SELECT memberID, fname, lname, email, dob, membershipStart, status
    	FROM member
    	WHERE memberID = @new_memberID;
 
    	-- Commit the transaction
    	COMMIT TRANSACTION;
 
	END TRY
	BEGIN CATCH
    	-- If an error occurs, roll back the transaction
    	ROLLBACK TRANSACTION;
 
    	-- Return the error message
    	SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END;



USE WorldsBestLibrary
GRANT EXECUTE ON OBJECT::AddLibraryMember
TO dbuser;



CREATE PROCEDURE ManageReview
	@reviewID INT,                -- The review ID to manage
	@actionType VARCHAR(10),   	-- The action to take ('delete' or 'update')
	@response VARCHAR(200) = NULL  -- The response from the librarian (used for update)
AS
BEGIN
	DECLARE @errorMessage VARCHAR(500);
 
	BEGIN TRY
    	-- Start the transaction
    	BEGIN TRANSACTION;
 
    	IF @actionType = 'delete'
    	BEGIN
        	-- Delete the review
        	DELETE FROM review
        	WHERE reviewID = @reviewID;
 
        	PRINT 'Review deleted successfully';
    	END
    	ELSE IF @actionType = 'update'
    	BEGIN
        	-- Update the review with the librarian's response
        	UPDATE review
        	SET description = description + ' Librarian Response: ' + @response,
            	date = GETDATE()  -- Update the date to current timestamp
        	WHERE reviewID = @reviewID;
 
        	PRINT 'Review updated successfully';
    	END
    	ELSE
    	BEGIN
        	-- If the actionType is not recognized, raise an error
        	SET @errorMessage = 'Invalid action type. Must be "delete" or "update".';
        	THROW 50000, @errorMessage, 1;
    	END
 
    	-- Commit the transaction if no error occurs
    	COMMIT TRANSACTION;
 
	END TRY
	BEGIN CATCH
    	-- If an error occurs, roll back the transaction
    	ROLLBACK TRANSACTION;
 
    	-- Capture and return the error message
    	SET @errorMessage = ERROR_MESSAGE();
    	PRINT 'Error: ' + @errorMessage;
	END CATCH
END;
 


 
USE WorldsBestLibrary
GRANT EXECUTE ON OBJECT::ManageReview
TO dbuser;


USE WorldsBestLibrary
GRANT SELECT, INSERT, DELETE, UPDATE ON dbo.review TO dbuser;