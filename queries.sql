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

SELECT name FROM animals
JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name FROM animals
JOIN species ON species.id = animals.species_id
WHERE species.name = 'Pokemon';

SELECT name AS name_of_animals, full_name AS name_of_owners FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT species.name, COUNT(*) FROM animals
LEFT JOIN species ON species.id = animals.species_id
GROUP BY species.name;

SELECT animals.name FROM animals
JOIN species ON species.id = animals.species_id
JOIN owners ON owners.id = animals.owner_id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell' ;

SELECT name FROM animals
JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT full_name, COUNT(full_name) AS maximum FROM animals
JOIN owners ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY maximum
DESC LIMIT 1;

/*day four*/

SELECT vets.name AS "Vet Name", animals.name AS "Animal Name", visits.date_of_visit
  FROM vets
  INNER JOIN visits
    ON vets.id = visits.vet_id
  INNER JOIN animals
    ON visits.animal_id = animals.id
  WHERE vets.name = 'William Tatcher'
  ORDER by date_of_visit DESC LIMIT 1;

SELECT vets.name AS "Vet Name", COUNT(DISTINCT animals.name)
   FROM vets
   INNER JOIN visits
     ON vets.id = visits.vet_id
   INNER JOIN animals
     ON visits.animal_id = animals.id
   WHERE vets.name = 'Stephanie Mendez'
   GROUP BY vets.name;

SELECT vets.name AS "Vet Name", species.name AS "Species"
  FROM vets
  FULL OUTER JOIN specializations
    ON vets.id = specializations.vet_id
  FULL OUTER JOIN species
    ON species.id = specializations.species_id;

SELECT animals.name AS "Animal", visits.date_of_visit
  FROM animals
  JOIN visits
    ON animals.id = visits.animal_id
  WHERE visits.vet_id = (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez')
  AND
  visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name, COUNT(*)
  FROM animals
  JOIN visits
    ON animals.id = visits.animal_id
  GROUP BY animals.name
  ORDER BY count DESC LIMIT 1;

SELECT vets.name AS "Vet", animals.name AS "Animal", visits.date_of_visit
  FROM vets
  JOIN visits
    ON vets.id = visits.vet_id
  JOIN animals
    ON visits.animal_id = animals.id
  WHERE vets.name = 'Maisy Smith'
  ORDER BY date_of_visit LIMIT 1;

SELECT
  vets.id AS "Vet id", vets.name AS "Vet", date_of_graduation,

  visits.date_of_visit,

  animals.id AS "Animal id", animals.name AS "Animal", date_of_birth, escape_attempts, neutered, weight_kg, species_id, owner_id
  FROM vets
  JOIN visits
    ON vets.id = visits.vet_id
  JOIN animals
    ON visits.animal_id = animals.id
  ORDER BY date_of_visit DESC LIMIT 1;


SELECT vets.name
  FROM vets
  JOIN visits
    ON vets.id = visits.vet_id
  LEFT JOIN specializations
    ON vets.id = specializations.vet_id
  WHERE specializations.vet_id IS NULL
  GROUP BY vets.name;

SELECT species.name AS "species", COUNT(animals.species_id)
  FROM vets
  JOIN visits
    ON vets.id = visits.vet_id
  JOIN animals
    ON animals.id = visits.animal_id
  JOIN species
    ON species.id = animals.species_id
  WHERE vets.name = 'Maisy Smith'
  GROUP BY species.name
ORDER BY count DESC LIMIT 1;
