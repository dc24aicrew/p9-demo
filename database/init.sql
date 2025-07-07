-- Construction Management System Database Schema

CREATE DATABASE IF NOT EXISTS construction_management;
USE construction_management;

-- Employees table
CREATE TABLE IF NOT EXISTS employees (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    position VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20),
    email VARCHAR(255) UNIQUE,
    daily_wage DECIMAL(10,2) NOT NULL,
    hire_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Projects table
CREATE TABLE IF NOT EXISTS projects (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL,
    description TEXT,
    start_date DATE NOT NULL,
    end_date DATE,
    total_budget DECIMAL(15,2),
    note TEXT,
    revenue DECIMAL(15,2),
    status ENUM('PLANNING', 'ACTIVE', 'COMPLETED', 'CANCELLED') DEFAULT 'PLANNING',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Work shifts table
CREATE TABLE IF NOT EXISTS work_shifts (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    employee_id BIGINT NOT NULL,
    project_id BIGINT NOT NULL,
    work_date DATE NOT NULL,
    shift_type ENUM('FULL_DAY', 'MORNING', 'AFTERNOON') NOT NULL,
    advance_amount DECIMAL(10,2) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE,
    UNIQUE KEY unique_employee_date_shift (employee_id, work_date, shift_type)
);

-- Salary calculations table
CREATE TABLE IF NOT EXISTS salary_calculations (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    employee_id BIGINT NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL,
    total_work_days DECIMAL(5,2) NOT NULL,
    gross_salary DECIMAL(10,2) NOT NULL,
    total_advances DECIMAL(10,2) NOT NULL,
    net_salary DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE,
    UNIQUE KEY unique_employee_month_year (employee_id, month, year)
);

-- Insert sample data
INSERT INTO employees (full_name, position, phone_number, email, daily_wage, hire_date) VALUES
('John Doe', 'Site Manager', '+1234567890', 'john.doe@example.com', 150.00, '2023-01-15'),
('Jane Smith', 'Construction Worker', '+1234567891', 'jane.smith@example.com', 100.00, '2023-02-01'),
('Mike Johnson', 'Electrician', '+1234567892', 'mike.johnson@example.com', 120.00, '2023-01-20');

INSERT INTO projects (project_name, description, start_date, end_date, total_budget, revenue, status) VALUES
('Office Building Construction', 'Construction of a 5-story office building', '2023-01-01', '2024-06-30', 500000.00, 600000.00, 'ACTIVE'),
('Residential Complex', 'Building a residential complex with 20 units', '2023-03-01', '2024-12-31', 800000.00, 950000.00, 'ACTIVE'),
('Bridge Renovation', 'Renovation of the city bridge', '2023-02-15', '2023-08-15', 200000.00, 240000.00, 'COMPLETED');