use energyDrinkDB;
/* 1. What consumer groups enjoy recipe X the most?  (limit 1 is used to get the first row)*/

CREATE VIEW popular_recipe as
SELECT distinct produces.recipe_name, max(consumes.num_consumed) as max_consumed, consumers.age_range
FROM produces,products,consumes,consumers
WHERE produces.product_ID = products.ID and consumes.product_ID = products.ID and consumers.age_range = consumes.age_range
GROUP BY consumers.age_range
ORDER BY consumes.num_consumed DESC;

SELECT age_range
FROM popular_recipe
WHERE recipe_name = 'x' limit 1;


/* 2. How much of product X does consumers ages 16-18 consume on average?*/
CREATE view AVG_consumed As
SELECT products.ID, products.name AS prod_name, consumes.age_range, AVG(consumes.num_consumed) AS avg_consumed
FROM products, consumes, consumers
WHERE products.ID = consumes.product_ID 
Group by products.ID;

SELECT avg_consumed
FROM AVG_consumed
WHERE prod_name = 'x' and age_range = '16-18';

/* 3. What types of stores buy the most of product X? */
CREATE VIEW Max_Amount_Type AS
SELECT stores.type, MAX(purchases.amount) as max_amount, stores.company_name, products.name as product_name
FROM products,purchases,stores
WHERE products.ID = purchases.product_ID and purchases.company_name = stores.company_name 
GROUP BY products.name;

SELECT type
FROM Max_Amount_Type
WHERE product_name = 'x';

/*4. What recipes use more than X different ingredients of the same type? */

select distinct recipes.name as recipe_name
from ingredients, recipes, is_used_in
where is_used_in.ingredient_name = ingredients.name and is_used_in.recipe_name = recipes.name
group by ingredients.type, ingredients.name
having count(ingredients.type) > 'x';

/* 5. List the flavors of drinks produced by order of popularity. */

SELECT distinct recipes.flavor
FROM recipes,produces,products,consumes
WHERE recipes.name = produces.recipe_name and produces.product_ID = products.ID and consumes.product_ID = products.ID
order by consumes.num_consumed;

/* 6. What types of stores stock products that use recipe X? */

CREATE VIEW store_type_recipe as
SELECT distinct stores.type as store_type, produces.recipe_name
FROM stores, purchases, products, produces
WHERE stores.company_name = purchases.company_name and purchases.product_ID = products.ID and products.ID = produces.product_ID ;

SELECT store_type
FROM store_type_recipe
WHERE recipe_name = 'x';

/* 7. What stores manage their own shipping? */
SELECT company_name
FROM stores
WHERE shipping_method = 'Client-Managed';

/* 8. What products contain the most sodium citrate? */

CREATE VIEW max_ingredient as
SELECT products.name as prod_name, max(is_used_in.quantity) as max_quantity, is_used_in.ingredient_name
FROM products,produces,recipes,is_used_in
WHERE products.ID = produces.product_ID AND recipes.name = produces.recipe_name AND is_used_in.recipe_name = recipes.name 
GROUP BY is_used_in.ingredient_name;

SELECT prod_name
FROM max_ingredient
WHERE ingredient_name = 'Sodium Citrate';

/* 9. List the products that are sold in stores of type x. */
CREATE VIEW prod_in_store as
SELECT DISTINCT products.name as prod_name, stores.company_name, stores.type as store_type
FROM products,purchases,stores
WHERE products.ID = purchases.product_ID and purchases.company_name = stores.company_name; 

SELECT prod_name
FROM prod_in_store
WHERE store_type = 'x';

/* 10. What stores have bought at least amount X of all products from the company in the last two years? */

SELECT company_name, sum(amount)
FROM purchases
WHERE purchase_date >= date_add(curdate(), interval -2 year)
GROUP BY company_name
HAVING sum(amount) > 'x';

/* 11. What products have consumers been preferring in the last eight months? */

SELECT distinct products.name as prod_name, max(consumes.num_consumed) as max_consumed
FROM consumes,products 
WHERE consumes.product_ID = products.ID and  consumes.date_measured >= date_add(curdate(), interval -8 month)
group by products.name; 

/* 12.What ages prefer to buy drinks individually rather than in packs? */
CREATE VIEW most_consumed_prod as
SELECT DISTINCT consumers.age_range, max(consumes.num_consumed) as max_consumed, products.type
FROM consumers, consumes,products
WHERE consumers.age_range = consumes.age_range and consumes.product_ID = products.ID 
GROUP BY consumers.age_range;

SELECT age_range
FROM most_consumed_prod
WHERE type = 'Single Can';

/* 13.How popular are products without any sugar compared to products with sugar? 
(it will show a table that constains the name of the product, the age_range and maximum quanitity(most popular))*/

select distinct products.name, consumes.age_range, max(consumes.num_consumed) as max_consumed
from products, consumes, recipes, is_used_in, ingredients, produces
where products.ID = produces.product_ID and products.ID = consumes.product_ID and produces.recipe_name = recipes.name and is_used_in.recipe_name = recipes.name 
and is_used_in.ingredient_name = ingredients.name and products.name not in
(select distinct products.name
from products, consumes, recipes, is_used_in, ingredients, produces
where products.ID = produces.product_ID and products.ID = consumes.product_ID and produces.recipe_name = recipes.name and is_used_in.recipe_name = recipes.name 
and is_used_in.ingredient_name = ingredients.name and ingredients.type = 'Natural Sweetener'
group by products.name)
group by consumes.age_range;


/* 14.What recipes have less than X calories per unit? */

SELECT recipes.name
FROM recipes
WHERE calories_per_unit < 'X';

/* 15. What stores bought products in the last week? (shows also when the produt was purchase)*/

SELECT stores.company_name, purchases.purchase_date
FROM stores,purchases
WHERE stores.company_name = purchases.company_name and purchases.purchase_date >= date_add(curdate(), interval -7 day);

/* 16. How popular are recipes created before date X compared to those created afterwards?. 
(it will show a table with the recipe_name, the date created, the number of product consumed and the age_range)*/
/* the 'x' should be replaced by a date format ex. '2007-05-29'*/
select distinct recipes.name as recipe_name, recipes.date_created, max(consumes.num_consumed) as most_consumed, consumes.age_range
from recipes, produces, products, consumes
where recipes.name = produces.recipe_name and products.ID = produces.product_ID 
and consumes.product_ID = products.ID and recipes.date_created < 'x'  
group by consumes.age_range, recipes.name;

/* 17. List all the stores of type convenience store.*/

SELECT stores.company_name
FROM stores
WHERE stores.type = 'Convenience Store';

/* 18. Are there any ingredients with less that than ten kilograms on hand?*/

SELECT ingredients.name
FROM ingredients
WHERE stock < 10000;

/* 19.List ingredients by order of what is used the most in recipes. (based on the tot_quanitity of all recepies for each ingredient)*/

SELECT distinct ingredients.name as ingredient_name, sum(is_used_in.quantity) as tot_quantity
FROM ingredients, is_used_in
WHERE ingredients.name = is_used_in.ingredient_name
GROUP BY ingredient_name 
order by tot_quantity desc;

/* 20.What months do consumers drink the most of product x? */

CREATE VIEW month_product_most_consumed as
SELECT products.name as prod_name, month(consumes.date_measured) as month_consumed, max(consumes.num_consumed) as most_quantity_consumed
FROM products, consumes
WHERE products.ID = consumes.product_ID
GROUP BY products.name;

SELECT month_consumed
FROM month_product_most_consumed
WHERE prod_name = 'x';
