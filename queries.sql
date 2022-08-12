/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE NOT name = 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT COUNT(escape_attempts), neutered FROM animals GROUP BY neutered;
SELECT MIN(weight_kg) AS MinimumWeight FROM animals;
SELECT MAX(weight_kg) AS MaximumWeight FROM animals;
SELECT AVG(escape_attempts) AS Average FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';

-- What animals belong to Melody Pond?
SELECT name, full_name FROM animals INNER JOIN owners ON owners.id = owner_id AND owners.id = 4;

-- List of all animals that are pokemon (their type is Pokemon)
SELECT animals.name, species.name FROM animals INNER JOIN species ON species.id = species_id AND species.id = 1;

-- List of all owners and their animals, remember to include those that don't own any animal
SELECT owners.id, owners.full_name, animals.name As Animals FROM owners FULL OUTER JOIN animals ON owners.id = owner_id;

-- How many animals are their per species?
SELECT species.name AS species, COUNT(*) FROM animals INNER JOIN species ON species.id = species_id GROUP BY species;

-- List all Digimon owned by Jennifer Orwell
SELECT species.name, full_name, animals.name FROM animals
INNER JOIN species ON species.id = species_id AND species.name = 'Digimon'
INNER JOIN owners ON owners.id = owner_id AND owners.id = 2;

-- List all animals owned by Dean Winchester that haven't tried to escape
SELECT * FROM animals
INNER JOIN owners ON owners.id = owner_id AND owners.full_name = 'Dean Winchester'
WHERE escape_attempts = 0;

-- Who owns the most animals
SELECT owners.full_name AS fullName, COUNT(*) FROM owners
INNER JOIN animals ON owners.id = owner_id GROUP BY fullName;

-- Day 4
-- Who was the last animal seen by William Tatcher
SELECT a.name, visits.date_of_visit FROM animals a
INNER JOIN visits ON a.id = animal_id
INNER JOIN vets ON vets.id = vet_id WHERE vets.name = 'William Tatcher' ORDER BY date_of_visit DESC; 

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(*) FROM animals a
INNER JOIN visits ON a.id = animal_id
INNER JOIN vets ON vets.id = vet_id WHERE vets.name = 'Stephanie Mendez';

-- List all vets and their specialists, including vets with no specialists
SELECT vets.name, species.name FROM vets
LEFT JOIN specializations s ON vets.id = s.vet_id
INNER JOIN species ON species.id = s.species_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020
SELECT a.name FROM animals a
INNER JOIN visits ON a.id = animal_id
INNER JOIN vets ON vets.id = vet_id WHERE vets.name = 'Stephanie Mendez' AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

-- What animals has the most visits
SELECT a.name, COUNT(vets.id) FROM animals a
INNER JOIN visits v ON a.id = animal_id
INNER JOIN vets ON vets.id = vet_id GROUP BY a.name ORDER BY count DESC;

-- Who was Maisy Smith's first visit?
SELECT a.name, visits.date_of_visit FROM animals a
INNER JOIN visits ON a.id = animal_id
INNER JOIN vets ON vets.id = vet_id WHERE vets.name = 'Maisy Smith' ORDER BY date_of_visit ASC; 

-- Details for most recent visit: animal information, vet information, and date of visit
SELECT a.name AS Animal, a.weight_kg, a.date_of_birth, a.escape_attempts, vets.name AS Vets_name, visits.date_of_visit FROM animals a
INNER JOIN visits ON a.id = animal_id
INNER JOIN vets ON vets.id = vet_id ORDER BY date_of_visit DESC; 

-- How many visits were with a vet that did not specialize in that animal's species
SELECT COUNT(*) FROM animals a
INNER JOIN visits ON a.id = animal_id
INNER JOIN vets v ON v.id = vet_id WHERE v.id = 2; 

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most
SELECT species.name, COUNT(*) FROM species
INNER JOIN animals ON species.id = animals.species_id
INNER JOIN visits ON animals.id = animal_id
INNER JOIN vets v ON v.id = vet_id WHERE v.id = 2 GROUP BY species.name ORDER BY count DESC;
