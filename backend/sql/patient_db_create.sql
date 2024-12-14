-- Enable UUID generation for PostgreSQL
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Lookup table for user roles
CREATE TABLE roles (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE NOT NULL
);

-- Lookup table for genders
CREATE TABLE genders (
    gender_id SERIAL PRIMARY KEY,
    gender_name VARCHAR(10) UNIQUE NOT NULL
);

-- Lookup table for appointment and billing statuses
CREATE TABLE statuses (
    status_id SERIAL PRIMARY KEY,
    status_name VARCHAR(20) UNIQUE NOT NULL
);

-- Users table (stores information about system users)
CREATE TABLE users (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

