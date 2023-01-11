	CREATE TABLE Users
	(
	 userID INT PRIMARY KEY,
	 name CHAR(25) CHECK (name NOT LIKE '%[^a-z, A-Z]%') NOT NULL,
	 surname CHAR(35) CHECK (surname NOT LIKE '%[^a-z , A-Z]%') NOT NULL,
	 user_name CHAR(25) NOT NULL UNIQUE,
	 password CHAR(25) CHECK (LEN(password) >= 5)NOT NULL,
	 email VARCHAR(255) CHECK (email like '%_@__%.__%')NOT NULL UNIQUE

	);
	CREATE TABLE Addresses
	(
	 addressID INT PRIMARY KEY,
	 city CHAR(20) CHECK (city like '%[^a-zA-Z]%') NOT NULL,
	 region CHAR(30) NOT NULL,
	 postcode CHAR(6) CHECK (postcode like '[0-9][0-9]-[0-9][0-9][0-9]') NOT NULL,
	 street CHAR(25) NOT NULL, 
	 building_number CHAR(5) NOT NULL
	);
	CREATE TABLE HasAddress
	(
	userREF INT REFERENCES Users ON DELETE CASCADE,
	addressREF INT REFERENCES Addresses ON DELETE CASCADE,
	PRIMARY KEY (userREF, addressREF)
	);
	CREATE TABLE Receivers
	(
	 receiverID INTEGER PRIMARY KEY,
	 name CHAR(30) CHECK ( name NOT LIKE '%[^a-z, A-Z]%')NOT NULL,
	 surname CHAR (30) CHECK ( surname  NOT LIKE '%[^a-z , A-Z]%')NOT NULL,
	 email CHAR(25) CHECK (email like '%_@__%.__%') NOT NULL
	);
	CREATE TABLE Orders
	(
	 orderID INTEGER PRIMARY KEY,
	 date_of_check_in DATETIME,
	 userREF INT REFERENCES Users ON DELETE SET NULL

	);
	CREATE TABLE Packages
	(
	 packageID INTEGER PRIMARY KEY,
	 is_fragile BIT DEFAULT 0 NOT NULL,
	 size_X INT CHECK(size_X > 0 AND size_X < 500 ) NOT NULL,
	 size_Y INT CHECK(size_Y > 0 AND size_Y < 500) NOT NULL,
	 size_Z INT CHECK(size_Z > 0 AND size_Z < 500) NOT NULL,
	 weight INT CHECK(weight > 0 AND weight < 200) NOT NULL,
	 addressREF INT REFERENCES Addresses ON DELETE SET NULL,
	 orderREF INT REFERENCES Orders ON DELETE SET NULL,
	 receiverREF INT REFERENCES Receivers ON DELETE SET NULL
	);

	CREATE TABLE Tracking_info
	(
	trackerID INT PRIMARY KEY,
	message_CHAR VARCHAR(255),
	packageREF INT REFERENCES Packages ON DELETE SET NULL
	);
	CREATE TABLE Tracker
	(
	trackerREF INT REFERENCES Tracking_info ON DELETE CASCADE,
	receiverREF INT REFERENCES Receivers ON DELETE CASCADE,
	PRIMARY KEY (trackerREF, receiverREF)
	);

	CREATE TABLE Delivery_units
	(
	unitID INT PRIMARY KEY,
	capacity INT CHECK(capacity >= 0) NOT NULL,
	--addressREF INT REFERENCES Addresses ON DELETE SET NULL
	
	);
	ALTER TABLE Delivery_units 
		ADD addresREF int REFERENCES Addresses(addressID) ON DELETE SET NULL
	CREATE TABLE Deliverymen
	(
	deliverymanID INT PRIMARY KEY,
	phone_num CHAR(9) CHECK (phone_num NOT LIKE '%[^0-9]%{9}') NOT NULL
	);
	CREATE TABLE Vehicles
	(
	vehicleID INT  PRIMARY KEY,
	register_plate CHAR(8) NOT NULL,
	type CHAR(12) NOT NULL,
	is_available BIT DEFAULT 0 NOT NULL
	);

	CREATE TABLE Driverlogs
	(
	driverlogID INT PRIMARY KEY,
	licence_type CHAR(2) NOT NULL,
	deliverymanREF INT REFERENCES Deliverymen ON DELETE CASCADE,
	vehicleREF INT REFERENCES Vehicles ON DELETE CASCADE
	);
	CREATE TABLE Transports
	(
	transportID INT PRIMARY KEY,
	status CHAR(10),
	x_coor FLOAT,
	y_coor FLOAT ,
	vehicleREF INT REFERENCES Vehicles ON DELETE SET NULL,
	deliverymanREF INT REFERENCES Deliverymen ON DELETE SET NULL,
	fromUnitREF INT REFERENCES Delivery_units(unitID),
	toUnitREF INT REFERENCES Delivery_units(unitID)
	);

	CREATE TABLE PackageTransport
	(
	packageREF INT REFERENCES Packages(packageID) ON DELETE CASCADE,
	transportREF INT REFERENCES Transports(transportID) ON DELETE CASCADE,	
	PRIMARY KEY ( packageREF,transportREF)
	);
	CREATE TABLE Transshipments
	(
	transshipmentID INT PRIMARY KEY,
	date DATETIME NOT NULL,
	packageREF INT REFERENCES Packages ON DELETE CASCADE,
	unitREF INT REFERENCES Delivery_units (unitID)
	);
	CREATE TABLE TabelkaPomocnicza
	(
	tracker_REF INT,
	receiver_REF INT,
	FOREIGN KEY (tracker_REF, receiver_REF) REFERENCES Tracker (trackerREF, receiverREF)

	);