CREATE TABLE IF NOT EXISTS Horse(id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, name VARCHAR(30) NOT NULL, age INTEGER NOT NULL CHECK age>0, min_speed DOUBLE NOT NULL, max_speed DOUBLE NOT NULL, picture VARCHAR NOT NULL, is_deleted BOOLEAN NOT NULL DEFAULT false, CHECK min_speed<=max_speed AND min_speed>0.0 and max_speed>0.0);
CREATE TABLE IF NOT EXISTS Jockey(id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, first_name VARCHAR(30) NOT NULL,last_name VARCHAR(30) NOT NULL, country VARCHAR(30) NOT NULL, skill DOUBLE NOT NULL, is_deleted BOOLEAN NOT NULL DEFAULT false);
CREATE TABLE IF NOT EXISTS RaceResult(race_id INTEGER NOT NULL, horse_id INTEGER REFERENCES Horse(id), jockey_id INTEGER REFERENCES Jockey(id), horse_name VARCHAR(30) NOT NULL, jockey_name VARCHAR(61) NOT NULL, random_speed DOUBLE NOT NULL CHECK random_speed>0.0, luck_factor DOUBLE NOT NULL, jockey_skill_calc DOUBLE NOT NULL, average_speed DOUBLE NOT NULL, rank INTEGER NOT NULL CHECK rank>0, PRIMARY KEY(race_id, horse_id, jockey_id));