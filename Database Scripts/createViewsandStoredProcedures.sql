/*SCRIPT FIVE*/
/*Creates some important views and stored procedures to assist in running the db.*/

USE energyDrinkDB;

/*Create views for the secondary user groups, allowing improved ease-of-use.*/
CREATE OR REPLACE VIEW marketingOverview AS
SELECT consumers.age_range AS Age_Group, consumers.approximate_count AS Approximate_Count, products.ID AS Product_ID, consumes.num_consumed AS Amount_Consumed, consumes.date_measured AS Date_Measured
FROM products
JOIN consumes ON products.ID = consumes.product_ID
JOIN consumers ON consumers.age_range = consumes.age_range
ORDER BY Age_Group ASC, Product_ID ASC;

CREATE OR REPLACE VIEW accountingOverview AS
SELECT purchases.purchase_date AS Purchase_Date, stores.company_name AS Company, products.ID AS Product_ID, purchases.amount AS Quantity
FROM products 
JOIN purchases ON products.ID = purchases.product_ID
JOIN stores ON stores.company_name = purchases.company_name
ORDER BY Purchase_Date DESC;

CREATE OR REPLACE VIEW acquititionsOverview AS
SELECT ingredients.name AS Ingredient_Name, ingredients.stock AS Current_Stock, ingredients.type AS Ingredient_Type
FROM ingredients
ORDER BY Current_Stock ASC;

CREATE OR REPLACE VIEW shippingOverview AS
SELECT stores.company_name AS Company, products.ID AS Product_ID, products.type AS Product_Type, purchases.purchase_date AS Purchase_Date, purchases.amount AS Quantity, stores.shipping_method AS Shipping_Method
FROM stores
JOIN purchases ON stores.company_name = purchases.company_name
JOIN products ON purchases.product_ID = products.ID
ORDER BY Purchase_Date DESC;

/*Create stored procedures for primary user groups, for most primary actions performed on the database*/
/*Add the amount of the given ingredient to the total stocks of ingredients.*/
DELIMITER //
CREATE PROCEDURE restockIngredient(IN ingredient_name VARCHAR(64), IN amount DECIMAL(10,3))
BEGIN
UPDATE ingredients 
SET stock = stock + amount
WHERE name = ingredient_name;
END //
DELIMITER ;

/*Make the given amount of the specified product, using it's defined recipe, subtracting the required ingredients. Rollback if insufficient ingredients.*/
DELIMITER //
CREATE PROCEDURE makeProduct(IN productID CHAR(3), IN amount INTEGER)
BEGIN 
DECLARE recipename VARCHAR(64);
DECLARE volume INTEGER DEFAULT 0;
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
    RESIGNAL;
END;
START TRANSACTION;
	SET recipename = (SELECT recipe_name FROM produces WHERE product_ID = productID);
	SET volume = amount * (SELECT unit_volume FROM products WHERE ID = productID);
	DROP TEMPORARY TABLE IF EXISTS productionTemp;
	CREATE TEMPORARY TABLE productionTemp AS
		(SELECT ingredient_name, quantity 
		FROM is_used_in
		WHERE recipe_name = recipename);
	SET SQL_SAFE_UPDATES=0;
	UPDATE productionTemp
		SET quantity = quantity * volume;
	SET SQL_SAFE_UPDATES=1;
	UPDATE ingredients, productionTemp
		SET ingredients.stock = ingredients.stock - productionTemp.quantity
        WHERE ingredients.name = productionTemp.ingredient_name;
	UPDATE products
		SET stock = stock + amount
		WHERE products.ID = productID;
COMMIT;
END //
DELIMITER ;

/*Create a new log of consumer preferences.*/
DELIMITER //
CREATE PROCEDURE logPreference(IN productID CHAR(3), IN ageRange VARCHAR(64), IN amount INTEGER)
BEGIN
INSERT INTO consumes VALUES (productID, ageRange, amount, SYSDATE());
END //
DELIMITER ;

/*Sell a given amount of a given product to a given company, logging it in the purchases table.*/
DELIMITER //
CREATE PROCEDURE sellProduct(IN productID CHAR(3), IN company VARCHAR(64), IN amount INTEGER)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;
    RESIGNAL;
END;
START TRANSACTION;
	UPDATE products
		SET products.stock = products.stock - amount
		WHERE products.ID  = productID;
	INSERT INTO purchases VALUES (productID, company, amount, SYSDATE());
COMMIT;
END //
DELIMITER ;