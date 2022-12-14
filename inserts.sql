INSERT INTO Users Values (1, 'Wiktor', 'Czetyrbok', 'kasztanators', '12345', 's188695@gmail.com')
INSERT INTO Users Values (2, 'Lucas', 'Crancah', 'quepasa', 'oeamf5', 's18sd95@gmail.com')
INSERT INTO Users Values (3, 'Eulogiusz', 'Ryibinski', 'lewy', '1xv345', 's134695@gmail.com')
INSERT INTO Users Values (4, 'Eleonora', 'Michalek', 'ander', '432bbr', 's1856395@gmail.com')
INSERT INTO Users Values (5, 'Bozena', 'Ostrowska', 'lewarek', '213asdf', 's18863245@gmail.com')
INSERT INTO Users Values (6, 'Anna', 'Sokolowska', 'kalkulator', 'wdgf34', 's188295@gmail.com')
INSERT INTO Users Values (7, 'Agata', 'Padzina', 'szlanka', '4yt3qgwer', 's112695@gmail.com')
INSERT INTO Users Values (8, 'Dariusz', 'Dario', 'glosnik', 'DGSVgbas', 's1318695@gmail.com')
INSERT INTO Users Values (9, 'Michal', 'Tukowski', 'scyzoryk', 'aresvbyt', 's175695@gmail.com')
INSERT INTO Users Values (10, 'Adrian', 'Chodan', 'sluchawki', 'kugfghf', 's188634@gmail.com')
SELECT * FROM Users

INSERT INTO Addresses Values (1, 'Gdansk', 'Pomorskie' , '80-152', 'Traugutta', 9)
INSERT INTO Addresses Values (2, 'Warszawa', 'Mazowieckie' , '00-018', 'Europejska', 19)
INSERT INTO Addresses Values (3, 'Torun', 'Kujawsko-Pomorskie' , '87-162', 'Jadwigi', 3)
INSERT INTO Addresses Values (4, 'Bialystok', 'Podlaskie' , '15-008', 'Ketrzynskiego', 7)
INSERT INTO Addresses Values (5, 'Poznan', 'Wielkopolska' , '80-152', 'Stocznia', 43)
INSERT INTO Addresses Values (6, 'Bydgoszcz', 'Kujawsko-Pomorskie' , '80-152', '3 Maja', 12)
INSERT INTO Addresses Values (7, 'Gdansk', 'Pomorskie' , '85-032', 'Wysoka', 34)
INSERT INTO Addresses Values (8, 'Warszawa', 'Mazowieckie' , '00-018', 'Krotka', 11)
INSERT INTO Addresses Values (9, 'Gdansk', 'Pomorskie' , '80-152', 'Dluga', 91)
INSERT INTO Addresses Values (10, 'Krakow', 'Malopolskie' , '30-033', 'Boczna', 9)
INSERT INTO Addresses Values (11, 'Warszawa', 'Mazowieckie' , '00-018', 'Krotka', 11)
INSERT INTO Addresses Values (12, 'Gdansk', 'Pomorskie' , '80-152', 'Dluga', 21)
INSERT INTO Addresses Values (13, 'Krakow', 'Malopolskie' , '30-023', 'Boczna', 6)
INSERT INTO Addresses Values (14, 'Bialystok', 'Podlaskie' , '15-008', 'Ketrzynskiego', 7)
INSERT INTO Addresses Values (15, 'Bialystok', 'Podlaskie' , '15-008', 'Ketrzynskiego', 1)
INSERT INTO Addresses Values (16, 'Torun', 'Kujawsko-Pomorskie' , '87-162', 'Mieszka', 3)
INSERT INTO Addresses Values (17, 'Torun', 'Kujawsko-Pomorskie' , '87-162', 'Mieszka', 2)
INSERT INTO Addresses Values (18, 'Torun', 'Kujawsko-Pomorskie' , '87-162', 'Mieszka', 4)
INSERT INTO Addresses Values (19, 'Torun', 'Kujawsko-Pomorskie' , '87-162', 'Mieszka', 5)
INSERT INTO Addresses Values (20, 'Torun', 'Kujawsko-Pomorskie' , '87-162', 'Mieszka', 6)
INSERT INTO Addresses Values (21, 'Torun', 'Kujawsko-Pomorskie' , '87-162', 'Mieszka', 7)

SELECT * FROM Addresses


