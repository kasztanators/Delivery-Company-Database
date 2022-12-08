INSERT INTO Users Values (1, 'Wikt1or', 'Czety24rbok', 'kasztanators', '12345', 's188695@gmail.com')
SELECT * FROM Users

INSERT INTO Addresses Values (1, 'Gdansk', 'Pomorskie' , '80-152', 'Traugutta', 9)
SELECT * FROM Addresses


INSERT INTO HasAddress Values ( 1,1 )
SELECT * FROM HasAddress


INSERT INTO Receivers Values ( 1,'Dedza', 'Kamil', '19020@gmail.com')
SELECT * FROM Receivers

INSERT INTO Orders Values(1, '2020-01-01 00:00:00', 1)
SELECT * FROM Orders

INSERT INTO Packages Values(1, 0, 12, 12, 15, 20, 1, 1, 1)
SELECT * FROM Packages


INSERT INTO Tracking_info Values(1, 'Paczka wyjechala z punktu A')
SELECT * FROM Tracking_info

INSERT INTO Tracker Values(1 ,1 )
SELECT * FROM Tracker

INSERT INTO Delivery_units Values(1, 124, 1)
SELECT * FROM Delivery_units


INSERT INTO Deliverymen Values(1, '696286572')
SELECT * FROM Deliverymen

INSERT INTO Vehicles Values(1,'NGI 5U27', 'lorry', 0)
SELECT * FROM Vehicles


INSERT INTO Driverlogs Values(1, 'B2', 1, 1)
SELECT * FROM Driverlogs


INSERT INTO Transports Values(1, 'picked', 8.241234, 2.124134, 1, 1,1)
SELECT * FROM Transports

INSERT INTO Group_of_packages Values()
SELECT * FROM Group_of_packages

INSERT INTO Transshipments Values(1, '2020-01-01 00:00:00', 1)
SELECT * FROM Transshipments
