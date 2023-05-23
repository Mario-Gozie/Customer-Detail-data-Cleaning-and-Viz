select * from Dirty_5
--looking at the data below, I can see that the column name is not right. 
-- I will have to rename the column name, but before I do that,
-- I need to copy the column name so I won't loose that individuals details

-- Renaming column
Exec sp_rename 'Dirty_5.Name Hussein Hakeem Address Number 22 Fioye Crescent Surulere La', 
'Dirty_part';

select * from Dirty_5
--  the data column has been successfully renamed. 

-- I need to put back the detail I removed

insert into Dirty_5(Dirty_part)
values('Name Hussein Hakeem Address Number 22 Fioye Crescent Surulere Lagos Age 17 Gender Male')

select * from Dirty_5;

-- the cleaning process proper


 with partially_partially_cleaned_data as (select Dirty_part, SUBSTRING(Dirty_part, 6, 
charindex('Address', Dirty_part)-7) as Full_Names,

 SUBSTRING(Dirty_part, CHARINDEX('Address', Dirty_part)+8,
  LEN(Dirty_part)- CHARINDEX('Address', Dirty_part)) AS Address_and_More,
   
   left(substring(SUBSTRING(Dirty_part, CHARINDEX('Age', Dirty_part),
   LEN(Dirty_part) - charindex('Age', Dirty_part)),5,6),2)
 as Age , 

 SUBSTRING(Dirty_Part, CHARINDEX('Gender', Dirty_part)+6, 10) as Gender
 from Dirty_5),

Trimmed as (select Trim(Full_Names) as Full_Names, Trim(Left(Address_and_More, 
CHARINDEX('Age', Address_and_More)-1)) as Addresses,
 Trim(Age) as Age,Trim(Gender) as Gender from partially_partially_cleaned_data)

 select * into Dirty_Cleaned from Trimmed

 go

 --since every thing is now in a new table, I can run a Query for the new Table seperately

 select * from Dirty_Cleaned