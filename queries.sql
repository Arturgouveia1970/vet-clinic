/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals where name like '%mon';
select name from animals where date_of_birth BETWEEN '2016-01-01' and '2019-01-01';
select name from animals where neuterd = true and escape_attemps < 3;
select date_of_birth from animals where name in ('Agumon', 'Pikachu');
select name, escape_attemps from animals where weight_kg > 10.5;
select * from animals where neuterd = true;
select * from animals where name NOT in ('Gabumon');
select * from animals WHERE weight_kg >=10.4 and weight_kg <=17.3;
