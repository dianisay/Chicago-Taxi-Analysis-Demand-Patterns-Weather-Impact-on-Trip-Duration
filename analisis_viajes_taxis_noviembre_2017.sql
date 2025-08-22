-- ========================================================
-- Script: analisis_viajes_taxis_noviembre_2017.sql
-- Descripción: Consultas SQL para analizar datos de viajes
-- de taxi y condiciones meteorológicas en noviembre 2017.
-- Autor: Diana
-- ========================================================

------------------------------------------------------------
-- 1. Viajes por compañía para el 15 y 16 de noviembre 2017
------------------------------------------------------------
SELECT 
    c.company_name, 
    COUNT(t.trip_id) AS trips_amount
FROM trips t
JOIN cabs c ON t.cab_id = c.cab_id
WHERE t.start_ts::date BETWEEN '2017-11-15' AND '2017-11-16'
GROUP BY c.company_name
ORDER BY trips_amount DESC;

------------------------------------------------------------
-- 2. Viajes (1-7 nov) de compañías que contienen "Yellow" o "Blue"
------------------------------------------------------------
SELECT 
    c.company_name,
    COUNT(t.trip_id) AS trips_amount
FROM trips t
JOIN cabs c ON t.cab_id = c.cab_id
WHERE t.start_ts::date BETWEEN '2017-11-01' AND '2017-11-07'
  AND (c.company_name ILIKE '%Yellow%' OR c.company_name ILIKE '%Blue%')
GROUP BY c.company_name
ORDER BY trips_amount DESC;

------------------------------------------------------------
-- 3. Top compañías (Flash Cab, Taxi Affiliation Services) y grupo "Other"
------------------------------------------------------------
SELECT 
    CASE
        WHEN c.company_name = 'Flash Cab' THEN 'Flash Cab'
        WHEN c.company_name = 'Taxi Affiliation Services' THEN 'Taxi Affiliation Services'
        ELSE 'Other'
    END AS company,
    COUNT(t.trip_id) AS trips_amount
FROM trips t
JOIN cabs c ON t.cab_id = c.cab_id
WHERE t.start_ts::date BETWEEN '2017-11-01' AND '2017-11-07'
GROUP BY company
ORDER BY trips_amount DESC;

------------------------------------------------------------
-- 4. IDs de barrios O'Hare y Loop
------------------------------------------------------------
SELECT
    neighborhood_id,
    name
FROM neighborhoods
WHERE name LIKE '%Hare' OR name LIKE 'Loop';

------------------------------------------------------------
-- 5. Condiciones climáticas por hora (Good/Bad)
------------------------------------------------------------
SELECT
    ts,
    CASE
        WHEN description LIKE '%rain%' OR description LIKE '%storm%' THEN 'Bad'
        ELSE 'Good'
    END AS weather_conditions
FROM weather_records;

------------------------------------------------------------
-- 6. Viajes Loop → O'Hare en sábado con condiciones climáticas
------------------------------------------------------------
SELECT
    t.start_ts,
    W.weather_conditions,
    t.duration_seconds
FROM trips t
JOIN (
    SELECT
        ts,
        CASE
            WHEN description LIKE '%rain%' OR description LIKE '%storm%' THEN 'Bad'
            ELSE 'Good'
        END AS weather_conditions
    FROM weather_records
) W ON W.ts = t.start_ts
WHERE t.pickup_location_id = 50
  AND t.dropoff_location_id = 63
  AND EXTRACT(DOW FROM t.start_ts) = 6
ORDER BY t.trip_id;