INSERT INTO HasAddress Values ( 1,9 )
INSERT INTO HasAddress Values ( 2,9 )
INSERT INTO HasAddress Values ( 3,8 )
INSERT INTO HasAddress Values ( 4,7 )
INSERT INTO HasAddress Values ( 5,6 )
INSERT INTO HasAddress Values ( 6,5 )
INSERT INTO HasAddress Values ( 7,4 )
INSERT INTO HasAddress Values ( 8,3 )
INSERT INTO HasAddress Values ( 9,2 )
INSERT INTO HasAddress Values ( 9,1 )

SELECT * FROM HasAddress
DELETE HasAddress WHERE userREF =1

INSERT INTO Receivers Values ( 1,'Kopel', 'Kamil', '191220@gmail.com')
INSERT INTO Receivers Values ( 2,'Mieszko', 'Adam', '190450@gmail.com')
INSERT INTO Receivers Values ( 3,'Pach', 'Adrian', '19023415@gmail.com')
INSERT INTO Receivers Values ( 4,'Rogozinski', 'Anastazy', '237623@gmail.com')
INSERT INTO Receivers Values ( 5,'Debski', 'Amadeusz', '3894271@gmail.com')
INSERT INTO Receivers Values ( 6,'Krasucki', 'Antoni', '2473868@gmail.com')
INSERT INTO Receivers Values ( 7,'Krzewski', 'Arkady', '14387@gmail.com')
INSERT INTO Receivers Values ( 8,'Oleszkiewicz', 'Artur', '41378@gmail.com')
INSERT INTO Receivers Values ( 9,'Popiela', 'Bernard', '413522@gmail.com')
INSERT INTO Receivers Values ( 10,'Siedlecki', 'Bogumyslaw', '315243@gmail.com')
SELECT * FROM Receivers

INSERT INTO Orders Values(1, '2020-01-01 00:00:00', 9)
INSERT INTO Orders Values(2, '2022-10-14 21:20:20', 9)
INSERT INTO Orders Values(3, '2021-05-02 17:02:31', 8)
INSERT INTO Orders Values(4, '2020-07-16 15:00:18', 7)
INSERT INTO Orders Values(5, '2020-04-11 09:25:16', 6)
INSERT INTO Orders Values(6, '2019-09-14 16:39:07', 5)
INSERT INTO Orders Values(7, '2019-04-07 07:16:25', 4)
INSERT INTO Orders Values(8, '2020-02-07 07:51:27', 3)
INSERT INTO Orders Values(9, '2021-06-06 22:25:15', 2)
INSERT INTO Orders Values(10, '2021-06-11 09:21:08', 1)


SELECT * FROM Orders

INSERT INTO Packages Values(1, 0, 13, 3, 5, 2, 18, 1, 1)
INSERT INTO Packages Values(2, 1, 12, 2, 13, 20, 19, 1, 2)
INSERT INTO Packages Values(3, 0, 1, 52, 12, 30, 19, 3, 3)
INSERT INTO Packages Values(4, 0, 11, 12, 11, 21, 20, 2, 4)
INSERT INTO Packages Values(5, 1, 16, 178, 14, 40, 21, 2, 5)
INSERT INTO Packages Values(6, 0, 18, 123, 11, 10, 21, 3, 6)
INSERT INTO Packages Values(7, 1, 19, 5, 15, 8, 8, 4, 7)
INSERT INTO Packages Values(8, 0, 14, 12, 16, 6, 4, 5, 8)
INSERT INTO Packages Values(9, 1, 12, 12, 18, 22, 5, 6, 9)
INSERT INTO Packages Values(10, 0, 19, 11, 19, 12, 3, 7, 10)
INSERT INTO Packages Values(11, 1, 12, 112, 17, 31, 1, 8, 11)
INSERT INTO Packages Values(12, 0, 11, 121, 15, 6, 9, 9, 12)
INSERT INTO Packages Values(13, 0, 141, 121, 18, 4, 17, 10, 13)
SELECT * FROM Packages


