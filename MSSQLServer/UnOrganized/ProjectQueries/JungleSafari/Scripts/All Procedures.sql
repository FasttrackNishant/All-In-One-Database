-- Profile Procedure

use jungle_safari_api

create proc sp_get_profileHeader
@userId int
as
begin
	select  u.id, p.firstname , p.lastname,p.Gender, r.name from users u inner join profiles p on p.userid = u.id inner join roles r on u.roleid = r.id where userid =@userId
end


-- safaris

select * from safaris where parkId = 1;
-- 


-- get safari details

create proc sp_getSafariNameBySafariId
@safariId int
as
begin
select    s.safariid , s.safariname , p.parkname from safaris s join parks p on s.parkid = p.parkid where s.safariid =@safariId
end

-- safari gates

create proc sp_getGatesBySafariId
@safariId int
as
begin
select GateId, GateName,MaxVehiclesPerSlot ,Status from gates where parkid= ( select parkid from safaris where safariid =@safariId)
end

-- safari slots
create proc sp_getSlotsSafariId
@safariId int
as
begin
select SlotId , SlotName ,StartTime, EndTime, Status,capacity from safarislots where parkid= ( select parkid from safaris where safariid =@safariId) and capacity >0
end

-- get vehicles details

create proc sp_getVechilesBySafariId
@safariId int
as 
begin
SELECT 
    v.VehicleId, 
    v.TypeName, 
    v.SeatingCapacity, 
    v.IsActive, 
    e.Amount 
FROM 
    safaris s 
JOIN 
    parks p ON s.safariid = p.parkid 
JOIN 
    entryfees e ON p.parkid = e.ParkId 
JOIN 
    Vehicles v ON e.VehicleTypeId = v.VehicleId 
WHERE 
    s.safariid = @safariId;
end


exec sp_getGatesBySafariId 1



select GateId, GateName,MaxVehiclesPerSlot ,Status from gates where parkid=2 ( select parkid from safaris where safariid =8)


-- create new booking


select touristid from tourists where userid = 11

-- booking id

-- booking table

-- payment table


-- Insert Payment Procedure


