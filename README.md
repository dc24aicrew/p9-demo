# Construction Management System

## About The Project
A full-stack web application to manage employees and projects in a construction company.

**Frontend**: ReactJS using JavaScript ES6  
**Backend**: Java using Spring Framework  
**Database**: MariaDB

## Project Structure
```
├── backend/           # Spring Boot application
│   ├── src/
│   │   ├── main/java/com/construction/management/
│   │   └── test/
│   ├── pom.xml
│   └── .gitignore
├── frontend/          # React application
│   ├── src/
│   ├── public/
│   ├── package.json
│   └── .gitignore
├── database/          # Database scripts
│   └── init.sql
├── docker-compose.yml # MariaDB setup
└── README.md
```

## Features

### Employee Management
CRUD operations for employees with:
- Full name, position, phone number, email
- Daily wage and hire date

### Project Management  
CRUD operations for projects with:
- Project name, description, start date, end date
- Total budget, notes, revenue

### Work Calendar
- Employee calendar for work shifts (full day, morning, afternoon)
- Work location selection from active projects
- Advance amount tracking per day

### Salary Calculation
- Monthly salary calculation based on working shifts
- Daily wage and advance deductions
- Summary reports

## Getting Started

### Prerequisites
- Java 17+
- Node.js 18+
- Maven 3.6+
- Docker (for MariaDB)

### Database Setup
```bash
# Start MariaDB with Docker Compose
docker-compose up -d
```

### Backend Setup
```bash
cd backend
mvn clean install
mvn spring-boot:run
```
The backend API will be available at `http://localhost:8080/api`

### Frontend Setup
```bash
cd frontend
npm install
npm start
```
The React app will be available at `http://localhost:3000`

### Running Tests
```bash
# Backend tests
cd backend
mvn test

# Frontend tests  
cd frontend
npm test
```

### Building for Production
```bash
# Backend
cd backend
mvn clean package

# Frontend
cd frontend
npm run build
```

## API Documentation
The backend provides RESTful APIs organized with proper separation of concerns. API endpoints will be documented as development progresses.
