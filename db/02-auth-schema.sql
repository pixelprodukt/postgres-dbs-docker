\c "auth";

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255),
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS roles (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS users_roles (
    user_id UUID,
    role_id BIGINT,
    CONSTRAINT fk_userId FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_roleId FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE
);

-- sample data
-- insert roles ADMIN and USER
INSERT INTO roles (name, description)
VALUES
    ('ADMIN', 'Berechtigung für einen Administrator.'),
    ('USER', 'Berechtigung für einen Benutzer.');

-- insert sample user data
INSERT INTO users (id, name, email, password, created_at, updated_at)
VALUES 
    ('080259ea-770d-4866-b023-d75cbbca6637', 'John Doe', 'john.doe@example.com', crypt('password123', gen_salt('bf')), NOW(), NOW()),
    ('34e230a6-3e4c-49b4-abc4-a78e10ad227a', 'Jane Smith', 'jane.smith@example.com', crypt('securepass456', gen_salt('bf')), NOW(), NOW()),
    ('64147f66-d716-4a09-9685-d6b991072391', NULL, 'alex.jones@example.com', crypt('pass789', gen_salt('bf', 10)), NOW(), NOW()),
    ('71f21c2f-9d44-4093-9448-cbb29810cc4c', 'Emily Brown', 'emily.brown@example.com', crypt('mypassword101', gen_salt('bf')), NOW(), NOW());

-- connect some users to a role
INSERT INTO users_roles (user_id, role_id)
VALUES (
    (SELECT id FROM users WHERE email = 'john.doe@example.com'),
    (SELECT id FROM roles WHERE name = 'ADMIN')
),
(
    (SELECT id FROM users WHERE email = 'jane.smith@example.com'),
    (SELECT id FROM roles WHERE name = 'USER')
);