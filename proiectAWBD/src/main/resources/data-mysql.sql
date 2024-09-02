INSERT INTO address (city, country, state, street, zip) VALUES ('New York', 'USA', 'NY', '123 Broadway', '10001');
INSERT INTO address (city, country, state, street, zip) VALUES ('Los Angeles', 'USA', 'CA', '456 Hollywood Blvd', '90028');
INSERT INTO address (city, country, state, street, zip) VALUES ('Chicago', 'USA', 'IL', '789 Michigan Ave', '60611');
INSERT INTO address (city, country, state, street, zip) VALUES ('Miami', 'USA', 'FL', '101 Ocean Dr', '33139');
INSERT INTO address (city, country, state, street, zip) VALUES ('Dallas', 'USA', 'TX', '202 Elm St', '75201');

INSERT INTO artist (name, nationality, record_label, website) VALUES ('The Beatles', 'British', 'EMI', 'www.thebeatles.com');
INSERT INTO artist (name, nationality, record_label, website) VALUES ('Nirvana', 'American', 'DGC', 'www.nirvana.com');
INSERT INTO artist (name, nationality, record_label, website) VALUES ('Beyoncé', 'American', 'Parkwood', 'www.beyonce.com');
INSERT INTO artist (name, nationality, record_label, website) VALUES ('Daft Punk', 'French', 'Virgin', 'www.daftpunk.com');
INSERT INTO artist (name, nationality, record_label, website) VALUES ('Adele', 'British', 'XL', 'www.adele.com');



INSERT INTO customer (address_id, email, first_name, last_name, password, username) VALUES (1, 'john.doe@example.com', 'John', 'Doe', 'password123', 'johndoe');
INSERT INTO customer (address_id, email, first_name, last_name, password, username) VALUES (2, 'jane.smith@example.com', 'Jane', 'Smith', 'password456', 'janesmith');
INSERT INTO customer (address_id, email, first_name, last_name, password, username) VALUES (3, 'mike.jones@example.com', 'Mike', 'Jones', 'password789', 'mikejones');
INSERT INTO customer (address_id, email, first_name, last_name, password, username) VALUES (4, 'lisa.wong@example.com', 'Lisa', 'Wong', 'passwordabc', 'lisawong');
INSERT INTO customer (address_id, email, first_name, last_name, password, username) VALUES (5, 'tom.brown@example.com', 'Tom', 'Brown', 'passwordxyz', 'tombrown');


INSERT INTO product (price, quantity, artist_id, description, format, name, release_date, genre)
VALUES (19.99, 100, 1, 'Classic rock album', 'CD', 'Abbey Road', '1969-09-26', 'ROCK');
INSERT INTO product (price, quantity, artist_id, description, format, name, release_date, genre)
VALUES (14.99, 200, 2, 'Grunge album', 'Vinyl', 'Nevermind', '1991-09-24', 'ALTROCK');
INSERT INTO product (price, quantity, artist_id, description, format, name, release_date, genre)
VALUES (12.99, 150, 3, 'Pop album', 'Digital', 'Lemonade', '2016-04-23', 'HIPHOP');
INSERT INTO product (price, quantity, artist_id, description, format, name, release_date, genre)
VALUES (18.99, 50, 4, 'Electronic album', 'CD', 'Random Access Memories', '2013-05-17', 'EDM');
INSERT INTO product (price, quantity, artist_id, description, format, name, release_date, genre)
VALUES (15.99, 75, 5, 'Pop album', 'Vinyl', '21', '2011-01-24', 'ROCK');
