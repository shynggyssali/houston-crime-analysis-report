-- Create database and table
CREATE DATABASE IF NOT EXISTS Houston_NIBRS;

USE Houston_NIBRS;

CREATE TABLE nibrs24_with_neighborhoods
(
Incident INT, 
RMSOccurrenceDate DATE, 
RMSOccurrenceHour INT, 
NIBRSClass VARCHAR(255),
NIBRSDescription VARCHAR(255), 
OffenseCount VARCHAR(255),
Beat VARCHAR(255),
Premise VARCHAR(255), 
StreetNo VARCHAR(100),
StreetName VARCHAR(255),
StreetType VARCHAR(255),
Suffix VARCHAR(255), 
City VARCHAR(255),
ZIPCode VARCHAR(20), 
MapLongitude FLOAT NULL,
MapLatitude FLOAT NULL,
Neighborhood VARCHAR(255)
);

-- Load cleaned CSV data
LOAD DATA LOCAL INFILE '/Users/shynmere/Desktop/data-files/nibrs24_with_neighborhoods.csv'
INTO TABLE nibrs24_with_neighborhoods
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Clean up neighborhood names
UPDATE nibrs24_with_neighborhoods
SET Neighborhood = REPLACE(REPLACE(REPLACE(TRIM(Neighborhood), '\r', ''), '\n', ''), '\t', '');

-- Query 1: Unsafe Crimes by Type
SELECT NIBRSDescription AS CrimeType, COUNT(*) AS CrimeCount
FROM nibrs24_with_neighborhoods
WHERE NIBRSDescription IN (
  'Aggravated Assault', 'Simple Assault', 'Robbery', 'Forcible Rape', 'Forcible Fondling', 
  'Forcible Sodomy', 'Intimidation', 'Kidnapping, Abduction', 'Murder, non-negligent', 
  'Weapon law violations', 'Drug, narcotic violations', 'Drug equipment violations', 
  'Driving under the influence', 'Burglary, Breaking and Entering', 'Arson', 
  'Motor vehicle theft', 'Theft from motor vehicle', 'Theft from building', 
  'Destruction, damage, vandalism', 'Theft of motor vehicle parts or accessory'
)
GROUP BY NIBRSDescription
ORDER BY CrimeCount DESC;

-- Query 2: Unsafe Crimes by Neighborhood
SELECT Neighborhood, COUNT(*) AS CrimeCount
FROM nibrs24_with_neighborhoods
WHERE NIBRSDescription IN (
  'Aggravated Assault', 'Simple Assault', 'Robbery', 'Forcible Rape', 'Forcible Fondling', 
  'Forcible Sodomy', 'Intimidation', 'Kidnapping, Abduction', 'Murder, non-negligent', 
  'Weapon law violations', 'Drug, narcotic violations', 'Drug equipment violations', 
  'Driving under the influence', 'Burglary, Breaking and Entering', 'Arson', 
  'Motor vehicle theft', 'Theft from motor vehicle', 'Theft from building', 
  'Destruction, damage, vandalism', 'Theft of motor vehicle parts or accessory'
)
GROUP BY Neighborhood
ORDER BY CrimeCount DESC;

-- Query 3: Unsafe Crimes by Premise
SELECT Premise, COUNT(*) AS CrimeCount
FROM nibrs24_with_neighborhoods
WHERE NIBRSDescription IN (
  'Aggravated Assault', 'Simple Assault', 'Robbery', 'Forcible Rape', 'Forcible Fondling', 
  'Forcible Sodomy', 'Intimidation', 'Kidnapping, Abduction', 'Murder, non-negligent', 
  'Weapon law violations', 'Drug, narcotic violations', 'Drug equipment violations', 
  'Driving under the influence', 'Burglary, Breaking and Entering', 'Arson', 
  'Motor vehicle theft', 'Theft from motor vehicle', 'Theft from building', 
  'Destruction, damage, vandalism', 'Theft of motor vehicle parts or accessory'
)
GROUP BY Premise
ORDER BY CrimeCount DESC;