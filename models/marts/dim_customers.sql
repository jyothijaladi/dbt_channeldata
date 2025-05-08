with stg_dim_customers as(
    select
       customer_id as nk_customer_id,
       name as dsc_name,
       date_birth as dt_date_birth,
       email_address as dsc_email_address,
       phone_number as dsc_phone_number,
       country as dsc_country,
       created_at as dt_created_at,
       updated_at as dt_updated_at
    from {{ref("stg_customers")}}
)

select 
    {{ dbt_utils.generate_surrogate_key(["nk_customer_id"])}} as sk_customer,
    *
from stg_dim_customers