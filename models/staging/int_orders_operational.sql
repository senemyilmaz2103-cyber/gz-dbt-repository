-- int_orders_operatinal
select
    o.orders_id,
    o.date_date,
    round(o.margin+s.shipping_fee-(s.ship_cost+s.logcost)) as operasyonel_margin,
    o.revenue,
    o.quantity,
    o.purchase_cost,
    o.margin,
    s.shipping_fee,
    s.ship_cost,
    s.logcost 
from {{ref("int_orders_margin")}} o
left join {{ref("stg_raw__ship")}} s
    using orders_id
order by orders_id