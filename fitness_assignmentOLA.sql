-- OPGAVE FITNESS_ASSIGNMENT

-- 1NF: Alle attributter er atomare og der er ingen gentagne grupper.
-- Ingen ændringer var nødvendige, eftersomm at hver tabel allerede har atomare attributter.

-- 2NF: Fjern partielle funktionelle afhængigheder.
-- Ingen attributter i nogen tabel afhænger kun af en del af primærnøglen.
-- Alle ikke-nøgle attributter afhænger af hele primærnøglen.

-- 3NF: Fjern transitive afhængigheder.
-- Ingen transitive afhængigheder er til stede, da alle attributter afhænger direkte af primærnøglen.

-- Mapping til relationel model:
-- Alle tabeller har primærnøgler (PK) og fremmednøgler (FK) som defineret nedenfor.

-- Mapping til relationel model:
-- Alle tabeller har primærnøgler (PK) og fremmednøgler (FK) som defineret nedenfor.

-- Relationsmodel:
-- MEDLEMSKABER (id PK, navn VARCHAR(50) UNIQUE, beskrivelse TEXT, pris DECIMAL(10,2))
-- MEDLEMMER (id PK, navn VARCHAR(100), email VARCHAR(100) UNIQUE, medlemskab_id FK, oprettet_dato DATE)
-- TRAENINGSHOLD (id PK, navn VARCHAR(50), beskrivelse TEXT, max_deltagere INT)
-- INSTRUKTORER (id PK, navn VARCHAR(100), email VARCHAR(100) UNIQUE)
-- HOLD_INSTRUKTORER (id PK, traeningshold_id FK, instruktor_id FK)
-- BOOKING (id PK, medlem_id FK, traeningshold_id FK, dato TIMESTAMP, UNIQUE(medlem_id, traeningshold_id, dato))
-- BETALING (id PK, medlem_id FK, type VARCHAR(50), beloeb DECIMAL(10,2), betalingsdato TIMESTAMP)
-- MEDLEMSRABATTER (id PK, medlem_id FK, rabat_procent DECIMAL(5,2), gyldig_fra DATE, gyldig_til DATE)

CREATE TABLE IF NOT EXISTS Medlemskaber (
    id INT PRIMARY KEY,
    navn VARCHAR(50) UNIQUE NOT NULL,
    beskrivelse TEXT,
    pris DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS Medlemmer (
    id INT PRIMARY KEY,
    navn VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    medlemskab_id INT,
    oprettet_dato DATE DEFAULT(CURRENT_DATE),
    FOREIGN KEY (medlemskab_id) REFERENCES Medlemskaber(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Traeningshold (
    id INT PRIMARY KEY,
    navn VARCHAR(50) NOT NULL,
    beskrivelse TEXT,
    max_deltagere INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Instruktorer (
    id INT PRIMARY KEY,
    navn VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS HoldInstruktorer (
    id INT PRIMARY KEY,
    traeningshold_id INT,
    instruktor_id INT,
    FOREIGN KEY (traeningshold_id) REFERENCES Traeningshold(id) ON DELETE CASCADE,
    FOREIGN KEY (instruktor_id) REFERENCES Instruktorer(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Booking (
    id INT PRIMARY KEY,
    medlem_id INT,
    traeningshold_id INT,
    dato TIMESTAMP NOT NULL,
    FOREIGN KEY (medlem_id) REFERENCES Medlemmer(id) ON DELETE CASCADE,
    FOREIGN KEY (traeningshold_id) REFERENCES Traeningshold(id) ON DELETE CASCADE,
    UNIQUE (medlem_id, traeningshold_id, dato)
);

CREATE TABLE IF NOT EXISTS Betaling (
    id INT PRIMARY KEY,
    medlem_id INT,
    type VARCHAR(50) CHECK (type IN ('Abonnement', 'Klippekort')),
    beloeb DECIMAL(10,2) NOT NULL,
    betalingsdato TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (medlem_id) REFERENCES Medlemmer(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Medlemsrabatter (
    id INT PRIMARY KEY,
    medlem_id INT,
    rabat_procent DECIMAL(5,2) CHECK (rabat_procent >= 0 AND rabat_procent <= 100),
    gyldig_fra DATE NOT NULL,
    gyldig_til DATE NOT NULL,
    FOREIGN KEY (medlem_id) REFERENCES Medlemmer(id) ON DELETE CASCADE
);
