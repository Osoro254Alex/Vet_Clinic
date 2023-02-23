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
