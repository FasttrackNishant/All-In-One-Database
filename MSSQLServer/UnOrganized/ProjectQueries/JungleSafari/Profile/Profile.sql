INSERT INTO [Jungle_Safari_API].[dbo].[Profiles]
(
   
    [UserId],
    [FirstName],
    [LastName],
    [DateOfBirth],
    [Gender],
    [Street],
    [City],
    [State],
    [CountryId],
    [ZipCode],
    [ProfilePictureUrl],
    [IsProfileComplete],
    [CreatedAt],
    [UpdatedAt]
)
VALUES
(
     -- ProfileId (assuming it's an identity column, you might want to omit this)
    1, -- UserId (adjust based on your user identification system)
    'Rahul', -- FirstName
    'Sharma', -- LastName
    '1992-05-20', -- DateOfBirth (in YYYY-MM-DD format)
    'Male', -- GenderId (assuming 1 represents Male)
    '42, Rajpath Marg', -- Street
    'New Delhi', -- City
    'Delhi', -- State
    1, -- CountryId (assuming 91 represents India)
    '110001', -- ZipCode
    'https://example.com/profile-pics/rahul-sharma.jpg', -- ProfilePictureUrl
    1, -- IsProfileComplete (1 for true, 0 for false)
    GETDATE(), -- CreatedAt (current date and time)
    GETDATE() -- UpdatedAt (current date and time)
);

drop table profiles;