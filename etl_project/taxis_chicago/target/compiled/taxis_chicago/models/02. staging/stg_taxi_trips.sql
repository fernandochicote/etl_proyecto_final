

select
    cast(trip_id as VARCHAR) as trip_id,
    cast(taxi_id as VARCHAR) as taxi_id,
    cast(trip_start_timestamp as TIMESTAMP) as start_timestamp,
    cast(trip_end_timestamp as TIMESTAMP) as end_timestamp,
    cast(trip_seconds as DOUBLE) as trip_seconds,
    cast(trip_miles as DOUBLE) as trip_miles,
    cast(pickup_community_area as INT) as pickup_community_area,
    cast(dropoff_community_area as INT) as dropoff_community_area,
    cast(fare as DOUBLE) as fare,
    cast(tips as DOUBLE) as tips,
    cast(tolls as DOUBLE) as tolls,
    cast(extras as DOUBLE) as extras,
    cast(trip_total as DOUBLE) as trip_total_amount,
    cast(payment_type as VARCHAR) as payment_type,
    cast(company as VARCHAR) as company,
    cast(pickup_centroid_latitude as DOUBLE) as pickup_centroid_latitude,
    cast(pickup_centroid_longitude as DOUBLE) as pickup_centroid_longitude,
    cast(dropoff_centroid_latitude as DOUBLE) as dropoff_centroid_latitude,
    cast(dropoff_centroid_longitude as DOUBLE) as dropoff_centroid_longitude
from "dev"."dbt_blue"."load_taxi_trips"