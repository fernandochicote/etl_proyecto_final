






    with grouped_expression as (
    select
        
        
    
  
( 1=1 and dropoff_area_id >= 0 and dropoff_area_id <= 77
)
 as expression


    from "dev"."dbt_blue"."fact_taxi_trips"
    

),
validation_errors as (

    select
        *
    from
        grouped_expression
    where
        not(expression = true)

)

select *
from validation_errors







