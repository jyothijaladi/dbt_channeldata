{{ config(materialized = 'view') }}

with raw_channels as (
    select 
        channel_id,
        channel_name,
        created_at,
        updated_at
    from {{ source("raw", "channels") }}
)

select * from raw_channels
