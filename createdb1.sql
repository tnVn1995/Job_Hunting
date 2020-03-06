CREATE DATABASE IF NOT EXISTS scraping;

CREATE TABLE IF NOT EXISTS job_hunting
 (company_id SMALLINT UNSIGNED AUTO_INCREMENT,
    company_name VARCHAR(20),
    createdDate DATE DEFAULT(curdate()),
    city VARCHAR(20),
    state VARCHAR(20),
    url VARCHAR(400),
    CONSTRAINT pk_company PRIMARY KEY(company_id)
 );


-- DESCRIBE job_hunting;

CREATE TABLE IF NOT EXISTS job_desc
(company_id SMALLINT UNSIGNED AUTO_INCREMENT,
    job_description MEDIUMTEXT,
    createdDate DATE DEFAULT(curdate()),
    CONSTRAINT pk_company_id PRIMARY KEY (company_id),
    CONSTRAINT fk_comp_desc_id FOREIGN KEY (company_id)
    REFERENCES job_hunting (company_id)
);

DESCRIBE job_desc;

CREATE TABLE IF NOT EXISTS job_status(
    company_id SMALLINT UNSIGNED AUTO_INCREMENT,
    status BOOLEAN DEFAULT(0),
    createdDate DATETIME DEFAULT(now()),
    CONSTRAINT pk_company_id PRIMARY KEY(company_id),
    CONSTRAINT fk_comp_status_id FOREIGN KEY(company_id)
    REFERENCES job_hunting(company_id)
);

DESCRIBE job_status;