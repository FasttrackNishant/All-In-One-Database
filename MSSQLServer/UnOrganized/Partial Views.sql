create database partial_db

use partial_db

CREATE TABLE [dbo].[Courses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseDescription] [nvarchar](max) NULL,
CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



CREATE TABLE [dbo].[students](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](max) NULL,
	[StudentDOB] [nvarchar](max) NULL,
	[StudentPhoneNum] [nvarchar](max) NULL,
	[studentAddress] [nvarchar](max) NULL,
	[CourseID] [int] NULL,
CONSTRAINT [PK_students] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
 
ALTER TABLE [dbo].[students]  WITH CHECK ADD  CONSTRAINT [FK_students_Courses_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([ID])
GO
 
ALTER TABLE [dbo].[students] CHECK CONSTRAINT [FK_students_Courses_CourseID]
GO

set identity_insert Courses  off


insert into Courses (CourseDescription) values('dotnet core'), ('core java') , ('python')

insert into students (StudentName, StudentDOB, StudentPhoneNum, studentAddress, CourseID) 
values 
('Rohan Kumar', '1990-01-01', '9876543210', '123 MG Road, Mumbai', 1),
('Priya Sharma', '1992-02-02', '8765432109', '456 Sector 17, Chandigarh', 2),
('Karan Patel', '1995-03-03', '7654321098', '789 Indira Nagar, Bangalore', 3),
('Aisha Jain', '1998-04-04', '6543210987', '321 Rajpur Road, Dehradun', 1),
('Siddharth Gupta', '2000-05-05', '5432109876', '901 Sector 29, Noida', 2)

select * from students;
select * from Courses;



CREATE TABLE Departments (
    ID int IDENTITY(1,1) NOT NULL,
    DeptName nvarchar(max) NULL,
    CONSTRAINT PK_Departments PRIMARY KEY CLUSTERED (ID ASC)
) ON [PRIMARY]

CREATE TABLE Employees (
    ID int IDENTITY(1,1) NOT NULL,
    Name nvarchar(max) NULL,
    Salary decimal(10, 2) NULL,
    DeptID int NULL,
    CONSTRAINT PK_Employees PRIMARY KEY CLUSTERED (ID ASC),
    CONSTRAINT FK_Employees_Departments_DeptID FOREIGN KEY (DeptID) REFERENCES Departments (ID)
) ON [PRIMARY]
GO


-- Insert 5 departments
INSERT INTO Departments (DeptName) VALUES
('Sales'),
('Marketing'),
('IT'),
('HR'),
('Finance')

-- Insert 5 employees
INSERT INTO Employees (Name, Salary, DeptID) VALUES
('John Doe', 50000.00, 1),
('Jane Smith', 60000.00, 2),
('Bob Johnson', 70000.00, 3),
('Alice Brown', 40000.00, 4),
('Mike Davis', 55000.00, 1)