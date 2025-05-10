-- users and profiles
use Test_EduHub

EXEC sp_InsertUserProfile 
    @username = 'rahuljain',
    @password = 'rahul123',
    @role = 'Student',
    @firstname = 'Rahul',
    @lastname = 'Jain',
    @email = 'rahuljain@example.com',
    @mobileNumber = '9876543210',
    @profileImage = 'rahuljain.jpg';

EXEC sp_InsertUserProfile 
    @username = 'priyasharma',
    @password = 'priya123',
    @role = 'Educator',
    @firstname = 'Priya',
    @lastname = 'Sharma',
    @email = 'priyasharma@example.com',
    @mobileNumber = '9123456789',
    @profileImage = 'priyasharma.jpg';

EXEC sp_InsertUserProfile 
    @username = 'kunalm',
    @password = 'kunal123',
    @role = 'Student',
    @firstname = 'Kunal',
    @lastname = 'Mehta',
    @email = 'kunalm@example.com',
    @mobileNumber = '9876543210';
    

EXEC sp_InsertUserProfile 
    @username = 'soniagupta',
    @password = 'sonia123',
    @role = 'Admin',
    @firstname = 'Sonia',
    @lastname = 'Gupta',
    @email = 'soniagupta@example.com',
    @mobileNumber = '9123456789',
    @profileImage = 'soniagupta.jpg';

EXEC sp_InsertUserProfile 
    @username = 'rohanp',
    @password = 'rohan123',
    @role = 'Student',
    @firstname = 'Rohan',
    @lastname = 'Patel',
	@email='rohan@gmail.com',
    @mobileNumber = '9876543210',
    @profileImage = 'rohanp.jpg';

EXEC sp_InsertUserProfile 
    @username = 'nehasingh',
    @password = 'neha123',
    @role = 'Educator',
    @firstname = 'Neha',
    @lastname = 'Singh',
    @email = 'nehasingh@example.com',
    @mobileNumber = '9123456789';
   

EXEC sp_InsertUserProfile 
    @username = 'amitkumar',
    @password = 'amit123',
    @role = 'Admin',
    @firstname = 'Amit',
    @lastname = 'Kumar',
    @email = 'amitkumar@example.com',
    @mobileNumber = '9876543210',
    @profileImage = 'amitkumar.jpg';

EXEC sp_InsertUserProfile 
    @username = 'swatijain',
    @password = 'swati123',
    @role = 'Student',
    @firstname = 'Swati',
    @lastname = 'Jain',
    @email = 'swatijain@example.com',
    @profileImage = 'swatijain.jpg';

EXEC sp_InsertUserProfile 
    @username = 'rajeshp',
    @password = 'rajesh123',
    @role = 'Educator',
    @firstname = 'Rajesh',
    @lastname = 'Patel',
    @email = 'rajeshp@example.com',
    @mobileNumber = '9123456789';

EXEC sp_InsertUserProfile 
    @username = 'ankitsharma',
    @password = 'ankit123',
    @role = 'Student',
    @firstname = 'Ankit',
    @lastname = 'Sharma',
    @email = 'ankitsharma@example.com',
    @mobileNumber = '9876543210',
    @profileImage = 'ankitsharma.jpg';



	-- courses data


	EXEC sp_InsertCourse 
    @username = 'priyasharma',
    @title = 'Introduction to Web Development',
    @description = 'Learn the basics of web development, including HTML, CSS, and JavaScript.',
    @courseStartDate = '2023-01-01',
    @courseEndDate = '2023-02-28',
    @level = 'beginner',
    @categoryname = 'Web Development';

EXEC sp_InsertCourse 
    @username = 'nehasingh',
    @title = 'Advanced Mobile App Development',
    @description = 'Learn advanced concepts of mobile app development, including React Native and Flutter.',
    @courseStartDate = '2023-03-01',
    @courseEndDate = '2023-04-30',
    @level = 'advanced',
    @categoryname = 'Mobile App Development';

