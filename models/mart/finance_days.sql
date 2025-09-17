 {{config(meterialized='table')}}
WITH orders_per_day AS (
    SELECT 
        date_date,
        COUNT(DISTINCT orders_id) AS nb,
        ROUND(SUM(CAST(logcost AS FLOAT64)), 0) AS logcost,
        ROUND(SUM(CAST(ship_cost AS FLOAT64)), 0) AS ship_cost,
        ROUND(SUM(CAST(shipping_fee AS FLOAT64)), 0) AS shipping_fee,
        ROUND(SUM(CAST(purchase_cost AS FLOAT64)), 0) AS purchase_cost,
        ROUND(SUM(CAST(quantity AS FLOAT64)), 0) AS quantity,
        ROUND(SUM(CAST(margin AS FLOAT64)), 0) AS margin,
        ROUND(SUM(CAST(revenue AS FLOAT64)), 0) AS total_revenue,
        ROUND(SUM(CAST(operasyonel_margin AS FLOAT64)), 0) AS operational_margin,
    FROM {{ ref("int_orders_operational") }}
    GROUP BY date_date
)

SELECT 
    date_date,
    total_revenue AS revenue,
    margin,
    operational_margin,
    purchase_cost,
    shipping_fee,
    logcost,
    ship_cost,
    quantity,
    ROUND(total_revenue / NULLIF(nb, 0), 2) AS average_basket
FROM orders_per_day
ORDER BY date_date DESC



