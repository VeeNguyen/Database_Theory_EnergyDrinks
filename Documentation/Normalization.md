## Normalization of Entities
> Bold and italic are PK. From Ingredients, we have **Name** as the PK and Stock with Type as attributes. Recipe has **Name** and **Date_Created** as PK and they point to Flavor and Calories_per_unit as attributes. Product has **ID** as the PK that points to Name, Size, Type as attributes and from those three we have Stock. Store has **Company_Name** as the PK that points to Number_of_Store, Shipping_Method and Type as attributes. Consumer has **Age_Range** as PK that points to Approximate_Count as attribute. No lossless can be found during the process. <br/>

### Ingredients <br/>
> {<em>**Name**</em>, Stock, Type}

### Recipe <br/>
> {<em>**Name**</em>, <em>**Date_Created**</em>, Flavor}, {<em>**Name**</em>, <em>**Date_Created**</em>, Calories_per_unit}

### Product <br/>
> {<em>**ID**</em>, Name, Size, Type, Stock}

### Store <br/>
> {<em>**Company_Name**</em>, Number_of_Store, Shipping_Method, Type}

### Consumer <br/>
> {<em>**Age_Range**</em>, Approximate_Count}

<br/>

## Normalization of Relations
> Bold and italic are PK. The relation between the Ingredient and Recipe is the Is_Used_In with the PK of the Ingredient's Name and the Recipe's Name with Quantity as the attribute. The entity Recipe and Product has the relation of Produces where we have the Product's ID and the Recipe's Name as the Pk of the relation and the Amount of the attribute. Between Product and Store, we have a relation Produces that have the Product's ID and the Store's Company_Name as the PK of the relation with the Amunt and Date as attributes. Consumes is the relation between Product and Consumer with the Product's ID and Consumer's Age_Range as the PK and Count with Date_Measured as the attributes.


### Is_Used_In (Ingredient - Recipe) <br/>
> {<em>**Ingr.Name**</em>, <em>**Reci.Name**</em>, Quantity}

### Produces (Recipe - Product) </br>
> {<em>**Prod.ID**</em>, <em>**Reci.Name**</em>, Amount}

### Purchase (Product - Store) </br>
> {<em>**Prod.ID**</em>, <em>**Stor.Company_Name**</em>, Amount, Date}

### Consumes (Product - Consumer) </br>
> {<em>**Prod.ID**</em>, <em>**Cons.Age_Range**</em>, Count, Date_Measured}

