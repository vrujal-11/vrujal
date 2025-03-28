
CREATE DATABASE HR ;

Use HR ;

                          # DATABASE NAME : HR PAGE 1(29)


-- SINGLE LINE COMMENT 
-- IN THIS PAGE WE HAVE TO CREATE EMPLOYEE AND DEPARTMENT TABLE TO SOLVE TO QUERY 


-- QUES1) Display all information in the tables EMP and DEPT?
-- ANS) SELECT * FROM EMP;
        SELECT * FROM DEPT;

-- QUES2) Display only the hire date and employee name for each employee? 
-- ANS)   SELECT HIREDATE, ENAME FROM EMP;

-- QUES3) Display the ename concatenated with the job ID, separated by a comma and space, 
		  and name the column Employee and Title?

-- ANS)  SELECT CONCAT(ENAME, ', ', JOB) AS "Employee and Title" FROM EMP;

-- QUES4) Display the hire date, name and department number for all clerks?

-- ANS) SELECT HIREDATE, ENAME, DEPTNO FROM EMP WHERE JOB = 'CLERK';

-- QUES5) Create a query to display all the data from the EMP table.
          Separate each column by a comma. Name the column THE OUTPUT?

-- ANS)  SELECT 
         CONCAT(EMPNO, ', ', ENAME, ', ', JOB, ', ', MGR, ', ', HIREDATE, ', ', SAL, ', ',
         COMM, ', ', DEPTNO) AS "THE OUTPUT" 
         FROM EMP;

-- QUES6) Display the names and salaries of all employees with a salary greater than 2000?

-- ANS) SELECT ENAME, SAL FROM EMP WHERE SAL > 2000;

-- QUES7) Display the names and dates of employees with the column headers "Name" and "Start 
          Date"?

-- ANS) SELECT ENAME AS "Name", HIREDATE AS "Start Date" FROM EMP;

-- QUES8) Display the names and hire dates of all employees in the order they were hired?

-- ANS) SELECT ENAME AS "Name", HIREDATE AS "Hire Date" FROM EMP ORDER BY HIREDATE;

-- QUES9) Display the names and salaries of all employees in reverse salary order?

-- ANS) SELECT ENAME AS "Name", SAL AS "Salary" FROM EMP ORDER BY SAL DESC;

-- QUES10) Display 'ename" and "deptno" who are all earned commission 
		   and display salary in reverse order?

-- ANS) SELECT ENAME AS "Name", DEPTNO AS "Department", SAL AS "Salary"
		FROM EMP
        WHERE COMM IS NOT NULL
        ORDER BY SAL DESC;

-- QUES11) Display the last name and job title of all employees who do not have a manager?

-- ANS) SELECT ENAME AS "Last Name", JOB AS "Job Title"
	   FROM EMP
        WHERE MGR IS NULL;

-- QUES12) Display the last name, job, and salary for all employees whose job is sales representative 
		  or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000?

 -- ANS) SELECT ENAME AS "Last Name", JOB AS "Job Title", SAL AS "Salary"
         FROM EMP
		 WHERE (JOB = 'SALESMAN' OR JOB = 'CLERK')
         AND SAL NOT IN (2500, 3500, 5000);


                             
                             
						DATABASE NAME : HR PAGE 2(30)


-- SINGLE LINE COMMENT 
-- IN THIS PAGE WE ARE SOLVING THIS QUESTION BY USING MIN, MAX, AVG,SUM AND COUNT 


-- QUES1) Display the maximum, minimum and average salary and commission earmed?

-- ANS) SELECT 
        MAX(SAL) AS "Maximum Salary",
        MIN(SAL) AS "Minimum Salary",
        AVG(SAL) AS "Average Salary",
        MAX(COMM) AS "Maximum Commission",
        MIN(COMM) AS "Minimum Commission",
        AVG(COMM) AS "Average Commission"
        FROM EMP;

-- QUES2) Display the department number, total salary payout and total commission
          payout for each department?

-- ANS)  SELECT 
		 DEPTNO AS "Department Number",
         SUM(SAL) AS "Total Salary Payout",
         SUM(COMM) AS "Total Commission Payout"
         FROM EMP
         GROUP BY DEPTNO;

