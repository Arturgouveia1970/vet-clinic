CREATE TABLE animals (
    id serial NOT NULL,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attemps integer,
    neuterd bool NOT NULL,
    weight_kg decimal
);

ALTER TABLE animals add column species varchar(100);
select count (*) from animals;
select count (*) from animals where escape_attemps = 0;
select avg (weight_kg) from animals;
select count(escape_attemps) from animals where neuterd = true;
select count(escape_attemps) from animals where neuterd = false;
select max(weight_kg) from animals group by species;
select min(weight_kg) from animals group by species;
select avg(escape_attemps),species from animals where date_of_birth between '1990-01-01' and '2000-12-31' group by species;