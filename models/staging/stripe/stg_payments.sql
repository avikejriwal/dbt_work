SELECT 
id AS payment_id
, orderid
, paymentmethod AS payment_method
, status
, amount / 100 AS amount
, created
, _batched_at AS batched_at
FROM raw.stripe.payment