EXEC sp_InsertCourse 
    @username = 'priyasharma',
    @title = 'Data Science Fundamentals',
    @description = 'Learn the basics of data science, including data preprocessing, visualization, and machine learning.',
    @courseStartDate = '2023-05-01',
    @courseEndDate = '2023-06-30',
    @level = 'beginner',
    @categoryname = 'Data Science';

EXEC sp_InsertCourse 
    @username = 'rajeshp',
    @title = 'Artificial Intelligence with Python',
    @description = 'Learn the basics of artificial intelligence, including machine learning and deep learning with Python.',
    @courseStartDate = '2023-07-01',
    @courseEndDate = '2023-08-31',
    @level = 'intermediate',
    @categoryname = 'Artificial Intelligence';

EXEC sp_InsertCourse 
    @username = 'nehasingh',
    @title = 'Cyber Security Essentials',
    @description = 'Learn the basics of cyber security, including threat analysis and risk management.',
    @courseStartDate = '2023-09-01',
    @courseEndDate = '2023-10-31',
    @level = 'beginner',
    @categoryname = 'Cyber Security';

EXEC sp_InsertCourse 
    @username = 'priyasharma',
    @title = 'Database Administration with MySQL',
    @description = 'Learn the basics of database administration, including database design and performance tuning with MySQL.',
    @courseStartDate = '2023-11-01',
    @courseEndDate = '2023-12-31',
    @level = 'intermediate',
    @categoryname = 'Database Administration';

EXEC sp_InsertCourse 
    @username = 'rajeshp',
    @title = 'Cloud Computing with AWS',
    @description = 'Learn the basics of cloud computing, including AWS services and architecture.',
    @courseStartDate = '2024-01-01',
    @courseEndDate = '2024-02-28',
    @level = 'advanced',
    @categoryname = 'Cloud Computing';

EXEC sp_InsertCourse 
    @username = 'nehasingh',
    @title = 'Networking Fundamentals',
    @description = 'Learn the basics of networking, including network protocols and architecture.',
    @courseStartDate = '2024-03-01',
    @courseEndDate = '2024-04-30',
    @level = 'beginner',
    @categoryname = 'Networking Fundamentals';

EXEC sp_InsertCourse 
    @username = 'priyasharma',
    @title = 'Game Development with Unity',
    @description = 'Learn the basics of game development, including game design and development with Unity.',
    @courseStartDate = '2024-05-01',
    @courseEndDate = '2024-06-30',
    @level = 'intermediate',
    @categoryname = 'Game Development';

EXEC sp_InsertCourse 
    @username = 'rajeshp',
    @title = 'Software Testing Fundamentals',
    @description = 'Learn the basics of software testing, including testing methodologies and tools.',
    @courseStartDate = '2024-07-01',
    @courseEndDate = '2024-08-31',
    @level = 'beginner',
    @categoryname = 'Software Testing';


-- insert enrollments



EXEC sp_CreateEnrollment 
    @role = 'Student',
    @enrollmentdate = '2023-01-15 10:00:00',
    @userid = 4 ,
    @courseid =3;


EXEC sp_CreateEnrollment 
    @role = 'Student',
    @enrollmentdate = '2023-01-15 10:00:00',
    @userid = 2,
    @courseid = 1;

EXEC sp_CreateEnrollment 
    @role = 'Student',
    @enrollmentdate = '2023-03-10 14:30:00',
    @userid = 3,
    @courseid = 2;

EXEC sp_CreateEnrollment 
    @role = 'Student',
    @enrollmentdate = '2023-05-20 09:00:00',
    @userid = 6,
    @courseid = 3;

EXEC sp_CreateEnrollment 
    @role = 'Student',
    @enrollmentdate = '2023-07-25 11:15:00',
    @userid = 8,
    @courseid = 4;

EXEC sp_CreateEnrollment 
    @role = 'Student',
    @enrollmentdate = '2023-09-15 13:45:00',
    @userid = 10,
    @courseid = 6;




	-- insert material


	-- Course 1: Introduction to Web Development
EXEC sp_InsertMaterial 
    @Courseid = 1,
    @Title = 'HTML Basics',
    @Description = 'Learn the basics of HTML',
    @URL = 'https://example.com/html-basics',
    @UploadDate = '2023-01-05',
    @ContentType = 'pdf';