CREATE PROCEDURE sp_InsertPayment
(
    @TransactionId VARCHAR(100),
    @Amount DECIMAL(18, 2),
    @PaymentMethod VARCHAR(50),
    @PaymentStatus VARCHAR(50),
    @BankName VARCHAR(100)
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        INSERT INTO PaymentDetails 
        (
            TransactionId, 
            Amount, 
            PaymentMethod, 
            PaymentStatus, 
            BankName
        )
        VALUES 
        (
            @TransactionId, 
            @Amount, 
            @PaymentMethod, 
            @PaymentStatus, 
            @BankName
        );

        SELECT SCOPE_IDENTITY() AS PaymentId;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO

exec sp_InsertPayment 


-- booking details


ALTER TABLE SafariBookings
DROP COLUMN SafariDate, CancellationReason;


CREATE PROCEDURE sp_InsertBooking
(
    @ParkId INT,
    @GateId INT,
    @SlotId INT,
    @VehicleTypeId INT,
    @BookingDate DATE,
    @IsOwnVehicle BIT,
    @TotalAmount DECIMAL(10,2),
    @CurrentStatusId INT,
    @PaymentId INT,
    @SafariId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF @ParkId <= 0 OR @GateId <= 0 OR @SlotId <= 0
        BEGIN
            RAISERROR('Invalid Park, Gate, or Slot ID', 16, 1);
            RETURN -1;
        END

        IF @VehicleTypeId <= 0
        BEGIN
            RAISERROR('Invalid Vehicle Type', 16, 1);
            RETURN -1;
        END

        IF @BookingDate IS NULL
        BEGIN
            RAISERROR('Booking Date is required', 16, 1);
            RETURN -1;
        END

        -- Begin Transaction
        BEGIN TRANSACTION;

        -- Insert Booking
        INSERT INTO SafariBookings 
        (
            ParkId, 
            GateId, 
            SlotId, 
            VehicleTypeId, 
            BookingDate, 
            IsOwnVehicle, 
            TotalAmount, 
            CurrentStatusId, 
            PaymentId, 
            CreatedAt, 
            UpdatedAt,
            SafariId
        )
        VALUES 
        (
            @ParkId,
            @GateId,
            @SlotId,
            @VehicleTypeId,
            @BookingDate,
            @IsOwnVehicle,
            @TotalAmount,
            @CurrentStatusId,
            @PaymentId,
            GETDATE(),
            GETDATE(),
            @SafariId
        );

        COMMIT TRANSACTION;
        RETURN SCOPE_IDENTITY();
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
        RETURN -1;
    END CATCH
END


EXEC sp_InsertBooking 
    @ParkId = 1, 
    @GateId = 1, 
    @SlotId = 1, 
    @VehicleTypeId = 1, 
    @BookingDate = '2023-06-15', 
    @IsOwnVehicle = 0, 
    @TotalAmount = 2500.00, 
    @CurrentStatusId = 2, 
    @PaymentId = 1, 
    @SafariId = 1




	-- bookin tourist



	CREATE PROCEDURE sp_InsertBookingTourist
(
    @BookingId INT,
    @TouristId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Validate input parameters
        IF @BookingId IS NULL OR @BookingId <= 0
        BEGIN
            RAISERROR('Invalid Booking ID', 16, 1);
            RETURN -1;
        END

        IF @TouristId IS NULL OR @TouristId <= 0
        BEGIN
            RAISERROR('Invalid Tourist ID', 16, 1);
            RETURN -1;
        END

        -- Check if Booking exists
        IF NOT EXISTS (SELECT 1 FROM SafariBookings WHERE BookingId = @BookingId)
        BEGIN
            RAISERROR('Booking does not exist', 16, 1);
            RETURN -1;
        END

        -- Check if Tourist exists
        IF NOT EXISTS (SELECT 1 FROM Tourists WHERE TouristId = @TouristId)
        BEGIN
            RAISERROR('Tourist does not exist', 16, 1);
            RETURN -1;
        END

        -- Check if Tourist is already added to this Booking
        IF EXISTS (SELECT 1 FROM BookingTourists 
                   WHERE BookingId = @BookingId AND TouristId = @TouristId)
        BEGIN
            RAISERROR('Tourist is already added to this Booking', 16, 1);
            RETURN -1;
        END

        -- Begin transaction
        BEGIN TRANSACTION;

        -- Insert BookingTourist
        INSERT INTO BookingTourists 
        (BookingId, TouristId, CreatedAt, UpdatedAt)
        VALUES 
        (@BookingId, @TouristId, GETDATE(), GETDATE());

        -- Commit transaction
        COMMIT TRANSACTION;

        -- Return the newly inserted BookingTouristId
        RETURN SCOPE_IDENTITY();
    END TRY
    BEGIN CATCH
        -- Rollback transaction if it exists
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Raise error with original error details
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        RETURN -1;
    END CATCH
END

delete from BookingTourists where BookingTouristId = 6

EXEC sp_InsertBookingTourist 
    @BookingId = 23, 
    @TouristId = 4;


	-- booking transacti at once


	CREATE PROCEDURE sp_ProcessBookingTransaction
(
    -- User Details
    @UserId INT,

    -- Payment Details
    @TransactionId VARCHAR(100),
    @Amount DECIMAL(18, 2),
    @PaymentMethod VARCHAR(50),
    @PaymentStatus VARCHAR(50),
    @BankName VARCHAR(100),

    -- Booking Details
    @ParkId INT,
    @GateId INT,
    @SlotId INT,
    @VehicleTypeId INT,
    @BookingDate DATE,
    @IsOwnVehicle BIT,
    @CurrentStatusId INT,
    @SafariId INT
)
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @PaymentId INT;
    DECLARE @BookingId INT;
    DECLARE @BookingTouristId INT;
    DECLARE @TouristId INT;
    DECLARE @ErrorMessage NVARCHAR(4000);

    BEGIN TRY
        -- Validate input parameters
        IF @UserId <= 0
        BEGIN
            RAISERROR('Invalid User ID', 16, 1);
            RETURN;
        END

        -- Validate User and Get/Create Tourist Record
        BEGIN TRANSACTION;

        -- Check if User exists
        IF NOT EXISTS (SELECT 1 FROM Users WHERE Id = @UserId)
        BEGIN
            RAISERROR('User does not exist', 16, 1);
            RETURN;
        END

        -- Get or Create Tourist Record
        SELECT @TouristId = TouristId 
        FROM Tourists 
        WHERE UserId = @UserId;

      
       
        COMMIT TRANSACTION;
  
        BEGIN TRANSACTION;

        -- Step 1: Insert Payment
        INSERT INTO PaymentDetails 
        (
            TransactionId, 
            Amount, 
            PaymentMethod, 
            PaymentStatus, 
            BankName
        )
        VALUES 
        (
            @TransactionId, 
            @Amount, 
            @PaymentMethod, 
            @PaymentStatus, 
            @BankName
        );

        SET @PaymentId = SCOPE_IDENTITY();

        -- Step 2: Insert Booking
        INSERT INTO SafariBookings 
        (
            ParkId, 
            GateId, 
            SlotId, 
            VehicleTypeId, 
            BookingDate, 
            IsOwnVehicle, 
            TotalAmount, 
            CurrentStatusId, 
            PaymentId, 
            CreatedAt, 
            UpdatedAt,
            SafariId
        )
        VALUES 
        (
            @ParkId,
            @GateId,
            @SlotId,
            @VehicleTypeId,
            @BookingDate,
            @IsOwnVehicle,
            @Amount,
            @CurrentStatusId,
            @PaymentId,
            GETDATE(),
            GETDATE(),
            @SafariId
        );

        SET @BookingId = SCOPE_IDENTITY();

        -- Step 3: Insert Booking Tourist
        INSERT INTO BookingTourists 
        (
            BookingId, 
            TouristId, 
            CreatedAt, 
            UpdatedAt
        )
        VALUES 
        (
            @BookingId, 
            @TouristId, 
            GETDATE(), 
            GETDATE()
        );

        SET @BookingTouristId = SCOPE_IDENTITY();

        -- Commit the transaction
        COMMIT TRANSACTION;

        -- Return the details of the transaction
        SELECT 
            @UserId AS UserId,
            @TouristId AS TouristId,
            @PaymentId AS PaymentId, 
            @BookingId AS BookingId, 
            @BookingTouristId AS BookingTouristId;

    END TRY
    BEGIN CATCH
        -- Rollback the transaction if any error occurs
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

       
        -- Raise the error
        DECLARE @ErrorMsg NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMsg, 16, 1);
    END CATCH
END


EXEC sp_ProcessBookingTransaction
    @UserId = 11,
    @TransactionId = 'TXN123456',
    @Amount = 5000.00,
    @PaymentMethod = 'Credit Card',
    @PaymentStatus = 'Successful',
    @BankName = 'State Bank of India',
    @ParkId = 1,
    @GateId = 2,
    @SlotId = 3,
    @VehicleTypeId = 1,
    @BookingDate = '2024-06-15',
    @IsOwnVehicle = 0,
    @CurrentStatusId = 1,
    @SafariId = 1;





	--- get the booking details for the user 

CREATE PROCEDURE sp_GetAllBookingsByUserId
(
    @UserId INT
)
AS
BEGIN
    SET NOCOUNT ON;

   
    IF @UserId IS NULL OR @UserId <= 0
    BEGIN
        RAISERROR('Invalid User ID', 16, 1);
        RETURN;
    END

    -- Retrieve booking data for the specified UserId
    SELECT 
        sb.BookingId,
        p.ParkName,
        s.SafariName,
        sb.BookingDate,
        g.GateName,
        vt.TypeName,
		slt.SlotName,
        bs.StatusName AS BookingStatus,
        pd.PaymentStatus,
        sb.TotalAmount
    FROM SafariBookings sb
    INNER JOIN PaymentDetails pd ON sb.PaymentId = pd.PaymentId
    INNER JOIN BookingStatusTypes bs ON sb.CurrentStatusId = bs.StatusId
    INNER JOIN BookingTourists bt ON sb.BookingId = bt.BookingId
    INNER JOIN Tourists t ON bt.TouristId = t.TouristId
    INNER JOIN Users u ON t.UserId = u.Id
    INNER JOIN Parks p ON sb.ParkId = p.ParkId
    INNER JOIN Safaris s ON sb.SafariId = s.SafariId
    INNER JOIN Gates g ON sb.GateId = g.GateId
    INNER JOIN Vehicles vt ON sb.VehicleTypeId = vt.VehicleId
	INNER JOIN SafariSlots slt on slt.SlotId = sb.SlotId
    WHERE u.Id = 11;
END


exec sp_GetAllBookingsByUserId 11

-- get all booking for the park


CREATE PROCEDURE sp_GetAllBookingsByParkId
(
    @ParkId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    -- Validate input parameter
    IF @ParkId IS NULL OR @ParkId <= 0
    BEGIN
        RAISERROR('Invalid Park ID', 16, 1);
        RETURN;
    END

    -- Retrieve booking data for the specified ParkId
    SELECT 
        sb.BookingId,
        p.ParkName,
        p.ParkId,
        s.SafariName,
        sb.BookingDate,
        sb.TotalAmount,
        pd.PaymentStatus,
        bs.StatusName AS BookingStatus,
        g.GateName,
        vt.TypeName AS VehicleType,
        pd.TransactionId,
        sb.IsOwnVehicle,
        sb.CreatedAt,
        prof.FirstName + ' ' + prof.LastName AS TouristName,
        u.PhoneNumber AS TouristContact,
        u.Email AS UserEmail
       
    FROM SafariBookings sb
    INNER JOIN PaymentDetails pd ON sb.PaymentId = pd.PaymentId
    INNER JOIN BookingStatusTypes bs ON sb.CurrentStatusId = bs.StatusId
    INNER JOIN BookingTourists bt ON sb.BookingId = bt.BookingId
    INNER JOIN Tourists t ON bt.TouristId = t.TouristId
    INNER JOIN Users u ON t.UserId = u.Id
    INNER JOIN Parks p ON sb.ParkId = p.ParkId
    INNER JOIN Safaris s ON sb.SafariId = s.SafariId
    INNER JOIN Gates g ON sb.GateId = g.GateId
    INNER JOIN Vehicles vt ON sb.VehicleTypeId = vt.VehicleId
	INNER JOIN Profiles prof on prof.UserId = u.id
    WHERE p.ParkId = @ParkId
    ORDER BY sb.CreatedAt DESC;
END

-- change booking status

exec sp_GetAllBookingsByParkId 1


CREATE PROCEDURE sp_UpdateBookingStatus
(
    @BookingId INT,
    @NewStatusId INT,
    @UserId INT  -- User ID instead of direct Employee ID
)
AS
BEGIN
    SET NOCOUNT ON;

    -- Declare variable to store Employee ID
    DECLARE @EmployeeId INT;

    -- Validate input parameters
    IF @BookingId IS NULL OR @BookingId <= 0
    BEGIN
        RAISERROR('Invalid Booking ID', 16, 1);
        RETURN;
    END

    IF @NewStatusId IS NULL OR @NewStatusId <= 0
    BEGIN
        RAISERROR('Invalid Status ID', 16, 1);
        RETURN;
    END

    IF @UserId IS NULL OR @UserId <= 0
    BEGIN
        RAISERROR('Invalid User ID', 16, 1);
        RETURN;
    END

    -- Retrieve Employee ID from Employee table using User ID
    SELECT @EmployeeId = EmployeeId
    FROM Employees
    WHERE UserId = @UserId;

    -- Check if Employee exists
    IF @EmployeeId IS NULL
    BEGIN
        RAISERROR('No Employee found for the given User ID', 16, 1);
        RETURN;
    END

    -- Begin transaction for atomic operation
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Update the booking status in the SafariBookings table
        UPDATE SafariBookings
        SET CurrentStatusId = @NewStatusId,
            UpdatedAt = GETDATE(),
            ChangedBy = @EmployeeId  -- Use retrieved Employee ID
        WHERE BookingId = @BookingId;

        -- Check if any rows were affected
        IF @@ROWCOUNT = 0
        BEGIN
            RAISERROR('No booking found with the specified Booking ID', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Commit the transaction
        COMMIT TRANSACTION;

        

        PRINT 'Booking status updated successfully.';
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if an error occurs
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Throw the error
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END

EXEC sp_UpdateBookingStatus 
    @BookingId = 24, 
    @NewStatusId = 1,  
    @UserId  = 9; 
	