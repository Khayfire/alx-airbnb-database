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
JOIN payments pay ON b.id = pay.booking_id
WHERE b.start_date >= '2024-01-01' 
  AND b.end_date <= '2024-12-31';


-- Refactored Query (Optimized)
-- Improvements:
--   1. Use LEFT JOIN for optional relationships (payments may not always exist).
--   2. Select only necessary columns for faster execution.
--   3. Apply filters in WHERE clause to reduce scanned rows.
--   4. Ensure indexes exist on JOIN/filter keys (user_id, property_id, booking_id, start_date).
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
LEFT JOIN payments pay ON b.id = pay.booking_id
WHERE b.start_date >= '2024-01-01' 
  AND b.end_date <= '2024-12-31';

EXPLAIN ANALYZE
SELECT ...


    SELECT b.id AS booking_id, b.start_date, b.end_date,
       u.name AS user_name,
       p.name AS property_name,
       pay.amount, pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id;

