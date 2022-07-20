/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals where name like '%mon';
select name from animals where date_of_birth BETWEEN '2016-01-01' and '2019-01-01';
select name from animals where neuterd = true and escape_attemps < 3;
select date_of_birth from animals where name in ('Agumon', 'Pikachu');
select name, escape_attemps from animals where weight_kg > 10.5;
select * from animals where neuterd = true;
select * from animals where name NOT in ('Gabumon');
select * from animals WHERE weight_kg >=10.4 and weight_kg <=17.3;

ALTER table animals add primary key (id)
select count (*) from animals;
select count (*) from animals where escape_attemps = 0;
select avg (weight_kg) from animals;
select count(escape_attemps) from animals where neuterd = true;
select count(escape_attemps) from animals where neuterd = false;
select max(weight_kg) from animals group by species;
select min(weight_kg) from animals group by species;
select avg(escape_attemps),species from animals
  where date_of_birth between '1990-01-01' and '2000-12-31'
  group by species;

--join queries
select name, full_name from animals 
  join owners on animals.owner_id = owners.id 
  where full_name = 'Melody Pond';
select animals.name as ANIMALS, species.name as SPECIES from animals
  join species on animals.species_id = species.id 
  where species.name = 'Pokemon';
select name as ANIMALS, full_name as OWNERS from animals 
  right join owners on animals.owner_id = owners.id;
select count(animals.name) as number_of_animals, species.name as specie from animals
  join species on animals.species_id = species.id 
  group by species.name;
select full_name as owner, animals.name as animals_name, species.name as name_of_species from animals 
  join owners on owners.id = animals.owner_id 
  join species on species.id = animals.species_id 
  where owners.full_name = 'Jennifer Orwell' and species.name = 'Digimon';
  select name, escape_attemps,full_name from animals
    join owners
    on owners.id = animals.owner_id 
    where owners.full_name = 'Dean Winchester' and animals.escape_attemps = 0;
select full_name, count(animals.owner_id) as Owns from owners
 join animals on animals.owner_id = owners.id 
 group by full_name 
 order by Owns desc;