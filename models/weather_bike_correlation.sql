WITH CTE AS(
    SELECT 
    t.* 
    FROM
    {{ ref ('trips_fact')}} t
    limit 10
)

select * from CTE













