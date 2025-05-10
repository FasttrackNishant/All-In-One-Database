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
select    s.safariid , s.safariname , p.parkname from safaris s join parks p on s.parkid = p.parkid where s.safariid =1

select * from safaris s right join gates g on s.parkid = g.parkid where s.safariid  =1

select GateId, GateName,MaxVehiclesPerSlot ,Status from gates where parkid= ( select parkid from safaris where safariid =1)

select * from safarislots where parkid= ( select parkid from safaris where safariid =1)

-- 