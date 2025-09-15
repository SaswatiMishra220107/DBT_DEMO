WITH CTE AS
(
    select 
        TRY_TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
        DATE(TRY_TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
        HOUR(TRY_TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
        {{get_daytype('STARTED_AT')}} AS DAY_TYPE,
        {{get_season('STARTED_AT')}} AS SEASON_TYPE,
        {{function1('STARTED_AT')}}  AS PastorFuture

    from
    {{source('demo','bike')}}
    where STARTED_AT!='started_at'
)
select * from CTE