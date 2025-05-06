{{ config(materialized = 'view') }}

with raw_customers as(
    select 
        customer_id,
        name,
        date_birth,
        email_address,
        phone_number,
        country,
        created_at,
        updated_at
    from {{ source("raw","customer")}}
)

select * from raw_customers