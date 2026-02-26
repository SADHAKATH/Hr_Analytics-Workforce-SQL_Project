/*
Normalization in MySQL is the process of 
organizing database tables to reduce 
data redundancy - ( repitation of data in different table in db)
, eliminate anomalies - (, 
and improve data integrity - 
(correctness of the data or data reliabliity). 
It involves breaking down large tables 
into smaller, related tables 
and establishing relationships between them.
*/
/* types of normalization:
-- 1 NF - each cell should contain only one value ( atomic value)
-- 2NF - should be in 1NF and only 
have one primary key should be in a table
-- 3 NF - should be in 1nf and 2 nf , the non-key columns should
not be dependant of each other.
*/

/*
QUERY OPTIMIZATION - INCREASING THE PERFORMANCE OF THE QUERY/
SPEEDING UP THE DATA RETRIEVAL PROCESS. 
-- 1.DATA SHOULD BE NORMALIZED ( ADHERE TO 1NF,2NF,3NF RULE)
-- 2. USE THE COLUMN NAME INSTEAD OF USING *
-- 3. USE LIMIT STATEMENT TO LIMIT YOUR OUTPUT OR RESULT
-- 4. CREATE A INDEX FOR THE COLUMN 

*/
SELECT EMAIL FROM EMPLOYEES WHERE EMAIL="";
 -- BEFORE CREATING INDEX FOR EMAIL

CREATE INDEX IDX_EMAIL ON EMPLOYEES(EMAIL);




/*
Problems with Unnormalized Data:

Data Redundancy 
- Same information stored multiple times
Update Anomalies 
- Need to update data in multiple places
Insert Anomalies 
- Cannot insert certain data without other data
Delete Anomalies 
- Losing important data when deleting records
Storage Waste 
- Inefficient use of storage space

*/
/*
Normal Forms
First Normal Form (1NF)
Rules:

1. Each column contains atomic 
(indivisible) values
2. No repeating groups or arrays
3. Each row must be unique

*/

CREATE TABLE student_courses_bad (
    student_id INT,
    student_name VARCHAR(50),
    courses VARCHAR(200),  -- Contains multiple values
    phone_numbers VARCHAR(100)  -- Contains multiple phone numbers
);

-- Bad data
INSERT INTO student_courses_bad VALUES 
(1, 'Andrew', 'Math,Physics,Chemistry', '123-456,789-012'),
(2, 'Charlie', 'Biology,Chemistry', '555-123');

-- 1NF Compliant:
CREATE TABLE students_1nf (
    student_id INT,
    student_name VARCHAR(50),
    course VARCHAR(50),
    phone_number VARCHAR(15)
);

INSERT INTO students_1nf VALUES 
(1, 'John', 'Math', '123-456'),
(1, 'John', 'Physics', '123-456'),
(1, 'John', 'Chemistry', '789-012'),
(2, 'Charlie', 'Biology', '555-123'),
(2, 'Charlie', 'Chemistry', '555-123');

/*
Second Normal Form (2NF)
Rules:

1. Must be in 1NF
2. No partial dependencies 
(non-key attributes fully 
depend on the entire primary key)
*/

-- 1NF but not 2NF:
CREATE TABLE student_courses_1nf (
    student_id INT,
    course_id INT,
    student_name VARCHAR(50),
    -- Depends only on student_id
    course_name VARCHAR(50),
    -- Depends only on course_id
    instructor VARCHAR(50),
    -- Depends only on course_id
    grade CHAR(2),
    -- Depends on both student_id and course_id
    PRIMARY KEY (student_id, course_id)
);

-- 2NF Compliant:
-- Students table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

-- Courses table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    instructor VARCHAR(50)
);

-- Enrollments table (junction table)
CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    grade CHAR(2),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

/*
Third Normal Form (3NF)
Rules:
1. Must be in 2NF
2. No transitive dependencies 
(non-key attributes don't depend 
on other non-key attributes)
*/

CREATE TABLE students_2nf (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department_id INT,
    department_name VARCHAR(50),
    -- Depends on department_id, not student_id
    department_head VARCHAR(50)
    -- Depends on department_id, not student_id
);

-- 3NF Compliant:
-- Departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    department_head VARCHAR(50)
);

-- Students table
CREATE TABLE students_3nf (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);


-- Complete Example: E-commerce Database
-- Unnormalized Table:

CREATE TABLE orders_unnormalized (
    order_id INT,
    customer_name VARCHAR(50),
    customer_email VARCHAR(50),
    customer_address VARCHAR(100),
    product_name VARCHAR(50),
    product_price DECIMAL(10,2),
    category_name VARCHAR(50),
    quantity INT,
    order_date DATE
);

-- Normalized Tables (3NF):
-- Categories table
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) UNIQUE
);

-- Products table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50),
    price DECIMAL(10,2),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50),
    email VARCHAR(50) UNIQUE,
    address VARCHAR(100)
);

-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order Items table (junction table)
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    price_at_time DECIMAL(10,2),  -- Price when ordered
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Sample Data:
-- Insert sample data
INSERT INTO categories VALUES (1, 'Electronics'), (2, 'Books');

INSERT INTO products VALUES 
(1, 'Laptop', 999.99, 1),
(2, 'Mouse', 25.99, 1),
(3, 'SQL Guide', 45.00, 2);

INSERT INTO customers VALUES 
(1, 'John Doe', 'john@email.com', '123 Main St'),
(2, 'Jane Smith', 'jane@email.com', '456 Oak Ave');

INSERT INTO orders VALUES 
(1, 1, '2024-01-15'),
(2, 2, '2024-01-16');

INSERT INTO order_items VALUES 
(1, 1, 1, 999.99),  -- John bought 1 laptop
(1, 2, 2, 25.99),   -- John bought 2 mice
(2, 3, 1, 45.00);   -- Jane bought 1 book


/*
Benefits of Normalization

Eliminates Data Redundancy
Improves Data Integrity
Reduces Storage Space
Easier Maintenance
Prevents Update Anomalies

Drawbacks of Normalization

Complex Queries - Requires more JOINs
Performance Impact - More tables to query
Development Complexity - More tables to manage

When to Denormalize
Sometimes you might intentionally 
denormalize for:

Performance reasons (fewer JOINs)
Reporting databases (data warehouses)
Read-heavy applications
Caching strategies

Normalization is a fundamental concept 
in database design that helps create efficient, 
maintainable, and reliable database 
structures while minimizing data 
redundancy and ensuring data integrity.
*/

