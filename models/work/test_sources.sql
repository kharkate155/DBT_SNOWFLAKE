{{ config(
    enabled=false,

) }}

select 
*
from {{ source('DBT_SRC', 'BIKE_RIDES') }}
