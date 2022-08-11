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