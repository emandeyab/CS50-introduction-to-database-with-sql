CREATE TABLE "passengers" (
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL
);
CREATE TABLE "Check-Ins" (
    "check_date" TEXT,
    "flight_id" INTEGER,
    FOREIGN KEY ("flight_id") REFERENCES "flights"("id")
);
CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK ("concourse" IN (
        'A', 'B', 'C', 'D', 'F', 'T'
    )),
    PRIMARY KEY ("id")
);
CREATE TABLE "flights" (
    "id" INTEGER,
    "airline_id" INTEGER,
    "flight_number" INTEGER NOT NULL,
    "departing_from" TEXT NOT NULL,
    "heading_to" TEXT NOT NULL,
    "departure_date" TEXT NOT NULL,
    "arrival_date" TEXT NOT NULL,
     PRIMARY KEY ("id"),
     FOREIGN KEY ("airline_id") REFERENCES "airlines"("id")
)
