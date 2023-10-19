-- get: the total amount of cash money recorded since "2023-02-01"
-- show: total amount of cash money
-- example result:
-- +-------------------------------------+
-- |total_amount_of_cash_money_since_date|
-- +-------------------------------------+
-- |396.7152237892151                    |
-- +-------------------------------------+



-- get: the client, which smokes, that had the most amount of money spent since "2023-02-01"
-- show: total amount of money spent, first name, last name, enrolment date
-- example result:
-- +--------------------------------------+----------+---------+--------------+
-- |total_amount_of_money_spent_since_date|first_name|last_name|enrolment_date|
-- +--------------------------------------+----------+---------+--------------+
-- |179.20616817474365                    |Sophia    |Jackson  |2023-01-01    |
-- +--------------------------------------+----------+---------+--------------+



-- get: the dentist that as the largest amount of hygienist assigned currently
-- show: amount of hygienist assigned, first name, last name
-- example result:
-- +----------------------------+----------+---------+
-- |amount_of_hygienist_assigned|first_name|last_name|
-- +----------------------------+----------+---------+
-- |5                           |Elijah    |Rodriguez|
-- +----------------------------+----------+---------+



-- get: the amount of appointment with different client a dentist had and will have, for all dentist
-- show: amount of unique client, dentist full name
-- example result:
-- +-----------------------+-----------------+
-- |amount_of_unique_client|dentist_full_name|
-- +-----------------------+-----------------+
-- |7                      |Ethan Robinson   |
-- |6                      |Charlotte Clark  |
-- |5                      |Elijah Rodriguez |
-- |4                      |Lily Lewis       |
-- +-----------------------+-----------------+



-- get: the amount of appointment with different clients a dentist had and the total amount of money from invoices of those appointment, for all dentist
-- show: total amount of invoice money, amount of unique client, dentist full name
-- example result:
-- +-----------------------------+-----------------------+-----------------+
-- |total_amount_of_invoice_money|amount_of_unique_client|dentist_full_name|
-- +-----------------------------+-----------------------+-----------------+
-- |451.66262674331665           |7                      |Ethan Robinson   |
-- |323.66156101226807           |6                      |Charlotte Clark  |
-- |286.6758484840393            |5                      |Elijah Rodriguez |
-- |135.49040985107422           |4                      |Lily Lewis       |
-- +-----------------------------+-----------------------+-----------------+



-- get: the total amount of money generated from invoices
-- show: total amount of money
-- example result:
-- +---------------------+
-- |total_amount_of_money|
-- +---------------------+
-- |1261.451220035553    |
-- +---------------------+


