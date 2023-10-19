CREATE DATABASE dentisterie_management_service;

CREATE TABLE person
(
    id            BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT UNIQUE,
    first_name    VARCHAR(50)        NOT NULL,
    last_name     VARCHAR(50)        NOT NULL,
    date_of_birth DATE               NOT NULL
);

CREATE TABLE dentist
(
    id BIGINT PRIMARY KEY NOT NULL UNIQUE,
    FOREIGN KEY (id) REFERENCES person (id)
);

CREATE TABLE hygienist
(
    id BIGINT PRIMARY KEY NOT NULL UNIQUE,
    FOREIGN KEY (id) REFERENCES person (id)
);

CREATE TABLE dentist_assigned_hygienist
(
    id_dentist   BIGINT NOT NULL,
    id_hygienist BIGINT NOT NULL,
    FOREIGN KEY (id_dentist) REFERENCES dentist (id),
    FOREIGN KEY (id_hygienist) REFERENCES hygienist (id),
    PRIMARY KEY (id_dentist, id_hygienist)
);

CREATE TABLE client
(
    id             BIGINT PRIMARY KEY NOT NULL UNIQUE,
    enrolment_date DATE               NOT NULL,
    is_smoker      BOOLEAN            NOT NULL,
    id_dentist     BIGINT             NOT NULL,
    FOREIGN KEY (id) REFERENCES person (id),
    FOREIGN KEY (id_dentist) REFERENCES dentist (id)
);

CREATE TABLE invoice
(
    id           BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT UNIQUE,
    amount       FLOAT              NOT NULL,
    invoice_date DATE               NOT NULL,
    payment_type VARCHAR(50)        NOT NULL,
    id_client    BIGINT             NOT NULL,
    id_dentist   BIGINT             NOT NULL,
    FOREIGN KEY (id_client) REFERENCES client (id),
    FOREIGN KEY (id_dentist) REFERENCES dentist (id)
);

CREATE TABLE appointment
(
    id                   BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT UNIQUE,
    appointment_datetime DATETIME           NOT NULL,
    appointment_type     VARCHAR(50)        NOT NULL,
    id_client            BIGINT             NOT NULL,
    id_dentist           BIGINT             NOT NULL,
    id_invoice           BIGINT,
    FOREIGN KEY (id_client) REFERENCES client (id),
    FOREIGN KEY (id_dentist) REFERENCES dentist (id),
    FOREIGN KEY (id_invoice) REFERENCES invoice (id)
);

-- create 20 person
INSERT INTO person (first_name, last_name, date_of_birth)
VALUES ('Ethan', 'Robinson', '1990-01-19'),
       ('Charlotte', 'Clark', '1993-05-22'),
       ('Elijah', 'Rodriguez', '1986-08-03'),
       ('Lily', 'Lewis', '1992-06-12'),
       ('Daniel', 'Walker', '1979-09-29'),
       ('John', 'Doe', '1985-01-15'),
       ('Jane', 'Smith', '1987-05-23'),
       ('Emily', 'Johnson', '1992-09-10'),
       ('Michael', 'Williams', '1978-12-05'),
       ('Olivia', 'Brown', '1990-04-12'),
       ('William', 'Taylor', '1980-02-25'),
       ('Emma', 'Anderson', '1983-06-18'),
       ('Liam', 'Thomas', '1991-03-09'),
       ('Sophia', 'Jackson', '1988-11-11'),
       ('James', 'White', '1975-12-14'),
       ('Ava', 'Harris', '2000-04-20'),
       ('Lucas', 'Martin', '1987-07-21'),
       ('Mia', 'Thompson', '1982-05-15'),
       ('Benjamin', 'Garcia', '2001-09-24'),
       ('Isabella', 'Martinez', '1989-10-30');

-- create 4 dentist
INSERT INTO dentist (id)
SELECT p.id
FROM person p
         LEFT OUTER JOIN dentist d ON p.id = d.id
         LEFT OUTER JOIN client c ON p.id = c.id
         LEFT OUTER JOIN hygienist h ON p.id = h.id
WHERE d.id IS NULL
  AND c.id IS NULL
  AND h.id IS NULL
LIMIT 4;

-- create 7 hygienist
INSERT INTO hygienist (id)
SELECT p.id
FROM person p
         LEFT OUTER JOIN dentist d ON p.id = d.id
         LEFT OUTER JOIN client c ON p.id = c.id
         LEFT OUTER JOIN hygienist h ON p.id = h.id
WHERE d.id IS NULL
  AND c.id IS NULL
  AND h.id IS NULL
LIMIT 7;

-- first dentist will have 4 hygienist
INSERT INTO dentist_assigned_hygienist (id_dentist, id_hygienist)
SELECT d.id, h.id
FROM (SELECT id FROM dentist LIMIT 1 OFFSET 0) d
         JOIN (SELECT id FROM hygienist ORDER BY RAND() LIMIT 4 OFFSET 0) h;

-- second dentist will have 2 hygienist
INSERT INTO dentist_assigned_hygienist (id_dentist, id_hygienist)
SELECT d.id, h.id
FROM (SELECT id FROM dentist LIMIT 1 OFFSET 1) d
         JOIN (SELECT id FROM hygienist ORDER BY RAND() LIMIT 2 OFFSET 0) h;

-- third dentist will have 5 hygienist
INSERT INTO dentist_assigned_hygienist (id_dentist, id_hygienist)
SELECT d.id, h.id
FROM (SELECT id FROM dentist LIMIT 1 OFFSET 2) d
         JOIN (SELECT id FROM hygienist ORDER BY RAND() LIMIT 5 OFFSET 0) h;

