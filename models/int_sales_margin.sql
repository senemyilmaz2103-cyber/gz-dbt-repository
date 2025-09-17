-- models/intermediate/int_sales_margin.sql
select
    s.products_id,
    s.date_date,
    s.orders_id,
    s.revenue,
    s.quantity,
    p.purchase_price,

    -- Satın alma maliyeti
    round(s.quantity * p.purchase_price, 2) as purchase_cost,

    -- Marj
    round(s.revenue - (s.quantity * p.purchase_price), 2) as margin

from {{ ref("stg_raw__sales") }} s
left join {{ ref("stg_raw__product") }} p using (products_id)
