-- Create "retirement_titles" table
SELECT e.emp_no, 
        e.first_name, 
		e.last_name,
		t.title, 
		t.from_date, 
		t.to_date
INTO retirement_titles
FROM employees AS e
JOIN titles AS t
ON e.emp_no=t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no

-- View "retirement_titles" table 
SELECT *FROM retirement_titles;

-- Create "unique_title" table
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
       rt.first_name,
       rt.last_name,
	   rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE (rt.to_date='9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;

-- View "unique_titles" table
SELECT *FROM unique_titles;

-- Create Retiring Titles Table
-- Retrieve the number of employees by their most recent job title
SELECT COUNT(ut.title) AS "count", ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY "count" DESC;

-- View "retiring_titles" table
SELECT *FROM retiring_titles;

-- Create "mentorship-eligibility" table
SELECT DISTINCT ON (e.emp_no) e.emp_no,  
		e.first_name, 
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		t.title
INTO mentorship_eligibility
FROM employees AS e
JOIN dept_employees AS de
ON e.emp_no=de.emp_no
JOIN titles AS t
ON e.emp_no=t.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date='9999-01-01')
ORDER BY e.emp_no;

-- View "mentorship_eligibility" table
SELECT *FROM mentorship_eligibility;

-- Retrieve the number of current mentorship-eligibile employees by their most recent job title
-- Create "mentorship_eligibility_titles" table
SELECT COUNT(me.title) AS "count", me.title
INTO mentorship_eligibility_titles
FROM mentorship_eligibility AS me
GROUP BY me.title
ORDER BY "count" DESC;

-- View "mentorship_eligibility_titles" table
SELECT *FROM mentorship_eligibility_titles;

-- Average Salary by title table
SELECT ut.title, ROUND(AVG(s.salary),2) AS "Average Salary"
INTO salary_title
FROM unique_titles AS ut
JOIN salaries AS s
ON s.emp_no = ut.emp_no
GROUP BY ut.title
ORDER BY "Average Salary" DESC;

-- View "salary_title" table
SELECT *FROM salary_title;
	