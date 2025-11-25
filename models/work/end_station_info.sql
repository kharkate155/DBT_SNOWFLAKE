{{ config(
    alias = "END_BIKE_STATION_INFO"
) }}

select 

END_STATION_ID,
END_STATION_NAME,
END_LATITUDE,
END_LONGITUDE

FROM {{ source('DBT_SRC', 'BIKE_RIDES') }}