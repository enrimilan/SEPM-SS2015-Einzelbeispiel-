DROP SEQUENCE race_id_seq IF EXISTS;
DROP TABLE RaceResult IF EXISTS;
DROP TABLE Horse IF EXISTS;
DROP TABLE Jockey IF EXISTS;


CREATE TABLE Horse(id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, name VARCHAR(30) NOT NULL, age INTEGER NOT NULL CHECK age>0, min_speed DOUBLE NOT NULL, max_speed DOUBLE NOT NULL, picture VARCHAR NOT NULL, is_deleted BOOLEAN NOT NULL DEFAULT false, CHECK min_speed<=max_speed AND min_speed>0.0 and max_speed>0.0);
CREATE TABLE Jockey(id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, first_name VARCHAR(30) NOT NULL,last_name VARCHAR(30) NOT NULL, country VARCHAR(30) NOT NULL, skill DOUBLE NOT NULL, is_deleted BOOLEAN NOT NULL DEFAULT false);
CREATE TABLE RaceResult(race_id INTEGER NOT NULL, horse_id INTEGER REFERENCES Horse(id), jockey_id INTEGER REFERENCES Jockey(id), horse_name VARCHAR(30) NOT NULL, jockey_name VARCHAR(61) NOT NULL, random_speed DOUBLE NOT NULL CHECK random_speed>0.0, luck_factor DOUBLE NOT NULL, jockey_skill_calc DOUBLE NOT NULL, average_speed DOUBLE NOT NULL, rank INTEGER NOT NULL CHECK rank>0, PRIMARY KEY(race_id, horse_id, jockey_id));
CREATE SEQUENCE race_id_seq INCREMENT BY 1 START WITH 1 NOMAXVALUE;


INSERT INTO Horse(name,age,min_speed,max_speed,picture) VALUES ('Jacky',15,55.6,88.9,'src/res/pictures/1.jpg');
INSERT INTO Horse(name,age,min_speed,max_speed,picture) VALUES ('Avenida',23,56.0,82.9,'src/res/pictures/2.jpg');
INSERT INTO Horse(name,age,min_speed,max_speed,picture) VALUES ('Manchego',30,51.6,79.1,'src/res/pictures/3.jpg');
INSERT INTO Horse(name,age,min_speed,max_speed,picture) VALUES ('Trixie',19,59.6,90.7,'src/res/pictures/4.jpg');
INSERT INTO Horse(name,age,min_speed,max_speed,picture) VALUES ('Dark Sparks',22,65.6,95.2,'src/res/pictures/5.jpg');
INSERT INTO Horse(name,age,min_speed,max_speed,picture,is_deleted) VALUES ('Penny',12,52.6,85.3,'src/res/pictures/6.jpg',true);
INSERT INTO Horse(name,age,min_speed,max_speed,picture) VALUES ('Sweet Ranger',28,51.9,85.2,'src/res/pictures/7.jpg');
INSERT INTO Horse(name,age,min_speed,max_speed,picture,is_deleted) VALUES ('Finnigan',16,51.0,90.2,'src/res/pictures/8.jpg',true);
INSERT INTO Horse(name,age,min_speed,max_speed,picture) VALUES ('Sherman',24,50.8,96.2,'src/res/pictures/9.jpg');
INSERT INTO Horse(name,age,min_speed,max_speed,picture) VALUES ('Swiftbolt',16,65.6,95.1,'src/res/pictures/10.jpg');

