with

movies_data as (
    SELECT DATA
    FROM {{ source('dev','MOVIES') }}
)

SELECT * FROM movies_data