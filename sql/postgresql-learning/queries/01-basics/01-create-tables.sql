-- Learning: Basic Table Creation
-- This file teaches you how to create tables with different data types

-- Create a simple users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,                    -- Auto-incrementing primary key
    username VARCHAR(50) UNIQUE NOT NULL,     -- Unique username, max 50 chars
    email VARCHAR(100) UNIQUE NOT NULL,       -- Unique email, max 100 chars
    age INTEGER CHECK (age >= 0),             -- Age with constraint
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Auto-set timestamp
    is_active BOOLEAN DEFAULT TRUE            -- Boolean with default value
);

-- Create a posts table with foreign key
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,  -- Foreign key
    title VARCHAR(200) NOT NULL,
    content TEXT,                             -- Unlimited text
    published_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create a categories table
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Create a junction table for many-to-many relationship
CREATE TABLE post_categories (
    post_id INTEGER REFERENCES posts(id) ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories(id) ON DELETE CASCADE,
    PRIMARY KEY (post_id, category_id)        -- Composite primary key
);

-- Learning Notes:
-- 1. SERIAL = Auto-incrementing integer
-- 2. REFERENCES = Foreign key constraint
-- 3. ON DELETE CASCADE = Automatically delete related records
-- 4. CHECK = Data validation constraint
-- 5. DEFAULT = Set default value if not provided 