-- QUES3) Display the department number and number of employees in each department?
 
-- ANS) SELECT 
        DEPTNO AS "Department Number",
        COUNT(*) AS "Number of Employees"
        FROM EMP
        GROUP BY DEPTNO;

 -- QUES4) Display the depatment number and total salary of employees in
		   each department?
  
  -- ANS) SELECT 
          DEPTNO AS "Department Number",
          SUM(SAL) AS "Total Salary"
          FROM EMP
          GROUP BY DEPTNO;

-- QUES5) Display the employee's name who doesn't earn a commission. Order the result set 
		  without using the column name?  
  
-- ANS) SELECT ENAME
		FROM EMP
		WHERE COMM IS NULL
		ORDER BY 1;

  
-- QUES6) Display the employees name, department id and commission. If an Employee 
		 doesn't earn the commission, then display as 'No commission'. Name the columns 
         appropriately?

 -- ANS) SELECT 
         ENAME AS "Employee Name",
         DEPTNO AS "Department ID",
         COALESCE(TO_CHAR(COMM), 'No commission') AS "Commission"
         FROM EMP;

 
-- QUES7) Display the employee's name, salary and commission multiplied by 2. If an Employee 
		 doesn't earn the commission, then display as 'No commission. Name the columns 
         appropriately?

-- ANS) SELECT 
        ENAME AS "Employee Name",
        SAL AS "Salary",
        COALESCE(TO_CHAR(COMM * 2), 'No commission') AS "Double Commission"
        FROM EMP;


-- QUES8) Display the enployee's name, department id who have the first name same as
-- 		  another employee in the same department?

 -- ANS) SELECT ENAME AS "Employee Name", DEPTNO AS "Department ID"
 --       FROM EMP
 --       WHERE ENAME IN (
          SELECT ENAME
          FROM EMP
          GROUP BY ENAME, DEPTNO
		HAVING COUNT(*) > 1
          );

 -- QUES9) Display the sum of salaries of the employees working under each Manager?

-- ANS) SELECT ManagerID, SUM(Salary) AS TotalSalary
        FROM Employees
        GROUP BY ManagerID;


-- QUES10) Select the Managers name, the count of employees working under and the department 
           ID of the manager?

-- ANS) SELECT 
        M.ManagerName,
        COUNT(E.EmployeeID) AS NumberOfEmployees,
        M.DepartmentID
        FROM 
        Managers M
        JOIN 
           Employees E ON M.ManagerID = E.ManagerID
        GROUP BY 
        M.ManagerName, M.DepartmentID;

-- QUES11) Select the employee name, department id, and the salary. Group the result with the 
		   manager name and the employee last name should have second letter 'a!?

-- ANS) SELECT 
        M.ManagerName,
        E.LastName AS EmployeeName,
        E.DepartmentID,
        E.Salary
        FROM 
          Managers M
        JOIN 
        Employees E ON M.ManagerID = E.ManagerID
        WHERE 
        SUBSTRING(E.LastName, 2, 1) = 'a'
        GROUP BY 
        M.ManagerName, E.LastName, E.DepartmentID, E.Salary;

-- QUES12) Display the average of sum of the salaries and group the result with the 
           department id. Order the result with the department id?

-- ANS) SELECT DepartmentID, AVG(TotalSalary) AS AverageSalary
        FROM (
        SELECT DepartmentID, SUM(Salary) AS TotalSalary
        FROM Employees
        GROUP BY DepartmentID
		) AS DepartmentSalaries
        GROUP BY DepartmentID
        ORDER BY DepartmentID;

-- QUES13) Select the maximum salary of each department along with the department id?

-- ANS) SELECT DepartmentID, MAX(Salary) AS MaxSalary
        FROM Employees
        GROUP BY DepartmentID;

-- QUES14) Display the commission, if not null display 10% of salary, if null display a 
           default value 1?
 
 -- ANS) SELECT 
		 CASE 
           WHEN Commission IS NOT NULL THEN Salary * 0.1
		 ELSE 1
         END AS Commission
         FROM 
         Employees;

 

						DATABASE NAME : HR PAGE 3(31)


