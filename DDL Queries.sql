-- Employee table creation

CREATE TABLE employee (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_name VARCHAR(50),
    salary INTEGER
);

CREATE TABLE department (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(100)
);


CREATE TABLE sales (
    store_id INTEGER,
    store_name VARCHAR(50),
    product_name VARCHAR(50),
    quantity INTEGER,
    price INTEGER
);


CREATE TABLE employee_history (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_name VARCHAR(50),
    salary INTEGER,
    location VARCHAR(100)
);


