/*SCRIPT SIX*/
/*Creates user roles for the primary users of the database, as well as roles for secondary users.*/
USE energyDrinkDB;

/*Create roles for primary users, and assign needed privileges.*/
CREATE ROLE IF NOT EXISTS 'production', 'sales', 'research';

GRANT SELECT, UPDATE, INSERT ON ingredients TO 'production';
GRANT SELECT, UPDATE, INSERT ON products TO 'production';
GRANT SELECT ON is_used_in TO 'production';
GRANT SELECT ON produces TO 'production';
GRANT SELECT ON ingredient_types TO 'production';
GRANT SELECT ON product_types TO 'production';
GRANT EXECUTE ON PROCEDURE restockIngredient TO 'production';
GRANT EXECUTE ON PROCEDURE makeProduct TO 'production';

GRANT SELECT, UPDATE, INSERT ON products TO 'sales';
GRANT SELECT, UPDATE, INSERT ON stores TO 'sales';
GRANT SELECT, UPDATE, INSERT ON purchases TO 'sales';
GRANT SELECT, UPDATE, INSERT ON company_types TO 'sales';
GRANT SELECT ON consumers TO 'sales';
GRANT SELECT ON consumes TO 'sales';
GRANT EXECUTE ON PROCEDURE sellProduct TO 'sales';

GRANT SELECT, UPDATE, INSERT ON recipes TO 'research';
GRANT SELECT, UPDATE, INSERT ON consumers TO 'research';
GRANT SELECT, UPDATE, INSERT ON is_used_in TO 'research';
GRANT SELECT, UPDATE, INSERT ON produces TO 'research';
GRANT SELECT, UPDATE, INSERT ON consumes TO 'research';
GRANT SELECT, UPDATE, INSERT ON flavors TO 'research';
GRANT SELECT, UPDATE, INSERT ON product_types TO 'research';
GRANT SELECT ON ingredients TO 'research';
GRANT SELECT ON ingredient_types TO 'research';
GRANT EXECUTE ON PROCEDURE logPreference TO 'research';

/*Create roles for secondary users, and assign needed privileges.*/
CREATE ROLE IF NOT EXISTS 'management', 'marketing', 'accounting', 'acquititions', 'shipping';

GRANT SELECT ON *.* TO 'management';

GRANT SELECT ON products TO 'marketing';
GRANT SELECT ON consumers TO 'marketing';
GRANT SELECT ON consumes TO 'marketing';
GRANT SELECT ON marketingOverview TO 'marketing';

GRANT SELECT ON products TO 'accounting';
GRANT SELECT ON stores TO 'accounting';
GRANT SELECT ON purchases TO 'accounting';
GRANT SELECT ON company_types TO 'accounting';
GRANT SELECT ON accountingOverview TO 'accounting';

GRANT SELECT ON ingredients TO 'acquititions';
GRANT SELECT ON ingredient_types TO 'acquititions';
GRANT SELECT ON acquititionsOverview TO 'acquititions';

GRANT SELECT ON products TO 'shipping';
GRANT SELECT ON stores TO 'shipping';
GRANT SELECT ON purchases TO 'shipping';
GRANT SELECT ON product_types TO 'shipping';
GRANT SELECT ON company_types TO 'shipping';
GRANT SELECT ON shippingOverview TO 'shipping';