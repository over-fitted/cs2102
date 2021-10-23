------------------------------------------------------------------------
------------------------------------------------------------------------
--
-- CS2102 - ASSIGNMENT 1 (SQL)
--
------------------------------------------------------------------------
------------------------------------------------------------------------



DROP VIEW IF EXISTS student, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10;



------------------------------------------------------------------------
-- Replace the dummy values without Student ID & NUSNET ID
------------------------------------------------------------------------

CREATE OR REPLACE VIEW student(student_id, nusnet_id) AS
 SELECT 'A0217487U', 'e0543523'
;






------------------------------------------------------------------------
-- Query Q1
------------------------------------------------------------------------

CREATE OR REPLACE VIEW v1 (city_name) AS
SELECT name city_name
FROM cities
WHERE population > 10000000
AND capital = 'primary'
;





------------------------------------------------------------------------
-- Query Q2
------------------------------------------------------------------------

CREATE OR REPLACE VIEW v2 (country_name, capital_count) AS
SELECT co.name country_name, COUNT(*) capital_count
FROM countries co JOIN cities ci
on co.iso2 = ci.country_iso2
WHERE ci.capital = 'primary'
GROUP BY co.name
HAVING COUNT(*) > 1
;





------------------------------------------------------------------------
-- Query Q3
------------------------------------------------------------------------

CREATE OR REPLACE VIEW v3 (country_name) AS
SELECT name country_name
FROM countries 
WHERE gdp/population > (SELECT gdp/population FROM countries WHERE iso2 = 'SG')
AND continent = 'Europe'
;


------------------------------------------------------------------------
-- Query Q4
------------------------------------------------------------------------

CREATE OR REPLACE VIEW v4 (country_name) AS
SELECT co.name country_name
FROM countries co
WHERE (
    SELECT COUNT(*) FROM cities ci WHERE ci.country_iso2 = co.iso2 
) = 1
AND (
    SELECT COUNT(*) 
    FROM cities ci2 
    WHERE ci2.capital = 'primary'
    AND ci2.country_iso2 = co.iso2
) = 1
;




------------------------------------------------------------------------
-- Query 5
------------------------------------------------------------------------

CREATE OR REPLACE VIEW v5 (country_name, domestic_connections_count) AS
SELECT co.name country_name, COUNT(*) domestic_connections_count
FROM connections con JOIN airports a1
ON con.from_code = a1.code
JOIN airports a2
ON con.to_code = a2.code
JOIN countries co
ON co.iso2 = a1.country_iso2
WHERE a1.country_iso2 = a2.country_iso2
GROUP BY co.name
HAVING COUNT(*) > 100
ORDER BY domestic_connections_count DESC
;




------------------------------------------------------------------------
-- Query Q6
------------------------------------------------------------------------

CREATE OR REPLACE VIEW v6 (country_name1, country_name2) AS
WITH asianCountries AS (
    SELECT * FROM countries
    WHERE continent = 'Asia'
)
SELECT co1.name country_name1, co2.name country_name2
FROM asianCountries co1, asianCountries co2, borders b
WHERE co1.population < co2.population
AND b.country1_iso2 = co1.iso2
AND b.country2_iso2 = co2.iso2
;




------------------------------------------------------------------------
-- Query Q7
------------------------------------------------------------------------
CREATE OR REPLACE VIEW v7 (country_name) AS
SELECT co.name country_name
FROM countries co
WHERE co.continent = 'Asia'
AND (
    (SELECT COUNT(*)
    FROM visited v NATURAL JOIN users u
    WHERE co.iso2 = iso2
    AND name in ('Marie', 'Bill', 'Sam', 'Sarah')) 
) = 0
;




------------------------------------------------------------------------
-- Query Q8
------------------------------------------------------------------------

