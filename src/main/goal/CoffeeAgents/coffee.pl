:-dynamic have/1, % indicates that we have a product ready for use
	canProduce/1, % indicates what we can make ourselves
	canProduce/2, % indicates that an other machine can make a certain product
	delivered/2. % indicates that a product has been delivered to a certain machine.

% Common knowledge of ingredients that are needed for making a product.
requiredFor(coffee, water).
requiredFor(coffee, grounds).
requiredFor(espresso, coffee).
requiredFor(grounds, beans).

% A machine can make a Product if it has the product in stock or can make all ingredients.
canMake(Product) :- have(Product).
canMake(Product) :- canProduce(Product), forall(requiredFor(Product, Ingredient), canMake(Ingredient)).

% A short hand for having delivered a product to any machine
delivered(Product) :- delivered(_,Product).