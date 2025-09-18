WITH daily_weather AS (
    select 
    date(time) as daily_weather,
    weather,
    temp,
    pressure,
    humidity,
    clouds
    from
    {{ source('demo','weather') }}
   
),

daily_weather_agg AS(
    select 
    daily_weather,
    weather,
    round(avg(temp),2) AS avg_temp,
    round(avg (pressure),2) as avg_pressure,
    round(avg (clouds),2) as avg_cloud,
    round(avg(humidity),2) as avg_humidity
    from daily_weather
    group by daily_weather, weather
    QUALIFY ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY COUNT(weather) DESC) = 1
)

select * 
from daily_weather_agg