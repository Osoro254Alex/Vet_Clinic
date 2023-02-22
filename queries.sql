/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * FROM animals WHERE neutered='True' AND escape_attempts<3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon','Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg>10.5;
SELECT * FROM animals WHERE neutered='True';
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* Transaction 1 */

BEGIN;
UPDATE animals SET species='unspecified';
SELECT species FROM animals;
ROLLBACK;
SELECT species FROM animals;

BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species='pokemon' WHERE name NOT LIKE '%mon';
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon' WHERE name NOT LIKE '%mon';

COMMIT;
SELECT * FROM animals;

/* Transaction 2 */

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

/* Transaction 3 */

BEGIN;
SAVEPOINT SAVEp1;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT SAVEp2; 
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEp2;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;
SELECT * FROM animals;

/* Quiries */

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg) as Minimum, MAX(weight_kg) as Maximum FROM animals GROUP BY species;
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

