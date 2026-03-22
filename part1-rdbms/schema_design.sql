### ✅ Tables

sql
-- Customers
CREATE TABLE customers (
    customer_id VARCHAR PRIMARY KEY,
    customer_name VARCHAR NOT NULL,
    city VARCHAR NOT NULL
);

-- Products
CREATE TABLE products (
    product_id VARCHAR PRIMARY KEY,
    product_name VARCHAR NOT NULL,
    category VARCHAR NOT NULL
);

-- Sales Representatives
CREATE TABLE sales_reps (
    rep_id VARCHAR PRIMARY KEY,
    rep_name VARCHAR NOT NULL
);

-- Orders
CREATE TABLE orders (
    order_id VARCHAR PRIMARY KEY,
    customer_id VARCHAR,
    order_date DATE,
    total_amount DECIMAL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order Items
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id VARCHAR,
    product_id VARCHAR,
    quantity INT,
    price DECIMAL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);