INSERT INTO Tracking_info Values(1, 'Paczka wyjechala z punktu A')
INSERT INTO Tracking_info Values(2, 'Paczka wyjechala z punktu B')
INSERT INTO Tracking_info Values(3, 'Paczka wyjechala z punktu C')
INSERT INTO Tracking_info Values(4, 'Paczka wyjechala z punktu A')
INSERT INTO Tracking_info Values(5, 'Paczka wyjechala z punktu B')
INSERT INTO Tracking_info Values(6, 'Paczka wyjechala z punktu C')
INSERT INTO Tracking_info Values(7, 'Paczka wyjechala z punktu F')
INSERT INTO Tracking_info Values(8, 'Paczka wyjechala z punktu A')
INSERT INTO Tracking_info Values(9, 'Paczka wyjechala z punktu B')
INSERT INTO Tracking_info Values(10, 'Paczka wyjechala z punktu C')
INSERT INTO Tracking_info Values(11, 'Paczka w sortowni A')
INSERT INTO Tracking_info Values(12, 'Paczka w sortowni B')
INSERT INTO Tracking_info Values(13, 'Paczka w sortowni A')
INSERT INTO Tracking_info Values(14, 'Paczka w sortowni B')
INSERT INTO Tracking_info Values(15, 'Paczka w sortowni H')
INSERT INTO Tracking_info Values(16, 'Paczka w sortowni C')
INSERT INTO Tracking_info Values(17, 'Paczka w sortowni A')
INSERT INTO Tracking_info Values(18, 'Paczka w sortowni G')
INSERT INTO Tracking_info Values(19, 'Paczka w sortowni A')
INSERT INTO Tracking_info Values(20, 'Paczka w sortowni B')

SELECT * FROM Tracking_info

INSERT INTO Tracker Values(1 ,10 )
INSERT INTO Tracker Values(2 ,9 )
INSERT INTO Tracker Values(3 ,8 )
INSERT INTO Tracker Values(4 ,7 )
INSERT INTO Tracker Values(5 ,6 )
INSERT INTO Tracker Values(6 ,5 )
INSERT INTO Tracker Values(7 ,4 )
INSERT INTO Tracker Values(8 ,3 )
INSERT INTO Tracker Values(9 ,2 )
INSERT INTO Tracker Values(10 ,1 )
INSERT INTO Tracker Values(11 ,10 )
INSERT INTO Tracker Values(12 ,9 )
INSERT INTO Tracker Values(13 ,8 )
INSERT INTO Tracker Values(14 ,7 )
INSERT INTO Tracker Values(15 ,6 )
INSERT INTO Tracker Values(16 ,5 )
INSERT INTO Tracker Values(17 ,4 )
INSERT INTO Tracker Values(18 ,3 )
INSERT INTO Tracker Values(19 ,2 )
INSERT INTO Tracker Values(20 ,1 )

SELECT * FROM Tracker

INSERT INTO Delivery_units Values(1, 124, 10)
INSERT INTO Delivery_units Values(2, 1124, 12)
INSERT INTO Delivery_units Values(3, 1424, 13)
INSERT INTO Delivery_units Values(4, 5224, 14)
INSERT INTO Delivery_units Values(5, 1456, 15)
INSERT INTO Delivery_units Values(6, 12413, 16)
INSERT INTO Delivery_units Values(7, 13524, 17)
SELECT * FROM Delivery_units







INSERT INTO Deliverymen Values(1, '696286572')
INSERT INTO Deliverymen Values(2, '874983284')
INSERT INTO Deliverymen Values(3, '430179054')
INSERT INTO Deliverymen Values(4, '237786970')
INSERT INTO Deliverymen Values(5, '754451033')
INSERT INTO Deliverymen Values(6, '887531166')
INSERT INTO Deliverymen Values(7, '386510460')
INSERT INTO Deliverymen Values(8, '831368058')
INSERT INTO Deliverymen Values(9, '296440129')
INSERT INTO Deliverymen Values(10, '604312416')
SELECT * FROM Deliverymen

INSERT INTO Vehicles Values(1,'NGI5U27', 'lorry', 0)
INSERT INTO Vehicles Values(2,'DLE2102', 'car', 0)
INSERT INTO Vehicles Values(3,'PGS0184', 'car', 1)
INSERT INTO Vehicles Values(4,'LLU1020', 'car', 1)
INSERT INTO Vehicles Values(5,'WK52850', 'bus', 0)
INSERT INTO Vehicles Values(6,'WML0670', 'moped', 1)
INSERT INTO Vehicles Values(7,'ZCH1389', 'lorry', 0)
INSERT INTO Vehicles Values(8,'NGI5U27', 'bus', 1)
INSERT INTO Vehicles Values(9,'WW23928', 'motorbike', 0)
INSERT INTO Vehicles Values(10,'NOL0051', 'lorry', 0)
INSERT INTO Vehicles Values(11,'GCH1574', 'lorry', 1)
INSERT INTO Vehicles Values(12,'LPA9846', 'lorry', 0)


SELECT * FROM Vehicles


