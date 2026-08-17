-- 1. Display all employees
SELECT * FROM EMPLOYEES;
-- 2. Display employee names and salaries
SELECT employee_name, salary FROM employees;
-- 3. Find employees earning more than 50,000
SELECT * FROM employees WHERE salary > 50000;
-- 4. Find employees hired after January 1, 2024
SELECT * FROM employees WHERE hire_date > '2024-01-01';
-- 5. Display employees from department 10
SELECT * FROM employees WHERE department_id = 10;
-- 6. Sort employees by salary
SELECT * FROM employees ORDER BY department_id DESC, salary DESC;
-- 7. Display all departments
SELECT * FROM departments;
-- 8. Find a particular department
SELECT * FROM departments WHERE department_id = 4;

SELECT ucase(employee_name) FROM employees;

SELECT ucase(mid(employee_name, 1, 3)) FROM employees;

SELECT round(salary, 1) FROM employees;

SELECT employee_name, date_format(hire_date, '%d-%m-%y') FROM employees;

-- how many employees are working

SELECT count(employee_id) FROM employees;

-- employee with highest salary

SELECT max(salary) AS 'Highest Salary' FROM employees;

-- average employee salary

SELECT avg(salary) AS 'Average Salary' FROM employees;

-- find the count of employees in each department
SELECT department_id, count(employee_id) FROM employees group by department_id;

-- find how many orders each customer has placed
SELECT * FROM orders;

SELECT customer_id, count(order_id) FROM orders group by customer_id;
-- Find the total order amount for each customer.
SELECT customer_id, sum(total_amount) FROM orders GROUP BY customer_id;
--  Find the number of customers in each city.
SELECT city, count(customer_id) FROM customers GROUP BY city;

-- number of products in each category
SELECT category, count(product_id) FROM products GROUP BY category;

-- the costliest product in each category
SELECT category, max(price) FROM products GROUP BY category;

-- the day when least orders were placed
SELECT order_date, count(*) FROM orders GROUP BY order_date ORDER BY count(*) ASC LIMIT 1;

SELECT * FROM products;

-- find count of customers city wise in each state
SELECT state, city, count(customer_id) FROM customers group by state, city;
SELECT city, count(customer_id) FROM customers group by city;

--  TN    Chennai   2
--  TN    Trichy    3
--  TN    Madurai   1
--  KL    Trivandrum 4
--  KL    Allepy     2

-- Show departments that have more than 2 employees.
SELECT department_id, count(employee_id) FROM employees GROUP BY department_id HAVING count(employee_id) > 2;

-- Show departments where the average salary is greater than 70000.
SELECT department_id, avg(salary) FROM employees group by department_id having avg(salary) > 70000;

 -- Show customers whose total order amount is greater than 800.
SELECT customer_id, SUM(total_amount) FROM orders GROUP BY customer_id HAVING sum(total_amount) > 800;

-- Q12. Show cities having more than 1 customer.
SELECT city, count(customer_id) FROM customers GROUP BY city HAVING count(customer_id) > 1 ; 

-- Q13. Show customers who placed at least 2 orders.
SELECT customer_id, count(order_id) FROM orders GROUP BY customer_id HAVING count(order_id) >= 2;

-- Q14. Show product categories whose average price is greater than 100.
SELECT category, avg(price) FROM products GROUP BY category HAVING avg(price) > 100;

-- Q15. Display employee name and department name.
select * from employees;
select * from departments;
select employee_name, department_name from employees, departments;
-- theta style/old style
select employee_name, department_name from employees, departments where employees.department_id = departments.department_id;
-- new style
select e.employee_name, d.department_name from employees e join departments d on e.department_id = d.department_id;

-- Q16. Display customer name, order ID, and order amount.
select c.customer_name, o.order_id, o.total_amount 
		from customers c 
        inner join orders o 
        on c.customer_id = o.customer_id;
-- Q17. Display order ID, product name, and quantity.
select o.order_id, p.product_name, oi.quantity 
			from orders o 
            inner join order_items oi on o.order_id = oi.order_id
            inner join products p on oi.product_id = p.product_id;
            
-- Q18. Display customer name and the total amount of each order.
select c.customer_name, sum(o.total_amount) 
		from customers c 
        inner join orders o on c.customer_id = o.customer_id
        group by o.customer_id;

-- Q19. Display employees earning more than 70000 along with their department name.
select e.employee_id, e.employee_name, e.salary, d.department_name 
		from employees e inner join departments d on e.department_id = d.department_id
        where e.salary > 70000;
        
-- Q20. Find total sales made by each customer.
select c.customer_name, c.customer_id, sum(o.total_amount) 
					from customers c 
                    join orders o 
                    on c.customer_id = o.customer_id
                    group by o.customer_id;

-- Q21. Find the number of orders placed by each customer.
select c.customer_name, c.customer_id, count(o.order_id)
					from customers c 
                    join orders o 
                    on c.customer_id = o.customer_id
                    group by o.customer_id;
-- Q22. Find total sales for each city.
select c.city, count(o.order_id) 
			from customers c 
            join orders o
            on c.customer_id = o.customer_id
            group by c.city;
-- Q23. Find the average order amount for each city.
select c.city, avg(o.total_amount) 
			from customers c 
            join orders o
            on c.customer_id = o.customer_id
            group by c.city;
-- Q24. Find total quantity sold for each product.
select product_id, sum(quantity) from order_items group by product_id; 

-- Q25. Find total quantity sold for each product category.
select p.category, sum(oi.quantity) 
			from products p
            join order_items oi
            on p.product_id  = oi.product_id
            group by p.category;
