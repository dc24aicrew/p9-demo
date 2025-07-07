# Development Guide

## Architecture Overview

This is a full-stack application with clear separation between frontend and backend:

### Backend (Spring Boot)
- **Location**: `/backend`
- **Technology**: Java 17, Spring Boot 3.2.0, Spring Data JPA
- **Database**: MariaDB (development), H2 (testing)
- **Port**: 8080
- **Context Path**: `/api`

### Frontend (React)
- **Location**: `/frontend`  
- **Technology**: React 18, JavaScript ES6
- **Port**: 3000 (development)

### Database
- **Production**: MariaDB 10.11 (via Docker Compose)
- **Testing**: H2 in-memory database

## Development Workflow

### 1. Environment Setup
```bash
# Clone the repository
git clone <repository-url>
cd p9-demo

# Start the database
docker-compose up -d

# Terminal 1: Start backend
cd backend
mvn spring-boot:run

# Terminal 2: Start frontend  
cd frontend
npm start
```

### 2. Making Changes

#### Backend Changes
- Java code is in `backend/src/main/java/com/construction/management/`
- Tests are in `backend/src/test/java/`
- Configuration is in `backend/src/main/resources/application.properties`

#### Frontend Changes
- React components are in `frontend/src/`
- Tests are in `frontend/src/` (*.test.js files)

### 3. Testing
```bash
# Backend tests (run from backend/ directory)
mvn test

# Frontend tests (run from frontend/ directory)
npm test
```

### 4. Building
```bash
# Backend build
cd backend && mvn clean package

# Frontend build
cd frontend && npm run build
```

## Database Schema

The application uses the following main entities:

### Employees
- ID, full_name, position, phone_number, email
- daily_wage, hire_date
- Timestamps: created_at, updated_at

### Projects  
- ID, project_name, description
- start_date, end_date, total_budget, revenue, note
- status (PLANNING, ACTIVE, COMPLETED, CANCELLED)
- Timestamps: created_at, updated_at

### Work Shifts
- ID, employee_id (FK), project_id (FK)
- work_date, shift_type (FULL_DAY, MORNING, AFTERNOON)
- advance_amount
- Timestamps: created_at, updated_at

### Salary Calculations
- ID, employee_id (FK), month, year
- total_work_days, gross_salary, total_advances, net_salary
- created_at timestamp

## Next Development Steps

1. **Backend API Implementation**
   - Employee CRUD operations
   - Project CRUD operations  
   - Work shift management
   - Salary calculation logic

2. **Frontend UI Implementation**
   - Employee management table
   - Project management table
   - Work calendar component
   - Salary calculation dashboard

3. **Integration**
   - Connect frontend to backend APIs
   - Implement error handling
   - Add validation
   - Authentication/authorization

## Code Standards

### Backend
- Follow Spring Boot conventions
- Use JPA annotations for entity mapping
- RESTful API design patterns
- Proper exception handling
- Comprehensive testing

### Frontend
- Functional components with hooks
- Proper component organization
- CSS modules or styled-components
- Error boundaries
- Testing with React Testing Library

## Troubleshooting

### Backend Issues
- Check database connection in application.properties
- Ensure MariaDB is running: `docker-compose ps`
- Check logs: `mvn spring-boot:run` output

### Frontend Issues  
- Clear npm cache: `npm cache clean --force`
- Delete node_modules and reinstall: `rm -rf node_modules && npm install`
- Check for port conflicts (default: 3000)

### Database Issues
- Reset database: `docker-compose down -v && docker-compose up -d`
- Check database logs: `docker-compose logs mariadb`