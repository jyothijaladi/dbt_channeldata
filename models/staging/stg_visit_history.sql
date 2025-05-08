{{config(materialized='view')}}

with raw_visit_history as(
    select
        customer_id,
        channel_id,
        visit_timestamp,
        bounce_timestamp,
        created_at,
        updated_at
    from {{ source("raw","visithistory")}}
)

select * from raw_visit_history