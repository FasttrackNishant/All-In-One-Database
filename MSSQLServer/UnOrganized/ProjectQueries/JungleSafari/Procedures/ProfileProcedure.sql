CREATE PROCEDURE CheckAndUpdateProfileCompleteness
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if user exists
    IF NOT EXISTS (SELECT 1 FROM Profiles WHERE UserId = @UserId)
    BEGIN
        SELECT 
            NULL AS ProfileId, 
            @UserId AS UserId, 
            0 AS IsProfileComplete;
        RETURN;
    END

    -- Check profile completeness
    DECLARE @IsProfileComplete BIT = 0;

    SELECT @IsProfileComplete = 
        CASE 
            WHEN FirstName IS NOT NULL 
             AND LastName IS NOT NULL 
             AND DateOfBirth IS NOT NULL 
             AND Gender IS NOT NULL 
             AND Street IS NOT NULL 
             AND City IS NOT NULL 
             AND State IS NOT NULL 
             AND CountryId IS NOT NULL 
             AND ZipCode IS NOT NULL 
             -- Exclude ProfilePictureUrl from completeness check
            THEN 1 
            ELSE 0 
        END
    FROM Profiles
    WHERE UserId = @UserId;

    -- Update profile completeness
    UPDATE Profiles
    SET 
        IsProfileComplete = @IsProfileComplete,
        UpdatedAt = GETDATE()
    WHERE UserId = @UserId;

    -- Return result
    SELECT 
        ProfileId, 
        UserId, 
        IsProfileComplete
    FROM Profiles
    WHERE UserId = @UserId;
END

use Jungle_Safari_API


CREATE PROCEDURE sp_CheckAndUpdateProfileCompleteness
    @id INT
AS
BEGIN
    DECLARE @ProfileId INT
    DECLARE @IsComplete BIT  -- Explicitly declare as BIT

    -- Your existing logic
    SELECT 
        @ProfileId = ProfileId,
        @IsComplete = CASE 
            WHEN (  FirstName IS NOT NULL 
             AND LastName IS NOT NULL 
             AND DateOfBirth IS NOT NULL 
             AND Gender IS NOT NULL 
             AND Street IS NOT NULL 
             AND City IS NOT NULL 
             AND State IS NOT NULL 
             AND CountryId IS NOT NULL 
             AND ZipCode IS NOT NULL ) 
            THEN 1 
            ELSE 0 
        END
    FROM Profiles
    WHERE UserId = @id

    -- Return the results
    SELECT 
        @ProfileId AS ProfileId, 
        @id AS UserId, 
        CAST(@IsComplete AS BIT) AS IsProfileComplete  -- Explicitly CAST to BIT
END

drop proc CheckAndUpdateProfileCompleteness 9
exec CheckAndUpdateProfileCompleteness 92


CREATE PROCEDURE sp_CheckAndUpdateProfileCompleteness
    @id INT
AS
BEGIN
    DECLARE @ProfileId INT
    DECLARE @IsComplete TINYINT  -- Use TINYINT instead of BIT

    -- Your existing logic
    SELECT 
        @ProfileId = ProfileId,
        @IsComplete = CASE 
            WHEN (  FirstName IS NOT NULL 
             AND LastName IS NOT NULL 
             AND DateOfBirth IS NOT NULL 
             AND Gender IS NOT NULL 
             AND Street IS NOT NULL 
             AND City IS NOT NULL 
             AND State IS NOT NULL 
             AND CountryId IS NOT NULL 
             AND ZipCode IS NOT NULL ) 
            THEN 1 
            ELSE 0 
        END
    FROM Profiles
    WHERE UserId = @id

    -- Return the results
    SELECT 
        @ProfileId AS ProfileId, 
        @id AS UserId, 
        @IsComplete AS IsProfileComplete
END