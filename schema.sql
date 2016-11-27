DROP DATABASE renthome;
CREATE DATABASE renthome;
USE renthome;

CREATE TABLE listing(
id INT NOT NULL,
title VARCHAR(100),
address VARCHAR(100),
city VARCHAR(20),
state VARCHAR(20),
zipcode VARCHAR(10),
location POINT,
price INT,
description VARCHAR(2048),
bedroom_num INT,
bathroom_num INT,
PRIMARY KEY (id));

CREATE TABLE images(
id INT NOT NULL AUTO_INCREMENT,
url VARCHAR(2048),
listing_id INT NOT NULL,
FOREIGN KEY fk_listing_id(listing_id) REFERENCES listing(id),
PRIMARY KEY (id));

# Listing 1
INSERT INTO listing (
	id, title, address, city, state, zipcode, location,
    price, description, bedroom_num, bathroom_num)
VALUES (
	1,
	'Estancia Apartment Homes',
    '500 Estancia',
    'Irvine',
    '92602',
    'CA',
    Point(33.726509, -117.7783426),
    1800,
    'NEWLY REMODELED RESIDENCES IN NORTHPARK VILLAGE',
    1, 1);
INSERT INTO images (url, listing_id)
VALUES ('https://www.irvinecompanyapartments.com/assets/images/collection/premier/Estancia/hero/2.jpg', 1);
INSERT INTO images (url, listing_id)
VALUES ('https://www.irvinecompanyapartments.com/assets/images/collection/premier/Estancia/hero/3.jpg', 1);

# Listing 2
INSERT INTO listing (
	id, title, address, city, state, zipcode, location,
    price, description, bedroom_num, bathroom_num)
VALUES (
	2,
	'Solana Apartment Homes',
    '100 Monte Vista',
    'Irvine',
    '92602',
    'CA',
    Point(33.726143, -117.774609),
    1900,
    'NEWLY REMODELED IN NORTHPARK VILLAGE RESORT-STYLE LIVING IN THE HEART OF IRVINE',
    1, 1);
INSERT INTO images (url, listing_id)
VALUES ('https://www.irvinecompanyapartments.com/assets/images/collection/premier/Solana/hero/2.jpg', 2);

# Listing 3
INSERT INTO listing (
	id, title, address, city, state, zipcode, location, 
    price, description, bedroom_num, bathroom_num)
VALUES (
	3,
	'Solana Apartment Homes',
    '100 Monte Vista',
    'Irvine',
    'CA',
    '92602',
    Point(33.726143, -117.774609),
    1900,
    'NEWLY REMODELED IN NORTHPARK VILLAGE RESORT-STYLE LIVING IN THE HEART OF IRVINE',
    2, 1);
INSERT INTO images (url, listing_id)
VALUES ('https://www.irvinecompanyapartments.com/assets/images/collection/premier/Solana/hero/2.jpg', 3);