-- SINGLE LINE COMENT 
-- IN THIS PAGE WE SOLVING THIS QUERY BY USING STRING METHOD, CONCAT AND CASE.


-- QUES1) Write a query that displays the employee's last names only from the string's 
          2-5th position with the first letter capitalized and all other letters lowercase,
          Give each column an appropriate label?

-- ANS) SELECT 
		CONCAT(UPPER(SUBSTRING(last_name, 2, 1)), LOWER(SUBSTRING(last_name, 3, 4))) AS 
        Modified_Last_Name
        FROM 
           employees;

-- QUES2) Write a query that displays the employee's first name and last name along with 
		  a" in between for e.g: first name : Ram; last name : Kumar then Ram-Kumar.
          Also displays the month on which the employee has joined?
 
 -- ANS) SELECT 
         CONCAT(first_name, '-', last_name) AS Full_Name,
         MONTH(join_date) AS Join_Month
         FROM 
            employees;

 -- QUES3) Write a query to display the employee's last name and if half of the salary 
           is greater than ten thousand then increase the salary by 10% else by 11.5% along
           with the bonus amount of 1500 each. Provide each column an appropriate label?
 
-- ANS) SELECT 
        last_name,
        CASE 
           WHEN salary * 0.5 > 10000 THEN ROUND(salary * 1.1 + 1500, 2)
        ELSE ROUND(salary * 1.115 + 1500, 2)
        END AS Increased_Salary,
        1500 AS Bonus_Amount
		FROM 
           employees;

-- QUES4) Display the employee ID by Appending two zeros after 2nd digit
		 and '"E' in the end, department id, salary and the manager name all in Upper
         case, if the Manager name consists of z' replace it with '$'?

-- ANS) SELECT 
        CONCAT(SUBSTRING(employee_id, 1, 2), '00', 'E') AS Modified_Employee_ID,
        department_id,
        UPPER(salary) AS Salary,
        REPLACE(UPPER(manager_name), 'Z', '$!') AS Modified_Manager_Name
        FROM 
           employees;

-- QUES5) Write a query that displays the employee's last narmes with the first letter 
          capitalized and all other letters lowercase, and the length of the names, for all 
          employees whose name starts with J, A, or M. Give each column an appropriate label.
          Sort the results by the employees' last names?
  
-- ANS) SELECT 
        CONCAT(UPPER(SUBSTRING(last_name, 1, 1)), LOWER(SUBSTRING(last_name, 2))) AS Modified_Last_Name,
        LENGTH(last_name) AS Name_Length
        FROM 
         employees
        WHERE 
        last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%'
        ORDER BY 
           last_name;

--QUES6) Createa query to display the last name and salary for all employees. Format
		 the salary to be 15 characters long, left-padded with $. Label the column SALARY?
 
-- ANS) SELECT 
       last_name,
       LPAD(salary, 15, '$') AS SALARY
       FROM 
          employees;

-- QUES7) Display the employee's name if it is a palindrome?

-- ANS) SELECT 
        CONCAT(first_name, ' ', last_name) AS Employee_Name
        FROM 
           employees
       WHERE 
           CONCAT(first_name, ' ', last_name) = REVERSE(CONCAT(first_name, ' ', last_name));

-- QUES8) Display First names of all employees with initcapS? 

-- ANS) SELECT 
		INITCAP(first_name) AS First_Name
		FROM 
           employees;

-- QUES9) From LOCATIONS table, extract the word between first and second space from the 
          STREET ADDRESS column?

-- ANS) SELECT 
        TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(street_address, ' ', 2), ' ', -1)) AS 
        Word_Between_First_and_Second_Space
        FROM 
            locations;

 -- QUES10) Extract first letter from First Name column and append it with the Last Name.
            Also add "@systechusa.com" at the end. Name the column as e-mail address. All 
		    characters should be in lower case. Display this along with their First Name?
 
 -- ANS) SELECT 
         CONCAT(LOWER(SUBSTRING(first_name, 1, 1)), last_name, '@systechusa.com') AS e_mail_address,
         first_name
         FROM 
            employees;

-- QUES11) Display the names and job titles of all employees with the same job as Trenna?
 
