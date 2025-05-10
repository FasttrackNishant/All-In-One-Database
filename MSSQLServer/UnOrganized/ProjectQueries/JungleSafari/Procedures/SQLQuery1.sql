
INSERT INTO Profiles (
    ProfileId,
    UserId,
    FirstName,
    LastName,
    DateOfBirth,
    GenderId,
    Street,
    City,
    State,
    CountryId,
    ZipCode,
    ProfilePictureUrl,
    IsProfileComplete,
    CreatedAt,
    UpdatedAt
)
VALUES (
    1,                              -- ProfileId
    1,                              -- UserId
    'Rajesh',                       -- FirstName
    'Kumar',                        -- LastName
    '1990-05-15',                   -- DateOfBirth
    1,                              -- GenderId
    '123 Main St',                  -- Street
    'Delhi',                        -- City
    'Delhi',                        -- State
    1,                              -- CountryId
    '110001',                       -- ZipCode
    NULL,                           -- ProfilePictureUrl
    1,                              -- IsProfileComplete
    '2024-11-03 01:01:30.047',     -- CreatedAt
    '2024-11-03 01:01:30.047'      -- UpdatedAt
);
