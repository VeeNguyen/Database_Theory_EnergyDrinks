/*SCRIPT THREE*/
/*Loads sample data into primary entity tables*/

use energyDrinkDB;

INSERT into ingredients VALUES ('Sugar', '276305.346', 'Natural Sweetener');
INSERT into ingredients VALUES ('Filtered Water', '306730.345', 'Base');
INSERT into ingredients VALUES ('Lemon Juice Concentrate', '871.343', 'Extract');
INSERT into ingredients VALUES ('Sodium Citrate', '10005.323', 'Flavoring');
INSERT into ingredients VALUES ('Caffeine', '6072.456', 'Stimulant');
INSERT into ingredients VALUES ('Taurine', '13000.243', 'Stimulant');
INSERT into ingredients VALUES ('Sucralose', '8067.342', 'Artifical Sweetener');
INSERT into ingredients VALUES ('Apple Juice Concentrate', '34223.234', 'Extract');
INSERT into ingredients VALUES ('Carbonated Water', '9463385.234', 'Base');
INSERT into ingredients VALUES ('Phosphoric Acid', '39239.434', 'Preservative');
INSERT into ingredients VALUES ('Potassium Benzoate', '4243.333', 'Preservative');
INSERT into ingredients VALUES ('Milk Protein', '493243.321', 'Supplement');
INSERT into ingredients VALUES ('Coco Powder', '3342.432', 'Flavoring');
INSERT into ingredients VALUES ('High Fructose Corn Syrup', '3959490.543', 'Natural Sweetener');
INSERT into ingredients VALUES ('Caramel Coloring', '4353.001', 'Coloring');
INSERT into ingredients VALUES ('Cyanocobalamin', '34.543', 'Supplement');
INSERT into ingredients VALUES ('Maltodextrin', '432.643', 'Stimulant');

INSERT into recipes VALUES ('Red Bull.Original.V1', 'Other', '1972-01-07', '0.473');
INSERT into recipes VALUES ('Monster.Rehab.V2', 'Tea', '1974-03-09', '0.055');
INSERT into recipes VALUES ('Full-throttle.V1', 'Citrus', '1985-10-12', '0.465');
INSERT into recipes VALUES ('Coke.V1', 'Cola', '1995-12-16', '0.394');
INSERT into recipes VALUES ('Diet_coke.V1', 'Cola', '1932-11-01', '0');
INSERT into recipes VALUES ('POWERTHIRST.V5', 'Shockolate', '2007-5-29', '1.337');

INSERT into products VALUES ('456', 'Red Bull', '4260', '12-Pack Cans', '258');
INSERT into products VALUES ('789', 'Monster', '1832', '4-Pack Cans', '134');
INSERT into products VALUES ('321', 'Full-throttle', '236', 'Single Can', '1513');
INSERT into products VALUES ('654', 'Coke', '8520', '24-Pack Cans', '37');
INSERT into products VALUES ('987', 'Diet coke', '8520', '24-Pack Cans', '35');
INSERT into products VALUES ('999', 'Diet coke', '3546', '6-Pack Bottles', '206');
INSERT into products VALUES ('420', 'POWERTHIRST', '946', 'Single Can', '666');

INSERT into stores VALUES ('Walmart', '145', 'Client-Managed', 'Supermarket');
INSERT into stores VALUES ('7-11', '241', 'Company-Managed', 'Convenience Store');
INSERT into stores VALUES ('Wawa', '32', 'Company-Managed', 'Convenience Store');
INSERT into stores VALUES ('Diebold, Inc', '345', 'Client-Managed', 'Vending Machine');
INSERT into stores VALUES ('Costco', '56', 'Company-Managed', 'Supermarket');
INSERT into stores VALUES ('Little Ceasers', '102', 'Client-Managed', 'Restraunt');

INSERT into consumers VALUES ('1-9', '2434');
INSERT into consumers VALUES ('10-16', '346345');
INSERT into consumers VALUES ('17-21', '104322');
INSERT into consumers VALUES ('22-28', '76735');
INSERT into consumers VALUES ('29-35', '8724');
INSERT into consumers VALUES ('36-41', '12323');
INSERT into consumers VALUES ('42-49', '3152');
INSERT into consumers VALUES ('50-59', '1273');
INSERT into consumers VALUES ('60-69', '443');
INSERT into consumers VALUES ('70-79', '231');
INSERT into consumers VALUES ('80-89', '92');
