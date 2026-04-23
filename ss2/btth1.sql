create database my_hobbie_db;

use my_hobbie_db;

create table persons (
personId int NOT NULL PRIMARY KEY,
lastName char(255) NOT NULL,
firstName char(255) NOT NULL,
email char(100) NOT NULL UNIQUE,
address char(255),
city char(255)
);

create table hobbies (
id int NOT NULL PRIMARY KEY,
name char(100) CHECK (length(name) >4),
personId int,
CONSTRAINT fk_hobbies_persons
FOREIGN KEY (personId)
REFERENCES persons(personId)
);

INSERT INTO persons VALUES(1, 'Nguyen', 'An', 'an@example.com', '123 Street', 'HCMC');

INSERT INTO hobbies VALUES(1, "CHOI G", 1)