--The business task is to improve retention by identifying high value customers and churn risks.
--First I want to take a look at all the data to get a general idea of possible insights.
--What customers are high value?

Select *
From Customer_Info;

--Joining the two tables to include the population of each zipcode.
Select *
From Customer_Info
Inner Join Zipcode_Populations ON Customer_Info.[Zip Code]=Zipcode_Populations.[Zip Code];

--Is there a difference in gender?
Select Gender, COUNT(Gender)
From Customer_Info
Group By Gender;

--What are the most common ages?
Select Age, COUNT(Age) as Num_of_Age
From Customer_Info
Group By Age
Order By Num_of_Age DESC;

--What customers churned?
Select *
From Customer_Info
Where [Customer Status] = 'Churned';

--What churned customers listed as reasons for leaving?
Select [Churn Reason], COUNT([Churn Reason]) as Num_of_Reason
From Customer_Info
Where [Customer Status] = 'Churned'
Group By [Churn Reason];

--What are the top reasons for leaving?
Select [Churn Reason], COUNT([Churn Reason]) as Num_of_Reason
From Customer_Info
Where [Customer Status] = 'Churned'
Group By [Churn Reason]
Order By Num_of_Reason DESC;

--What are the top categories for customers leaving?
Select [Churn Category], COUNT([Churn Category]) as Num_of_Category
From Customer_Info
Where [Customer Status] = 'Churned'
Group By [Churn Category]
Order By Num_of_Category DESC;

--What time contracts were most common for churned customers?
Select Contract, COUNT(Contract) as Num_of_Contract_Type
From Customer_Info
Where [Customer Status] = 'Churned'
Group By Contract;

--What customers stayed?
Select *
From Customer_Info
Where [Customer Status] = 'Stayed';

--What time contracts were most common for customers that stayed?
Select Contract, COUNT(Contract) as Num_of_Contract_Type
From Customer_Info
Where [Customer Status] = 'Stayed'
Group By Contract;

--What do customers with the highest revenue that stayed have in common?
Select *
From Customer_Info
Where [Customer Status] = 'Stayed'
Order By [Total Revenue] DESC;

--Customers with a total revenue above average?
Select *
From Customer_Info
Where [Total Revenue] > (Select AVG([Total Revenue]) From Customer_Info);

--How many customers are above average in revenue (High Value)?
Select COUNT(*) as High_Value_Customers
From Customer_Info
Where [Total Revenue] > (Select AVG([Total Revenue]) From Customer_Info);

--What is the average monthly revenue per customer?
Select AVG([Total Revenue]/[Tenure in Months]) as Avg_Rev_Per_Month
From Customer_Info

--What is the average monthly revenue from customers that stayed?
Select AVG([Total Revenue]/[Tenure in Months])
From Customer_Info
Where [Customer Status] = 'Stayed';

--What is the average monthly revenue from customers that left?
Select AVG([Total Revenue]/[Tenure in Months])
From Customer_Info
Where [Customer Status] = 'Churned';

--What is the average tenure in months for customers that stayed?
Select AVG([Tenure in Months])
From Customer_Info
Where [Customer Status] = 'Stayed';

--What is the average tenure in months for customers that left?
Select AVG([Tenure in Months])
From Customer_Info
Where [Customer Status] = 'Churned';

--What is the most popular Internet Type?
Select [Internet Type], COUNT([Internet Type]) 
From Customer_Info
Group By [Internet Type];

--What is the most common internet type for customers who left?
Select [Internet Type], COUNT([Internet Type]) 
From Customer_Info
Where [Customer Status] = 'Churned'
Group By [Internet Type];

--What is the most common internet type for customers who stayed?
Select [Internet Type], COUNT([Internet Type]) 
From Customer_Info
Where [Customer Status] = 'Stayed'
Group By [Internet Type];

--How many customers in each city left?
Select [City], COUNT([City]) as Num_of_Cust_in_City
From Customer_Info
Where [Customer Status] = 'Churned'
Group By [City]
Order By Num_of_Cust_in_City DESC;

--How many customers in each city stayed?
Select [City], COUNT([City]) as Num_of_Cust_in_City
From Customer_Info
Where [Customer Status] = 'Stayed'
Group By [City]
Order By Num_of_Cust_in_City DESC;

--What is the highest average revenue for each offer?
Select [Offer], COUNT([Offer]) as Num_of_offer, SUM([Total Revenue]) as Sum_of_Revenue, AVG([Total Revenue]) as Avg_Revenue_Per_Offer
From Customer_Info
Group By [Offer]
Order By Num_of_offer DESC;


