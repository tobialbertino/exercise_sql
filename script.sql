CREATE DATABASE exercise_sql;
USE exercise_sql;


CREATE TABLE role_actors (
    id BIGINT UNSIGNED AUTO_INCREMENT,
    role_name VARCHAR(100),

    PRIMARY KEY(id)
);

CREATE TABLE actors (
    id BIGINT UNSIGNED AUTO_INCREMENT,
    username VARCHAR(100) UNIQUE,
    password VARCHAR(500),
    role_id BIGINT UNSIGNED,
    is_verified BOOLEAN,
    is_active BOOLEAN,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY(id),
    FOREIGN KEY(role_id) REFERENCES role_actors(id) ON DELETE CASCADE
);

CREATE TABLE customers (
    id BIGINT UNSIGNED AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    avatar VARCHAR(100),
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    PRIMARY KEY(id)
);

CREATE TABLE admin_reg (
    id BIGINT UNSIGNED AUTO_INCREMENT,
    admin_id BIGINT UNSIGNED,
    super_admin_id BIGINT UNSIGNED,
    status VARCHAR(100),

    PRIMARY KEY(id),
    FOREIGN KEY(admin_id) REFERENCES actors(id) ON DELETE CASCADE,
    FOREIGN KEY(super_admin_id) REFERENCES actors(id) ON DELETE CASCADE
);

CREATE TABLE authentications (
	token TEXT NOT NULL
);

-- insert role, 1 -> admin, 2 -> super_admin
INSERT INTO role_actors(id, role_name) 
VALUES (1, 'admin'),
(2, 'super_admin');

-- insert super admin, 
-- username: super_admin, 
-- password: password
INSERT INTO actors(id, username, password, role_id, is_verified, is_active) 
VALUES (1, 'super_admin', '$2a$04$e1it1T0mKhWvyvpIvbhMJuACG9qPS8DtV4laZnEpo6FPMTSk/CH1m', 2, 1, 1);


-- set access
-- create super_admin
CREATE USER 'super_admin'@'localhost' IDENTIFIED BY 'password';
-- grant grant option
GRANT USAGE ON exercise_sql.* TO 'super_admin'@'localhost' WITH GRANT OPTION;
-- or 
GRANT GRANT OPTION ON exercise_sql.* TO 'super_admin'@'localhost';

-- grant ALL PRIVILEGES
GRANT ALL PRIVILEGES ON exercise_sql.* TO 'super_admin'@'localhost';

-- Get Process Access , must all databases to success / global privileges
GRANT PROCESS ON *.* TO 'super_admin'@'localhost';

-- Insert data actor super_admin in Actor table
-- INSERT INTO actors(username, password) VALUES('super_admin', 'password');

-- Create user admin_db
CREATE USER 'admin_db'@'0.0.0.0' IDENTIFIED BY 'password';
-- grant ALL PRIVILEGES
GRANT ALL PRIVILEGES ON exercise_sql.* TO 'admin_db'@'0.0.0.0';


-- export database dump
mysqldump -u super_admin -ppassword exercise_sql > C:\Users\TOBI\Documents\dumps\dump_exercise_sql.sql 