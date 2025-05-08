select
    sk_customer,
    sk_channel,
    sk_product,
    sum(mtr_total_amount_gross) as mtr_total_amount_gross,
    sum(mtr_unit_price) as mtr_unit_price
from {{ ref('fct_purchase_history') }}
group by 1,2,3
having sum(mtr_unit_price) > sum(mtr_total_amount_gross)