{%macro function1 (x)%}
    CASE WHEN TO_TIMESTAMP({{x}}) < CURRENT_DATE
        THEN 'PAST'
        ELSE 'FUTURE'
    END
{%endmacro%}

{%macro get_season(x)%}
    CASE 
            WHEN MONTH(TO_TIMESTAMP({{x}})) IN ('12','1','2')
            THEN 'Winter'
            WHEN MONTH(TO_TIMESTAMP({{x}})) IN ('3','4','5')
            THEN 'Spring'
            WHEN MONTH(TO_TIMESTAMP({{x}})) IN ('6','7','8')
            THEN 'Summer'
            ELSE 'Autumn'
        END

{%endmacro%}
{%macro get_daytype(x)%}
        CASE 
            WHEN DAYNAME(TO_TIMESTAMP({{x}})) IN ('Sat','Sun')
            THEN 'Weekend'
            ELSE 'Businessday'
        END

{%endmacro%}