-- fourth dentist will have 0 hygienist

-- create 9 client
INSERT INTO client (id, enrolment_date, is_smoker, id_dentist)
SELECT p.id,
       dates.enrolment_date,
       RAND() < 0.5                                                                               AS is_smoker,
       (SELECT id FROM dentist WHERE id != (SELECT MAX(id) FROM dentist) ORDER BY RAND() LIMIT 1) AS id_dentist
FROM (SELECT '2023-01-01' AS enrolment_date
      UNION ALL
      SELECT '2023-01-15'
      UNION ALL
      SELECT '2023-02-01'
      UNION ALL
      SELECT '2023-02-15'
      UNION ALL
      SELECT '2023-03-01'
      UNION ALL
      SELECT '2023-03-15'
      UNION ALL
      SELECT '2023-04-01'
      UNION ALL
      SELECT '2023-04-15'
      UNION ALL
      SELECT '2023-05-01') AS dates
         JOIN person p
         LEFT JOIN dentist d ON p.id = d.id
         LEFT JOIN client c ON p.id = c.id
         LEFT JOIN hygienist h ON p.id = h.id
WHERE d.id IS NULL
  AND c.id IS NULL
  AND h.id IS NULL
LIMIT 9;

-- fourth dentist will not have any client

-- create invoices
INSERT INTO invoice (amount, invoice_date, payment_type, id_client, id_dentist)
SELECT IF(RAND() < 0.5, 100, 50) * RAND() + RAND()      AS amount,
       dates.invoice_date,
       IF(RAND() < 0.5, 'Credit Card', 'Cash')          AS payment_type,
       (SELECT id FROM client ORDER BY RAND() LIMIT 1)  AS id_client,
       (SELECT id FROM dentist ORDER BY RAND() LIMIT 1) AS id_dentist
FROM (SELECT '2023-01-01' AS invoice_date
      UNION ALL
      SELECT '2023-01-03'
      UNION ALL
      SELECT '2023-01-05'
      UNION ALL
      SELECT '2023-01-08'
      UNION ALL
      SELECT '2023-01-11'
      UNION ALL
      SELECT '2023-01-14'
      UNION ALL
      SELECT '2023-01-17'
      UNION ALL
      SELECT '2023-01-20'
      UNION ALL
      SELECT '2023-01-23'
      UNION ALL
      SELECT '2023-01-26'
      UNION ALL
      SELECT '2023-01-29'
      UNION ALL
      SELECT '2023-02-01'
      UNION ALL
      SELECT '2023-02-04'
      UNION ALL
      SELECT '2023-02-07'
      UNION ALL
      SELECT '2023-02-10'
      UNION ALL
      SELECT '2023-02-13'
      UNION ALL
      SELECT '2023-02-16'
      UNION ALL
      SELECT '2023-02-19'
      UNION ALL
      SELECT '2023-02-22'
      UNION ALL
      SELECT '2023-02-25'
      UNION ALL
      SELECT '2023-02-28'
      UNION ALL
      SELECT '2023-03-03'
      UNION ALL
      SELECT '2023-03-06'
      UNION ALL
      SELECT '2023-03-09'
      UNION ALL
      SELECT '2023-03-12'
      UNION ALL
      SELECT '2023-03-15'
      UNION ALL
      SELECT '2023-03-18'
      UNION ALL
      SELECT '2023-03-21'
      UNION ALL
      SELECT '2023-03-24'
      UNION ALL
      SELECT '2023-03-27'
      UNION ALL
      SELECT '2023-03-30') AS dates;

-- create past appointments based on invoices
INSERT INTO appointment (appointment_datetime, appointment_type, id_client, id_dentist, id_invoice)
SELECT DATE_ADD(invoice_date, INTERVAL (8 + FLOOR(8 * RAND())) HOUR) AS appointment_datetime,
       CASE FLOOR(3 * RAND())
           WHEN 0 THEN 'Checkup'
           WHEN 1 THEN 'Cleaning'
           ELSE 'Treatment'
           END                                                       AS appointment_type,
       id_client,
       id_dentist,
       id
FROM invoice
ORDER BY RAND()
LIMIT 28;

-- create future appointments without invoices
INSERT INTO appointment (appointment_datetime, appointment_type, id_client, id_dentist)
SELECT DATE_ADD(MAX(invoice_date), INTERVAL (2 + FLOOR(10 * RAND())) DAY) AS future_appointment_date,
       CASE FLOOR(3 * RAND())
           WHEN 0 THEN 'Checkup'
           WHEN 1 THEN 'Cleaning'
           ELSE 'Treatment'
           END                                                            AS appointment_type,
       (SELECT id FROM client ORDER BY RAND() LIMIT 1)                    AS id_client,
       (SELECT id FROM dentist ORDER BY RAND() LIMIT 1)                   AS id_dentist
FROM (SELECT 1 AS dummy_col
      UNION ALL
      SELECT 2
      UNION ALL
      SELECT 3
      UNION ALL
      SELECT 4
      UNION ALL
      SELECT 5
      UNION ALL
      SELECT 6
      UNION ALL
      SELECT 7
      UNION ALL
      SELECT 8
      UNION ALL
      SELECT 9
      UNION ALL
      SELECT 10) AS dummy
         JOIN invoice
GROUP BY dummy.dummy_col;

