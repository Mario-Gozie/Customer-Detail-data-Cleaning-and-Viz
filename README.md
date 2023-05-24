## INTRODUCTION

![Alt Text]('https://github.com/Mario-Gozie/SQL-Task/blob/main/Images/intro.png')


This is a Data cleaning Task using sql. 
The customer dataset was gotten online and was cleaned initially using power Query.

## POSSIBLE STAKEHOLDERS

![Alt]('https://github.com/Mario-Gozie/Chandoo-Sales-Data-Project/blob/main/Images/stakeholders.jpg')
* Shop Owners
* CEO's etc

## TOOLS USED
* SQL

## THE TASK

### Exploring the Data

`select * from Dirty_5`


![Alt Text](https://github.com/Mario-Gozie/Customer-Detail-data-Cleaning-and-Viz/blob/main/Images/Screenshot%20(293).png)

It is clear that the details are all in one column. it's also obvious that someone's detail is as the column name.
hence, I need to rename the column to Dirty part but before I do so, I must copy down the individual's details.

### Renaming Column

`Exec sp_rename 'Dirty_5.Name Hussein Hakeem Address Number 22 Fioye Crescent Surulere La', 

'Dirty_part';`

![Alt Text](https://github.com/Mario-Gozie/Customer-Detail-data-Cleaning-and-Viz/blob/main/Images/Screenshot%20(294).png)

### viewing the table again

`select * from Dirty_5`

![Alt Text](https://github.com/Mario-Gozie/Customer-Detail-data-Cleaning-and-Viz/blob/main/Images/Screenshot%20(295).png)

This shows I have successfully changed the column name to Dirty Part.

### Adding the previously removed column

`insert into Dirty_5(Dirty_part)
values('Name Hussein Hakeem Address Number 22 Fioye Crescent Surulere Lagos Age 17 Gender Male')`

![Alt Text](https://github.com/Mario-Gozie/Customer-Detail-data-Cleaning-and-Viz/blob/main/Images/Screenshot%20(296).png)




### Viewing the Table again to see the added Name
`select * from Dirty_5;`


![Alt Text](https://github.com/Mario-Gozie/Customer-Detail-data-Cleaning-and-Viz/blob/main/Images/Screenshot%20(297).png)

### Spliting into Fullname, Address, Age Gender and creation of a new table to contain the clean data (Dirty_cleaned)

 `with partially_partially_cleaned_data as (select Dirty_part, SUBSTRING(Dirty_part, 6, 
charindex('Address', Dirty_part)-7) as Full_Names,`

 `SUBSTRING(Dirty_part, CHARINDEX('Address', Dirty_part)+8,
  LEN(Dirty_part)- CHARINDEX('Address', Dirty_part)) AS Address_and_More,`
   
   `left(substring(SUBSTRING(Dirty_part, CHARINDEX('Age', Dirty_part),
   LEN(Dirty_part) - charindex('Age', Dirty_part)),5,6),2)
 as Age ,`

 `SUBSTRING(Dirty_Part, CHARINDEX('Gender', Dirty_part)+6, 10) as Gender
 from Dirty_5),`

`Trimmed as (select Trim(Full_Names) as Full_Names, Trim(Left(Address_and_More, 
CHARINDEX('Age', Address_and_More)-1)) as Addresses,
 Trim(Age) as Age,Trim(Gender) as Gender from partially_partially_cleaned_data)`

 `select * into Dirty_Cleaned from Trimmed`

![Alt Text](https://github.com/Mario-Gozie/Customer-Detail-data-Cleaning-and-Viz/blob/main/Images/Screenshot%20(298).png)

### Viewing the new clean Table

 `select * from Dirty_Cleaned`
 
 ![Alt Text](https://github.com/Mario-Gozie/Customer-Detail-data-Cleaning-and-Viz/blob/main/Images/Screenshot%20(342).png)



