{{ config(materialized='view')}}

with raw_products as(
    select
        product_sku,
        product_name,
        unit_price,
        created_at,
        updated_at
    from {{ source("raw","products") }}
)

select * from raw_products