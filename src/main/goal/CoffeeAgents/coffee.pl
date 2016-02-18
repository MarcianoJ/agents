%%%%% Common knowledge of ingredients that are needed for making a coffee product. %%%%%
:- dynamic(me/1). % indicates who we are
:- dynamic(have/1). % indicates we have a product ready for use
:- dynamic(delivered/2). % delivered(Machine, product) indicates a product delivered to machine. 

requiredFor(coffee, water).
requiredFor(coffee, grounds).
requiredFor(espresso, coffee). 
requiredFor(grounds, beans).

% canProduce indicates what a machine can make (if it has the requiredFor).
canProduce(grinder,grounds).
canProduce(maker,coffee).
canProduce(maker,expresso).

% shortcut for what this machine can produce.
canProduce(Product) :- me(Me), canProduce(Me, Product).

% A Machine can make a Product if it has the product in stock or can make all ingredients.
canMake(Product) :- have(Product).
canMake(Product) :- canProduce(Product), forall(requiredFor(Product, Ingredient), canMake(Ingredient)).
	
