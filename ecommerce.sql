-- Creating the database
CREATE DATABASE EcommerceDB;

-- Use the database
USE EcommerceDB;

-- Creating a table to store the product's image
CREATE TABLE product_image (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,                           -- (product)
    image_url VARCHAR(255) NOT NULL           -- (Stores product image URLs or file references)
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Creating a table to manage available color options
CREATE TABLE color (
    color_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL                -- (available color options)
);

-- Creating a table that classifies products into categories
CREATE TABLE product_category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL                -- (name)
);

-- Creating a table that stores general product details 
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,               -- (name)
    brand_id INT,                             -- (brand)
    base_price DECIMAL(10,2) NOT NULL,        -- (base price)
    category_id INT,                          -- (product_category)
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- Creating a table that represents purchasable items with specific variations
CREATE TABLE product_item (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,                           -- (product)
    variation_id INT,                         -- (product_variation)
    stock_quantity INT NOT NULL,              -- (Stores stock availability)
    price DECIMAL(10,2) NOT NULL,             -- (Represents purchasable items with specific variations)
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id)
);

-- Creating a table that stores brand related data
CREATE TABLE brand (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,               -- (name)
    description TEXT                          -- (description)
);


-- Creating a table that links a product to its variations
CREATE TABLE product_variation (
    variation_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,                           -- (product)
    color_id INT,                             -- (color)
    size_option_id INT,                       -- (size)
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);


-- Creating a table that groups sizes into categories
CREATE TABLE size_category (
    size_category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL         -- (Groups sizes into categories e.g., clothing sizes, shoe sizes)
);

-- Creating a table that lists specific sizes
CREATE TABLE size_option (
    size_option_id INT PRIMARY KEY AUTO_INCREMENT,
    size_category_id INT,                      -- (size_category)
    value VARCHAR(50) NOT NULL,                -- (specific sizes e.g., S, M, L, 42)
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- Creating a table that stores custom attributes
CREATE TABLE product_attribute (
    attribute_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,                            -- (product)
    attribute_category_id INT,                 -- (attribute_category)
    attribute_type_id INT,                     -- (attribute_type)
    value VARCHAR(255) NOT NULL,               -- (Stores custom attributes e.g., material, weight)
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);

-- Creating a table that groups attributes into categories
CREATE TABLE attribute_category (
    attribute_category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL              -- (Groups attributes into categories e.g., physical, technical)
);

-- Creating a table that defines types of attributes
CREATE TABLE attribute_type (
    attribute_type_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(100) NOT NULL         -- (Defines types of attributes e.g., text, number, boolean)
);



-- Inserting into product_image
INSERT INTO product_image (product_id, image_url) VALUES 
(1, 'nike_air_max.jpg'),
(2, 'iphone_13.jpg'),
(3, 'galaxy_s21.jpg'),
(4, 'adidas_ultraboost.jpg'),
(5, 'ps5_console.jpg');

-- Inserting into color
INSERT INTO color (name) VALUES 
('Red'),
('Blue'),
('Black'),
('White'),
('Green');

-- Inserting into product_category
INSERT INTO product_category (name) VALUES 
('Clothing'),
('Electronics'),
('Footwear'),
('Accessories'),
('Home Appliances');

-- Inserting into product
INSERT INTO product (name, brand_id, base_price, category_id) VALUES 
('Air Max Shoes', 1, 120.99, 3),
('iPhone 13', 2, 799.99, 2),
('Galaxy S21', 3, 699.99, 2),
('Ultraboost Sneakers', 4, 180.49, 3),
('PlayStation 5', 5, 499.99, 2);

-- Inserting into product_item
INSERT INTO product_item (product_id, variation_id, stock_quantity, price) VALUES 
(1, 1, 50, 120.99),
(2, 2, 30, 799.99),
(3, 3, 25, 699.99),
(4, 4, 40, 180.49),
(5, 5, 15, 499.99);

-- Inserting into brand
INSERT INTO brand (name, description) VALUES 
('Nike', 'Sportswear and athletic gear'),
('Apple', 'Consumer electronics and software'),
('Samsung', 'Innovative technology solutions'),
('Adidas', 'Footwear and apparel'),
('Sony', 'Entertainment and digital devices');

-- Inserting into product_variation
INSERT INTO product_variation (product_id, color_id, size_option_id) VALUES 
(1, 3, 4),
(2, 2, NULL),
(3, 1, NULL),
(4, 5, 5),
(5, 4, NULL);

-- Inserting into size_category
INSERT INTO size_category (name) VALUES 
('Clothing Sizes'),
('Shoe Sizes'),
('TV Screen Sizes'),
('Laptop Dimensions'),
('Appliance Capacities');

-- Inserting into size_option
INSERT INTO size_option (size_category_id, value) VALUES 
(1, 'S'),
(1, 'M'),
(1, 'L'),
(2, '42'),
(2, '44');

-- Inserting into product_attribute
INSERT INTO product_attribute (product_id, attribute_category_id, attribute_type_id, value) VALUES 
(1, 3, 1, 'Leather'),
(2, 2, 4, '256GB'),
(3, 5, 5, 'OLED'),
(4, 3, 1, 'Mesh'),
(5, 2, 4, '825GB');

-- Inserting into attribute_category
INSERT INTO attribute_category (name) VALUES 
('Physical'),
('Technical'),
('Material'),
('Weight'),
('Screen Type');

-- Inserting into attribute_type
INSERT INTO attribute_type (type_name) VALUES 
('Text'),
('Number'),
('Boolean'),
('Decimal'),
('Enum');























