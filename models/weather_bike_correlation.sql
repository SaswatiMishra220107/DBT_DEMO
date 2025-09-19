WITH CTE AS(
    SELECT 
    t.*,
    w.*
    FROM
    {{ ref ('trips_fact')}} t
    LEFT JOIN {{ ref('daily_weather') }} w
    ON t.TRIP_DATE = w.daily_weather
    limit 10
)

select * from CTE













