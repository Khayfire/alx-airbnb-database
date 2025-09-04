# Database Performance Monitoring & Refinement - Airbnb Database

This report documents the continuous monitoring process for the **alx-airbnb-database** project, using query execution plans to detect and resolve bottlenecks.

---

## 1. Monitoring Tools

We used:

- **EXPLAIN / EXPLAIN ANALYZE (PostgreSQL, MySQL, MariaDB)**  
  Provides query execution plans, cost estimates, and runtime performance.  

- **SHOW PROFILE (MySQL)**  
  Displays detailed resource usage (CPU, I/O, memory) for queries.  

---

## 2. Queries Monitored

### Query A: Count Bookings by User
```sql
EXPLAIN ANALYZE
SELECT u.id, u.name, COUNT(b.id) AS total_bookings
FROM users u
JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name;

