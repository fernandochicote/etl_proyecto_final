{{ config(materialized='table') }}

WITH TimeSeries AS (
    SELECT 
        r.datetime_value::TIME AS ID,
        EXTRACT(HOUR FROM r.datetime_value) AS hour,
        EXTRACT(MINUTE FROM r.datetime_value) AS minute,
        EXTRACT(SECOND FROM r.datetime_value) AS second,
        CASE
            WHEN EXTRACT(HOUR FROM r.datetime_value) < 6 THEN 'Night'
            WHEN EXTRACT(HOUR FROM r.datetime_value) < 12 THEN 'Morning'
            WHEN EXTRACT(HOUR FROM r.datetime_value) < 18 THEN 'Afternoon'
            ELSE 'Evening'
        END AS part_of_day
    FROM range(TIMESTAMP '2024-01-01 00:00:00', TIMESTAMP '2024-01-01 23:59:59', INTERVAL 1 SECOND) AS r(datetime_value)
)

SELECT * FROM TimeSeries