INSERT INTO Driverlogs Values(1, 'C', 1, 12)
INSERT INTO Driverlogs Values(2, 'C', 2, 11)
INSERT INTO Driverlogs Values(3, 'C', 3, 10)
INSERT INTO Driverlogs Values(4, 'B1', 4, 9)
INSERT INTO Driverlogs Values(5, 'B2', 5, 8)
INSERT INTO Driverlogs Values(6, 'C', 6, 7)
INSERT INTO Driverlogs Values(7, 'B1', 7, 6)
INSERT INTO Driverlogs Values(8, 'B2', 8, 5)
INSERT INTO Driverlogs Values(9, 'B', 9, 4)
INSERT INTO Driverlogs Values(10, 'B', 10, 3)
INSERT INTO Driverlogs Values(12, 'B', 1, 2)
INSERT INTO Driverlogs Values(13, 'C', 2, 1)
INSERT INTO Driverlogs Values(14, 'C', 3, 1)
SELECT * FROM Driverlogs


INSERT INTO Transports Values(1, 'picked', 8.2412345, 2.124134, 1, 10,1,6)
INSERT INTO Transports Values(2, 'sorted', 8.2412341, 26.826999, 2, 9,2,7)
INSERT INTO Transports Values(3, 'picked', 8.2412365, 2.124134, 3, 8,3,7)
INSERT INTO Transports Values(4, 'picked', 8.2416554, 2.124134, 4, 7,4,5)
INSERT INTO Transports Values(5, 'sorted', 8.2413223, 13.513534, 5, 6,6,2)
INSERT INTO Transports Values(6, 'picked', 12.1394862, 2.124134, 6, 5,6,4)
INSERT INTO Transports Values(7, 'delvered', 13.513534, 2.124134, 7, 4,7,3)
INSERT INTO Transports Values(8, 'picked', 13.513534, 2.124134, 1, 8, 3,2)
INSERT INTO Transports Values(9, 'delivered', 41.3434312, 13.513534, 9, 2,4,1)
INSERT INTO Transports Values(10, 'delivered', 21.3434312, 73.513534, 10, 1,4,6)




SELECT * FROM Transports

INSERT INTO PackageTransport Values(1, 1)
INSERT INTO PackageTransport Values(2, 9)
INSERT INTO PackageTransport Values(3, 8)
INSERT INTO PackageTransport Values(4, 7)
INSERT INTO PackageTransport Values(5, 6)
INSERT INTO PackageTransport Values(6, 5)
INSERT INTO PackageTransport Values(7, 4)
INSERT INTO PackageTransport Values(8, 3)
INSERT INTO PackageTransport Values(9, 2)
INSERT INTO PackageTransport Values(10, 1)
INSERT INTO PackageTransport Values(12, 2)
INSERT INTO PackageTransport Values(13, 10)
SELECT * FROM PackageTransport


INSERT INTO Transshipments Values(1, '2022-11-29 14:32:44', 1)
INSERT INTO Transshipments Values(2, '2022-11-30 11:22:07', 1)
INSERT INTO Transshipments Values(3, '2021-06-06 18:22:24', 2)
INSERT INTO Transshipments Values(4, '2021-06-08 20:59:56', 2)
INSERT INTO Transshipments Values(5, '2022-07-28 07:38:07', 3)
INSERT INTO Transshipments Values(6, '2022-07-28 20:02:04', 3)
INSERT INTO Transshipments Values(7, '2021-08-22 15:14:42', 4)
INSERT INTO Transshipments Values(8, '2022-08-24 03:02:34', 4)
INSERT INTO Transshipments Values(9, '2022-06-20 01:49:17', 5)
INSERT INTO Transshipments Values(10, '2022-06-21 12:39:05', 5)
INSERT INTO Transshipments Values(11, '2021-03-22 04:36:20', 6)
INSERT INTO Transshipments Values(12, '2021-03-23 15:49:21', 6)
INSERT INTO Transshipments Values(13, '2021-01-01 08:21:45', 7)
INSERT INTO Transshipments Values(14, '2021-01-01 22:46:59', 7)
INSERT INTO Transshipments Values(15, '2021-12-21 09:28:32', 8)
INSERT INTO Transshipments Values(16, '2021-12-22 03:02:57', 8)
INSERT INTO Transshipments Values(17, '2021-06-11 23:13:05', 9)
INSERT INTO Transshipments Values(18, '2021-06-12 09:02:45', 9)
INSERT INTO Transshipments Values(19, '2021-07-12 02:07:39', 10)
INSERT INTO Transshipments Values(20, '2021-07-12 06:07:39', 10)

SELECT * FROM Transshipments
