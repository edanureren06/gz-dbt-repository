{{ config(materialized='view') }}
select
  s.products_id,
  s.date_date,
  s.orders_id,
  s.revenue,
  s.quantity,
  p.purchase_price,
  round(s.quantity * p.purchase_price, 2) as purchase_cost,
  round(s.revenue - s.quantity * p.purchase_price, 2) as margin
from {{ ref('stg_raw_sales') }} as s
left join {{ ref('stg_raw_product') }} as p
  on s.products_id = p.products_id
 dbt build --select int_sales_margin
