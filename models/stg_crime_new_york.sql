WITH CTE AS(
    SELECT * 
    FROM
    {{ source('USCrime','URBAN_CRIME_INCIDENT_LOG')}}
    WHERE CITY='New York' 
    AND OFFENSE_CATEGORY IN ('Theft','Driving Under The Influence')
    AND DATE IS NOT NULL
)
SELECT 
OFFENSE_CATEGORY,
{{get_daytype('DATE')}} as DAY_TYPE,
{{get_season('DATE')}} AS SEASON,
count(OFFENSE_CATEGORY) AS NumberofOffenses
FROM CTE
GROUP BY OFFENSE_CATEGORY,DAY_TYPE,SEASON
ORDER BY NumberofOffenses DESC