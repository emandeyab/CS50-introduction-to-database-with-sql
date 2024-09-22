CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT,
    "price" INTEGER,
    PRIMARY KEY("id")
);
CREATE TABLE "donuts" (
    "id" INTEGER,
    "ingredient_id" INTEGER,
    "name" TEXT,
    "gluten-free" BOOLEAN NOT NULL,
    "price" INTEGER,
     PRIMARY KEY("id"),
     FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id")
);
CREATE TABLE "order" (
    "id" INTEGER,
    "donut_id" INTEGER,
    "customer_id" INTEGER,
     PRIMARY KEY("id"),
     FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
     FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);
CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "order_id" INTEGER,
    "price" INTEGER,
    FOREIGN KEY("order_id") REFERENCES "orders"("id")
);
