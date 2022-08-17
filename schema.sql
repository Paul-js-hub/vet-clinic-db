/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered boolean,
    weight_kg NUMERIC,
    PRIMARY KEY(id)
);

ALTER TABLE animals ADD species VARCHAR(100);

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(100),
    age INT,
    PRIMARY KEY(id)
);

CREATE TABLE species (
     id INT GENERATED ALWAYS AS IDENTITY,
     name VARCHAR(100),
     PRIMARY KEY(id)
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY (owner_id) REFERENCES owners(id);

CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

CREATE TABLE specializations (
    id INT GENERATED ALWAYS AS IDENTITY,
    species_id INT REFERENCES species (id) ON DELETE CASCADE,
    vet_id INT REFERENCES vets (id) ON DELETE CASCADE,
    PRIMARY KEY (id)
);

CREATE TABLE visits (
    id INT GENERATED ALWAYS AS IDENTITY,
    animal_id INT REFERENCES animals (id) ON DELETE CASCADE,
    vet_id INT REFERENCES vets (id) ON DELETE CASCADE,
    date_of_visit DATE,
    PRIMARY KEY (id)
);

-- performance audit
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX animal_id ON visits (animal_id);

CREATE INDEX vet_id ON visits (vet_id);

CREATE INDEX owner_email ON owners (email);

