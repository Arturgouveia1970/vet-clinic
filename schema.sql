CREATE TABLE animals (
    id serial NOT NULL,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attemps integer,
    neuterd bool NOT NULL,
    weight_kg decimal
);

alter table animals add column species VARCHAR(100);

CREATE TABLE owners (
   id SERIAL NOT NULL,
   full_name VARCHAR(100) NOT NULL,
   age INT,
   PRIMARY KEY(id)
);

CREATE TABLE species (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(50) NOT NULL
);

ALTER TABLE animals ADD COLUMN id PRIMARY KEY;

ALTER TABLE animals drop column species;
ALTER TABLE animals ADD COLUMN species_id INTEGER;
ALTER TABLE animals 
  ADD CONSTRAINT fk_species 
  FOREIGN KEY (species_id) 
  REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id INTEGER;
ALTER TABLE animals 
   ADD CONSTRAINT fk_owners 
   FOREIGN KEY(owner_id)
   REFERENCES owners(id);

CREATE TABLE vets (
   id serial PRIMARY KEY NOT NULL,
   name VARCHAR(50) NOT NULL,
   age INTEGER,
   date_of_graduation DATE
);

CREATE TABLE specialization (
  id SERIAL PRIMARY KEY NOT NULL,
  species_id INT NOT NULL,
  vet_id INT NOT NULL,
  CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id),
  CONSTRAINT fk_vets FOREIGN KEY(vet_id) REFERENCES vets(id)
);

CREATE TABLE visits (
  id SERIAL PRIMARY KEY NOT NULL,
  animal_id INT NOT NULL,
  vet_id INT NOT NULL,
  date_of_visit DATE NOT NULL,
  CONSTRAINT fk_visit_animal FOREIGN KEY(animal_id) REFERENCES animals(id),
  CONSTRAINT fk_visit_vet FOREIGN KEY(vet_id) REFERENCES vets(id)
  );