-- ANS) SELECT 
          first_name,
          last_name,
          job_title
        FROM 
          employees
        WHERE 
          job_title = (
        SELECT 
            job_title 
        FROM 
            employees 
        WHERE 
            first_name = 'Trenna'
		);

-- QUES12) Display the names and department name of all employees working in the same 
           city as Trenna?

-- ANS) SELECT 
          e.first_name,
          e.last_name,
          d.department_name
       FROM 
          employees e
       JOIN 
          departments d ON e.department_id = d.department_id
       WHERE 
          e.city = (
	   SELECT 
            city 
        FROM 
            employees 
        WHERE 
            first_name = 'Trenna'
		) 
        AND 
         (e.first_name != 'Trenna' OR e.last_name != 'Trenna');

-- QUES13) Display the name of the employee whose salary is the lowest?

-- ANS) SELECT 
         first_name,
         last_name
        FROM 
         employees
		WHERE 
        salary = (
		SELECT 
            MIN(salary) 
        FROM 
            employees
         );

-- QUES14) Display the names of all employees except the lowest paid? 

-- ANS) SELECT 
        first_name,
        last_name
        FROM 
         employees
        WHERE 
         salary != (
        SELECT 
            MIN(salary) 
        FROM 
            employees
         );


                              DATABASE NAMR : HR PAGE 4(32)

-- SINGLE LINE COMMENT
-- IN THIS PAGE WE SOLVING THIS QUERY BY USING RIGHT JOIN , LEFT JOIN AND CASE METHOD .

-- QUES1) Write a query to display the last name, department number, department name
		  for all employees?
 
 -- ANS) SELECT 
          e.last_name,
          e.department_id,
          d.department_name
        FROM 
          employees e
        JOIN 
          departments d ON e.department_id = d.department_id;

-- QUES2) Create a unique list of all jobs that are in department 4. Include the location of the 
          department in the output?

-- ANS) SELECT DISTINCT
         e.job_id,
         d.department_name,
		 l.city
        FROM 
         employees e
        JOIN 
         departments d ON e.department_id = d.department_id
        JOIN 
         locations l ON d.location_id = l.location_id
        WHERE 
         e.department_id = 4;

-- QUES3) Write a query to display the employee last name,department name,location id and city of 
          all employees who earn commission?

-- ANS) SELECT 
          e.last_name,
          d.department_name,
          l.location_id,
          l.city
        FROM 
          employees e
        JOIN 
           departments d ON e.department_id = d.department_id
        JOIN 
           locations l ON d.location_id = l.location_id
        WHERE 
           e.commission_pct IS NOT NULL;

-- QUES4) Display the employee last name and department name of all employees who
		  have an 'a' in their last name?
 
-- ANS)  SELECT 
          e.last_name,
          d.department_name
         FROM 
          employees e
         JOIN 
          departments d ON e.department_id = d.department_id
         WHERE 
          e.last_name LIKE '%a%';

-- QUES5) Write a query to display the last name,job,department number and 
          department name for all employees who work in ATLANTA?

-- ANS) SELECT e.last_name, j.job_title, e.department_id, d.department_name
        FROM employees e
        JOIN jobs j ON e.job_id = j.job_id
        JOIN departments d ON e.department_id = d.department_id
        JOIN locations l ON d.location_id = l.location_id
        WHERE l.city = 'ATLANTA';

-- QUES6) Display the employee last name and employee number along with their 
          manager's last name and manager number?

-- ANS)  SELECT e.last_name AS employee_last_name, e.employee_id AS employee_number,
	     m.last_name AS manager_last_name, e.manager_id  manager_number FROM 
		 employees e LEFT JOIN employees m ON e.manager_id = m.employee_id;

-- QUES7) Display the employee last name and employee number along with their 
          manager's last name and manager number (including the employees who have
          no manager)?

-- ANS) SELECT e.last_name AS employee_last_name, e.employee_id AS employee_number,
        COALESCE(m.last_name, 'No Manager') AS manager_last_name,
        e.manager_id AS manager_number FROM employees e
		LEFT JOIN employees m ON e.manager_id = m.employee_id;

