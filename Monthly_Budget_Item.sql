/**Clints want to know how to spend less by Mastering the monthly budget.
We have to create database table for everyday necessities data so that we can calculate how much spend and we have any savings 
Analysis past expenses so we can plan budget for future. 
Execute multiple value using sum, extract function that helps me to get data from month to date.
Later we use order by function so that all categories for such month will be shown together. 
Tools used SQL( select statement,where clause, order by, group by , Extract function)**/


--First of all, we’ll write a very simple SQL query that will list all the information in our table

select * from monthly_budget_item

--We used the SUM() function with the amount column inside to get the overall sum of all items (both the expenses expressed as negative numbers and the income expressed as positive numbers) in our table. The result is as follows:

SELECT SUM(amount) FROM monthly_budget_item;

--We used a time function named EXTRACT to extract the month from each date. We also used this function to group all rows by the month. Finally, we sorted the rows by the month. The month value will be a number from 1 (January) to 3 (March).

SELECT EXTRACT(MONTH FROM date), SUM(amount)
FROM monthly_budget_item
GROUP BY EXTRACT(MONTH FROM date)
ORDER BY EXTRACT(MONTH FROM date);

--We’ve added an ORDER BY clause at the end. Now, all the categories for each month will be shown together, and the category where we spent most will be shown first. This is what we’ll see when we run the query.

SELECT EXTRACT(MONTH FROM date), category, SUM(amount)
FROM monthly_budget_item
GROUP BY EXTRACT(MONTH FROM date), category
ORDER BY EXTRACT(MONTH FROM date), SUM(amount);

--We’ve added a WHERE clause to only show items from the “food” category. The result should look like this.

SELECT EXTRACT(MONTH FROM date), description, amount
FROM monthly_budget_item
WHERE category = 'food'
ORDER BY EXTRACT(MONTH FROM date);

--we’ve just identified the first possible improvement: we should pay attention to what we put into our cart. Now, let’s run a similar query for the “entertainment” category.

SELECT EXTRACT(MONTH FROM date), description, amount
FROM monthly_budget_item
WHERE category = 'entertainment'
ORDER BY EXTRACT(MONTH FROM date);

--Conclusion is that we should pay attention to the entertainment options, and maybe look for those that are less expensive. Finally, let’s look at the last category: transport. Again, we’ll use a similar query.

SELECT EXTRACT(MONTH FROM date), description, amount
FROM monthly_budget_item
WHERE category = 'transport'
ORDER BY EXTRACT(MONTH FROM date);

--We spent much more on fuel in March than we spent on metro tickets in the first two months. We could save some money by using public transport instead of a car.
