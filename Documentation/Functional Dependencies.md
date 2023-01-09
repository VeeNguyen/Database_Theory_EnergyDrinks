
# Functional dependency

Based on formula: 
FD = x-> y
if t1x1 = t2x2
then t1y1 = t1y2

## Entites

### Ingredient:
> Name -> Stock, Type

### Recipe:
> Name, Date_Created -> Flavor, Calories_per_unit

### Product:
> ID -> Name, Size, Type, Stock </br>
> Name, Size, Type -> Stock

### Store:
> Company_Name -> Number_of_Store, Shipping_Method, Type

### Consumer:
> Age_Range -> Approximate_Count

## Relations

### Is_Used_In (Ingredient - Recipe):
> Ingr.Name, Reci.Name -> Quantity

### Produces (Recipe - Product):
> Prod.ID -> Reci.Name, Amount

### Purchase (Product - Store):
> Prod_ID, Stor.Company_Name -> Amount, Date

### Consumes (Product - Consumer):
> Prod_ID, Cons.Age_Range -> Count, Date_Measured
