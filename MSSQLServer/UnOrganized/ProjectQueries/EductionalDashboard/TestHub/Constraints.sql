-- constraints



-- Profile
SELECT 
    name AS ConstraintName,
    type_desc AS ConstraintType
FROM 
    sys.key_constraints
WHERE 
    parent_object_id = OBJECT_ID('Profiles')
UNION ALL
SELECT 
    name AS ConstraintName,
    type_desc AS ConstraintType
FROM 
    sys.check_constraints
WHERE 
    parent_object_id = OBJECT_ID('Profiles')
UNION ALL
SELECT 
    name AS ConstraintName,
    type_desc AS ConstraintType
FROM 
    sys.default_constraints
WHERE 
    parent_object_id = OBJECT_ID('Profiles');



	alter table profiles drop constraint email ;

