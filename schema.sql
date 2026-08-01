-- schema.sql
-- Estrutura do banco de dados de uma loja fictícia (e-commerce simplificado)
-- Versão para PostgreSQL

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id     SERIAL PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    email           VARCHAR(150) UNIQUE NOT NULL,
    city            VARCHAR(100),
    state           VARCHAR(2),
    created_at      DATE NOT NULL
);

CREATE TABLE categories (
    category_id     SERIAL PRIMARY KEY,
    name            VARCHAR(80) NOT NULL
);

CREATE TABLE products (
    product_id      SERIAL PRIMARY KEY,
    name            VARCHAR(150) NOT NULL,
    category_id     INT NOT NULL REFERENCES categories(category_id),
    price           NUMERIC(10,2) NOT NULL,
    stock_quantity  INT NOT NULL DEFAULT 0
);

CREATE TABLE orders (
    order_id        SERIAL PRIMARY KEY,
    customer_id     INT NOT NULL REFERENCES customers(customer_id),
    order_date      DATE NOT NULL,
    status          VARCHAR(20) NOT NULL DEFAULT 'completed'
        CHECK (status IN ('completed', 'pending', 'cancelled'))
);

CREATE TABLE order_items (
    order_item_id   SERIAL PRIMARY KEY,
    order_id        INT NOT NULL REFERENCES orders(order_id),
    product_id      INT NOT NULL REFERENCES products(product_id),
    quantity        INT NOT NULL CHECK (quantity > 0),
    unit_price      NUMERIC(10,2) NOT NULL
);

CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orders_date ON orders(order_date);
CREATE INDEX idx_order_items_order ON order_items(order_id);
CREATE INDEX idx_order_items_product ON order_items(product_id);
CREATE INDEX idx_products_category ON products(category_id);
