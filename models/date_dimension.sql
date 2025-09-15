WITH CTE AS
(
    select 
        TRY_TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
        DATE(TRY_TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
        HOUR(TRY_TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
        CASE 
            WHEN DAYNAME(TRY_TO_TIMESTAMP(STARTED_AT)) IN ('Sat','Sun')
            THEN 'Weekend'
            ELSE 'Businessday'
        END AS DAY_TYPE,
        CASE 
            WHEN MONTH(TRY_TO_TIMESTAMP(STARTED_AT)) IN ('12','1','2')
            THEN 'Winter'
            WHEN MONTH(TRY_TO_TIMESTAMP(STARTED_AT)) IN ('3','4','5')
            THEN 'Spring'
            WHEN MONTH(TRY_TO_TIMESTAMP(STARTED_AT)) IN ('6','7','8')
            THEN 'Summer'
            ELSE 'Autumn'
        END AS Season_Type    

    from
    {{source('demo','bike')}}
    where STARTED_AT!='started_at'
)
select * from CTE