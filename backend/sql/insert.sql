-- Insert roles
INSERT INTO roles (role_name) VALUES
('admin'),
('doctor'),
('receptionist'),
('accountant');

-- Insert genders
INSERT INTO genders (gender_name) VALUES
('male'),
('female'),
('other');

-- Insert statuses
INSERT INTO statuses (status_name) VALUES
('scheduled'),
('completed'),
('cancelled'),
('pending'),
('paid');

-- Insert permissions
INSERT INTO permissions (permission_name) VALUES
('can_register_patient'),
('can_schedule_appointment'),
('can_view_medical_records'),
('can_generate_reports');

-- Assign permissions to roles
INSERT INTO role_permissions (role_id, permission_id) VALUES
(1, 1), -- Admin: can_register_patient
(1, 2), -- Admin: can_schedule_appointment
(1, 3), -- Admin: can_view_medical_records
(1, 4), -- Admin: can_generate_reports
(2, 2), -- Doctor: can_schedule_appointment
(2, 3), -- Doctor: can_view_medical_records
(3, 1), -- Receptionist: can_register_patient
(3, 2), -- Receptionist: can_schedule_appointment
(4, 4); -- Accountant: can_generate_reports
