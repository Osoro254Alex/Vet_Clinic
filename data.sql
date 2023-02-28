/* Populate database with sample data. */

insert into animals (
 name, date_of_birth, escape_attempts, 
 neutered, weight_kg) values ('Agumon', 'Feb 3, 2020', 0, true, 10.23);
insert into animals (
 name, date_of_birth, escape_attempts, 
 neutered, weight_kg) values ('Gabumon', 'Nov 15, 2018',  2, true, 8);
insert into animals (
 name, date_of_birth, escape_attempts, 
 neutered, weight_kg) values ('Pikachu', 'Jan 7, 2021', 1, false, 15.04);
insert into animals (
 name, date_of_birth, escape_attempts, 
 neutered, weight_kg) values ('Devimon', 'May 12, 2017', 5, true, 11);
insert into animals (
 name, date_of_birth, escape_attempts, 
 neutered, weight_kg) values ('Charmander', 'Feb 8, 2020', 0, false, 11);
insert into animals (
 name, date_of_birth, escape_attempts, 
 neutered, weight_kg) values ('Plantmon', 'Nov 15, 2021', 2, true, 5.7);
insert into animals (
 name, date_of_birth, escape_attempts, 
 neutered, weight_kg) values ('Squirtle', 'Apr 2, 1993', 3, false, 12.13);
insert into animals (
 name, date_of_birth, escape_attempts, 
 neutered, weight_kg) values ('Angemon', 'Jun 12, 2005', 1, true, 45);
insert into animals (
 name, date_of_birth, escape_attempts, 
 neutered, weight_kg) values ('Boarmon', 'Jun 7, 2005', 7, true, 20.4);
insert into animals (
 name, date_of_birth, escape_attempts, 
 neutered, weight_kg) values ('Blossom', 'Oct 13, 1998', 3, true, 17);
insert into animals (
 name, date_of_birth, escape_attempts, 
 neutered, weight_kg) values ('Ditto', 'May 14, 2022', 4, true, 22);

INSERT INTO owners (full_name, age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES
('Pokemon'),
('Digimon');

UPDATE animals SET species_id = 1 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 2 WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id = 1 WHERE name IN ('Agumon');
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon','Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon','Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander','Squirtle','Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon','Boarmon');

/*day four*/
  -- Insert the following data for vets:
INSERT INTO vets (name, age, date_of_graduation) VALUES 
('William Tatcher', 45, 'Apr 23, 2000'),
('Maisy Smith', 26, 'Jan 17,2019'),
('Stephanie Mendez', 64, 'May 4, 1981'),
('Jack Harkness', 38, 'Jun 8, 2008');

-- Insert data for specialties:
-- Vet William Tatcher is specialized in Pokemon.
INSERT INTO specializations (vet_id, species_id)
  VALUES(
    (SELECT id FROM vets WHERE name = 'William Tatcher'),
    (SELECT id FROM species WHERE name = 'Pokemon')
  );

-- Vet Stephanie Mendez is specialized in Digimon and Pokemon.
INSERT INTO specializations (vet_id, species_id)
  VALUES(
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    (SELECT id FROM species WHERE name = 'Digimon')
  );

INSERT INTO specializations (vet_id, species_id)
  VALUES(
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    (SELECT id FROM species WHERE name = 'Pokemon')
  );

-- Vet Jack Harkness is specialized in Digimon.
INSERT INTO specializations (vet_id, species_id)
  VALUES(
    (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    (SELECT id FROM species WHERE name = 'Digimon')
  );

/*visit insertion*/

--Agumon visited William Tatcher on May 24th, 2020.

INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  (SELECT id FROM animals WHERE name = 'Agumon'),
  'May 24, 2020'
);

--Agumon visited Stephanie Mendez on Jul 22th, 2020.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  (SELECT id FROM animals WHERE name = 'Agumon'),
  'Jul 22, 2020'
);

--Gabumon Jack visited Harkness on Feb 2nd, 2021.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  (SELECT id FROM animals WHERE name = 'Gabumon'),
  'Feb 02, 2021'
);

-- Pikachu visited Maisy Smith on Jan 5th, 2020.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Pikachu'),
  'Jan 05, 2020'
);

--Pikachu visited Maisy Smith on Mar 8th, 2020.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Pikachu'),
  'Mar 08, 2020'
);

-- Pikachu visited Maisy Smith on May 14th, 2020.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Pikachu'),
  'May 14, 2020'
);

-- Devimon visited Stephanie Mendez on May 4th, 2021.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  (SELECT id FROM animals WHERE name = 'Devimon'),
  'May 04, 2021'
);

-- Charmander visited Jack Harkness on Feb 24th, 2021.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  (SELECT id FROM animals WHERE name = 'Charmander'),
  'Feb 24, 2021'
);

-- Plantmon visited Maisy Smith on Dec 21st, 2019.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Plantmon'),
  'Dec 21, 2019'
);

-- Plantmon visited William Tatcher on Aug 10th, 2020.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  (SELECT id FROM animals WHERE name = 'Plantmon'),
  'Aug 10, 2020'
);

-- Plantmon visited Maisy Smith on Apr 7th, 2021.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Plantmon'),
  'Apr 07, 2021'
);

-- Squirtle visited Stephanie Mendez on Sep 29th, 2019.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  (SELECT id FROM animals WHERE name = 'Squirtle'),
  'Sep 29, 2019'
);

-- Angemon visited Jack Harkness on Oct 3rd, 2020.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  (SELECT id FROM animals WHERE name = 'Angemon'),
  'Oct 03, 2020'
);

-- Angemon visited Jack Harkness on Nov 4th, 2020.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  (SELECT id FROM animals WHERE name = 'Angemon'),
  'Nov 04, 2020'
);


 -- Boarmon visited Maisy Smith on Jan 24th, 2019.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Boarmon'),
  'Jan 24, 2019'
);

-- Boarmon visited Maisy Smith on May 15th, 2019.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Boarmon'),
  'May 15, 2019'
);

-- Boarmon visited Maisy Smith on Feb 27th, 2020.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Boarmon'),
  'Feb 27, 2020'
);

-- Boarmon visited Maisy Smith on Aug 3rd, 2020.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Boarmon'),
  'Aug 03, 2020'
);

--  Blossom visited Stephanie Mendez on May 24th, 2020.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  (SELECT id FROM animals WHERE name = 'Blossom'),
  'May 24, 2020'
);

-- Blossom visited William Tatcher on Jan 11th, 2021.
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  (SELECT id FROM animals WHERE name = 'Blossom'),
  'Jan 11, 2021'
);


--[x] database perfomance audit



-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

