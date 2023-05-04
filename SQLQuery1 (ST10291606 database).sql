USE master

IF EXISTS ( SELECT * FROM sys.databases Where name = 'ST10291606Database')
DROP DATABASE ST10291606Database
CREATE DATABASE ST10291606Database 
USE ST10291606Database

-- CREATING TABLES (Chao 2014).

CREATE TABLE car(
carNo VARCHAR(6) NOT NULL,
carMake VARCHAR(50) NOT NULL,
carModel VARCHAR(50) NOT NULL,
carBodyType VARCHAR(50) NOT NULL,
kilometresTravelled INT NOT NULL,
serviceKilometres INT NOT NULL, 
available VARCHAR(3) NOT NULL,
PRIMARY KEY (carNo)
);

CREATE TABLE driver(
driverID INT IDENTITY(1,1) NOT NULL,
name VARCHAR(50) NOT NULL,
surname VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL,
mobileNo VARCHAR(10) NOT Null,
address VARCHAR(150) NOT NULL,
PRIMARY KEY (driverID)
);

CREATE TABLE inspector(
inspectorNo VARCHAR(4) NOT NULL,
name VARCHAR(50) NOT NULL,
surname VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL,
mobileNo VARCHAR(10) NOT NULL,
PRIMARY KEY (inspectorNo)
);

CREATE TABLE fine(
fineID INT IDENTITY(1,1) NOT NULL,
fineAmount INT NOT NULL,
PRIMARY KEY (fineID)
);

CREATE TABLE rental(
rentalID INT IDENTITY(1,1) NOT NULL,
rentalFee INT NOT NULL,
startDate VARCHAR(10),
endDate VARCHAR(10),
carNo VARCHAR(6) NOT NULL,
driverID INT NOT NULL,
inspectorNo VARCHAR(4) NOT NULL,
PRIMARY KEY (rentalID),
FOREIGN KEY (carNo) REFERENCES car(carNo),
FOREIGN KEY (driverID) REFERENCES driver(driverID),
FOREIGN KEY (inspectorNo) REFERENCES inspector(inspectorNo)
);

CREATE TABLE returnCar(
returnCarID INT IDENTITY(1,1) NOT NULL,
returnDate VARCHAR(10) NOT NULL,
elapsedDate INT NOT NULL,
carNo VARCHAR(6) NOT NULL,
driverID INT NOT NULL,
inspectorNo VARCHAR(4) NOT NULL, 
fineID INT NOT NULL,
PRIMARY KEY (returnCarID),
FOREIGN KEY (carNo) REFERENCES car(carNo),
FOREIGN KEY (driverID) REFERENCES driver(driverID),
FOREIGN KEY (inspectorNo) REFERENCES inspector(inspectorNo),
FOREIGN KEY (fineID) REFERENCES fine(fineID)
);

-- SHOWING FINISHED TABLES (Chao, 2014).

SELECT * 
FROM car;

SELECT * 
FROM driver;

SELECT *
FROM inspector;

SELECT *
FROM fine;

SELECT *
FROM rental;

SELECT *
FROM returnCar;

-- POPULATING DATA FOR ALL RELEVANT TABLES (Chao, 2014).

INSERT INTO car (carNo, carMake, carModel, carBodyType, kilometresTravelled, serviceKilometres, available)
VALUES ('HYU001', 'Hyundai', 'Grand i10 1.0 Motion', 'Hatchback', 1500, 15000, 'yes'),
('HYU002', 'Hyundai', 'i20 1.2 Fluid', 'Hatchback', 3000, 15000, 'yes'),
('BMW001', 'BMW', '320d 1.2', 'Sedan', 20000, 50000, 'yes'),
('BMW002', 'BMW', '240d 1.4', 'Sedan', 9500, 15000, 'yes'),
('TOY001', 'Toyota', 'Corolla 1.0', 'Sedan', 15000, 50000, 'yes'),
('TOY002', 'Toyota', 'Avanza 1.0', 'SUV', 98000, 15000, 'yes'),
('TOY003', 'Toyota', 'Corolla Quest 1.0', 'Sedan', 15000, 50000, 'yes'),
('MER001', 'Mercedes Benz', 'c180', 'Sedan', 5200, 15000, 'yes'),
('MER002', 'Mercedes Benz', 'A200 Sedan', 'Sedan', 4080, 15000, 'yes'),
('FOR001', 'Ford', 'Fiesta 1.0', 'Sedan', 7600, 15000, 'yes');