CREATE OR REPLACE VIEW v8 (city_name) AS
WITH SGtoEurope (euAirportCode) AS (
SELECT a.code euAirportCode
FROM (
    SELECT ci.name cityName, ci.country_iso2 country_iso2  
    FROM cities ci 
    JOIN countries co ON co.iso2 = ci.country_iso2 
    WHERE co.continent = 'Europe'
) ci
JOIN airports a
    ON ci.cityName = a.city
    AND ci.country_iso2 = a.country_iso2
JOIN routes r
    ON a.code = r.to_code
WHERE r.from_code = 'SIN'
AND r.airline_code = 'SQ'
)
-- Direct flight
SELECT ci.name city_name
FROM (SELECT * FROM cities WHERE country_iso2 = 'US') ci 
JOIN airports a 
    ON ci.name = a.city
    AND ci.country_iso2 = a.country_iso2
JOIN routes r 
    ON a.code = r.to_code
WHERE r.from_code = 'SIN'
AND r.airline_code = 'SQ'
UNION
-- transfer in europe
SELECT ci.name
FROM (SELECT * FROM cities WHERE country_iso2 = 'US') ci 
JOIN airports a 
    ON ci.name = a.city
    AND ci.country_iso2 = a.country_iso2
JOIN routes r
    ON a.code = r.to_code
WHERE r.airline_code = 'SQ' 
AND EXISTS (
    SELECT 1 FROM SGtoEurope se
    WHERE se.euAirportCode = r.from_code
)
;





------------------------------------------------------------------------
-- Query Q9
------------------------------------------------------------------------

CREATE OR REPLACE VIEW v9 (country_name, crossing_count) AS
WITH RECURSIVE land_crossing AS (
    SELECT country1_iso2, country2_iso2, 1 AS crossing_count
    FROM borders
    WHERE country1_iso2 = 'MY'
    UNION ALL
    SELECT b.country1_iso2, b.country2_iso2, crossing_count + 1
    FROM land_crossing lc, borders b
    WHERE b.country1_iso2 = lc.country2_iso2
    AND crossing_count < 10
)
SELECT DISTINCT co.name country_name, MIN(crossing_count) crossing_count
FROM land_crossing 
JOIN countries co ON co.iso2 = land_crossing.country2_iso2
WHERE co.continent = 'Africa'
GROUP BY co.name
ORDER BY crossing_count DESC
;






------------------------------------------------------------------------
-- Query Q10
------------------------------------------------------------------------

CREATE OR REPLACE VIEW v10 (airport_name) AS
SELECT DISTINCT name airport_name
FROM airports a
WHERE EXISTS (
    SELECT 1
    FROM routes r, airports a2, countries c
    WHERE r.from_code = a.code
    AND r.to_code = a2.code
    AND a2.country_iso2 = c.iso2
    AND c.continent = 'Africa'
)
AND EXISTS (
    SELECT 1
    FROM routes r, airports a2, countries c
    WHERE r.from_code = a.code
    AND r.to_code = a2.code
    AND a2.country_iso2 = c.iso2
    AND c.continent = 'Europe'
)
AND EXISTS (
    SELECT 1
    FROM routes r, airports a2, countries c
    WHERE r.from_code = a.code
    AND r.to_code = a2.code
    AND a2.country_iso2 = c.iso2
    AND c.continent = 'Asia'
)
AND EXISTS (
    SELECT 1
    FROM routes r, airports a2, countries c
    WHERE r.from_code = a.code
    AND r.to_code = a2.code
    AND a2.country_iso2 = c.iso2
    AND c.continent = 'North America'
)
AND EXISTS (
    SELECT 1
    FROM routes r, airports a2, countries c
    WHERE r.from_code = a.code
    AND r.to_code = a2.code
    AND a2.country_iso2 = c.iso2
    AND c.continent = 'South America'
)
AND EXISTS (
    SELECT 1
    FROM routes r, airports a2, countries c
    WHERE r.from_code = a.code
    AND r.to_code = a2.code
    AND a2.country_iso2 = c.iso2
    AND c.continent = 'Oceania'
)
;


