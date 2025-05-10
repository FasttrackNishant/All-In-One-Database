
drop table feedbacks

drop table enquiries

CREATE TABLE [Feedbacks] (
  [Feedbackid] integer PRIMARY KEY identity(1,1),
  [UserId] int,
  [CourseId] int,
  [Feedback] nvarchar(255),
  [Date] datetime
)

ALTER TABLE [Enquiries]
ADD [IsActive] bit NOT NULL DEFAULT 1;

CREATE TABLE [Enquiries] (
  [EnquiryId] integer PRIMARY KEY identity(1,1), 
  [UserId] integer,
  [Courseid] integer,
  [Subject] nvarchar(255),
  [Message] nvarchar(255),
  [EnquiryDate] date,
  [Status] nvarchar(255),
  [Response] nvarchar(255)
)




ALTER TABLE [Enquiries] ADD FOREIGN KEY ([Courseid]) REFERENCES [Courses] ([id])


ALTER TABLE [Enquiries] ADD FOREIGN KEY ([UserId]) REFERENCES [Users] (id)


ALTER TABLE [Feedbacks] ADD FOREIGN KEY ([UserId]) REFERENCES [Enrollments] ([id])

ALTER TABLE [Feedbacks] ADD FOREIGN KEY ([CourseId]) REFERENCES [Courses]([id])



INSERT INTO Feedbacks ( UserId, CourseId, Feedback, Date)
VALUES
  ( 2, 1, 'Great course, learned a lot about web development', '2023-02-15 12:00:00'),
  ( 3, 2, 'Excellent course, the instructor was very knowledgeable', '2023-04-20 14:00:00'),
  ( 4, 3, 'Good course, but the assignments were a bit too easy', '2023-06-10 10:00:00'),
  ( 5, 4, 'Average course, could be improved with more examples', '2023-08-05 16:00:00'),
  ( 6, 5, 'Good course, the instructor was very responsive', '2023-10-15 18:00:00'),
  ( 7, 6, 'Excellent course, I would recommend it to others', '2023-12-10 12:00:00');

  INSERT INTO Enquiries ( UserId, Courseid, Subject, Message, EnquiryDate, Status, Response)
VALUES
  ( 2, 1, 'Course Enquiry', 'I am interested in this course', '2023-01-01', 'Open', NULL),
  ( 3, 2, 'Course Details', 'Can you provide more details about this course?', '2023-01-05', 'Open', NULL),
  ( 4, 3, 'Course Fee', 'What is the fee for this course?', '2023-01-10', 'Open', NULL),
  ( 5, 4, 'Course Schedule', 'What is the schedule for this course?', '2023-01-15', 'Open', NULL),
  ( 6, 5, 'Course Material', 'What material is required for this course?', '2023-01-20', 'Open', NULL),
  ( 7, 6, 'Course Duration', 'How long does this course take to complete?', '2023-01-25', 'Open', NULL),
  ( 8, 7, 'Course Certification', 'Is this course certified?', '2023-02-01', 'Open', NULL);

  drop proc sp_get_enquiriesbyUserId

  create proc sp_get_enquiriesbyUserId
  @userid int 
  as
  begin
  select e.EnquiryId ,c.Title, e.subject,e.message,e.Response ,e.enquiryDate,e.status, p.firstname , p.lastname ,cat.CategoryName
			from Enquiries as e inner join Profiles as p on e.userId = p.id inner join Courses as c on c.id = e.CourseID
			inner join Categories as cat on cat.id = c.categoryId
		where c.userid = @userid and Response is null;
end

exec sp_get_enquiriesbyUserId 3


  create proc sp_get_detailed_enquiry
  @enquiryId int 
  as
  begin
  select e.EnquiryId ,c.Title, e.subject,e.message, e.Response, e.enquiryDate,e.status, p.firstname , p.lastname ,cat.CategoryName
			from Enquiries as e inner join Profiles as p on e.userId = p.id inner join Courses as c on c.id = e.CourseID
			inner join Categories as cat on cat.id = c.categoryId
		where e.EnquiryId = @enquiryId;
end



drop proc sp_get_past_enquiries

 create proc sp_get_past_enquiries
  @userid int 
  as
  begin
  select e.EnquiryId ,c.Title, e.subject,e.message,e.Response ,e.enquiryDate,e.status, p.firstname , p.lastname ,cat.CategoryName
			from Enquiries as e inner join Profiles as p on e.userId = p.id inner join Courses as c on c.id = e.CourseID
			inner join Categories as cat on cat.id = c.categoryId
		where c.userid = @userid and e.status='Closed' ;
end


 create proc sp_get_enquiriesbyStudent
  @userid int 
  as
  begin
  select e.EnquiryId ,c.Title, e.subject,e.message,e.Response ,e.enquiryDate,e.status, p.firstname , p.lastname ,cat.CategoryName
			from Enquiries as e inner join Profiles as p on e.userId = p.id inner join Courses as c on c.id = e.CourseID
			inner join Categories as cat on cat.id = c.categoryId
		where e.userid = @userid and e.Status = 'Open';
end


 create proc sp_get_Past_enquiriesbyStudent
  @userid int 
  as
  begin
  select e.EnquiryId ,c.Title, e.subject,e.message,e.Response ,e.enquiryDate,e.status, p.firstname , p.lastname ,cat.CategoryName
			from Enquiries as e inner join Profiles as p on e.userId = p.id inner join Courses as c on c.id = e.CourseID
			inner join Categories as cat on cat.id = c.categoryId
		where e.userid = @userid and e.Status = 'Closed';
end

use Test_EduHub

