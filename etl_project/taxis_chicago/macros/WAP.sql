{% macro publish() %}
    {% set create_schema_sql %}
        CREATE SCHEMA IF NOT EXISTS dbt_green;
    {% endset %}

    {% set sql %}
        CREATE OR REPLACE TABLE dbt_green.fact_taxi_trips AS SELECT * FROM dbt_blue.fact_taxi_trips;
        CREATE OR REPLACE TABLE dbt_green.dim_community_areas AS SELECT * FROM dbt_blue.dim_community_areas;
        CREATE OR REPLACE TABLE dbt_green.dim_date AS SELECT * FROM dbt_blue.dim_date;
        CREATE OR REPLACE TABLE dbt_green.dim_time AS SELECT * FROM dbt_blue.dim_time;
    {% endset %}

    {%- if target.name == 'green' -%}
        {% do log("Creating schema dbt_green if not exists...", info=True) %}
        {% do run_query(create_schema_sql) %}
        {% do log("Schema dbt_green created or already exists", info=True) %}
        
        {% do log("Merging into green environment...", info=True) %}
        {% do run_query(sql) %}
        {% do log("Merge into green environment done", info=True) %}
    {%- else -%}
        {% do exceptions.warn("[WARNING]: Target schema is not green") %}
    {%- endif -%}
{% endmacro %}

