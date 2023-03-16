with customers as (

    select * from {{ ref('stg_customers')}}

)

, customer_orders as (

    select
        customer_id,

        MIN(order_date) as first_order_date,
        MAX(order_date) as most_recent_order_date,
        COUNT(order_id) as number_of_orders,
        SUM(payments.amount) AS lifetime_value

    FROM {{ ref('stg_orders') }} AS orders
        LEFT JOIN {{ ref('stg_payments') }} AS payments
        ON payments.orderid = orders.order_id

    GROUP BY 1

),

final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders,
        customer_orders.lifetime_value

    from customers

    left join customer_orders using (customer_id)

)

select * from final