-- QUES8) Create a query that displays employees last name,department number,and
          all the employees who work in the same department as a given employee?

-- ANS)  SELECT e1.last_name AS employee_last_name, e1.department_id,
         e2.last_name AS colleague_last_name FROM employees e1
         JOIN employees e2 ON e1.department_id = e2.department_id ;

-- QUES9) Create a query that displays the name,job,department name,salary,grade for all 
          employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=c)?

-- ANS) SELECT e.last_name AS employee_name,j.job_title,d.department_name,e.salary,
	    CASE
 	        WHEN e.salary >= 50000 THEN 'A'
	        WHEN e.salary >= 30000 THEN 'B'
	        ELSE 'C'
	        END AS grade
            FROM empl e JOIN jobs j ON e.job_id = j.job_id
            JOIN depart d ON e.department_id = d.department_id;

-- QUES10) Display the names and hire date for all employees who were hired before their 
           managers along withe their manager names and hire date. Label the columns as 
           Employee name, emp hire date,manager name,man hire date?

-- ANS) SELECT emp.last_name AS "Employee name", emp.hire_date AS "emp hire date",
        mgr.last_name AS "Manager name", mgr.hire_date AS "man hire date"
		FROM employees emp
        JOIN employees mgr ON emp.manager_id = mgr.employee_id
		WHERE emp.hire_date < mgr.hire_date;

								   
					DATABASE NAME : ADVENTURE WORKS PAGE 5(33)
                                   
-- SINGLE LINE COMMENT
-- IN  THIS PAGE WE SOLVING THIS QUERY BY USING  LEFT JOIN, GROUP BY, SUM AND EXTRACT.


-- QUES1) Write a query to display employee numbers and employee name (first name, last name) 
          of all the sales employees who received an amount of 2000 in bonus.*/

-- ANS) SELECT e.employee_id, e.first_name || ' ' || e.last_name AS employee_name FROM empl e
		JOIN job_history jh ON e.employee_id = jh.employee_id
		JOIN jobs j ON jh.job_id = j.job_id
        WHERE j.job_title = 'Sales Representative' AND jh.bonus = 2000;

-- QUES2) Fetch address details of employees belonging to the state CA. If address is nul, 
          provide default value N/A?

-- ANS) SELECT e.employee_id, COALESCE(a.address, 'N/A') AS address,
        COALESCE(a.city, 'N/A') AS city,COALESCE(a.state, 'N/A') AS state,
        COALESCE(a.country, 'N/A') AS country,COALESCE(a.postal_code, 'N/A') AS postal_code
        FROM employees e LEFT JOIN addresses a ON e.address_id = a.address_id 
        WHERE a.state = 'CA' OR a.state IS NULL;

-- QUES3) Write a query that displays all the products along with the Sales Orderl D even if
		  an order has never been placed for that product?
 
-- ANS) SELECT p.product_id, p.product_name, so.order_id AS Sales_Order_ID FROM products p
        LEFT JOIN sales_orders so ON p.product_id = so.product_id;

-- QUES4) Find the subcategories that have at least two different prices less than $15.

-- ANS) SELECT subcategory_id FROM 
		(SELECT subcategory_id, price FROM products WHERE price < 15) AS sub_prices
		GROUP BY subcategory_id
		HAVING COUNT(DISTINCT price) >= 2;

-- QUES5) Write a query to display employees and their manager details. Fetch employee id, 
          employee first name, and manager id, manager name.  
       B) Display the employee id and employee name of employees who do not have manager?

-- ANS) SELECT e.employee_id AS employee_id,
		e.first_name AS employee_first_name,
        m.employee_id AS manager_id,
        m.first_name || ' ' || m.last_name AS manager_name
        FROM empl e LEFT JOIN employees m ON e.manager_id = m.employee_id;

-- QUES6) Display the names of all products of a particular subcategory 15 and the names of their 
          vendors? 
	   B) Find the products that have more than one vendor?

-- ANS) SELECT product_id,COUNT(DISTINCT vendor_id) AS num_vendors FROM products
		GROUP BY product_id HAVING COUNT(DISTINCT vendor_id) > 1;

-- QUES7) Find all the customers who do not belong to any store?

