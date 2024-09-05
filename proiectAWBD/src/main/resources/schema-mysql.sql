-- Drop tables if they exist
DROP TABLE IF EXISTS purchase_product;
DROP TABLE IF EXISTS purchase;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS artist;
DROP TABLE IF EXISTS USER_AUTHORITY;
DROP TABLE IF EXISTS USER;
DROP TABLE IF EXISTS AUTHORITY;


-- Create tables

CREATE TABLE USER(
                     id BIGINT AUTO_INCREMENT PRIMARY KEY,
                     username VARCHAR(50) NOT NULL,
                     password VARCHAR(100) NOT NULL,
                     email VARCHAR(50) NOT NULL,
                     enabled BOOLEAN NOT NULL DEFAULT true,
                     account_non_expired BOOLEAN NOT NULL DEFAULT true,
                     account_non_locked BOOLEAN NOT NULL DEFAULT true,
                     credentials_non_expired BOOLEAN NOT NULL DEFAULT true
);

CREATE TABLE AUTHORITY(
                          id BIGINT AUTO_INCREMENT PRIMARY KEY,
                          role VARCHAR(50) NOT NULL
);

CREATE TABLE USER_AUTHORITY(
                               user_id BIGINT,
                               authority_id BIGINT,
                               FOREIGN KEY (user_id) REFERENCES USER(id),
                               FOREIGN KEY (authority_id) REFERENCES AUTHORITY(id),
                               PRIMARY KEY (user_id, authority_id)
);

CREATE TABLE address (
                         id BIGINT NOT NULL AUTO_INCREMENT,
                         city VARCHAR(255),
                         country VARCHAR(255),
                         state VARCHAR(255),
                         street VARCHAR(255),
                         zip VARCHAR(255),
                         PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE artist (
                        id BIGINT NOT NULL AUTO_INCREMENT,
                        name VARCHAR(255),
                        nationality VARCHAR(255),
                        record_label VARCHAR(255),
                        website VARCHAR(255),
                        PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE customer (
                          address_id BIGINT,
                          id BIGINT NOT NULL AUTO_INCREMENT,
                          email VARCHAR(255),
                          first_name VARCHAR(255),
                          last_name VARCHAR(255),
                          password VARCHAR(255),
                          username VARCHAR(255),
                          PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE product (
                         price FLOAT(53) NOT NULL,
                         quantity INTEGER NOT NULL,
                         artist_id BIGINT,
                         id BIGINT NOT NULL AUTO_INCREMENT,
                         description VARCHAR(255),
                         format VARCHAR(255),
                         name VARCHAR(255),
                         release_date VARCHAR(255),
                         genre ENUM ('ALTROCK','EDM','HIPHOP','METAL','ROCK', 'POP'),
                         PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE purchase (
                          customer_id BIGINT,
                          id BIGINT NOT NULL AUTO_INCREMENT,
                          purchase_date DATETIME(6),
                          PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE purchase_product (
                                  product_id BIGINT NOT NULL,
                                  purchase_id BIGINT NOT NULL
) ENGINE=InnoDB;

-- Add constraints
ALTER TABLE customer
    ADD CONSTRAINT UKr8whbd0mf9er6vwfr0sclsxkd UNIQUE (address_id);

ALTER TABLE customer
    ADD CONSTRAINT FKglkhkmh2vyn790ijs6hiqqpi FOREIGN KEY (address_id) REFERENCES address (id);

ALTER TABLE product
    ADD CONSTRAINT FK9kvrcx7so145dw76x3sgvydr5 FOREIGN KEY (artist_id) REFERENCES artist (id);

ALTER TABLE purchase
    ADD CONSTRAINT FK2pehe23hwdcyql94c531rbf70 FOREIGN KEY (customer_id) REFERENCES customer (id);

ALTER TABLE purchase_product
    ADD CONSTRAINT FKl1da8u1v57wry7sunkkgmjr8o FOREIGN KEY (product_id) REFERENCES product (id);

ALTER TABLE purchase_product
    ADD CONSTRAINT FK1te3j5efipmc5c19wve8c90qd FOREIGN KEY (purchase_id) REFERENCES purchase (id);
