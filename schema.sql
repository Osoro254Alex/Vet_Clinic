/* Database schema to keep the structure of entire database. */

create database vet_clinic;
create table animals(
    id int GENERATED ALWAYS AS IDENTITY,
    name varchar(40),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal,
    species varchar(100),
    primary key (id)
);

/* Add column to animals */

ALTER TABLE animals
  ADD species varchar(100)

/* Create another tables */

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name varchar(255),
    age integer
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name varchar(100)
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD species_id INTEGER REFERENCES species(id);
ALTER TABLE animals ADD owner_id INTEGER REFERENCES owners(id); 

/*day four*/

-- [x] Create a table for Vets
CREATE TABLE  vets(
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(150),
    age INT,
    date_of_graduation DATE
);

-- [x] Create a many to many relationship between vets and species

CREATE TABLE specializations (
    vet_id INT,
    species_id INT,
    PRIMARY KEY (vet_id, species_id),
    CONSTRAINT fk_vets
        FOREIGN KEY (vet_id)
            REFERENCES vets(id),
    CONSTRAINT fk_species
        FOREIGN KEY (species_id)
            REFERENCES species(id)
);


CREATE TABLE visits(
    vet_id INT,
    animal_id INT,
    date_of_visit DATE,
    PRIMARY KEY (vet_id, animal_id, date_of_visit),
    CONSTRAINT fk_vets
        FOREIGN KEY (vet_id)
            REFERENCES vets(id),
    CONSTRAINT fk_animals
        FOREIGN KEY (animal_id)
            REFERENCES animals(id)
);

--[x] database perfomance audit

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);


