-- 7. В подключенном MySQL репозитории создать базу данных “Друзья человека”
create database Frends_Human;
use Frends_Human;
-- 8. Создать таблицы с иерархией из диаграммы в БД

CREATE TABLE Animal (
    animal_id INT PRIMARY KEY,
    name VARCHAR(100),
    birthdate DATE
);

CREATE TABLE Mammal (
    animal_id INT PRIMARY KEY REFERENCES Animal(animal_id),
    description VARCHAR(100),
    weight DECIMAL(5, 2)
);

CREATE TABLE Horse (
    animal_id INT PRIMARY KEY REFERENCES Mammal(animal_id),
    breed VARCHAR(50),
    color VARCHAR(50)
);

CREATE TABLE Donkey (
    animal_id INT PRIMARY KEY REFERENCES Mammal(animal_id),
    height DECIMAL(5, 2),
    length DECIMAL(5, 2)
);

CREATE TABLE Camel (
    animal_id INT PRIMARY KEY REFERENCES Mammal(animal_id),
    hump_number INT,
    speed DECIMAL(5, 2),
    endurance DECIMAL(5, 2)
);

-- 9. Заполнить низкоуровневые таблицы именами(животных), командами которые они выполняют и датами рождения

INSERT INTO Animal (animal_id, name, birthdate) VALUES (1, 'Cat', '2010-08-15');
INSERT INTO Animal (animal_id, name, birthdate) VALUES (2, 'Dog', '2012-03-22');
INSERT INTO Animal (animal_id, name, birthdate) VALUES (3, 'Hamster', '2015-11-10');
INSERT INTO Animal (animal_id, name, birthdate) VALUES (4, 'Camel', '2008-06-27');
INSERT INTO Animal (animal_id, name, birthdate) VALUES (5, 'Hourse', '2004-11-20');
INSERT INTO Animal (animal_id, name, birthdate) VALUES (6, 'Donkey', '2000-05-17');


INSERT INTO Mammal (animal_id, description, weight) VALUES (1, 'a mammal with fangs and claws', 8);
INSERT INTO Mammal (animal_id, description, weight) VALUES (2, 'A mammal with fangs', 40);
INSERT INTO Mammal (animal_id, description, weight) VALUES (3, 'Large mammal with sharp claws', 350);
INSERT INTO Mammal (animal_id, description, weight) VALUES (4, 'Tusked mammal with a trunk', 500);

INSERT INTO Horse (animal_id, breed, color) VALUES (1, 'Arabian', 'Brown');
INSERT INTO Horse (animal_id, breed, color) VALUES (2, 'Siberian', 'White');
INSERT INTO Horse (animal_id, breed, color) VALUES (3, 'Mustang', 'Black');
INSERT INTO Horse (animal_id, breed, color) VALUES (4, 'Clydesdale', 'Brown');

INSERT INTO Donkey (animal_id, height, length) VALUES (1, 120, 180);
INSERT INTO Donkey (animal_id, height, length) VALUES (2, 130, 190);
INSERT INTO Donkey (animal_id, height, length) VALUES (3, 125, 185);
INSERT INTO Donkey (animal_id, height, length) VALUES (4, 140, 200);

INSERT INTO Camel (animal_id, hump_number, speed, endurance) VALUES (1, 1, 20, 10);
INSERT INTO Camel (animal_id, hump_number, speed, endurance) VALUES (2, 2, 15, 12);
INSERT INTO Camel (animal_id, hump_number, speed, endurance) VALUES (3, 1, 18, 9);
INSERT INTO Camel (animal_id, hump_number, speed, endurance) VALUES (4, 2, 16, 11);

/*10. Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой
питомник на зимовку. Объединить таблицы лошади, и ослы в одну таблицу.
*/

DELETE FROM Camel;

CREATE TABLE Equus (
    animal_id INT PRIMARY KEY REFERENCES Mammal(animal_id),
    breed VARCHAR(50),
    color VARCHAR(50),
    height DECIMAL(5, 2),
    length DECIMAL(5, 2)
);


INSERT INTO Equus (animal_id, breed, color, height, length)
SELECT H.animal_id, H.breed, H.color, D.height, D.length
FROM Horse H
JOIN Donkey D ON H.animal_id = D.animal_id;

/*11.Создать новую таблицу “молодые животные” в которую попадут все
животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью
до месяца подсчитать возраст животных в новой таблице
*/

CREATE TABLE YoungAnimals (
    animal_id INT PRIMARY KEY REFERENCES Animal(animal_id),
    name VARCHAR(100),
    birthdate DATE,
    age_months INT
);

UPDATE Animal SET birthdate = '2021-08-15'
WHERE name = 'cat';


INSERT INTO YoungAnimals (animal_id, name, birthdate, age_months)
SELECT A.animal_id, A.name, A.birthdate, TIMESTAMPDIFF(MONTH, A.birthdate, CURDATE()) AS age_months
FROM Animal A
WHERE TIMESTAMPDIFF(YEAR, A.birthdate, CURDATE()) < 3
AND TIMESTAMPDIFF(YEAR, A.birthdate, CURDATE())> 1;
