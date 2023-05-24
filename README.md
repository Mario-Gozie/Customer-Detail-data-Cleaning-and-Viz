## INTRODUCTION

![Alt Text]('')
This is a Data cleaning Task using sql. 
The customer dataset was gotten online and was cleaned initially using power Query.

## POSSIBLE STAKEHOLDERS

![Alt]('')
* Shop Owners
* CEO's etc

## TOOLS USED
* SQL

## THE TASK

### Exploring the Data

`select * from Dirty_5`


![Alt Text]('https://github.com/Mario-Gozie/Customer-Detail-data-Cleaning-and-Viz/blob/main/Images/Screenshot%20(293).png')

It is clear that the details are all in one column. it's also obvious that someone's detail is as the column name.
hence, I need to rename the column to Dirty part but before I do so, I must copy down the individual's details.

### Renaming Column

`Exec sp_rename 'Dirty_5.Name Hussein Hakeem Address Number 22 Fioye Crescent Surulere La', 

'Dirty_part';`

![Alt Text]('https://github.com/Mario-Gozie/Customer-Detail-data-Cleaning-and-Viz/blob/main/Images/Screenshot%20(294).png')

### viewing the table again

`select * from Dirty_5`

![Alt Text]('https://github.com/Mario-Gozie/Customer-Detail-data-Cleaning-and-Viz/blob/main/Images/Screenshot%20(295).png')

This shows I have successfully changed the column name to Dirty Part.

### Adding the previously removed column

`insert into Dirty_5(Dirty_part)

values('Name Hussein Hakeem Address Number 22 Fioye Crescent Surulere Lagos Age 17 Gender Male')`

![Alt Text]('https://github.com/Mario-Gozie/Customer-Detail-data-Cleaning-and-Viz/blob/main/Images/Screenshot%20(296).png')




### Viewing the Table again to see the added Name
`select * from Dirty_5;`


![Alt Text]('https://github.com/Mario-Gozie/Customer-Detail-data-Cleaning-and-Viz/blob/main/Images/Screenshot%20(297).png')
