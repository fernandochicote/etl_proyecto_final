
    
    

with all_values as (

    select
        payment_type as value_field,
        count(*) as n_records

    from "dev"."dbt_blue"."fact_taxi_trips"
    group by payment_type

)

select *
from all_values
where value_field not in (
    'Mobile','Credit Card','Cash','Prcard','Unknown'
)


