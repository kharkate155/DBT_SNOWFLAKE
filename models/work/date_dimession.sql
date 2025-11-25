{{ config(
    alias = "BIKE_DATE"
) }}


SELECT
    RIDE_ID,
    DATEDIFF('minute', started_at, ended_at) AS minute_difference,
    {{get_day_type('started_at')}} AS day_type,
    CASE
        WHEN DATE_PART('hour', started_at) BETWEEN 6 AND 11 THEN 'morning'
        WHEN DATE_PART('hour', started_at) BETWEEN 12 AND 17 THEN 'afternoon'
        WHEN DATE_PART('hour', started_at) BETWEEN 18 AND 21 THEN 'evening'
        ELSE 'night'
    END AS time_of_day,
    {{ get_season('started_at') }} AS season,
    CASE
        WHEN DATE_PART('hour', started_at) BETWEEN 6 AND 9 THEN 'rush_hour'
        WHEN DATE_PART('hour', started_at) BETWEEN 16 AND 19 THEN 'rush_hour'
        ELSE 'non_rush_hour'
    END AS rush_hour_indicator

FROM {{ source('DBT_SRC', 'BIKE_RIDES') }}
WHERE started_at IS NOT NULL
    AND ended_at IS NOT NULL

