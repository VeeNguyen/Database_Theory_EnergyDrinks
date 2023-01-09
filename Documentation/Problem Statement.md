# CMSC 508 Project Problem Description

Problem: 

A manufactuers of beverages, particularly of Energy Drinks, but not exclusively, needs to manage their product lines, from the actual production of drinks, to the development of new ones, as well as who buys them from the company and who eventually consumes them. The company would like to use a database to organize their production lines, research into new products, and sales of existing products, as well as provide easily-accessable data for administrative and support groups, such as accounting, marking, management, and shipping.

Description:

The database will be used to manage raw ingredients, the recipes that they are used in, and the products they produce. It also needs to track the stores that buy the products to sell to consumers, as well as some information on the consumers themselves. Raw Ingredients have a Name that identifies them, what type of ingredient they are, as well as the stock on hand of said ingredient, measured in kilograms. Recipes have a name that identify them, the date they were developed, main flavor they have, and the average number of calories per milliliter of the drink the recipe is for. Products have an identifying ID number, they also have a Name that isn't necessarily unique, Size (in milliliters) and Type, which together will be different for entities with the same Name, and Stock being the amount of product ready to be sold. Stores have an identifying Company Name, a count of the Number of Stores in the company, the Method of Shipping the company uses, and the Type of stores they are. Lastly Consumers, which have an identifying Age Range, and an approximate Count of consumers that fit into that range.

The primary users of the database are the Production staff, Sales Staff, and Research Staff, and secondarily Management, Marketing, Accounting, Acquisitions, and Shipping. Production will log which ingredients are in stock, used based on the recipe, and the resulting product. Research will track consumer data, and develop new recipes based on the preferences of consumers. Sales will log the companies that buy the products to stock their shelves. Management, Marketing, Accounting, Acquisitions, and Shipping will refer to the databse, but will not modify it.

Entity Sets:

- Ingredient
- Recipe
- Product
- Store
- Consumer

Primary Operations:

- Log Ingredients, log ingredients as they are bought and used in recipes.
- Update Consumer preferences, update information of what the Consumers prefer.
- Log Products, log products as they are produced and sold to stores.
- Create new recipes, add a new recipe as they are developed.
- Create and manage stores, as stores become clients of the company, create and manage them in the database.

Example Query:

1. What consumer groups enjoy recipe X the most?
2. How much of product X does consumers ages 16-18 consume on average?
3. What types of stores buy the most of product X?
4. What recipes use more than X different ingredients of the same type?
5. List the flavors of drinks produced by order of popularity.
6. What types of stores stock products that use recipe X? 
7. What stores manage their own shipping?
8. What products contain the most citric acid?
9. List the products that are sold in stores of type x.
10. What stores have bought at least amount X of all products from the company in the last two years?
11. What products have consumers been preferring in the last six months?
12. What ages prefer to buy drinks individually rather than in packs?
13. How popular are diet drinks compared to non-diet drinks?
14. What recipes have less than X calories per unit?
15. What stores bought products in the last week?
16. How popular are recipes created created before date X compared to those created afterwards?
17. List all the stores of type convenience store.
18. Are there any ingredients with less that than ten pounds on hand?
19. List ingredients by order of what is used the most in recipes.
20. What months do consumers drink the most of product X?
