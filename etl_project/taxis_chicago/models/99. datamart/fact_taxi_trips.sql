{{ config(materialized='table') }}

with tmp_data as (
    select *
        -- Campos de auditoria
        , NOW() audit_row_insert
        , 'dbt_demo' audit_process_id
    from {{ ref('structural_taxi_trips') }}
)

select * from tmp_data