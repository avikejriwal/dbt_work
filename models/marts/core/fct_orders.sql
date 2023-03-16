with payments as (

    select * from {{ ref('stg_payments') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

final as (

    select
        payments.orderid
        , orders.customer_id
        , payments.amount
    FROM payments JOIN orders ON payments.orderid = orders.order_id

)

select * from final