# Pewlett-Hackard-Analysis

## Overview 
Pewlett Hackard is a large company boasting several thousand employees. As baby boomers begin to retire at a rapid rate, Pewlett Hackard is looking toward the future in two ways. First, it's offering a retirement package for those who meet certain criteria. Second, it's starting to think about which positions will need to be filled in the near future.
The number of upcoming retirements will leave thousands of job openings. Therefore, they need to find answers to the following questions: 
- Who will be retiring in the next few years, by title? 
- How many employees are eligible to participate in a mentorship program?

### Aim 
The aim of this project is to help the company build an employee database with SQL by applying data analysis in the aim of future-proofing the company by determining how many people will be retiring and identify current employees who are eligible to participate in a mentorship program.

## Resources 
- Data Source: departments.csv - dept_emp.csv - dept_manager.csv - titles.csv - salaries.csv - employees.csv 
- Software: SQL, PostgreSQL, pgAdmin 4 

## Code 
To check the full code go to: https://github.com/MireyNM/-Pewlett-Hackard-Analysis/blob/main/Employee_Database_challenge.sql

## Analysis of Data 
### 1.  The Number of Retiring Employees by Title

To start our first task, we have written a query to create a Retirement Titles table that holds all the titles of employees who were born between January 1, 1952 and December 31, 1955. (Check retirement_titles.csv in Data folder to see all the results)

However, some employees may have multiple titles in the database (for example, due to promotions) therefore, we have used the ```DISTINCT ON ``` statement to create a Unique Title table that contains the most recent title of each employee. Then, we have used the ```COUNT ()``` function to create a table that has the number of retirement-age employees by most recent job title. Finally, because we want to include only current employees in our analysis, we have excluded those employees who have already left the company by filtering on ```to_date``` to keep only those dates that are equal to ```9999-01-01```. And we have exported the Unique Title table as unique_titles.csv (See Table 1 or check unique_titles.csv in the Data folder to see the complete data) 

<p align = "center">
<img width="499" alt="Outcomes_vs_Goals" src="https://user-images.githubusercontent.com/109363759/194459592-c49a56ed-ec9b-4bb2-aeb8-245d527c9cad.png">
</p>
<p align = "center">
Table 1 - Unique Title table that contains the most recent title of each employee.
</p>

Finally, another query was written and executed to create a Retiring Titles table that contains the number of titles filled by employees who are retiring (See Table 2) 

<p align = "center">
<img width="499" alt="Outcomes_vs_Goals" src="https://user-images.githubusercontent.com/109363759/194466869-9d06f236-f12c-42a3-8e40-97f205ae4579.png">
</p>
<p align = "center">
Table 2 - Retiring Titles table that contains the number of titles filled by employees who are retiring. 
</p>

### 2. The Employees Eligible for the Mentorship Program
In this part of our tasks we have written a query to create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965. And we have exported the results as mentorship_eligibilty.csv
(See Table 3 or mentorship_eligibilty.csv in the Data folder to check the full table).

<p align = "center">
<img width="499" alt="Outcomes_vs_Goals" src="https://user-images.githubusercontent.com/109363759/194467269-c052f2d2-3b78-4f89-b9b8-6563dfc1442a.png">
</p>
<p align = "center">
Table 3 - Mentorship-eligibility table that holds the current employees who are eligible for Mentorship Program.
</p>

## Results 
### 1.  The Number of Retiring Employees by Title
Table 2 shows the following:
- There are 72458 retirement-age employees in the company.
- These positions need to be filled when the "silver tsunami" begins.
- 70.16% of retirement-age employees are in Senior positions (Senior Engineer and Senior Staff) which may be alarming for the company as Senior employees are the most experienced and skilled. 
- There are only 2 managers in retirement age but as we have seen before there are just 5 active managers in the company. Therefore, I would suggest for the decision-makers in the company to hire more managers. 

### 2. The Employees Eligible for the Mentorship Program
Table 3 shows us that:
- There are 1549 employees eligible for the mentorship program.
- These employees could help in skills transfer to junior employees.
- This table is hard to define if we have enough eligible people to prepare the next generation (it is hard to go through 1549 rows)
- In order to know if there are enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees, I wrote the following query to create a table (See Table 4) showing the number of employees eligible for the mentorship program by title.

**Query to create mentorship eligibility by titles table**
```
-- Create "mentorship_eligibility_titles" table
SELECT COUNT(me.title) AS "count", me.title
INTO mentorship_eligibility_titles
FROM mentorship_eligibility AS me
GROUP BY me.title
ORDER BY "count" DESC;
```

<p align = "center">
<img width="499" alt="Outcomes_vs_Goals" src="https://user-images.githubusercontent.com/109363759/194468023-e51ff8e1-2894-4e51-8819-e9da95d3efc0.png">
</p>
<p align = "center">
Table 4 - Table showing mentorship-eligibility employees by title.
</p>


Table 4 shows us that:
- The highest number of people eligible for the mentorship program is for Senior Staff (569) which could help in skills transfer to junior staff or new staff hired. 
- The number of eligible senior engineer for the mentorship program (169 persons) is relatively low in comparison with number of retirement-age senior engineer (25916).
- There are no managers eligible for the mentorship program which could be alarming for the company. 

The second query I wrote was to create average salary by title (See Table 5).  
**Querry to create average salary by title table**
```
-- Average Salary by title table
SELECT ut.title, ROUND(AVG(s.salary),2) AS "Average Salary"
INTO salary_title
FROM unique_titles AS ut
JOIN salaries AS s
ON s.emp_no = ut.emp_no
GROUP BY ut.title
ORDER BY "Average Salary" DESC; 
```
<p align = "center">
<img width="499" alt="Outcomes_vs_Goals" src="https://user-images.githubusercontent.com/109363759/194468098-9a01655e-10a8-4d45-8a95-910c7625515a.png">
</p>
<p align = "center">
Table 5 - Table showing mentorship-eligibility employees by title.
</p>


- The average salary per title is the highest for managers which could explain the lack in managers in the company. 

## Summary
Finally, I would suggest few things for the decision makers of Pewlett Hackard company:
- Hiring new managers.
- Start skill transfer program between senior and junior employees in order to have employees ready to fill senior positions when the later retire. 
- Focus on hiring new staff and engineers as 70.16% of retirement-age employees are senior staff and engineers. 
- Offer new roles to senior and old employees in the aim of keeping them long enough in the company to share their knowledge with others. The company could offer them less stressful jobs or allow them to work part time or just part time of the year.



