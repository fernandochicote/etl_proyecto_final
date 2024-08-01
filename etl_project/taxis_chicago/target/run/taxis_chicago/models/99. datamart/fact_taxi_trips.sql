
  
    
    

    create  table
      "dev"."dbt_blue"."fact_taxi_trips__dbt_tmp"
  
    as (
      

with tmp_data as (
    select *
        -- Campos de auditoria
        , NOW() audit_row_insert
        , 'dbt_demo' audit_process_id
    from "dev"."dbt_blue"."structural_taxi_trips"
)

select * from tmp_data
    );
  
  