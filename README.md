# Healthcare Management System

A professional-grade **Healthcare Management System** designed for managing patients, appointments, medical records, billing, and user roles in a healthcare organization. This project is built using **PostgreSQL** for database management and is suitable for real-world deployment in 2025.

---

## Features

- **File Structure**: Professional organized or strured for effient file management for dev, test, and depolyment
- **User Management**: Supports multiple roles such as admin, doctor, receptionist, and accountant.
- **Patient Records**: Comprehensive patient information storage.
- **Appointment Scheduling**: Easy scheduling with status tracking.
- **Medical Records**: Secure and detailed records for patient treatments.
- **Billing System**: Tracks payments and manages invoices.
- **Role-Based Access Control (RBAC)**: Limits user actions based on roles.

## File Structure

patient-management-system/
├── backend/
│   ├── api/                       # Django REST API app
│   │   ├── __init__.py
│   │   ├── models.py
│   │   ├── serializers.py
│   │   ├── views.py
│   │   ├── urls.py
│   │   └── logic/
│   │       ├── patient_logic.py
│   │       ├── appointment_logic.py
│   │       └── billing_logic.py
│   ├── core/                      # Core Django settings
│   │   ├── __init__.py
│   │   ├── settings.py
│   │   ├── urls.py
│   │   └── wsgi.py
│   ├── manage.py                  # Django management script
│   ├── requirements/              # Python dependencies
│   │   ├── base.txt
│   │   ├── dev.txt
│   │   ├── prod.txt
├── frontend/
│   ├── src/                       # React/Vue/Angular code
│   │   ├── components/
│   │   │   ├── PatientsList.jsx
│   │   │   └── AppointmentForm.jsx
│   │   ├── App.jsx
│   │   └── index.js
│   ├── public/                    # Static assets (index.html, icons, etc.)
│   │   ├── index.html
│   │   └── favicon.ico
│   ├── package.json               # Frontend dependencies
│   ├── tailwind.config.js         # TailwindCSS config
│   └── postcss.config.js          # PostCSS config for Tailwind
├── deployment/
│   ├── docker-compose.yml         # Docker services
│   ├── Dockerfile                 # Backend Dockerfile
│   ├── nginx.conf                 # Nginx config
│   ├── k8s/                       # Kubernetes manifests
│   │   ├── deployment.yaml
│   │   ├── service.yaml
│   │   └── ingress.yaml
│   ├── terraform/                 # Terraform IaC scripts
│   │   ├── main.tf
│   │   └── variables.tf
│   └── .env                       # Environment variables
├── test/
│   ├── backend/                   # Backend unit tests
│   ├── frontend/                  # Frontend unit tests
│   └── integration/               # End-to-end tests
├── .gitignore                     # Ignore unnecessary files
├── README.md                      # Documentation
└── .pre-commit-config.yaml        # Pre-commit hooks

---

## Prerequisites

Before setting up the system, ensure the following are installed:

- **PostgreSQL** 15 or later
- **Docker** (optional, for containerized deployment)
- **pgAdmin** (optional, for database management)

---

## Installation and Setup

### **1. PostgreSQL Installation**

#### Linux
```bash
        sudo apt update
        sudo apt install postgresql postgresql-contrib
```

### MacOS

brew install postgresql

Start PostgreSQL Service
```bash 
        sudo systemctl start postgresql
        sudo systemctl enable postgresql
````
### 2. Database Setup

    Log into PostgreSQL:
```bash
    sudo -i -u postgres
    psql
```
Create the database and user:
```bash
    CREATE DATABASE healthcare_system;
    CREATE USER healthcare_user WITH PASSWORD 'secure_password';
    GRANT ALL PRIVILEGES ON DATABASE healthcare_system TO healthcare_user;
```
Exit PostgreSQL:
```bash
    \q
```
Connect to the database:
```bash
    psql -h localhost -U healthcare_user -d healthcare_system
```

### Schema
Tables

    users: Stores system user details.
    patients: Contains patient records.
    appointments: Tracks patient appointments with doctors.
    medical_records: Maintains treatment history for patients.
    billing: Manages invoices and payments.
    roles_permissions: Defines role-based permissions.

### SQL Table Definitions

Refer to the SQL Tables section for the complete schema.
Deployment Options

### 1. Local Deployment

Run PostgreSQL on your local machine and manage it using tools like pgAdmin.

### 2. Cloud Deployment

Use managed database services like:

    AWS RDS
    Google Cloud SQL
    Azure Database for PostgreSQL

### 3. Dockerized Deployment

Use Docker for containerized deployment:

    Create a docker-compose.yml file:

        version: '3.8'
        services:
        postgres:
            image: postgres:15
            container_name: postgres
            environment:
            POSTGRES_USER: healthcare_user
            POSTGRES_PASSWORD: secure_password
            POSTGRES_DB: healthcare_system
            ports:
            - "5432:5432"
            volumes:
            - postgres_data:/var/lib/postgresql/data

        volumes:
        postgres_data:

Run the containers:
```bash
    docker-compose up -d
```
### Usage
Insert Sample Data
```bash
    INSERT INTO users (first_name, last_name, email, password_hash, role) 
    VALUES ('Alice', 'Smith', 'alice@example.com', 'hashed_password', 'doctor');

    INSERT INTO patients (first_name, last_name, date_of_birth, gender, phone_number, email, address) 
    VALUES ('John', 'Doe', '1985-06-15', 'male', '1234567890', 'john.doe@example.com', '123 Main St');
```
### Queries

    Fetch all patients:
```bash
    SELECT * FROM patients;
```
List all appointments for a doctor:
```bash
    SELECT a.appointment_id, p.first_name || ' ' || p.last_name AS patient_name, 
           a.appointment_date, a.appointment_time, a.status
    FROM appointments a
    JOIN patients p ON a.patient_id = p.patient_id
    WHERE a.doctor_id = 1;
```
#### Maintenance and Security

    Backups: Enable daily backups for disaster recovery.
    Encryption:
        Use SSL/TLS for connections.
        Enable encryption at rest on managed cloud services.
    Role Management:
        Assign minimal privileges to each role.
        Use roles_permissions to control access.

### Future Enhancements

    Add API endpoints for integration with web or mobile applications.
    Implement a reporting module for analytics.
    Enhance RBAC for finer-grained access control.

### Contributing

Contributions are welcome! Please submit a pull request or report issues via GitHub.

### License
This project is licensed under the [MIT License](https://opensource.org/license/mit).
