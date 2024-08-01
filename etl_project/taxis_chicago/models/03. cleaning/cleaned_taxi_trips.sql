{{ config(materialized='view') }}

select
    trip_id,
    taxi_id,
    start_timestamp,
    end_timestamp,
    trip_seconds,
    trip_miles,
    coalesce(pickup_community_area, 0) as pickup_community_area,
    coalesce(dropoff_community_area, 0) as dropoff_community_area,
    fare,
    tips,
    tolls,
    extras,
    trip_total_amount,
    coalesce(payment_type, 'Unknown') as payment_type,
    coalesce(company, 'Unknown') as company,
    coalesce(pickup_centroid_latitude, 0.0) as start_lat,
    coalesce(pickup_centroid_longitude, 0.0) as start_lng,
    coalesce(dropoff_centroid_latitude, 0.0) as end_lat,
    coalesce(dropoff_centroid_longitude, 0.0) as end_lng,
from {{ ref('stg_taxi_trips') }}