-- display employees with salary greater than 60000
select * from employees where salary > 60000;    
-- display employees with salary greater than average salary
select * from employees where salary > (select avg(salary) from employees);
            
-- Q26. Find the department with the highest average salary.
select department_id, avg(salary) from employees group by department_id having avg(salary) = 
(select avg(salary) from employees group by department_id order by avg(salary) desc limit 1);

-- Q27. Find customers whose total purchases exceed 700.
select customer_id, sum(total_amount) from orders group by customer_id having sum(total_amount) > 700;

-- ============================================================
-- PART E: LEFT JOIN PRACTICE
-- ============================================================

-- Q28. Display all customers and their orders, including customers
--      who have not placed an order.
select c.customer_id, c.customer_name, o.order_id, o.order_date, o.total_amount
			from customers c
            left join orders o
            on c.customer_id  = o.customer_id;
-- Q29. Display all departments and employee counts, including
--      departments with zero employees.
select d.department_id, count(e.employee_id)
		from employees e 
        right join departments d
        on e.department_id = d.department_id
        group by d.department_id;

select * from employees;
select * from customers;
        
-- Q30. Find customers who have never placed an order.
select c.customer_id, c.customer_name, o.order_id, o.order_date, o.total_amount
			from customers c
            left join orders o
            on c.customer_id  = o.customer_id
            where o.order_id is null;
-- ============================================================
-- PART F: SELF JOIN PRACTICE
-- ============================================================
select * from employees;
-- Q31. Display each employee and their manager's name.
select a.employee_id, a.employee_name, b.employee_id as manager_id, b.employee_name as manager_name
			from employees a
            inner join employees b
            on a.manager_id = b.employee_id;
-- Q32. Display employee name, manager name, and department name.

-- Part A — Subqueries
-- Q1

-- Find all employees whose salary is greater than the average salary of all employees.
select * from employees where salary > (select avg(salary) from employees);

-- Q2

-- Find the employee(s) who have the highest salary.
select employee_id, employee_name from employees where salary = (select max(salary) from employees);
-- Q3

-- Find all employees who work in the IT department.
select d.department_id, d.department_name, e.employee_id, e.employee_name
		from employees e
        inner join departments d
        on e.department_id = d.department_id
        where d.department_name = 'IT';
        
-- Q4

-- Find employees who earn more than the average salary of the IT department.
select employee_id, employee_name 
			from employees 
            where salary > 
				(select avg(salary) 
							from employees 
                            where department_id = 
									(select department_id 
											from departments 
                                            where department_name = 'IT'));

-- Q5

-- Find employees who earn the same salary as John.
select * from employees where salary = (select salary from employees where employee_name = 'David');

-- Q6

-- Find employees who work in the same department as David.
select * from employees where department_id = (select department_id from employees where employee_name = 'David');
-- Q7

-- Find employees whose salary is greater than every employee in the HR department.
select * from employees where salary > (select max(salary) from employees where department_id = (select department_id from departments where department_name= 'HR' ));

-- Q8

-- Find employees whose salary is greater than at least one employee in the HR department.
select * from employees where salary > (select min(salary) from employees where department_id = (select department_id from departments where department_name= 'HR' ));

-- Q9

-- Find departments that have at least one employee.
select * from departments;
select department_id, count(employee_id) from employees group by department_id;
-- Q10

-- Find departments that have no employees.
select d.department_id, d.department_name       
		from departments d 
        left join employees e
        on d.department_id = e.department_id
        where e.department_id is null;
-- Q11

-- Find the second-highest salary in the company.
select * from employees;
select max(salary) from employees where salary < (select max(salary) from employees where salary);
-- Q12

-- Find employees who earn more than their own department's average salary.

select * from employees;
select avg(e2.salary) 
                    from employees e2 
                    group by e2.department_id;
-- correlated subqueries
select e1.employee_name, e1.salary, e1.department_id
			from employees e1 
            where salary > 
					(select avg(e2.salary) 
                    from employees e2 
                    where e2.department_id = e1.department_id);
-- Q13

-- Find the highest-paid employee in each department.
select * from employees where (salary, department_id) IN (select max(salary), department_id from employees group by department_id);

select max(salary) from employees group by department_id;
-- Q14

-- Find employees who are not managers.
select * from employees;
select employee_id, employee_name 
	from employees 
    where employee_id 
    not in (select manager_id from employees where manager_id is not null);

select manager_id from employees where manager_id is not null;

-- Q15

-- Find departments whose average salary is greater than the company's overall average salary.
select department_id, avg(salary) from employees group by department_id having avg(salary) > (select avg(salary) from employees);
select avg(salary) from employees; 
-- Part B — Set Operations
-- Q16

-- Display all employee names and customer names together using UNION.
select employee_name from employees
union
select customer_name from customers;
-- Q17

-- Display all employee names and customer names together using UNION ALL, including duplicates.
select employee_name from employees
union all
select customer_name from customers;
-- Q18

-- Find names that exist in both the employees and customers tables.
select employee_name from employees
INTERSECT
select customer_name from customers;
-- Q19

-- Find employee names that do not appear in the customers table.
select e.employee_name 
	from employees e 
    left join customers c 
    on e.employee_name = c.customer_name 
    where c.customer_name is null;

select employee_name from employees
except
select customer_name from customers;

select employee_name from employees where employee_name not in (select customer_name from customers);

-- Q20

-- Display employees from department 10 and department 20 using UNION.
select * from employees where department_id = 1
union
select * from employees where department_id = 2;
