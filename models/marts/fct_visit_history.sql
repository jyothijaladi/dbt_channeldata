with stg_fct_visit_history as(
    select
        customer_id as nk_customer_id,
        channel_id as nk_channel_id,
        cast(visit_timestamp as date) as sk_date_visit,
        cast(bounce_timestamp as date) as sk_date_bounce,
        cast(visit_timestamp as timestamp) as dt_visit_timestamp,
        cast(bounce_timestamp as timestamp) as dt_bounce_timestamp
    from {{ ref("stg_visit_history")}}
)

select 
    coalesce(dcust.sk_customer , '-1') as sk_customer,
    coalesce(dchan.sk_channel, '-1') as sk_channel,
    fct.sk_date_visit,
    fct.dt_visit_timestamp,
    fct.dt_bounce_timestamp,
    round(extract(epoch from (fct.dt_bounce_timestamp - fct.dt_visit_timestamp)) / 60, 2) as mtr_length_of_stay_minutes
from stg_fct_visit_history as fct
left join {{ ref("dim_customers")}} as dcust 
                on fct.nk_customer_id = dcust.nk_customer_id 
left join {{ ref ("dim_channels")}} as dchan 
                on fct.nk_channel_id = dchan.nk_channel_id