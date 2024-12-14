-- Enable UUID generation for PostgreSQL
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Lookup table for user roles
CREATE TABLE roles (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE NOT NULL
);