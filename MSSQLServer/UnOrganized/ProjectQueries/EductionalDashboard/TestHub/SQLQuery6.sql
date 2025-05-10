

CREATE TABLE [Enquiries] (
  [EnquiryId] integer PRIMARY KEY,
  [UserId] integer,
  [Courseid] integer,
  [Subject] nvarchar(255),
  [Message] nvarchar(255),
  [EnquiryDate] date,
  [Status] nvarchar(255),
  [Response] nvarchar(255)
)

