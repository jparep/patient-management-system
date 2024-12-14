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
