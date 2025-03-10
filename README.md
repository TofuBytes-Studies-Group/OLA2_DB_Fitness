# OLA2_DB_Fitness

Skrevet af: Isak Møgelvang, Jamie Callan og Helena Lykstoft


## ER-Diagram

Vi har lavet dette ER-diagram, hvor vi nedenunder har beskrevet de entiteter og attributter vi har tænkt skulle være med. Derudover har vi også lavet relationerne

#### Billede og beskrivelse
Hvilke overvejelser har vi gjort os undervejs?

## Dokumentation på normalisering ( kort forklaring og tabel der viser ændringer )

Giv eksempler på hvornår 2. og 3. normalform er brudt

#### 1NF: Sikr jer, at alle attributter er atomare og at der ikke er gentagne grupper.

#### 2NF: Fjern partielle funktionelle afhængigheder (sørg for, at ikke-nøgle attributter afhænger af hele primærnøglen).

#### 3NF: Fjern transitive afhængigheder (sørg for, at alle ikke-nøgle attributter kun afhænger af primærnøglen).


## Den relationelle model

Mapping til relationel database: Definér relationerne mellem entiteter

#### Billeder og eksempler
Dokumenter resultatet som en relationsmodel, fx:
MEMBER (member_id PK, name VARCHAR(100), start_date DATE, membertype ENUM('Basis', 'Premium', 'Elite'))
TEAM (team_id PK, description VARCHAR(50), max_participants INT, instructor_id FK) )


