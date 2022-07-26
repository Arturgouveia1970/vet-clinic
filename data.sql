/* Populate database with sample data. */

INSERT INTO animals ( id, name, date_of_birth, escape_attemps, neuterd, weight_kg) values
( 1, 'Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals ( id, name, date_of_birth, escape_attemps, neuterd, weight_kg) values ( 2, 'Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals ( id, name, date_of_birth, escape_attemps, neuterd, weight_kg) values ( 3, 'Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals ( id, name, date_of_birth, escape_attemps, neuterd, weight_kg) values ( 4, 'Devimon', '2017-05-12', 5, true, 11);
INSERT INTO animals ( id, name, date_of_birth, escape_attemps, neuterd, weight_kg) values ( 5, 'Charmander', '2020-02-08', 0, false, -11);
INSERT INTO animals ( id, name, date_of_birth, escape_attemps, neuterd, weight_kg) values ( 6, 'Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO animals ( id, name, date_of_birth, escape_attemps, neuterd, weight_kg) values ( 7, 'Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO animals ( id, name, date_of_birth, escape_attemps, neuterd, weight_kg) values ( 8, 'Angemon', '2005-06-12', 1, true, -45);
INSERT INTO animals ( id, name, date_of_birth, escape_attemps, neuterd, weight_kg) values ( 9, 'Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals ( id, name, date_of_birth, escape_attemps, neuterd, weight_kg) values ( 10, 'Blossom', '1998-10-13', 3, true, 17);

SELECT * from animals;
INSERT INTO animals VALUES ( 12, 'Orange', '2010-01-02', 5, true, 7);
select * from animals;
ALTER TABLE animals
 ADD AUTO_INCREMENT;
 INSERT INTO animals (name, date_of_birth, escape_attemps, neuterd, weight_kg) values ('bobby', '2020-04-04', 1, true, 10);
ALTER TABLE animals 
ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;
delete from animals where id = 21;
update animals set species = 'digimon' where name like '%mon';
update animals set species = 'pokemon' where species is null;
delete from animals where date_of_birth > '2022-01-01';
SAVEPOINT younger_than_2022_animals;
ROLLBACK;
update animals set weight_kg = weight_kg * (-1) where weight_kg < 0;
select * from animals;


 INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);
insert into species (name) values ('Pokemon');
insert into species (name) values ('Digimon');
update animals set species_id = 2 where name like '%mon';
update animals set species_id = 1 where name not like '%mon';
update animals set owner_id = 1 where name like 'Agumon';
update animals set owner_id = 2 where name like 'Gabumon';
update animals set owner_id = 2 where name like 'Pikachu';
update animals set owner_id = 4 where name like 'Plantmon';
update animals set owner_id = 5 where name like 'Charmander';
update animals set owner_id = 5 where name like 'Squirtle';
update animals set owner_id = 5 where name like 'Blossom';
update animals set owner_id = 6 where name like 'Angemon';
update animals set owner_id = 6 where name like 'Boarmon';

insert into vets (name, age, date_of_graduation) values
  ('William Tatcher', 45, '2000-04-23'), 
  ('Maisy Smith', 26, '2019-01-17'), 
  ('Stephanie Mendez', 64, '1981-05-04'), 
  ('Jack Harkness', 38, '2008-06-08');

insert into specialization (species_id, vet_id) values
  ((SELECT id from species where name = 'Pokemon'), (SELECT id from vets where name = 'William Tatcher')),
  ((select id from species where name = 'Pokemon'), (select id from vets where name = 'Stephanie Mendez')),
  ((select id from species where name = 'Digimon'), (select id from vets where name = 'Stephanie Mendez')),
  ((select id from species where name = 'Digimon'), (select id from vets where name = 'Jack Harkness'));

insert into visits (animal_id, vet_id, date_of_visit) values (1,1,'2020-05-24');
insert into visits (animal_id, vet_id, date_of_visit) values
  (1,3,'2020-07-22'), 
  (2,4,'2021-02-02'), 
  (17,2,'2020-01-05'), 
  (17,2,'2020-03-08'), 
  (17,2,'2020-05-14'), 
  (18,3,'2021-05-04'),
  (20,4,'2021-02-24'), 
  (6,2,'2019-12-21'), 
  (6,1,'2020-08-10'),
  (6,2,'2021-04-07'), 
  (7,3,'2019-09-29'), 
  (8,4,'2020-10-03'), 
  (8,4,'2020-11-04'),
  (9,2,'2019-10-24'),
  (9,2,'2019-05-15'),
  (9,2,'2020-02-02'), 
  (9,2,'2020-08-03'),
  (10,1,'2021-01-11');

  -- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM
  (SELECT id FROM animals) animal_ids, 
  (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

end;
