-- ====================
-- Seed Data
-- ====================

-- Insert Roles
INSERT INTO roles (role_name) VALUES
('admin'),
('doctor'),
('receptionist'),
('accountant');

-- Insert Genders
INSERT INTO genders (gender_name) VALUES
('male'),
('female'),
('other');

-- Insert Statuses
INSERT INTO statuses (status_name) VALUES
('scheduled'),
('completed'),
('cancelled'),
('pending'),
('paid');

-- Insert Permissions
INSERT INTO permissions (permission_name) VALUES
('can_register_patient'),
('can_schedule_appointment'),
('can_view_medical_records'),
('can_generate_reports');

-- Assign Permissions to Roles
INSERT INTO role_permissions (role_id, permission_id) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), -- Admin
(2, 2), (2, 3),                 -- Doctor
(3, 1), (3, 2),                 -- Receptionist
(4, 4);                         -- Accountant
