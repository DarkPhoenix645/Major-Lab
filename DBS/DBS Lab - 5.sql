CREATE TABLE users (
	id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(10),
    address VARCHAR(255),
    created_at TIMESTAMP DEFAULT(CURRENT_TIMESTAMP)
);

CREATE TABLE orders (
	order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    shipping_address VARCHAR(255),
    billing_address VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES users(id)
);

CREATE TABLE products (
	product_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(8,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

/* Problem 1 */
ALTER TABLE users
MODIFY phone_number VARCHAR(12);

/* Problem 2 */
SELECT * FROM orders WHERE order_date IS NULL;
UPDATE orders SET order_date = '1970-01-01' WHERE order_date IS NULL;
ALTER TABLE orders MODIFY order_date DATE NOT NULL;

/* Problem 3 */
ALTER TABLE users RENAME COLUMN created_at TO created_on;

/* Problem 4 */
ALTER TABLE users DROP COLUMN address;
ALTER TABLE users ADD COLUMN address TEXT AFTER phone_number;

/* Problem 5 */
ALTER TABLE products MODIFY updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

/* Problem 6 */
ALTER TABLE products MODIFY price DECIMAL(8,2) AFTER name;

/* Problem 7 */
ALTER TABLE orders MODIFY product_id INT DEFAULT 1000 NOT NULL;

/* Problem 8 */
ALTER TABLE orders DROP FOREIGN KEY orders_ibfk_1;
ALTER TABLE orders MODIFY customer_id VARCHAR(10);
ALTER TABLE users MODIFY id VARCHAR(10);

ALTER TABLE orders
ADD CONSTRAINT fk_customer_id
FOREIGN KEY (customer_id) REFERENCES users(id);