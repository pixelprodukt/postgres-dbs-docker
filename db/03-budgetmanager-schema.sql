\c "budgetmanager";

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE IF NOT EXISTS expenses (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    amount NUMERIC(12,2) NOT NULL CHECK (amount > 0), -- Max 999,999,999.99
    description VARCHAR(255),
    spent_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS budget_limits (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    type VARCHAR(20) NOT NULL CHECK (type IN ('global', 'monthly', 'category')), -- category is for later use when categories get implemented
    amount NUMERIC(12, 2) NOT NULL CHECK (amount >= 0),
    year_month DATE UNIQUE,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- sample data
INSERT INTO expenses (user_id, amount, spent_at, created_at, updated_at)
VALUES 
    ('080259ea-770d-4866-b023-d75cbbca6637', 89.90, NOW(), NOW(), NOW()),
    ('080259ea-770d-4866-b023-d75cbbca6637', 103.27, NOW(), NOW(), NOW()),
    ('080259ea-770d-4866-b023-d75cbbca6637', 31.26, NOW(), NOW(), NOW()),
    ('34e230a6-3e4c-49b4-abc4-a78e10ad227a', 12.50, NOW(), NOW(), NOW()),
    ('34e230a6-3e4c-49b4-abc4-a78e10ad227a', 8.12, NOW(), NOW(), NOW());

INSERT INTO budget_limits (user_id, type, amount, created_at, updated_at)
VALUES ('080259ea-770d-4866-b023-d75cbbca6637', 'global', 500.00, NOW(), NOW());