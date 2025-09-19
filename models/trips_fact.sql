WITH trips as (
    select 
    ride_id,
    --RIDEABLE_TYPE,
    DATE(TRY_TO_TIMESTAMP(STARTED_AT)) AS TRIP_DATE,
    start_statio_id,
    end_station_id,
    MEMBER_CSUAL AS MEMBER_CASUAL,
    TIMESTAMPDIFF(SECOND,TO_TIMESTAMP(ENDED_AT),TO_TIMESTAMP(STARTED_AT)) AS Trip_Duration_seconds,
    from 
    {{ ref('stg_bike') }}
    where ride_id!='ride_id' 
    --limit 10   

)
select * from trips 