INSERT INTO Jockey(first_name,last_name,country,skill) VALUES ('Eddie','Ahern','Ireland',3.0);
INSERT INTO Jockey(first_name,last_name,country,skill) VALUES ('Robby','Albarado','United States',1.0);
INSERT INTO Jockey(first_name,last_name,country,skill) VALUES ('Steve','Cauthen','United States',-2.0);
INSERT INTO Jockey(first_name,last_name,country,is_deleted,skill) VALUES ('Patricia','Cooksey','United States',true,4.0);
INSERT INTO Jockey(first_name,last_name,country,skill) VALUES ('Alan','Garcia','Peru',5.0);
INSERT INTO Jockey(first_name,last_name,country,skill) VALUES ('Julien','Leparoux','France',-7.0);
INSERT INTO Jockey(first_name,last_name,country,skill) VALUES ('Kirsty','Milczarek','Poland',8.0);
INSERT INTO Jockey(first_name,last_name,country,is_deleted,skill) VALUES ('Anna','Napravnik','United States',true,9.0);
INSERT INTO Jockey(first_name,last_name,country,skill) VALUES ('Lance','Sullivan','New Zealand',2.0);
INSERT INTO Jockey(first_name,last_name,country,skill) VALUES ('Stephane','Pasquier','France',0.0);

INSERT INTO RaceResult(race_id,horse_id,jockey_id,horse_name,jockey_name,random_speed,luck_factor,jockey_skill_calc,average_speed,rank) VALUES (race_id_seq.NEXTVAL,1,3,'Jacky','Stevie Cauthen',61.16,1.03,0.98,61.73,4);
INSERT INTO RaceResult(race_id,horse_id,jockey_id,horse_name,jockey_name,random_speed,luck_factor,jockey_skill_calc,average_speed,rank) VALUES (race_id_seq.CURRVAL,3,5,'Manchego','Alan Garcia',56.49,1.02,1.04,59.92,5);
INSERT INTO RaceResult(race_id,horse_id,jockey_id,horse_name,jockey_name,random_speed,luck_factor,jockey_skill_calc,average_speed,rank) VALUES (race_id_seq.CURRVAL,5,7,'Dark Sparks','Kirsty Milczarek',92.67,0.99,1.05,96.33,1);
INSERT INTO RaceResult(race_id,horse_id,jockey_id,horse_name,jockey_name,random_speed,luck_factor,jockey_skill_calc,average_speed,rank) VALUES (race_id_seq.CURRVAL,7,9,'Sweet Ranger','Lance Sullivan',64.68,0.99,1.02,65.31,3);
INSERT INTO RaceResult(race_id,horse_id,jockey_id,horse_name,jockey_name,random_speed,luck_factor,jockey_skill_calc,average_speed,rank) VALUES (race_id_seq.CURRVAL,9,1,'Sherman','Eddie Ahern',65.93,0.97,1.03,65.87,2);
INSERT INTO RaceResult(race_id,horse_id,jockey_id,horse_name,jockey_name,random_speed,luck_factor,jockey_skill_calc,average_speed,rank) VALUES (race_id_seq.NEXTVAL,2,4,'Avenida','Patricia Cooksey',74.06,1.03,1.03,78.57,3);
INSERT INTO RaceResult(race_id,horse_id,jockey_id,horse_name,jockey_name,random_speed,luck_factor,jockey_skill_calc,average_speed,rank) VALUES (race_id_seq.CURRVAL,4,6,'Trixie','Julien Leparoux',62.17,0.97,0.95,57.29,4);
INSERT INTO RaceResult(race_id,horse_id,jockey_id,horse_name,jockey_name,random_speed,luck_factor,jockey_skill_calc,average_speed,rank) VALUES (race_id_seq.CURRVAL,6,8,'Penny','Anna Napravnik',79.7,1.0,1.05,83.69,2);
INSERT INTO RaceResult(race_id,horse_id,jockey_id,horse_name,jockey_name,random_speed,luck_factor,jockey_skill_calc,average_speed,rank) VALUES (race_id_seq.CURRVAL,10,2,'Swiftbolt','Robby Albarado',94.32,1.04,1.01,99.07,1);
INSERT INTO RaceResult(race_id,horse_id,jockey_id,horse_name,jockey_name,random_speed,luck_factor,jockey_skill_calc,average_speed,rank) VALUES (race_id_seq.CURRVAL,1,1,'Jacky','Eddie Ahern',58.17,0.95,1.03,56.92,5);