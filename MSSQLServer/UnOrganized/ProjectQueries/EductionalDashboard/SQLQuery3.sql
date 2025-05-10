SELECT TOP (1000) [userId]
      ,[userName]
      ,[password]
      ,[role]
      ,[email]
      ,[mobile_no]
      ,[profileImage]
  FROM [Classroom_Edu_Hub].[dbo].[Users]


  CREATE TABLE Users (
    userId INT PRIMARY KEY IDENTITY(1,1),
    userName VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(15) NOT NULL CHECK (LEN(password) BETWEEN 8 AND 15),
    role VARCHAR(255) NOT NULL CHECK(role IN ('Student', 'Educator')),
    email VARCHAR(255) NOT NULL,
    mobile_no VARCHAR(10) NOT NULL,
    profileImage VARCHAR(255)
);

INSERT INTO Users (userName, password, role, email, mobile_no, profileImage)
VALUES
    ('johndoe', 'password123', 'Student', 'johndoe@example.com', '1234567890', 'profile1.jpg'),
    ('janesmith', 'abc12345', 'Educator', 'janesmith@example.com', '0987654321', 'profile2.jpg'),
    ('bobbrownlee', 'strongpass', 'Student', 'bobbrownlee@example.com', '5555555555', 'profile3.jpg'),
    ('sarahjones', 'mypassword', 'Educator', 'sarahjones@example.com', '1111111111', 'profile4.jpg'),
    ('mikewalker', 'pass123456', 'Student', 'mikewalker@example.com', '9876543210', 'profile5.jpg');