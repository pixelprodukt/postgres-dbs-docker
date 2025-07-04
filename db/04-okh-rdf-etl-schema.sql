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
    name TEXT,
    function TEXT,
    licensor TEXT,
    version TEXT,
    license_id INTEGER REFERENCES licenses(id),
    language_id INTEGER REFERENCES languages(id),
    source_license TEXT,
    source_license_name TEXT,
    source_license_osi TEXT,
    source_licensor TEXT,
    source_url TEXT,
    readme TEXT,
    technology_readiness_level TEXT,
    technology_readiness_level_label TEXT,
    technology_readiness_level_comment TEXT,
    technology_readiness_level_goal TEXT,
    documentation_readiness_level TEXT,
    documentation_readiness_level_label TEXT,
    documentation_readiness_level_comment TEXT,
    documentation_readiness_level_goal TEXT,
    attestation TEXT,
    doi TEXT,
    std TEXT,
    cpc TEXT,
    tsdc_id TEXT,
    bom_url TEXT,
    manufacturing_instructions TEXT,
    user_manual TEXT,
    mass TEXT,
    outer_dimensions_width TEXT,
    outer_dimensions_height TEXT,
    outer_dimensions_depth TEXT,
    img_url TEXT,
    release_url TEXT,
    normalized_manifest TEXT,
    project_source_url TEXT,
    project TEXT,

    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

-- Indexes for search and filter
CREATE INDEX idx_projects_name ON projects (name);
CREATE INDEX idx_projects_function ON projects (function);
CREATE INDEX idx_projects_licensor ON projects (licensor);
CREATE INDEX idx_projects_version ON projects (version);
CREATE INDEX idx_projects_license_id ON projects (license_id);
CREATE INDEX idx_projects_language_id ON projects (language_id);