EXEC sp_InsertMaterial 
    @Courseid = 1,
    @Title = 'CSS Fundamentals',
    @Description = 'Learn the basics of CSS',
    @URL = 'https://example.com/css-fundamentals',
    @UploadDate = '2023-01-10',
    @ContentType = 'pdf';

EXEC sp_InsertMaterial 
    @Courseid = 1,
    @Title = 'JavaScript Introduction',
    @Description = 'Learn the basics of JavaScript',
    @URL = 'https://example.com/javascript-introduction',
    @UploadDate = '2023-01-15',
    @ContentType = 'pdf';

-- Course 2: Advanced Mobile App Development
EXEC sp_InsertMaterial 
    @Courseid = 2,
    @Title = 'React Native Tutorial',
    @Description = 'Learn React Native',
    @URL = 'https://example.com/react-native-tutorial',
    @UploadDate = '2023-03-05',
    @ContentType = 'video';

EXEC sp_InsertMaterial 
    @Courseid = 2,
    @Title = 'Flutter Tutorial',
    @Description = 'Learn Flutter',
    @URL = 'https://example.com/flutter-tutorial',
    @UploadDate = '2023-03-10',
    @ContentType = 'video';

-- Course 3: Data Science Fundamentals
EXEC sp_InsertMaterial 
    @Courseid = 3,
    @Title = 'Data Preprocessing',
    @Description = 'Learn data preprocessing',
    @URL = 'https://example.com/data-preprocessing',
    @UploadDate = '2023-05-05',
    @ContentType = 'pdf';

EXEC sp_InsertMaterial 
    @Courseid = 3,
    @Title = 'Data Visualization',
    @Description = 'Learn data visualization',
    @URL = 'https://example.com/data-visualization',
    @UploadDate = '2023-05-10',
    @ContentType = 'pdf';

-- Course 4: Artificial Intelligence with Python
EXEC sp_InsertMaterial 
    @Courseid = 4,
    @Title = 'Machine Learning with Python',
    @Description = 'Learn machine learning with Python',
    @URL = 'https://example.com/machine-learning-python',
    @UploadDate = '2023-07-05',
    @ContentType = 'pdf';

EXEC sp_InsertMaterial 
    @Courseid = 4,
    @Title = 'Deep Learning with Python',
    @Description = 'Learn deep learning with Python',
    @URL = 'https://example.com/deep-learning-python',
    @UploadDate = '2023-07-10',
    @ContentType = 'pdf';

-- Course 5: Cyber Security Essentials
EXEC sp_InsertMaterial 
    @Courseid = 5,
    @Title = 'Threat Analysis',
    @Description = 'Learn threat analysis',
    @URL = 'https://example.com/threat-analysis',
    @UploadDate = '2023-09-05',
    @ContentType = 'pdf';

EXEC sp_InsertMaterial 
    @Courseid = 5,
    @Title = 'Risk Management',
    @Description = 'Learn risk management',
    @URL = 'https://example.com/risk-management',
    @UploadDate = '2023-09-10',
    @ContentType = 'pdf';

-- Course 6: Database Administration with MySQL
EXEC sp_InsertMaterial 
    @Courseid = 6,
    @Title = 'Database Design',
    @Description = 'Learn database design',
    @URL = 'https://example.com/database-design',
    @UploadDate = '2023-11-05',
    @ContentType = 'pdf';

EXEC sp_InsertMaterial 
    @Courseid = 6,
    @Title = 'Performance Tuning',
    @Description = 'Learn performance tuning',
    @URL = 'https://example.com/performance-tuning',
    @UploadDate = '2023-11-10',
    @ContentType = 'pdf';

-- Course 7: Cloud Computing with AWS
EXEC sp_InsertMaterial 
    @Courseid = 7,
    @Title = 'AWS Services',
    @Description = 'Learn AWS services',
    @URL = 'https://example.com/aws-services',
    @UploadDate = '2024-01-05',
    @ContentType = 'pdf';



	
select * from materials;