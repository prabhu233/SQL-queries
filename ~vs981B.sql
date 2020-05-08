REQUIREMENT NO1:Display a list of all property names and their property id’s for Owner Id: 1426

OUTPUT:
select property.Id as PropertyID,property.Name as PropertyName
from Property inner join OwnerProperty on property.Id=OwnerProperty.PropertyId
where OwnerProperty.OwnerId='1426'

REQUIREMENT NO2: Display the current home value for each property in question a). 

OUTPUT:
SELECT property.Id,property.Name,PropertyHomeValue.Value,PropertyHomeValue.Date
from Property inner join OwnerProperty on property.Id=OwnerProperty.[PropertyId] inner join
PropertyHomeValue on property.Id=PropertyHomeValue.PropertyId
where OwnerProperty.OwnerId='1426'

REQUIREMENT NO3: For each property in question a), return the following:                                                                      
Using rental payment amount, rental payment frequency, tenant start date and tenant
end date to write a query that returns the sum of all payments from start date to end date. 
Display the field. 

OUTPUT:
select distinct OwnerProperty.OwnerId,property.Name,property.ID,
(select sum (PropertyRentalPayment.Amount) from PropertyRentalPayment where propertyid=property.ID)
as RentalPaymentAmount,
TenantProperty.PaymentFrequencyId,TenantProperty.StartDate,TenantProperty.EndDate
from OwnerProperty inner join Property on OwnerProperty.PropertyId=Property.Id inner join
PropertyRentalPayment on OwnerProperty.PropertyId=PropertyRentalPayment.PropertyId
inner join TenantProperty on PropertyRentalPayment.PropertyId=TenantProperty.PropertyId
where OwnerProperty.OwnerId='1426'

REQUIREMENT NO4: Display all the jobs available

SOLUTION:
select job.id,job.JobDescription
from Job

REQUIREMENT NO5: Display all property names, current tenants first and last names and rental payments per 
week/ fortnight/month for the properties in question a). 

OUTPUT:
select a.ID,a.Name--,(first and lastname relation not found found)--
,c.amount,d.Name 
from 
Property a inner join [dbo].[OwnerProperty] b on a.ID=b.PropertyId
--inner join Tenant e (no relation found to Property?)
--Inner Join Person f on e.ID=f.ID (to get firstname, lastname)
inner join PropertyRentalPayment c on a.ID=c.PropertyId
inner join TargetRentType d on c.FrequencyType=d.Id
where ownerID=1426