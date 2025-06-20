with

repos as (
    select *
    from {{ source('dev','REPO_STATS') }}
),

renamed as (
    select 
        NAME,
        FULL_NAME
    from repos
)

select * from renamed