use entri_d42;
alter table persons add DOB date ;-- (1)
desc persons ;
select * from persons ;
select * from persons where id=2 ;
select * from persons ;
update persons set DOB='1999-02-23' where id=1;
update persons set DOB='1998-09-03' where id=2;
update persons set DOB='2001-06-20' where id=3;
update persons set DOB='1999-12-23' where id=4;
update persons set DOB= '1999-03-22' where id=5;
update persons set DOB='1997-11-06' where id=6;
update persons set DOB='2000-09-10' where id=7;
update persons set DOB='1999-05-12' where id=8;
update persons set DOB='1997-06-11' where id=9;
update persons set DOB='2000-01-04' where id=10;
update persons set DOB='1998-12-22' where id=11;
update persons set DOB='1999-03-22' where id=12;
select * from persons;
DELIMITER $$
CREATE FUNCTION CalculateAge(birthdate DATE) 
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE age INT;
  SET age = TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) - 
           IF(DATE_ADD(birthdate, INTERVAL TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) YEAR) > CURDATE(), 1, 0);
  RETURN age;
END $$
DELIMITER -- (2)
SELECT id, Fname, Lname, Population, Rating, Country_id, Country_name, DOB, CalculateAge(DOB) AS Age
FROM Persons; -- (3)
SELECT Country_name ,length(Country_name) as Length_Country_name from country; -- (4)
select Country_name ,substring(Country_name,1,3) as sub_country_name from country; -- (5)
select Country_name ,ucase(Country_name) as uppercase_name ,lcase(Country_name) as lowercase_name from country ; -- (6)