-- ANS) SELECT c.* FROM customers c
        LEFT JOIN stores s ON c.customer_id = s.customer_id
		WHERE s.customer_id IS NULL;

-- QUES8) Find sales prices of product 718 that are less than the list price recommended 
          for that product?

-- ANS) SELECT sales_price FROM products
        WHERE product_id = 718 AND sales_price < list_price;

-- QUES9) Display product number, description and sales of each product in the year 2001? 
 
-- ANS)  SELECT p.product_number, p.description, s.sales FROM products p
		 JOIN sales s ON p.product_id = s.product_id
		 WHERE EXTRACT(YEAR FROM s.sales_date) = 2001;

-- QUES10) Build the logic on the above question to extract sales for each category by year. 
           Fetch Product Name, Sales_2001, Sales_2002, Sales _2003?

--ANS) SELECT p.product_name,
       SUM(CASE WHEN EXTRACT(YEAR FROM s.sales_date) = 2001 THEN s.sales ELSE 0 END) AS Sales_2001,
       SUM(CASE WHEN EXTRACT(YEAR FROM s.sales_date) = 2002 THEN s.sales ELSE 0 END) AS Sales_2002,
       SUM(CASE WHEN EXTRACT(YEAR FROM s.sales_date) = 2003 THEN s.sales ELSE 0 END) AS Sales_2003
       FROM products p JOIN sales s ON p.product_id = s.product_id
       GROUP BY p.product_name;

                                
                                
						DATABASE NAME HR PAGE 6(34)

-- SINGLE LINE COMMENT 
-- IN THIS PAGE WE SOLVING THIS QUERY BY USING LIMITAND UNION FUNTION .


-- QUES1) Write a query to display the last name and hire date of any employee in the same 
          department as SALES?

-- ANS) SELECT last_name, hire_date FROM employees
        WHERE department = (SELECT department FROM employees 
        WHERE department = 'SALES' LIMIT 1);

-- QUES2) Create a query to display the employee numbers and last names of all employees who 
		  eam more than the average salary. Sort the results in ascending order of salary?

-- ANS) SELECT employee_number, last_name FROM employees
		WHERE salary > (SELECT AVG(salary) FROM employees) ORDER BY salary ASC;

-- QUES3) Write a query that displays the employee numbers and last names of all employees who 
		 work in a department with any employee whose last name contains a' ?

-- ANS) SELECT employee_number, last_name FROM employees
        WHERE department IN (SELECT department FROM employees
        WHERE last_name LIKE '%u%') ORDER BY last_name;

-- QUES4) Display the last name, department number, and job ID of all employees whose 
          department location is ATLANTA/

-- ANS) SELECT e.last_name, d.department_number, e.job_id FROM employees e
        JOIN departments d ON e.department_id = d.department_id
        JOIN locations l ON d.location_id = l.location_id
		WHERE l.location_name = 'ATLANTA';

-- QUES5) Display the last name and salary of every employee who reports to FILLMORE.*/

-- ANS) SELECT e.last_name, e.salary FROM employees e
        JOIN employees manager ON e.manager_id = manager.employee_id
		WHERE manager.last_name = 'FILLMORE';

-- QUES6) Display the depatment number, last name, and job ID for every employee in the 
          OPERATIONS department?

-- ANS) SELECT d.department_number, e.last_name, e.job_id FROM employees e
        JOIN departments d ON e.department_id = d.department_id
        WHERE d.department_name = 'OPERATIONS';

-- QUES7) Modify the above query to display the employee numbers, last names, and salaries of all 
          employees who eam more than the average salary and who work in a department with 
          any employee with a 'u'in their name?

-- ANS) SELECT e.employee_number, e.last_name, e.salary FROM employees e
        WHERE e.salary > (SELECT AVG(salary) FROM employees)
        AND e.department_id IN (SELECT department_idFROM employees
        WHERE last_name LIKE '%u%');

--QUES8) Display the names of all employees whose job title is the same as anyone in the sales 
		 dept?

-- ANS)  SELECT e.last_name FROM employees e
         WHERE e.job_title IN (SELECT DISTINCT e2.job_title 
         FROM employees e1 JOIN employees e2 ON e1.job_title = e2.job_title
         WHERE e1.department_id = (SELECT department_idFROM departments
         WHERE department_name = 'Sales'));

