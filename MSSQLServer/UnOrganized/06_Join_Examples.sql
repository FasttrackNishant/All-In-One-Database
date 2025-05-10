SELECT dbo.selfEmployee.Name AS Expr1, dbo.selfEmployee.Designation, dbo.selfEmployee.EmpId AS Expr2, selfEmployee_1.Designation AS Expr3, selfEmployee_1.SuperiorId
FROM   dbo.selfEmployee INNER JOIN
             dbo.selfEmployee AS selfEmployee_1 ON dbo.selfEmployee.EmpId = selfEmployee_1.EmpId

select * from selfEmployee;

select s1.EmpId ,s1.Name, s1.Designation , s2.Name from selfEmployee as s1 inner join selfEmployee as s2 on s1.SuperiorId = s2.EmpId ;