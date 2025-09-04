# Index Performance Analysis - Airbnb Database

This document explains the indexes created for the **alx-airbnb-database** project and their impact on query performance.

---

## 1. Identified High-Usage Columns

- **Users Table**
  - `id` → used in JOINs with `bookings.user_id`
  - `email` → used in WHERE clauses for login/authentication

- **Bookings Table**
  - `user_id` → used in JOINs with `users.id`
  - `property_id` → used in JOINs with `properties.id`
  - `start_date`, `end_date` → used in search queries and filters

- **Properties Table**
  - `id` → used in JOINs with `bookings.property_id`
  - `location` → used in search filters

---

## 2. Indexes Created

```sql
-- Users table
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_id ON users(id);

-- Bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_bookings_end_date ON bookings(end_date);

-- Properties table
CREATE INDEX idx_properties_id ON properties(id);
CREATE INDEX idx_properties_location ON properties(location);
