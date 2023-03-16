SELECT 
id AS payment_id
, orderid
, paymentmethod AS payment_method
, status
, amount / 100 AS amount
FROM raw.stripe.payment