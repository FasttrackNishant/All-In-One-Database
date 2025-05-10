use Jungle_Safari_API


alter table safaribookings add  ChangeBy int ;

exec sp_Rename 'safaribookings.ChangeBy', 'ChangedBy','Column'


update safaribookings set ChangedBy =0

FK_Employees_Identity references Safaris(SafariId)


alter table safaribookings add constraint FK_SafarBookings_Safari  foreign key (safariId) references Safaris(SafariId);

create proc sp_get_profileHeader
@userId int
as
begin
	select  u.id, p.firstname , p.lastname, r.name from users u inner join profiles p on p.userid = u.id inner join roles r on u.roleid = r.id where userid =@userId
end



drop proc sp_get_profileHeader