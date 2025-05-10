select getdate();

select month(getdate()) as month;

select month('20210102') as month;

select EOMONTH(GETDATE());

select EOMONTH('20210202');

select DATEADD(Day,1 , '2021-01-01') as 'Add 1 day',
	DATEADD(week,1,'March 1 , 2022') as 'Add 1 week',
	dateadd(month,1,'2021-01-01') as 'Add 1 Month',
	dateadd(year,1,'2021-01-01') as 'Add 1 Year';

--do same for year and check inbuild functions
--syntax ( date part, units, data or datetime)

