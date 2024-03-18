-- The avrage salary of the employees
select avg(salary) from employee order by avg(salary);


-- Fetching emplyees whose salary is greater than the average salary
SELECT emp_name,
       salary,
	   dept_name,
       Avg(salary)
FROM   employee
WHERE  salary > (SELECT Avg(salary)
                 FROM   employee)
GROUP BY emp_name, salary, dept_name 
ORDER  BY Avg(salary); 


-- une deuxième écriture pour la scaler subquery
SELECT emp_name,
       salary,
	   dept_name
FROM   employee e
       JOIN (SELECT Avg(salary) AS sal
             FROM   employee) average_salary
         ON e.salary > average_salary.sal
GROUP  BY emp_name, 
          salary,
		  dept_name; 
		  
		 
-- Lets find the employees who earn the highet salary in each departement

-- This is the max salary in every departement
SELECT dept_name,
       Max(salary)
FROM   employee
GROUP  BY dept_name; 


/*0 the employee nae correspoding to the highest salary in every departement */

-- Fetch highest salary relaed to every departement
select dept_name, max(salary) from employee group by dept_name;


-- Method1: using the WHERE CLAUSE
SELECT emp_name,
       dept_name,
       salary
FROM   employee
WHERE  ( dept_name, salary ) IN (SELECT dept_name,
                                        Max(salary)
                                 FROM   employee
                                 GROUP  BY dept_name); 		  
		  
		 
-- Method2: using the JOIN CLAUSE
SELECT emp_name,
       e.dept_name,
       salary
FROM   employee e
       JOIN (SELECT dept_name,
                    Max(salary) sal
             FROM   employee
             GROUP  BY dept_name) AS max_sal_dept
         ON e.salary = max_sal_dept.sal
            AND e.dept_name = max_sal_dept.dept_name; 	
			
			
/* Next problem: Find the department who do not have any employees */

-- First we will insert rows without emp_name
INSERT INTO employee (emp_name, dept_name, salary) 
VALUES 
    (NULL, 'IT', 60000),
    (NULL, 'HR', 55000),
    (NULL, 'Sales', 62000),
    (NULL, 'Marketing', 58000);

-- Checking the table
select * from employee;


-- Dept names where the emp_name is null
select emp_name, dept_name from employee where emp_name is null;



SELECT distinct(d.dept_name)
FROM   department d
       LEFT JOIN (SELECT emp_name,
                         dept_name
                  FROM   employee
                  WHERE  emp_name IS NULL) e
              ON e.dept_name = d.dept_name; 


SELECT *
FROM   department
WHERE  dept_name NOT IN (SELECT DISTINCT( dept_name )
                         FROM   employee); 
						 
						 
/* Finding the employees in each department who earn more than the avg salary in  that department. */

-- finding the avg salary at first
select avg (salary) from employee;


-- 
SELECT emp_name, salary, dept_name
FROM   employee e1
WHERE  salary > (SELECT Avg(salary)
                 FROM   employee e2
                 WHERE  e1.dept_name = e2.dept_name); 
				 
				 
/* Finding the sore who's sales are better than the average sales acros all stores */	

-- The total sales query in stores
select quantity*price as total_sales from sales;


select store_name, avg(quantity*price) as avg_total_sales from sales GROUP BY store_name;

-- 
SELECT store_name, quantity * price, avg(quantity*price) as avg_total_sales
FROM   sales
WHERE  quantity * price > (SELECT Avg(quantity * price) AS avg_total_sales
                           FROM   sales)
GROUP BY store_name, quantity * price; 


select avg(total_sales) from(
	select store_name, quantity * price as total_sales
	from sales)
 

select * from sales where quantity*price > (select avg(total_sales) from(
	select store_name, quantity * price as total_sales
	from sales))
	
	
SELECT store_id, store_name, SUM(quantity * price) AS total_sales
FROM sales
GROUP BY store_id, store_name
ORDER BY total_sales;



SELECT SUM(quantity * price) AS total_sales 
        FROM sales 
        GROUP BY store_id



SELECT AVG(total_sales) 
    FROM (
        SELECT SUM(quantity * price) AS total_sales 
        FROM sales 
        GROUP BY store_id
    )
	
	
	
SELECT store_id,
       store_name,
       Sum(quantity * price) AS total_sales
FROM   sales
GROUP  BY store_id,
          store_name
HAVING Sum(quantity * price) > (SELECT Avg(total_sales)
                                FROM   (SELECT Sum(quantity * price) AS
                                               total_sales
                                        FROM   sales
                                        GROUP  BY store_id)); 
										
										
--- Now we want ot insert data into the employee_hiorty table; making sure not to insert duplicate ones:

-- checking th data in the tables
select * from employee;
select * from department;
select * from employee_history;


-- inserting data into the employee_history table without duplicates

INSERT INTO employee_history
SELECT e.emp_id,
       e.emp_name,
       e.dept_name,
       e.salary,
       d.location
FROM   employee e
       JOIN department d
         ON e.dept_name = d.dept_name
WHERE  NOT EXISTS (SELECT 1
                   FROM   employee_history eh
                   WHERE  e.emp_id = eh.emp_id); 



--  Using the update query: Give 10% increment to all employees in NYC lcoation based on the max salay earned by an emp in each dep
-- only considering the employees in employee_history table

select * from employee_history where location= 'New York';


UPDATE employee E
SET    salary = (SELECT Max(salary) + Max(salary) * 0.1
                 FROM   employee_history eh
                 WHERE  e.dept_name = eh.dept_name)
WHERE  e.dept_name IN (SELECT dept_name
                       FROM   department
                       WHERE  location = 'New York')
       AND E.emp_id IN (SELECT emp_id
                        FROM   employee_history); 


select * from employee_history;
select * from employee;
select * from department;


