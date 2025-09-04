-- Initial Query (Unoptimized)
-- Retrieve all bookings along with the user details, property details, and payment details
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.payment_date,
    pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;


-- Refactored Query (Optimized)
-- Improvements: 
--   1. Use LEFT JOIN for optional relationships (payments may not always exist).
--   2. Select only necessary columns for faster execution.
--   3. Ensure indexes exist on JOIN keys (user_id, property_id, booking_id).
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount,
    pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id;


EXPLAIN ANALYZE
SELECT ...

  -- Refactored Query

  SELECT b.id AS booking_id, b.start_date, b.end_date,
       u.name AS user_name,
       p.name AS property_name,
       pay.amount, pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id;

