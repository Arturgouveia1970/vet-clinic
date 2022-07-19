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


