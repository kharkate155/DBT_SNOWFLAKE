select 
*
from {{ source('DBT_SRC', 'BIKE_RIDES') }}
