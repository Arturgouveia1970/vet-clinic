CREATE TABLE animals (
    id serial NOT NULL,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attemps integer,
    neuterd bool NOT NULL,
    weight_kg decimal
);
