-- Create indexes to improve query performance

-- Users table: Frequently queried by email (login, authentication) and id (joins)
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_id ON users(id);

-- Bookings table: Frequently queried by user_id, property_id (joins), start_date (search), end_date (search)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_bookings_end_date ON bookings(end_date);

-- Properties table: Frequently queried by location and id (joins)
CREATE INDEX idx_properties_id ON properties(id);
CREATE INDEX idx_properties_location ON properties(location);

-- o evaluate performance improvements, we used EXPLAIN (or EXPLAIN ANALYZE in PostgreSQL).
EXPLAIN ANALYZE
SELECT u.name, COUNT(b.id) AS total_bookings
FROM users u
JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name;

--
EXPLAIN ANALYZE
SELECT * FROM properties
WHERE location = 'New York';