update Feedbacks set CourseId =2 where Feedbackid = 25


--- give list of feedbacks 
drop proc sp_get_feedbackByUserId

drop proc sp_get_feedbackByCourseId


create proc sp_get_feedbackByCourseId_1
@courseId int
as
begin
select f.Feedbackid , f.UserId , f.CourseId , f.Feedback , f.Date , p.firstname , p.lastname , c.Title 
from feedbacks as f inner join courses as c on f.courseid = c.id join profiles as p on f.userid = p.userid where f.CourseId = 1 and f.IsActive = 1;
end



exec sp_get_feedbackByUserId 3

--- get feedback detials

create proc sp_get_feedback_by_feedbackId
@feedbackId int
as
begin
select f.Feedbackid , f.UserId , f.CourseId , f.Feedback , f.Date , p.firstname , p.lastname , c.Title 
from feedbacks as f inner join courses as c on f.courseid = c.id join profiles as p on f.userid = p.userid where f.Feedbackid = @feedbackId;
end

exec sp_get_feedback_by_feedbackId 25

drop proc sp_get_feedbackByUserIdWithCount

CREATE PROC sp_get_feedbackByUserIdWithCount
@userid int
AS
BEGIN
    DECLARE @FeedbackCount int;

    SELECT @FeedbackCount = COUNT(f.FeedbackId)
    FROM Feedbacks AS f
    INNER JOIN Courses AS c ON f.CourseId = c.Id
    WHERE c.UserId = @userid;

    SELECT f.Feedbackid, c.Title, cat.CategoryName, @FeedbackCount as FeedbackCount
    FROM feedbacks AS f
    INNER JOIN courses AS c ON f.courseid = c.id
    INNER JOIN Categories as cat on c.CategoryId = cat.Id
    INNER JOIN profiles AS p ON f.userid = p.userid
    WHERE c.userid = @userid;
END


SELECT COUNT(f.FeedbackId)
    FROM Feedbacks AS f inner join courses c on c.id = f.CourseId
    WHERE c.UserId = 3;


SELECT f.Feedbackid, c.Title, cat.CategoryName
    FROM feedbacks AS f
    INNER JOIN courses AS c ON f.courseid = c.id
    INNER JOIN Categories as cat on c.CategoryId = cat.Id
    INNER JOIN profiles AS p ON f.userid = p.userid
    WHERE c.userid = 3;



exec sp_get_feedbackByUserIdWithCount 3



CREATE PROC sp_get_feedbackByUserId
    @userid int
AS
BEGIN
    SELECT 
        f.Feedbackid AS FeedbackId, 
        f.UserId, 
        f.CourseId, 
        f.Feedback, 
        f.Date, 
        p.firstname AS FirstName, 
        p.lastname AS LastName, 
        c.Title
    FROM 
        feedbacks AS f 
    INNER JOIN 
        courses AS c ON f.courseid = c.id 
    INNER JOIN 
        profiles AS p ON f.userid = p.userid 
    WHERE 
        f.UserId = 3; 
END

sp_get_feedbackByUserId 3


SELECT 
    c.Title AS Title, 
    cat.Categoryname,
    COUNT(DISTINCT f.FeedbackId) AS FeedbackCount
FROM 
    Feedbacks AS f 
INNER JOIN 
    Courses AS c ON c.Id = f.CourseId 
INNER JOIN
    categories as cat ON cat.id = c.Id
WHERE 
    c.UserId = 3
GROUP BY 
    c.Title, cat.Categoryname;





select CourseId , Count(*) from Feedbacks where courseid in 
			(select id from courses where userid = 3)
			group by CourseId having count(Feedbackid) >0



select f.Feedbackid , f.UserId , f.CourseId , f.Feedback , f.Date , p.firstname , p.lastname , c.Title 
from feedbacks as f inner join courses as c on f.courseid = c.id join profiles as p on f.userid = p.userid where c.userid = 3 and f.IsActive = 1;


select  distinct c.title ,e.feedback, e.date,p.firstname,e.CourseID
			from Feedbacks as e inner join Profiles as p on e.userId = p.Id inner join Courses as c on c.id = e.CourseID
		where c.userid = 3;




		create proc sp_get_feedbackByUserId
@userid int
as
begin


select f.Feedbackid , f.UserId , f.CourseId , f.Feedback , f.Date , p.firstname , p.lastname , c.Title 
from feedbacks as f inner join courses as c on f.courseid = c.id join profiles as p on f.userid = p.userid where f.CourseId = 3 and f.IsActive = 1;


end


update Feedbacks set isactive = 1 where Feedbackid = 24




---

drop proc sp_get_feedbackByUserIdWithCount_1

CREATE PROC sp_get_feedbackByUserIdWithCount_1
@userid int
AS
BEGIN
	SELECT 
	    c.id as CourseId,
		c.Title AS Title, 
		cat.Categoryname,
		COUNT(DISTINCT f.FeedbackId) AS FeedbackCount
	FROM 
		Feedbacks AS f 
	INNER JOIN 
		Courses AS c ON c.Id = f.CourseId 
	INNER JOIN
		categories as cat ON cat.id = c.Id
	WHERE 
		c.UserId = @userid and f.isactive = 1
	GROUP BY 
		c.Title, cat.Categoryname, c.id;
end


exec  sp_get_feedbackByUserIdWithCount_1 3



select f.Feedbackid , f.UserId , f.CourseId , f.Feedback , f.Date , p.firstname , p.lastname , c.Title 
from feedbacks as f inner join courses as c on f.courseid = c.id join profiles as p on f.userid = p.userid where f.CourseId = 1 and f.IsActive = 1;