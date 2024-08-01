
  
  create view "dev"."dbt_blue"."enriched_taxi_trips__dbt_tmp" as (
    

select
    trip_id,
    taxi_id,
    start_timestamp,
    start_timestamp::date as trip_start_date,
    start_timestamp::time as trip_start_time,
    end_timestamp,
    end_timestamp::date as trip_end_date,
    end_timestamp::time as trip_end_time,
    trip_seconds,
    trip_miles as trip_distance_miles,
    trip_distance_miles * 1.60934 AS trip_distance_km,
    pickup_community_area,
    dropoff_community_area,
    fare,
    tips,
    tolls,
    extras,
    trip_total_amount as trip_total_amount_dolar,
    trip_total_amount_dolar * 0.85 AS trip_total_amount_eur,
    payment_type,
    company,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
from "dev"."dbt_blue"."cleaned_taxi_trips"
  );
