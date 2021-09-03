USE lab_mysql;

CREATE TABLE IF NOT EXISTS customers (
  customer_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  address VARCHAR(45),
  city VARCHAR(45),
  state CHAR(2),
  country VARCHAR(40),
  zip INT,
  PRIMARY KEY  (customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS invoice (
  invoice_num BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  date_ DATE NOT NULL,
  car CHAR(10) NOT NULL,
  vin CHAR(15) NOT NULL,
  customer VARCHAR(50) NOT NULL,
  staff_id BIGINT NOT NULL,
  customer_id BIGINT NOT NULL,
  PRIMARY KEY  (invoice_num),
  KEY idx_fk_vin (vin),
  KEY idx_fk_customer_id (customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS salespersons (
  staff_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  store_company VARCHAR(50) NOT NULL,
  PRIMARY KEY  (staff_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS cars (
  vin BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  manufacturer VARCHAR(50) NOT NULL,
  model VARCHAR(50) NOT NULL,
  year_ INT,
  color VARCHAR(20),
  PRIMARY KEY  (vin)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

