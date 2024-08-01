
  
    
    

    create  table
      "dev"."dbt_blue"."dim_community_areas__dbt_tmp"
  
    as (
      

WITH CommAreas AS (
    SELECT *
FROM read_csv('./data/bronze/chicago_city/community_area/CommAreas.csv'))

SELECT 
    AREA_NUMBE as comm_area_id,
    COMMUNITY as comm_area_name,
    SHAPE_AREA as comm_area_shape,
    SHAPE_LEN as comm_area_len,
    the_geom as comm_area_geometry

FROM CommAreas
    );
  
  