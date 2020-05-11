REQUIREMENT NO1:Display a list of all property names and their property id’s for Owner Id: 1426

SELECT [dbo].[OwnerProperty].propertyid,[dbo].[OwnerProperty].ownerid,[dbo].[Property].name
FROM [dbo].[Property] inner join [dbo].[OwnerProperty] on [dbo].[Property].id=[dbo].[OwnerProperty].propertyid
WHERE [dbo].[OwnerProperty].ownerid='1426'

REQUIREMENT NO2: Display the current home value for each property in question a).

select [dbo].[OwnerProperty].propertyid,[dbo].[Property].name,[dbo].[PropertyHomeValue].value,[dbo].[PropertyHomeValueType].homevaluetype
from [dbo].[OwnerProperty] inner join [dbo].[Property] on [dbo].[OwnerProperty].propertyid=[dbo].[Property].id
inner join [dbo].[PropertyHomeValue] on property.id=[dbo].[PropertyHomeValue].propertyid
inner join [dbo].[PropertyHomeValueType] on [dbo].[PropertyHomeValue].homevaluetypeid=[dbo].[PropertyHomeValueType].id
where [dbo].[OwnerProperty].ownerid='1426'

REQUIREMENT NO3: For each property in question a), return the following:                                                                      
Using rental payment amount, rental payment frequency, tenant start date and tenant
end date to write a query that returns the sum of all payments from start date to end date. 
Display the yield. 


select [dbo].[Property].id,[dbo].[Property].name,[dbo].[PropertyRentalPayment].amount,[dbo].[TargetRentType].name
from [dbo].[OwnerProperty] inner join [dbo].[PropertyRentalPayment]
on [dbo].[OwnerProperty].propertyid=[dbo].[PropertyRentalPayment].propertyid
inner join [dbo].[Property] on [dbo].[OwnerProperty].propertyid=[dbo].[Property].id
inner join [dbo].[TargetRentType] on [dbo].[PropertyRentalPayment].frequencytype=[dbo].[TargetRentType].id
inner join [dbo].[TenantProperty] on [dbo].[Property].id=[dbo].[TenantProperty].propertyid
inner join [dbo].[PropertyFinance] on [dbo].[Property].id=[dbo].[PropertyFinance].propertyid
where [dbo].[OwnerProperty].ownerid='1426'

select  DATEDIFF(wk,'2020-01-01', '2020-01-31')
select  DATEDIFF(MONTH,'2018-01-01 13:28:00.000', '2018-12-31 13:28:00.000')

select 3/2
select cast(3/2 as int)

select [dbo].[Property].id,[dbo].[Property].name,PropertyRentalPayment.Amount,
case when [dbo].[TargetRentType].name='Weekly' then PropertyRentalPayment.Amount*Datediff
(wk,[dbo].[TenantProperty].startdate,[dbo].[TenantProperty].enddate)
when [dbo].[TargetRentType].name='Fortnightly' then PropertyRentalPayment.Amount*cast
(Datediff(wk,[dbo].[TenantProperty].startdate,[dbo].[TenantProperty].enddate)/2 as int)
when [dbo].[TargetRentType].name='Monthly' then PropertyRentalPayment.Amount*Datediff
(MONTH,[dbo].[TenantProperty].startdate,[dbo].[TenantProperty].enddate) end,
[dbo].[TargetRentType].name,[dbo].[TenantProperty].startdate,[dbo].[TenantProperty].enddate,[dbo].[PropertyFinance].yield
from [dbo].[OwnerProperty] inner join [dbo].[PropertyRentalPayment]
on [dbo].[OwnerProperty].propertyid=[dbo].[PropertyRentalPayment].propertyid
inner join [dbo].[Property] on [dbo].[OwnerProperty].propertyid=[dbo].[Property].id
inner join [dbo].[TargetRentType] on [dbo].[PropertyRentalPayment].frequencytype=[dbo].[TargetRentType].id
inner join [dbo].[TenantProperty] on [dbo].[Property].id=[dbo].[TenantProperty].propertyid
inner join [dbo].[PropertyFinance] on [dbo].[Property].id=[dbo].[PropertyFinance].propertyid
where [dbo].[OwnerProperty].ownerid='1426'

select * from PropertyRentalPayment where propertyid='5638'

REQUIREMENT NO4: Display all the jobs available

select [dbo].[JobMedia].jobid,[dbo].[Job].jobdescription
from [dbo].[Job] inner join [dbo].[JobMedia] on [dbo].[Job].id=[dbo].[JobMedia].jobid

REQUIREMENT NO5: Display all property names, current tenants first and last names and rental payments per 
week/ fortnight/month for the properties in question a). 

select [dbo].[Property].id,[dbo].[Property].name,[dbo].[OwnerProperty].ownerid,[dbo].[Person].firstname,
[dbo].[Person].lastname,[dbo].[PropertyRentalPayment].amount,[dbo].[TargetRentType].name
from [dbo].[Property] inner join [dbo].[OwnerProperty] on [dbo].[Property].id=[dbo].[OwnerProperty].propertyid
inner join [dbo].[PropertyRentalPayment] on [dbo].[Property].id=[dbo].[PropertyRentalPayment].propertyid 
inner join [dbo].[TargetRentType] on [dbo].[PropertyRentalPayment].frequencytype=[dbo].[TargetRentType].id
inner join [dbo].[TenantProperty] on [dbo].[TenantProperty].propertyid=[dbo].[Property].ID
Inner Join [dbo].[Tenant] on Tenant.ID=[dbo].[TenantProperty].TenantID 
inner join [dbo].[Person] on [Tenant].id=[dbo].[Person].id
where [dbo].[OwnerProperty].ownerid='1426'


SELECT Table_Name, Column_Name 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_CATALOG = 'KEYS'
AND DATA_TYPE LIKE '%current%'


USEFUL INFORMATION:

select * from [dbo].[PropertyRentalPayment] where propertyid not in(select id from property)

search for data on schema
SELECT Table_Name, Column_Name 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_CATALOG = 'KEYS'
AND COLUMN_VALUE LIKE '%current%'

datediff function:
case when [dbo].[TargetRentType].name='Weekly' then PropertyRentalPayment.Amount*Datediff
(wk,[dbo].[TenantProperty].startdate,[dbo].[TenantProperty].enddate)
when [dbo].[TargetRentType].name='Fortnightly' then PropertyRentalPayment.Amount*cast
(Datediff(wk,[dbo].[TenantProperty].startdate,[dbo].[TenantProperty].enddate)/2 as int)
when [dbo].[TargetRentType].name='Monthly' then PropertyRentalPayment.Amount*Datediff
(MONTH,[dbo].[TenantProperty].startdate,[dbo].[TenantProperty].enddate) end
