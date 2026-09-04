query 1: Products by Revenue
mysql> SELECT
    ->     p.product_name,
    ->     SUM(f.quantity * f.unit_price) AS total_revenue
    -> FROM fact_sales f
    -> JOIN dim_product p
    ->     ON f.product_id = p.product_id
    -> GROUP BY p.product_name
    -> ORDER BY total_revenue DESC
    -> LIMIT 5;
+---------------+---------------+
| product_name  | total_revenue |
+---------------+---------------+
| Laptop Pro 14 |     225000.00 |
| Smartphone X  |     135000.00 |
| Monitor 27    |      54000.00 |
| Standing Desk |      44000.00 |
| Office Chair  |      36000.00 |
+---------------+---------------+
5 rows in set (0.07 sec)

query 2:Monthly Sales Revenue
mysql> SELECT
    ->     d.year,
    ->     d.month,
    ->     SUM(f.quantity * f.unit_price) AS total_revenue
    -> FROM fact_sales f
    -> JOIN dim_date d
    ->     ON f.date_id = d.date_id
    -> GROUP BY d.year, d.month
    -> ORDER BY d.year, d.month;
+------+-------+---------------+
| year | month | total_revenue |
+------+-------+---------------+
| 2024 |     1 |     165000.00 |
| 2024 |     2 |      67000.00 |
| 2024 |     3 |      30000.00 |
| 2024 |     4 |      16500.00 |
| 2024 |     5 |      97000.00 |
| 2024 |     6 |      42000.00 |
| 2024 |     7 |      13500.00 |
| 2024 |     8 |      12500.00 |
| 2024 |     9 |       9000.00 |
| 2024 |    10 |       3000.00 |
| 2024 |    11 |      18000.00 |
| 2024 |    12 |      75000.00 |
+------+-------+---------------+
12 rows in set (0.02 sec)

query 3:Customers by Spending
mysql> SELECT
    ->     c.customer_name,
    ->     SUM(f.quantity * f.unit_price) AS total_spent
    -> FROM fact_sales f
    -> JOIN dim_customer c
    ->     ON f.customer_id = c.customer_id
    -> GROUP BY c.customer_name
    -> ORDER BY total_spent DESC
    -> LIMIT 5;
+---------------+-------------+
| customer_name | total_spent |
+---------------+-------------+
| Priya Verma   |   120000.00 |
| Rahul Mehta   |   114000.00 |
| Aarav Sharma  |    93000.00 |
| Vikram Rao    |    79500.00 |
| Ananya Gupta  |    48000.00 |
+---------------+-------------+
5 rows in set (0.00 sec)

  query 4:  sales by Store
 SELECT
    ->     s.store_name,
    ->     SUM(f.quantity * f.unit_price) AS total_revenue
    -> FROM fact_sales f
    -> JOIN dim_store s
    ->     ON f.store_id = s.store_id
    -> GROUP BY s.store_name
    -> ORDER BY total_revenue DESC;
+---------------------+---------------+
| store_name          | total_revenue |
+---------------------+---------------+
| Bangalore Tech Park |     180000.00 |
| Delhi Central       |     157500.00 |
| Mumbai Mall         |     131000.00 |
| Pune Business Hub   |      44500.00 |
| Hyderabad Central   |      35500.00 |
+---------------------+---------------+
5 rows in set (0.01 sec)

query 5:   sales by state
 SELECT
    ->     c.state,
    ->     SUM(f.quantity * f.unit_price) AS total_revenue
    -> FROM fact_sales f
    -> JOIN dim_customer c
    ->     ON f.customer_id = c.customer_id
    -> GROUP BY c.state
    -> ORDER BY total_revenue DESC;
+---------------+---------------+
| state         | total_revenue |
+---------------+---------------+
| Maharashtra   |     146500.00 |
| Karnataka     |     114000.00 |
| Delhi         |      93000.00 |
| Tamil Nadu    |      79500.00 |
| Telangana     |      48000.00 |
| Rajasthan     |      28000.00 |
| Gujarat       |      18000.00 |
| West Bengal   |      11000.00 |
| Uttar Pradesh |      10500.00 |
+---------------+---------------+
9 rows in set (0.01 sec)

