use classroom;


-- SubQueries

-- single row  , multiple row , multiple column 

select * from products;

select * from products where price > (select avg(price) from products);



