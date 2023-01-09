# CMSC 508 Project Relational Schema

Due to limitations of git markdown, primary and foreign keys are *italizised* rather than underlined, and foreign keys will include their parent entity.

## Entities

>ingredients (*name*, stock, *ingredient_type.type*)
>
> - String name = All valid non-empty strings.
> - Decimal stock = Non-negative floating point numbers, in grams.
> - String type = All categories of ingredients (stimulants, sweeteners, bases, preservatives, ect.)

>recipes (*name*, *flavors.flavor*, date_created, calories_per_unit)
>
> - String name = All valid non-empty strings.
> - String flavor = All categories of flavors (cherry, apple, cola, lemon, ect.)
> - Date date_created = All valid dates before or on the current date.
> - Decimal calories_per_unit = Non-negative floating point numbers, in Kcals per milliliters.

>products (*ID*, name, unit_volume, *product_types.type*, stock)
>
> - String ID = All strings of three numeric digits.
> - String name = All valid non-empty strings.
> - Int unit_volume = Non-zero positive integers, in milliliters.
> - String type = All categories of types (single can, six pack of cans, twelve pack of cans, ect.)
> - Int stock = Non-negative integers, in units of products.

>stores (*company_name*, num_stores, shipping_method, *company_type.type*)
>
> - String company_name = All valid non-empty strings.
> - Int num_stores = Non-negative integers.
> - String shipping_method = "Company-Managed" or "Client-Managed".
> - String type = All categories of type (convenience stores, supermarkets, vending machines, ect.)

>consumers (*age_range*, approximate_count)
>
> - String age_range = All valid pair of integers of the form X-Y, where X < Y.
> - Int approximate_count = Non-negative integers, approximate number of individuals.

## Relations

ingredients - recipes
>is_used_in (*ingedients.name*, *recipes.name*, quantity)
>
> - Decimal quantity = Non-negative positive floating point number, in grams per mililiters.

recipes - products
>produces (*recipes.name*, *products.ID*)

products - stores
>purchases (*products.ID*, *stores.company_name*, amount, purchace_date)
>
> - Int amount = Non-zero integers, in number of product units.
> - Date purchase_date = All valid dates before or on the current date.

products - consumers
>consumes (*products.ID*, *consumers.age_range*, num_consumed, date_measured)
>
> - Int num_consumed = Non-negative integers, in number of product units.
> - Date date_measured = All valid dates before or on the current date.

## Bookkeeping
Not exactly part of the schema I think, but it's important nonetheless for the integrity of the database, and to enforce some of the above constraints.

>ingredient_types (*type*)
>
> - String type = All valid categories of ingredients used in energy drinks (and soft drinks).

>flavors (*flavor*)
>
> - String flavor = All valid flavors of energy drinks.

>product_types (*type*)
>
> - String type = All valid types units for selling energy drinks.

>company_types (*type*)
>
> - String type = All valid types of companies that buy products from the company.