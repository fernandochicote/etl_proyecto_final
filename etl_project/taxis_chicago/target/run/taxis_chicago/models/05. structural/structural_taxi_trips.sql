
  
  create view "dev"."dbt_blue"."structural_taxi_trips__dbt_tmp" as (
    

select
    trip_id,
    taxi_id,
    start_timestamp,
    end_timestamp,
    pickup_community_area as pickup_area_id,
    dropoff_community_area as dropoff_area_id,
    trip_start_date,
    trip_start_time,
    trip_end_date,
    trip_end_time,
    trip_seconds,
    trip_distance_miles,
    trip_distance_km,
    fare,
    tips,
    tolls,
    extras,
    trip_total_amount_dolar,
    trip_total_amount_eur,
    payment_type,
    company,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
from "dev"."dbt_blue"."enriched_taxi_trips"
  );
