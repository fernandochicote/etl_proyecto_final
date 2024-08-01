select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select taxi_id
from "dev"."dbt_blue"."fact_taxi_trips"
where taxi_id is null



      
    ) dbt_internal_test