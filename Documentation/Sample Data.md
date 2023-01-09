# Entities
Ingredients

Name | Stock (grams) | Type
--- | --- | ---
Sugar | 276305.346 | Natrual Sweetener
Filtered Water | 306730.345 | Base
Lemon Juice Concentrate | 871.343 | Extract
Sodium Citrate | 10005.323 | Flavoring
Caffeine | 6072.456 | Stimulant
Taurine | 13000.243 | Stimulant
Sucralose | 8067.342 | Artifical Sweetener
Apple Juice Conentrate | 34223.234 | Extract
Carbonated Water | 9463385.234 | Base
Phosphoric Acid | 39239.434 | Preservative
Potassium Benzoate | 4243.333 | Preservative
Milk Protein | 493243.321 | Supplement
Coco Powder | 3342.432 | Flavoring
High Fructose Corn Syrup | 3959490.543 | Natural Sweetener
Caramel Coloring | 4353.001 | Coloring
Cyanocobalamin | 34.543 | Supplement
Maltodextrin | 432.643 | Stimulant

Recipe

Name | Flavor | Date Created | Calories per Unit (milliliters)
--- | --- | --- | ---
Red Bull.Original.V1 | Other | 1972-01-07 | 0.473
Monster.Rehab.V2 | Tea | 1974-03-09 | 0.055
Full-throttle.V1 | Citrus | 1985-10-12 | 0.465
Coke.V1 | Cola | 1995-12-16 | 0.394
Diet_coke.V1 | Cola | 1932-11-01 | 0
POWERTHIRST.V5 | Shockolate | 2007-5-29 | 1.337

Product

ID | Name | Unit Volume (millilters) | Unit Type | Stock
--- | --- | --- | --- | ---
456 | Red Bull | 4260 | 12-Pack Cans | 258
789 | Monster | 1832 | 4-Pack Cans | 134
321 | Full-Throttle | 236 | Single Can | 1513
654 | Coke | 8520 | 24-Pack Cans | 37
987 | Diet Coke | 8520 | 24-Pack Cans | 35
999 | Diet Coke | 3546 | 6-Pack Bottles | 206
420 | POWERTHIRST | 946 | Single Can | 666

Store

Company Name | Number of Stores | Shipping Method | Store Type
--- | --- | --- | ---
Walmart | 145 | Client-Managed | Supermarket
7-11 | 241 | Company-Managed | Convenience Store
Wawa | 32 | Company-Managed | Convenience Store
Diebold, Inc | 345 | Client-Managed | Vending Machine
Costco | 56 | Company-Managed | Supermarket
Little Ceasers | 102 | Client-Managed | Restraunt

Consumer

Age Range | Approximate Count
--- | ---
1-9 | 2434
10-16 | 346345
17-21 | 104322
22-28 | 76735
29-35 | 8724
36-41 | 12323
42-49 | 3152
50-59 | 1273
60-69 | 443
70-79 | 231
80-89 | 92

# Relation
(TO BE UPDATED)

Is_Used_In (Ingredient - Recipe)

| Inge.Name      | Reci.Name       | Quantity   |
|------------|------------|------------|
| Sugar |  Red Bull.V1        |  3,000   |
| Sodium |  Red Bull.V1   |  2,000    |
| Taurine |  Red Bull.V1   |    1,000   |
| Glucuronic acid | Red Bull.V1   |   2,000   |
| Sugar |  Monster.V2  |  1,000    |
| Sodium |  Monster.V2  |  1,000   |
| Taurine |  Monster.V2    |    3,000   |
| Glucuronic acid |  Monster.V2  |    3,000  |
| Sugar |  Full-throttle.V1 |  3,000  |
| Sodium |  Full-throttle.V1  |  1,000     |
| Caffein |  Full-throttle.V1  |    1,000   |
| Glucuronic acid |  Full-throttle.V1   |  2,0000  |
| Sugar |  Coke.V1  |  1,000    |
| Sodium |  Coke.V1 |  2,000     |
| Caffein | Coke.V1 |   1,500  |
| Glucuronic acid |Coke.V1   |    3,500   |
| Sodium |  Diet_coke.V1   |  1,000     |
| Caffein |  Diet_coke.V1  |    2,000  |
| Taurine |  Diet_coke.V1    |    1,500   |
| Glucuronic acid | Diet_coke.V1   |   3,000   |


Produces (Recipe - Product)

| Reci.Name    | Prod.ID  | Amount  |
|------------|------------|------------|
| Red Bull.V1|  456       |  5,000  | 
| Monster.V2 |  789       |  10,000   |  
| Full-throttle.V1 |  321     |  6,000  | 
| Coke.V1 |  654  |    10,000 |  
| Diet_coke.V1 |  987    |    15,000  | 
| Diet_coke.V1 |  999    |    10,000  | 

Purchase (Product - Store)

|    Prod.ID   | Stor.Company_Name      | Amount      | Date  | 
|------------|------------|------------|------------|
|    456   | Walmart |       1,000      |    01-01-2020     |    
|    789   | Walmart |      1,000       |     01-01-2020    |
|    321   | Diebold |      17oz       |     25-05-2020     | 
|    654   | Wawa |       700      |   15-06-2020    | 
|    987   | Wawa |      500       |      5-07-2020    | 
|    999   | 7-11 |      500   |      5-08-2020    | 

Consumes (Product - Consumer)

|    Prod.ID   | Cons.Age_Range   | Count  | Data_Measured | 
|------------|------------|------------|------------|
|    445   | 18-24 years old |     6,000       |     10-10-2020      |     
|    777   | 18-24 years old |      4,000       |      10-10-2020     |      
|    982   | 25-34 years old |       2,000     |     15-6-2021      |     
|    344   | 45-54 years old |       3,000      |   15-6-2021     |    
|    112   | 45-54 years old |      4,000       |     15-12-2021     |       
|    221   | 65-74 years old |      1,000      |      15-12-2021     |  


# Example
Example of Relation between Recipe and Product. If join on where name of Recipe and Product are equal, we can have a table of name, flavor, type and stock on the energy drinks.<br/>
Recipe.Name = Product.Name

| Name      | Flavor       | Type   |    Stock  |
|------------|------------|------------|------------|
| Red Bull |  Original        | 12-pack     |     25        |
| Monster |  Rehab       |  6-pack     |        13     |
| Full-throttle |  Strength        |    12-pack    |      15       |
| Coke |  Cherry        |    24-pack    |   30     |
| Diet coke |  Original     |     24-pack   |      35      |