INSERT INTO driver (name, surname, email, mobileNo, address)
VALUES ('Gabrielle', 'Clarke', 'gorix10987@macauvpn.com', '0837113269', '917 Heuvel St Botshabelo Free State 9781'),
('Geoffrey', 'Franklin', 'noceti8743@drlatvia.com', '0847728052', '1114 Dorp St Paarl Western Cape 7655'),
('Fawn', 'Cooke', 'yegifav388@enamelme.com', '0821966584', '2158 Prospect St Garsfontein Gauteng 0042'),
('Darlene', 'Peters', 'mayeka4267@macauvpn.com', '0841221244', '2529 St. John Street Somerset West Western Cape 7110'),
('Vita', 'Soto', 'wegog55107@drlatvia.com', '0824567924', '1474 Wolmarans St Sundra Mpumalanga 2200'),
('Opal', 'Rehbein', 'yiyow34505@enpaypal.com', '0826864938', '697 Thutlwa St Letaba Limpopo 0870'),
('Vernon', 'Hodgson', 'gifeh11935@enamelme.com', '0855991446', '1935 Thutlwa St Letsitele Limpopo 0885'),
('Crispin', 'Wheatly', 'likon78255@macauvpn.com', '0838347945', '330 Sandown Rd Cape Town Western Cape 8018'),
('Melanie', 'Cunningham', 'sehapeb835@macauvpn.com', '0827329001', '616 Loop St Atlantis Western Cape 7350'),
('Kevin', 'Peay', 'xajic53991@enpaypal.com', '0832077149', '814 Daffodil Dr Elliotdale Eastern Cape 5118');

INSERT INTO inspector (inspectorNo, name, surname, email, mobileNo)
VALUES ('I101', 'Bud', 'Barnes', 'bud@therideyourent.com', '0821585359'),
('I102', 'Tracy', 'Reeves', 'tracy@therideyourent.com', '0822889988'),
('I103', 'Sandra', 'Goodwin', 'sandra@therideyourent.com', '0837695468'),
('I104', 'Shannon', 'Burke', 'shannon@therideyourent.com', '0836802514');

INSERT INTO rental (rentalFee, startDate, endDate, carNo, driverID, inspectorNo)
VALUES (5000, '2021-08-30', '2021-08-31', 'HYU001', 1, 'I101'),
(5000, '2021-09-01', '2021-09-10', 'HYU002', 1, 'I101'),
(6500, '2021-09-01', '2021-09-10', 'FOR001', 2, 'I101'),
(7000, '2021-09-20', '2021-09-25', 'BMW002', 5, 'I102'),
(5000, '2021-10-03', '2021-10-31', 'TOY002', 4, 'I102'),
(8000, '2021-10-05', '2021-10-15', 'MER001', 4, 'I103'),
(5000, '2021-12-01', '2022-02-10', 'HYU002', 7, 'I104'),
(5000, '2021-08-10', '2021-08-31', 'TOY003', 9, 'I104');

INSERT INTO fine (fineAmount)
VALUES (0),
(0),
(0),
(2500),
(1000),
(500),
(0),
(0);


INSERT INTO returnCar (returnDate, elapsedDate, carNo, driverID, inspectorNo, fineID)
VALUES ('2021-08-31', 0, 'HYU001', 1, 'I101', 1),
('2021-09-10', 0, 'HYU002', 1, 'I101', 2),
('2021-09-10', 0, 'FOR001', 2, 'I101', 3),
('2021-09-30', 5, 'BMW002', 5, 'I102', 4),
('2021-10-31', 2, 'TOY002', 4, 'I102', 5),
('2021-10-15', 1, 'MER001', 4, 'I103', 6), 
('2022-02-10', 0, 'HYU002', 7, 'I104', 7),
('2021-08-31', 0, 'TOY003', 9, 'I104', 8);


-- ANSWER TO Q.5
SELECT * FROM rental
WHERE startDate BETWEEN '2021-08-01' AND '2021-10-30';

-- ANSWER TO Q.6
SELECT * FROM rental
WHERE inspectorNo = 'I101';

-- ANSWER TO Q.7
SELECT * FROM returnCar
WHERE carNo = 'TOY001' or carNo = 'TOY002' or carNo = 'TOY003';

-- ANSWER TO Q.8
SELECT COUNT(*) FROM rental
WHERE carNo = 'HYU001' or carNo = 'HYU002'

-- ANSWER TO Q.9
UPDATE car
SET carModel = 'Focus'
WHERE carNo = 'FOR001';
SELECT * FROM car

--ANSWER TO Q.10
SELECT rental.carNo, car.available, driver.name, driver.surname, rental.startDate, rental.endDate, rental.rentalFee
FROM rental
JOIN driver on rental.driverID = driver.driverID
JOIN car on car.carNo = rental.carNo



-- ANSWER TO Q.11
SELECT DISTINCT carMake
FROM car
WHERE available = 'yes';

-- ANSWER TO Q.12
SELECT *
FROM car
WHERE serviceKilometres - kilometresTravelled <= 9000;

--ANSWER TO Q.13
SELECT  returnCarID,
		returnDate, 
		elapsedDate, 
		carNo, 
		driverID, 
		inspectorNo, 
		fineID,
		SUM(elapsedDate * 500) AS late_fee
FROM returnCar
GROUP BY returnCarID, returnDate, elapsedDate, carNo, driverID, inspectorNo, fineID