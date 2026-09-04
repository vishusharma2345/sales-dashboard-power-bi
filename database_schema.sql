CREATE TABLE `dim_customer` (
  `customer_id` int NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--+
| dim_date | CREATE TABLE `dim_date` (
  `date_id` int NOT NULL,
  `date` date NOT NULL,
  `day` int DEFAULT NULL,
  `month` int DEFAULT NULL,
  `month_name` varchar(20) DEFAULT NULL,
  `quarter` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `is_weekend` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`date_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.02 sec)

  
SHOW CREATE TABLE dim_product;
 CREATE TABLE `dim_product` (
  `product_id` int NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `sub_category` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.02 sec)

CREATE TABLE `dim_store` (
  `store_id` int NOT NULL,
  `store_name` varchar(100) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `store_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-----------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.02 sec)

mysql>


CREATE TABLE `fact_sales` (
  `sale_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  `date_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `customer_id` (`customer_id`),
  KEY `product_id` (`product_id`),
  KEY `store_id` (`store_id`),
  KEY `date_id` (`date_id`),
  CONSTRAINT `fact_sales_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `dim_customer` (`customer_id`),
  CONSTRAINT `fact_sales_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `dim_product` (`product_id`),
  CONSTRAINT `fact_sales_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `dim_store` (`store_id`),
  CONSTRAINT `fact_sales_ibfk_4` FOREIGN KEY (`date_id`) REFERENCES `dim_date` (`date_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.01 sec)

mysql>
