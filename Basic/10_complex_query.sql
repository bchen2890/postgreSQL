\i 2_insert.sql

SELECT * FROM accounts;
SELECT username,
       birth_date,
       CASE
			WHEN birth_date <  (NOW() - '18 years'::interval)::date
				THEN 'Above'
			WHEN birth_date >  (NOW() - '18 years'::interval)::date
				THEN 'Under'
			ELSE
				 'Unknown'
       END age_majority
FROM accounts
ORDER BY birth_date;

SELECT
	SUM (
		CASE
			WHEN birth_date <  (NOW() - '18 years'::interval)::date 
				THEN 1
			ELSE 0
		END
	) AS "Above",
	SUM (
		CASE
			WHEN birth_date >  (NOW() - '18 years'::interval)::date 
				THEN 1
			ELSE 0
		END
	) AS "Under"
FROM accounts;