-- QUES9) Write a compound query to produce a list of employees showing raise percentages, 
          employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise, 
		  employees in department 2 are given a 10% raise, employees in departments 4 and 5 are    
          jven a 15% raise, and enployees in department 6 are not given a raise?

-- ANS)  Employees in department 1 and 3 (5% raise)
		 SELECT employee_id, salary, 5 AS raise_percentage
		 FROM employees
         WHERE department_id IN (1, 3)
         UNION ALL
    --Employees in department 2 (10% raise)
         SELECT employee_id, salary, 10 AS raise_percentage
		 FROM employees
         WHERE department_id = 2
         UNION ALL
    -- Employees in departments 4 and 5 (15% raise)
         SELECT employee_id, salary, 15 AS raise_percentage
         FROM employees
         WHERE department_id IN (4, 5)
         UNION ALL
     -- Employees in department 6 (no raise)
        SELECT employee_id, salary, 0 AS raise_percentage
        FROM employees
        WHERE department_id = 6;

-- QUES10) Write a query to display the top three earners in the EMPLOYEES table. Display their last 
           names and salaries?

-- ANS) SELECT last_name, salary FROM employees
        ORDER BY salary DESC LIMIT 3;

-- QUES11) Display the names of all employees with their salary and commission earmed.  
		   Employees with a null commission should have O in the commission colunn?

-- ANS) SELECT last_name, salary, COALESCE(commission, 0) AS commission_earned
        FROM employees;

-- QUES12) Display the Managers (narne) with top three salaries along with their salaries and 
		   department information?

--ANS) SELECT m.last_name AS manager_name, e.salary, d.department_name
       FROM employees e JOIN employees m ON e.manager_id = m.employee_id
       JOIN departments d ON e.department_id = d.department_id
	   WHERE e.job_id LIKE '%MAN%' -- Assuming the job_id for managers contains 'MAN'
       ORDER BY e.salary DESC LIMIT 3;

                                   
                                   
							DATA FUNCTION PAGE 7 (35) 

-- SINGLE LINE COMMENT
-- IN THIS PAGE WE SOLVING THIS QUERY BY USING DATE_FORMAT, CONCAT.


-- QUES1) Find the date difference between the hire date and resignation date for all the 
          employees. Display in no. of days, months and year(1 year 3 months 5 days). 
          Emp ID Hire Date Resignation Date? 
	   1 //200o 7/1o/2013 
       2 4/12/2003 3/8/2017 
       3 22/9/2012 21/6/2015 
       4 13/4/2015 NULL 
       5 03/06/2016 NULL 
       6 08/08/2017 NULL 
       7 13/11/2016 NULL   */     


-- ANS)   SELECT Emp_ID, Hire_Date, Resignation_Date,
          CONCAT(FLOOR(DATEDIFF(Resignation_Date, Hire_Date) / 365), ' years ',
          FLOOR((DATEDIFF(Resignation_Date, Hire_Date) % 365) / 30), ' months ',
          (DATEDIFF(Resignation_Date, Hire_Date) % 365) % 30, ' days'
          ) AS Time_Difference FROM Employees;
               
-- QUES2) Format the hire date as mm/dd/yyyy(o9/22/20o3) and resignation 
          date as mon dd, ?                       
                        
-- ANS) SELECT Emp_ID, 
        DATE_FORMAT(Hire_Date, '%m/%d/%Y') AS Formatted_Hire_Date, 
        DATE_FORMAT(Resignation_Date, '%b %d, %Y') AS Formatted_Resignation_Date,
		CONCAT(FLOOR(DATEDIFF(Resignation_Date, Hire_Date) / 365), ' years ',
        FLOOR((DATEDIFF(Resignation_Date, Hire_Date) % 365) / 30), ' months ',
        (DATEDIFF(Resignation_Date, Hire_Date) % 365) % 30, ' days') AS Time_Difference
        FROM Employees;

--QUES3) Calcuate experience of the employee till date in Years and months
         (example 1 year and 3 months)?

