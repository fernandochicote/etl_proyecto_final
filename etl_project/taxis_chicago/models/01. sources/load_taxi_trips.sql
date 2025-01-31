{{ config(materialized='view') }}

WITH all_files AS (
    SELECT *
    FROM read_csv_auto('data/bronze/chicago_taxi/taxi_trips/**/*.csv')
)

SELECT
    trip_id,
    taxi_id,
    trip_start_timestamp,
    trip_end_timestamp,
    trip_seconds,
    trip_miles,
    pickup_census_tract,
    dropoff_census_tract,
    pickup_community_area,
    dropoff_community_area,
    fare,
    tips,
    tolls,
    extras,
    trip_total,
    payment_type,
    company,
    pickup_centroid_latitude,
    pickup_centroid_longitude,
    pickup_centroid_location,
    dropoff_centroid_latitude,
    dropoff_centroid_longitude,
    dropoff_centroid_location
FROM 
all_files


