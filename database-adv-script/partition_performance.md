# Partitioning Performance Report - Airbnb Database

This report documents the implementation of **table partitioning** on the `bookings` table and its performance impact.

---

## 1. Problem
The `bookings` table had grown significantly (millions of rows), and queries filtering by `start_date` were slow due to full table scans.

---

## 2. Solution
We implemented **range partitioning** on the `bookings` table using the `start_date` column.

### Partitioning Steps
1. Created a new partitioned table `bookings` with `PARTITION BY RANGE (start_date)`.
2. Added yearly partitions (`bookings_2023`, `bookings_2024`, `bookings_2025`).
3. Migrated old data from `bookings_old` into the new structure.
4. Ran test queries filtering on date ranges.

---

## 3. Query Test

### Example Query
```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';

