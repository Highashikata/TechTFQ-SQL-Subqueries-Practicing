-- Insert values into the table
INSERT INTO employee (emp_name, dept_name, salary) VALUES
    ('John Doe', 'IT', 60000),
    ('Jane Smith', 'HR', 55000),
    ('Michael Johnson', 'Sales', 62000),
    ('Emily Brown', 'Marketing', 58000),
    ('David Wilson', 'IT', 65000),
    ('Emma Lee', 'HR', 54000),
    ('James Taylor', 'Sales', 63000),
    ('Olivia Clark', 'Marketing', 59000),
    ('William Anderson', 'IT', 61000),
    ('Sophia Martinez', 'HR', 56000);
	
	
INSERT INTO department (dept_name, location) 
VALUES 
    ('IT', 'New York'),
    ('HR', 'Los Angeles'),
    ('Sales', 'Chicago'),
    ('Marketing', 'San Francisco'),
    ('Finance', 'Boston'),
    ('Operations', 'Seattle'),
    ('Engineering', 'Austin'),
    ('Customer Service', 'Denver'),
    ('Research and Development', 'Atlanta'),
    ('Product Management', 'Miami'),
    ('Quality Assurance', 'Houston'),
    ('Supply Chain', 'Dallas'),
    ('Legal', 'Philadelphia'),
    ('Public Relations', 'Phoenix'),
    ('Administration', 'Washington D.C.');
	
	
-- Insérer des données dans la colonne store_name
INSERT INTO sales (store_id, store_name, product_name, quantity, price) VALUES
    (1, 'Apple Store 1', 'Airpods Pro', 10, 249),
    (1, 'Apple Store 1', 'iPhone 13 Pro', 5, 999),
    (1, 'Apple Store 1', 'Macbook Pro 14', 8, 1999),
    (2, 'Apple Store 2', 'iPhone 12 Pro', 12, 1099),
    (2, 'Apple Store 2', 'Airpods Max', 7, 549),
    (2, 'Apple Store 2', 'iPad Pro 12.9"', 9, 1099),
    (3, 'Apple Store 3', 'iPhone SE', 15, 399),
    (3, 'Apple Store 3', 'Mac Mini', 6, 699),
    (3, 'Apple Store 3', 'Apple Watch Series 7', 10, 399),
    (4, 'Apple Store 4', 'Macbook Air', 11, 999),
    (4, 'Apple Store 4', 'HomePod Mini', 8, 99),
    (4, 'Apple Store 4', 'Apple TV 4K', 7, 179);

	
	
	
-- Check table
select * from employee;
select * from department;
select * from sales;
select * from employee_history;