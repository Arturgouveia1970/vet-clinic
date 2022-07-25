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

  --join table queries

select animals.name, visits.date_of_visit from animals
  join visits on animals.id = visits.animal_id 
  join vets on vet_id = visits.vet_id 
  where vets.name = 'William Tatcher' 
  order by visits.date_of_visit 
  desc 
  limit 1;

select count(distinct animals.name) from animals 
    join visits on animals.id = animal_id 
    join vets on vet_id = visits.vet_id 
    where vets.name = 'Stephanie Mendez' 
    group by vets.name;

select vets.name, species.name as specialities from vets 
    full join specialization on vets.id = specialization.vet_id 
    full join species on species.id = specialization.species_id;

select animals.name, visits.date_of_visit from animals 
    join visits on animals.id = visits.animal_id 
    join vets on vets.id = visits.vet_id 
    where visits.date_of_visit between '2020-04-01' and '2020-08-30' 
    and vets.name = 'Stephanie Mendez';

select count(animals.name) as nb_of_visits, animals.name from animals  
    join visits on animals.id = visits.animal_id 
    group by animals.name 
    order by nb_of_visits 
    desc limit 1;

select animals.name, visits.date_of_visit from animals 
    join visits on animals.id = visits.animal_id 
    join vets on vets.id = visits.vet_id 
    where vets.name = 'Maisy Smith' 
    order by visits.date_of_visit
    asc limit 1;

select visits.date_of_visit as DATE_OF_VISIT, 
       animals.name as ANIMAL_NAME, 
       animals.date_of_birth as ANIMAL_DOB, 
       animals.escape_attemps as ANIMAL_ESC_ATTEMPTS, 
       animals.weight_kg as WEIGHT, 
       species.name as SPECIES, 
       owners.full_name as OWNER, 
       vets.name as VETERINARY, 
       vets.age as VETS_AGE, 
       vets.date_of_graduation as VETS_DATE_OF_GRAD FROM animals 
  join visits on animals.id = visits.animal_id 
  join vets on vets.id = visits.vet_id 
  join species on animals.species_id = species.id 
  join owners on animals.owner_id = owners.id 
  order by visits.date_of_visit 
  desc limit 1;

select count(visits.animal_id) as NUMBER_OF_VISITS from visits 
    join vets on vets.id = visits.vet_id 
    join animals on animals.id = visits.animal_id 
    join specialization on specialization.vet_id = vets.id 
    where specialization.species_id != animals.species_id;

 select count(animals.species_id) as visit_count, species.name from animals 
     join visits on animals.id = visits.animal_id 
     join vets on vets.id = visits.vet_id 
     join species on animals.species_id = species.id 
     where vets.name = 'Maisy Smith' 
     group by species.name 
     order by visit_count 
     desc limit 1;

select count(*) from visits WHERE animal_id = 4;
select * from visits WHERE vet_id = 2;
select * from owners WHERE email = 'owner_18327@mail.com';

EXPLAIN analyze SELECT * from owners WHERE email = 'owner_18327@mail.com';
EXPLAIN analyze select * from visits WHEREmvet_id = 2;
EXPLAIN analyze select count(*) from visits WHERE animal_id = 4;
