CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  description TEXT,
  age_in_millions_of_years NUMERIC,
  has_life BOOLEAN NOT NULL DEFAULT false
);
CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
  temperature INT,
  is_spherical BOOLEAN NOT NULL DEFAULT true
);
CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  star_id INT NOT NULL REFERENCES star(star_id),
  distance_from_earth NUMERIC NOT NULL,
  has_life BOOLEAN NOT NULL DEFAULT false
);
CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  planet_id INT NOT NULL REFERENCES planet(planet_id),
  radius INT,
  is_spherical BOOLEAN NOT NULL DEFAULT true
);
CREATE TABLE nebula (
  nebula_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  galaxy_id INT REFERENCES galaxy(galaxy_id),
  description TEXT
);
INSERT INTO galaxy (name, description, age_in_millions_of_years, has_life)
VALUES
('Milky Way', 'Our galaxy', 13600, true),
('Andromeda', 'Nearest major galaxy', 10000, false),
('Triangulum', 'Small spiral galaxy', 2000, false),
('Whirlpool', 'Interacting galaxy', 500, false),
('Sombrero', 'Unusual shape', 8000, false),
('Centaurus A', 'Peculiar galaxy', 12000, false);
INSERT INTO star (name, galaxy_id, temperature)
VALUES
('Sun', 1, 5500),
('Sirius', 1, 9000),
('Alpha Centauri', 1, 6000),
('Betelgeuse', 2, 3500),
('Rigel', 2, 11000),
('Vega', 3, 9500);
INSERT INTO planet (name, star_id, distance_from_earth, has_life)
VALUES
('Mercury', 1, 91, false),
('Venus', 1, 41, false),
('Earth', 1, 0, true),
('Mars', 1, 78, false),
('Jupiter', 1, 628, false),
('Saturn', 1, 1275, false),
('Uranus', 1, 2724, false),
('Neptune', 1, 4351, false),
('Kepler-22b', 2, 600, false),
('Proxima b', 3, 4.2, false),
('Rigel-1', 5, 900, false),
('Vega-1', 6, 200, false);
INSERT INTO moon (name, planet_id, radius)
VALUES
('Moon', 3, 1737),
('Phobos', 4, 11),
('Deimos', 4, 6),
('Io', 5, 1821),
('Europa', 5, 1560),
('Ganymede', 5, 2634),
('Callisto', 5, 2410),
('Titan', 6, 2575),
('Enceladus', 6, 252),
('Rhea', 6, 764),
('Dione', 6, 561),
('Mimas', 6, 198),
('Triton', 8, 1353),
('Nereid', 8, 170),
('Proteus', 8, 210),
('Larissa', 8, 97),
('Hippocamp', 8, 17),
('Charon', 4, 606),
('Cerberus', 4, 1),
('Hydra', 4, 31);
