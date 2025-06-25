with

employees_by_month as (
    SELECT
        YEAR(START_DATE) AS year,
        MONTHNAME(START_DATE) AS month,
        COUNT(*) AS nr_employees
    FROM {{ var('database_name') }}.{{ var('schema_name') }}.{{ var('table_name') }}
    GROUP BY
        YEAR(START_DATE),
        MONTHNAME(START_DATE)
    ORDER BY
        nr_employees DESC
)

select * from employees_by_month