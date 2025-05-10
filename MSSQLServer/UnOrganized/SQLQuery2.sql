
SELECT DISTINCT JobTitle FROM HumanResources.Employee;

SELECT BusinessEntityID , JobTitle FROM HumanResources.Employee WHERE JobTitle = 'Engineering Manager';

select SubTotal , TaxAmt , SubTotal + TaxAmt as Result from Purchasing.PurchaseOrderHeader;

select SubTotal , TaxAmt , SubTotal / TaxAmt as Result from Purchasing.PurchaseOrderHeader where TaxAmt > 0;

select SubTotal , TaxAmt , SubTotal + TaxAmt as Result from Purchasing.PurchaseOrderHeader where SubTotal+TaxAmt > 500;


--Person Table

select * from Person.Person;

select   FirstName , MiddleName , LastName  from Person.Person;

-- cocatinate 

select FirstName , 