-- ANS) SELECT Emp_ID, 
        CONCAT(FLOOR(DATEDIFF(NOW(), Hire_Date) / 365), ' years ',
		FLOOR((DATEDIFF(NOW(), Hire_Date) % 365) / 30), ' months') AS Experience
		FROM Employees;


# Use Getdate() as input date for the below three questions. 
-- QUES4) Display the count of days in the previous quarter?

-- ANS) SELECT DATEDIFF(DAY, DATEADD(QUARTER, DATEDIFF(QUARTER, 0, GETDATE()) - 1, 0), 
	    DATEADD(DAY, -1, DATEADD(QUARTER, DATEDIFF(QUARTER, 0, GETDATE()), 0))) + 1
		AS DaysInPreviousQuarter;

-- QUES5) Fetch the previous Quarter's second week's first day's date

-- ANS) SET @StartOfPreviousQuarter = DATEADD(QUARTER, DATEDIFF(QUARTER, 0, GETDATE()) - 1, 0);
        SET @EndOfPreviousQuarter = DATEADD(DAY, -1, DATEADD(QUARTER,
		DATEDIFF(QUARTER, 0, GETDATE()), 0));
        SET @SecondWeekFirstDay = DATEADD(WEEK, 1, DATEADD(DAY, 1 - DATEPART
        (WEEKDAY, DATEADD(DAY, 1, @StartOfPreviousQuarter)), @StartOfPreviousQuarter));
		 SELECT @SecondWeekFirstDay AS PreviousQuarterSecondWeekFirstDay;

-- QUES6) Fetch the financial year's 15th week's dates (Format: Mon DD YYYY)

-- ANS)  DECLARE @start_date DATE;
         DECLARE @end_date DATE;

      -- Assuming financial year starts on April 1st
         SET @start_date = DATEFROMPARTS(YEAR(GETDATE()), 4, 1);
         SET @end_date = DATEADD(YEAR, 1, @start_date);

      -- Get the 15th week's dates
         WITH Weeks AS (
         SELECT @start_date AS start_of_year
         UNION ALL
         SELECT DATEADD(WEEK, 1, start_of_year)
         FROM Weeks
		 WHERE start_of_year < @end_date
         )
         SELECT 
         DATEADD(DAY, 1, start_of_year) AS Monday,
         DATEADD(DAY, 2, start_of_year) AS Tuesday,
         DATEADD(DAY, 3, start_of_year) AS Wednesday,
         DATEADD(DAY, 4, start_of_year) AS Thursday,
         DATEADD(DAY, 5, start_of_year) AS Friday,
         DATEADD(DAY, 6, start_of_year) AS Saturday,
         DATEADD(DAY, 7, start_of_year) AS Sunday
         FROM Weeks
         WHERE DATEPART(WEEK, start_of_year) = 15;

-- QUES7) Find out the date that corresponds to the last Saturday of January, 
          2015 using with clause?

-- ANS) SELECT CAST('2015-01-01' AS DATE) AS Date -- Start from the first day of January 2015 
		UNION ALL SELECT DATEADD(DAY, 1, Date)  
		FROM Calendar WHERE MONTH(Date) = 1 -- Select dates only from calender
        FROM Calendar
        WHERE DATENAME(WEEKDAY, Date) = 'Saturday'; -- Filter only Saturdays

		 # Use Airport database for the below two question:

-- QUES8) Find the number of days elapsed between first and last flights of a passenger.

-- ANS) SELECT PassengerID,DATEDIFF(DAY, MIN(FlightDate), MAX(FlightDate)) AS DaysElapsed
		FROM Flights GROUP BY PassengerID;

-- QUES9) Find the total duration in minutes and in seconds of the flight from Rostov
          to Moscow?
 
-- ANS)   SELECT SUM(DATEDIFF(MINUTE, DepartureTime, ArrivalTime)) AS TotalMinutes,
          SUM(DATEDIFF(SECOND, DepartureTime, ArrivalTime)) AS TotalSeconds
          FROM Flights
		  WHERE DepartureAirport = 'Rostov' AND ArrivalAirport = 'Moscow';


























































 
 
 
 
 
 
 
 
 
 



























































 
 
 
 
