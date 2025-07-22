\c "okh-rdf-etl";

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE IF NOT EXISTS languages (
    id SERIAL PRIMARY KEY,
    code TEXT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS licenses (
    id SERIAL PRIMARY KEY,
    uri TEXT UNIQUE NOT NULL,
    name TEXT,
    is_osi BOOLEAN
);

CREATE TABLE IF NOT EXISTS projects (
    id UUID PRIMARY KEY,
    uri_id TEXT UNIQUE NOT NULL,
    name TEXT,
    description TEXT,
    license TEXT,
    licensor TEXT,
    language TEXT,
    version TEXT,
    documentation_readiness_level TEXT,
    technology_readiness_level TEXT,
    image_url TEXT,
    manifest TEXT,
    source_url TEXT,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

-- Indexes for search and filter
CREATE INDEX idx_projects_name ON projects (name);
CREATE INDEX idx_projects_function ON projects (description);
CREATE INDEX idx_projects_license ON projects (license);
CREATE INDEX idx_projects_licensor ON projects (licensor);
CREATE INDEX idx_projects_version ON projects (version);
CREATE INDEX idx_projects_language ON projects (language);