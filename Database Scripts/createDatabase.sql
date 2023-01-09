/*SCRIPT ONE*/
/*Create intial database schema, tables, and basic check/foreign key constraints.*/

/*Create database entity*/
CREATE DATABASE energyDrinkDB;
USE energyDrinkDB;

/*Create entity tables*/
CREATE TABLE ingredients(
	name VARCHAR(64) PRIMARY KEY,
	stock DECIMAL(10, 3),
	type VARCHAR(64)
	);
CREATE TABLE recipes(
	name VARCHAR(64) PRIMARY KEY,
	flavor VARCHAR(64),
	date_created DATE,
	calories_per_unit DECIMAL(10, 3)
	);
CREATE TABLE products(
	ID CHAR(3) PRIMARY KEY,
	name VARCHAR(64) NOT NULL,
	unit_volume DECIMAL(10, 3),
	type VARCHAR(64),
	stock INTEGER
	);
CREATE TABLE stores(
	company_name VARCHAR(64) PRIMARY KEY,
	num_stores INTEGER,
	shipping_method VARCHAR(64),
	type VARCHAR(64)
	);
CREATE TABLE consumers(
	age_range VARCHAR(64) PRIMARY KEY,
	approximate_count INTEGER
	);
	
/*Create relation tables*/
CREATE TABLE is_used_in(
	ingredient_name VARCHAR(64),
	recipe_name VARCHAR(64),
	quantity DECIMAL(10,3),
	FOREIGN KEY(ingredient_name) REFERENCES ingredients(name) ON DELETE CASCADE,
	FOREIGN KEY(recipe_name) REFERENCES recipes(name) ON DELETE CASCADE
	);
CREATE TABLE produces(
	recipe_name VARCHAR(64),
	product_ID CHAR(3),
	FOREIGN KEY(recipe_name) REFERENCES recipes(name) ON DELETE CASCADE,
	FOREIGN KEY(product_ID) REFERENCES products(ID) ON DELETE CASCADE
	);
CREATE TABLE purchases(
	product_ID CHAR(3),
	company_name VARCHAR(64),
	amount INTEGER,
	purchase_date DATE,
	FOREIGN KEY(product_ID) REFERENCES products(ID) ON DELETE CASCADE,
	FOREIGN KEY(company_name) REFERENCES stores(company_name) ON DELETE CASCADE
	);
CREATE TABLE consumes(
	product_ID CHAR(3),
	age_range VARCHAR(64),
	num_consumed INTEGER,
	date_measured DATE,
	FOREIGN KEY(product_ID) REFERENCES products(ID) ON DELETE CASCADE,
	FOREIGN KEY(age_range) REFERENCES consumers(age_range) ON DELETE CASCADE
	);

/*Create bookkeeping tables*/
CREATE TABLE ingredient_types(
	type VARCHAR(64) PRIMARY KEY
	);
CREATE TABLE flavors(
	flavor VARCHAR(64) PRIMARY KEY
	);
CREATE TABLE product_types(
	type VARCHAR(64) PRIMARY KEY
	);
CREATE TABLE company_types(
	type VARCHAR(64) PRIMARY KEY
	);
	
/*Accounts table for user authentication*/
CREATE TABLE IF NOT EXISTS accounts (
    id int(11) NOT NULL AUTO_INCREMENT,
    username varchar(50) NOT NULL,
    password varchar(255) NOT NULL,
    email varchar(100) NOT NULL,
    PRIMARY KEY (id)
	) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
	
/*Default test account.*/
INSERT INTO accounts (id, username, password, email) VALUES (1, 'test', 'test', 'test@test.com');
	
/*Add basic constraints*/
ALTER TABLE ingredients
	ADD CONSTRAINT
	CHECK (stock >= 0),
	ADD CONSTRAINT
	FOREIGN KEY(type) REFERENCES ingredient_types(type) ON DELETE RESTRICT ON UPDATE CASCADE;
	
ALTER TABLE recipes
	ADD CONSTRAINT
	CHECK (date_created <= SYSDATE()),
	ADD CONSTRAINT
	CHECK (calories_per_unit >= 0),
	ADD CONSTRAINT
	FOREIGN KEY(flavor) REFERENCES flavors(flavor) ON DELETE RESTRICT ON UPDATE CASCADE;
	
ALTER TABLE products
	ADD CONSTRAINT
	CHECK (unit_volume > 0),
	ADD CONSTRAINT 
	CHECK (stock >= 0),
	ADD CONSTRAINT
	FOREIGN KEY(type) REFERENCES product_types(type) ON DELETE RESTRICT ON UPDATE CASCADE;
	
ALTER TABLE stores
	ADD CONSTRAINT
	CHECK (num_stores >= 0),
	ADD CONSTRAINT
	CHECK (shipping_method IN ("Company-Managed", "Client-Managed")),
	ADD CONSTRAINT
	FOREIGN KEY(type) REFERENCES company_types(type) ON DELETE RESTRICT ON UPDATE CASCADE;
	
ALTER TABLE consumers
	ADD CONSTRAINT
	CHECK (approximate_count >= 0);
	
ALTER TABLE is_used_in
	ADD CONSTRAINT
	CHECK (quantity >= 0);
	
ALTER TABLE purchases
	ADD CONSTRAINT
	CHECK (amount > 0),
	ADD CONSTRAINT
	CHECK (purchase_date <= SYSDATE());
	
ALTER TABLE consumes
	ADD CONSTRAINT
	CHECK (num_consumed >= 0),
	ADD CONSTRAINT
	CHECK (date_measured <= SYSDATE());