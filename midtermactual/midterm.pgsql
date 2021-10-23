/*q6*/
CREATE OR REPLACE VIEW q1 (country_name) AS
SELECT name
FROM countries 
WHERE population > 100000000
AND continent = 'Africa';

SELECT * FROM q1;
SELECT name, population FROM countries WHERE continent = 'Africa' ORDER BY population DESC;

/* q7 
name of continent with # of countries in continent without airport*/
CREATE OR REPLACE VIEW q2 (continent, country_count) AS
SELECT continent, COUNT(*)
FROM countries c LEFT JOIN airports a
ON c.iso2 = a.country_iso2
WHERE a.code IS NULL
GROUP BY c.continent;

/*
SELECT * FROM countries c LEFT JOIN airports a
ON c.iso2 = a.country_iso2
WHERE a.code IS NULL
ORDER BY continent;
*/

/* q8
top 10 countries with most land borders
+ number of land borders
*/
CREATE OR REPLACE VIEW q3 (country_name, border_count) AS
SELECT c.name, COUNT(b.country2_iso2) border_count
FROM countries c JOIN borders b
ON c.iso2 = b.country1_iso2
GROUP BY c.iso2
ORDER BY border_count DESC;
-- LIMIT 10;
SELECT * FROM q3;

SELECT * FROM borders WHERE country1_iso2 = 'CN';
/* q9
pairs of countries that share border
between europe and asia
*/
CREATE OR REPLACE VIEW q4 (country_name1, country_name2) AS
SELECT c1.name country_name1, c2.name country_name2
FROM (borders b JOIN countries c1 ON country1_iso2 = c1.iso2) 
      JOIN countries c2 ON country2_iso2 = c2.iso2
WHERE c1.continent = 'Europe'
AND c2.continent = 'Asia';

/*q10
asian countries that SQ doesnt fly to, 
including no airport
*/
CREATE OR REPLACE VIEW q5 (country_name) AS
SELECT DISTINCT c.name
FROM countries c
WHERE c.iso2 NOT IN (
    SELECT a2.country_iso2
    FROM airports a2 
    JOIN (SELECT * FROM routes WHERE airline_code = 'SQ') r
    ON r.to_code = a2.code
)
AND c.continent = 'Asia';

-- SELECT * FROM q5;