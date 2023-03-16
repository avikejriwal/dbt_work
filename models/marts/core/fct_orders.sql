with payments as (

    select * from {{ ref('stg_payments') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

final as (

    select
        payments.order_id
        , orders.customer_id
        , payments.amount
    FROM payments JOIN orders ON payments.order_id = orders.order_id

)

select * from final