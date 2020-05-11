REQUIREMENT NO1:Display a list of all property names and their property id’s for Owner Id: 1426

SELECT [dbo].[OwnerProperty].PROPERTYID,[dbo].[OwnerProperty].OWNERID,[dbo].[Property].name as PROPERTYNAME
FROM [dbo].[Property] inner join [dbo].[OwnerProperty] on [dbo].[Property].id=[dbo].[OwnerProperty].propertyid
WHERE [dbo].[OwnerProperty].ownerid='1426'

REQUIREMENT NO2: Display the current home value for each property in question a).

SELECT [dbo].[OwnerProperty].PROPERTYID,[dbo].[Property].name PROPERTYNAME,[dbo].[PropertyHomeValue].value as HOMEVALUE,
[dbo].[PropertyHomeValueType].HOMEVALUETYPE
FROM [dbo].[OwnerProperty] inner join [dbo].[Property] on [dbo].[OwnerProperty].propertyid=[dbo].[Property].id
inner join [dbo].[PropertyHomeValue] on property.id=[dbo].[PropertyHomeValue].propertyid
inner join [dbo].[PropertyHomeValueType] on [dbo].[PropertyHomeValue].homevaluetypeid=[dbo].[PropertyHomeValueType].id
WHERE [dbo].[OwnerProperty].ownerid='1426'

REQUIREMENT NO3: For each property in question a), return the following:                                                                      
Using rental payment amount, rental payment frequency, tenant start date and tenant
end date to write a query that returns the sum of all payments from start date to end date. 
Display the yield. 

SELECT [dbo].[Property].id as PROPERTYID,[dbo].[Property].name as PROPERTYNAME,
case when [dbo].[TargetRentType].name='Weekly' then PropertyRentalPayment.Amount*Datediff
(wk,[dbo].[TenantProperty].startdate,[dbo].[TenantProperty].enddate)
when [dbo].[TargetRentType].name='Fortnightly' then PropertyRentalPayment.Amount*cast
(Datediff(wk,[dbo].[TenantProperty].startdate,[dbo].[TenantProperty].enddate)/2 as int)
when [dbo].[TargetRentType].name='Monthly' then PropertyRentalPayment.Amount*Datediff
(MONTH,[dbo].[TenantProperty].startdate,[dbo].[TenantProperty].enddate) end TOTALPAYMENT,
[dbo].[TargetRentType].name as RENTTYPE,[dbo].[TenantProperty].STARTDATE,[dbo].[TenantProperty].ENDDATE,
[dbo].[PropertyFinance].YIELD
FROM [dbo].[OwnerProperty] inner join [dbo].[PropertyRentalPayment]
on [dbo].[OwnerProperty].propertyid=[dbo].[PropertyRentalPayment].propertyid
inner join [dbo].[Property] on [dbo].[OwnerProperty].propertyid=[dbo].[Property].id
inner join [dbo].[TargetRentType] on [dbo].[PropertyRentalPayment].frequencytype=[dbo].[TargetRentType].id
inner join [dbo].[TenantProperty] on [dbo].[Property].id=[dbo].[TenantProperty].propertyid
inner join [dbo].[PropertyFinance] on [dbo].[Property].id=[dbo].[PropertyFinance].propertyid
WHERE [dbo].[OwnerProperty].ownerid='1426'

REQUIREMENT NO4: Display all the jobs available

SELECT [dbo].[JobMedia].JOBID,[dbo].[Job].JOBDESCRIPTION
FROM [dbo].[Job] inner join [dbo].[JobMedia] on [dbo].[Job].id=[dbo].[JobMedia].jobid

REQUIREMENT NO5: Display all property names, current tenants first and last names and rental payments per 
week/ fortnight/month for the properties in question a). 

SELECT [dbo].[Property].ID,[dbo].[Property].name as PROPERTYNAME,[dbo].[OwnerProperty].OWNERID,[dbo].[Person].FIRSTNAME,
[dbo].[Person].LASTNAME,[dbo].[PropertyRentalPayment].amount as RENTALPAYMENTAMOUNT,[dbo].[TargetRentType].name as RENTTYPE
FROM [dbo].[Property] inner join [dbo].[OwnerProperty] on [dbo].[Property].id=[dbo].[OwnerProperty].propertyid
inner join [dbo].[PropertyRentalPayment] on [dbo].[Property].id=[dbo].[PropertyRentalPayment].propertyid 
inner join [dbo].[TargetRentType] on [dbo].[PropertyRentalPayment].frequencytype=[dbo].[TargetRentType].id
inner join [dbo].[TenantProperty] on [dbo].[TenantProperty].propertyid=[dbo].[Property].ID
Inner Join [dbo].[Tenant] on Tenant.ID=[dbo].[TenantProperty].TenantID 
inner join [dbo].[Person] on [Tenant].id=[dbo].[Person].id
WHERE [dbo].[OwnerProperty].ownerid='1426'
