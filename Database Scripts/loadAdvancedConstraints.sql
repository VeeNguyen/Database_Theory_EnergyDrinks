/*SCRIPT TWO*/
/*Initalizes advanced constraints (primarily those that make use of triggers and bookkeeping tables), as well as loads bookkeeping data.*/
USE energyDrinkDB;

/*Load the basic values into the bookkeeping tables.*/
INSERT INTO ingredient_types VALUES ("Natural Sweetener");
INSERT INTO ingredient_types VALUES ("Artifical Sweetener");
INSERT INTO ingredient_types VALUES ("Preservative");
INSERT INTO ingredient_types VALUES ("Stimulant");
INSERT INTO ingredient_types VALUES ("Supplement");
INSERT INTO ingredient_types VALUES ("Coloring");
INSERT INTO ingredient_types VALUES ("Base");
INSERT INTO ingredient_types VALUES ("Flavoring");
INSERT INTO ingredient_types VALUES ("Extract");
INSERT INTO ingredient_types VALUES ("Other");

INSERT INTO flavors VALUES ("Apple");
INSERT INTO flavors VALUES ("Cola");
INSERT INTO flavors VALUES ("Grape");
INSERT INTO flavors VALUES ("Orange");
INSERT INTO flavors VALUES ("Shockolate");
INSERT INTO flavors VALUES ("Lemon-Lime");
INSERT INTO flavors VALUES ("Citrus");
INSERT INTO flavors VALUES ("Cherry");
INSERT INTO flavors VALUES ("Berry");
INSERT INTO flavors VALUES ("Tea");
INSERT INTO flavors VALUES ("Strawberry");
INSERT INTO flavors VALUES ("Vanilla");
INSERT INTO flavors VALUES ("Coffee");
INSERT INTO flavors VALUES ("Other");

INSERT INTO product_types VALUES ("Single Can");
INSERT INTO product_types VALUES ("Single Bottle");
INSERT INTO product_types VALUES ("4-Pack Cans");
INSERT INTO product_types VALUES ("6-Pack Bottles");
INSERT INTO product_types VALUES ("12-Pack Cans");
INSERT INTO product_types VALUES ("24-Pack Cans");
INSERT INTO product_types VALUES ("Other");

INSERT INTO company_types VALUES ("Vending Machine");
INSERT INTO company_types VALUES ("Supermarket");
INSERT INTO company_types VALUES ("Convenience Store");
INSERT INTO company_types VALUES ("Restraunt");
INSERT INTO company_types VALUES ("Other");

/*Create triggers*/

/*Checks if date was included for recipe.date_created, if not, sets to current date.*/
DELIMITER //
CREATE TRIGGER recipe_date_check
BEFORE INSERT
ON recipes FOR EACH ROW
BEGIN
	IF new.date_created IS NULL THEN
		SET new.date_created = SYSDATE();
	END IF;
END //
DELIMITER ;

/*Checks if date was included for purchases.purchase_date, if not, sets to current date.*/
DELIMITER //
CREATE TRIGGER purchase_date_check
BEFORE INSERT
ON purchases FOR EACH ROW
BEGIN
	IF new.purchase_date IS NULL THEN
		SET new.purchase_date = SYSDATE();
	END IF;
END //
DELIMITER ;

/*Checks if date was included for consumes.date_measured, if not, sets to current date.*/
DELIMITER //
CREATE TRIGGER consumes_date_check
BEFORE INSERT
ON consumes FOR EACH ROW
BEGIN
	IF new.date_measured IS NULL THEN
		SET new.date_measured = SYSDATE();
	END IF;
END //
DELIMITER ;