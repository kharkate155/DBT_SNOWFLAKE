{% macro get_season(date_col) %}

    CASE
        WHEN DATE_PART('month', {{ date_col }}) IN (12, 1, 2) THEN 'winter'
        WHEN DATE_PART('month', {{ date_col }}) IN (3, 4, 5) THEN 'spring'
        WHEN DATE_PART('month', {{ date_col }}) IN (6, 7, 8) THEN 'summer'
        ELSE 'fall'
    END

{% endmacro %}

{% macro get_day_type(date_col) %}

    CASE
        WHEN DATE_PART('dayofweek', {{ date_col }}) IN (1, 7) THEN 'weekend'
        ELSE 'business_day'
    END

{% endmacro %}