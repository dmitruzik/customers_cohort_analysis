-- SELECT * FROM orders;

-- EDA

-- 1. Check table structure and data types

-- SELECT
--     column_name,
--     data_type
-- FROM information_schema.columns
-- WHERE table_name = 'orders';

--2. Row Count, basic sanity check

-- SELECT COUNT(*) AS total_rows FROM orders;

--3. Check for missing values

-- SELECT
--     COUNT(*) FILTER (WHERE customer_id IS NULL) AS missing_customer_id,
--     COUNT(*) FILTER (WHERE order_date IS NULL)  AS missing_order_date,
--     COUNT(*) FILTER (WHERE revenue IS NULL)     AS missing_revenue,
--     COUNT(*) FILTER (WHERE country IS NULL)     AS missing_country,
--     COUNT(*) FILTER (WHERE channel IS NULL)     AS missing_channel
-- FROM orders;

--4. Check for duplicates:

-- SELECT
--     order_id,
--     COUNT(*)
-- FROM orders
-- GROUP BY order_id
-- HAVING COUNT(*) > 1;

--5. Date Range and temporal coverage

-- SELECT
--     MIN(order_date) AS first_order,
--     MAX(order_date) AS last_order
-- FROM orders;

--6. Customer behaviour sanity checks

-- SELECT COUNT(DISTINCT customer_id) AS ubique_customers
-- FROM orders;

-- Orders per Customer distribution

-- SELECT
--     customer_id,
--     COUNT(*) AS orders_count
-- FROM orders
-- GROUP BY customer_id
-- ORDER BY orders_count DESC
-- LIMIT 10;

--7. Revenue quality checks

-- SELECT
--     MIN(revenue) AS min_revenue,
--     MAX(revenue) AS max_revenue,
--     AVG(revenue) AS avg_revenue
-- FROM orders;

-- Potential outliers
-- Identify revenue outliers using IQR method
-- WITH stats AS (
--     SELECT
--         PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY revenue) AS q1,
--         PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY revenue) AS q3
--     FROM orders
-- )
-- SELECT *
-- FROM orders, stats
-- WHERE revenue > q3 + 1.5 * (q3 - q1);

--8. Categorical value validation

-- SELECT
--     country,
--     COUNT(*) AS cnt
-- FROM orders
-- GROUP BY country
-- ORDER BY cnt DESC;

-- 8.1. Channels
-- SELECT
--     channel,
--     COUNT(*) AS cnt
-- FROM orders
-- GROUP BY channel;

-- 9. Final EDA query. Main KPI
-- SELECT
--     COUNT(*) AS total_orders,
--     COUNT(DISTINCT customer_id) AS total_customers,
--     ROUND(AVG(revenue), 2) AS avg_order_value,
--     COUNT(*)::NUMERIC / COUNT(DISTINCT customer_id) AS orders_per_customer
-- FROM orders;


