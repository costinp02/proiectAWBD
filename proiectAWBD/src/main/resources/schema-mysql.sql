-- Drop tables if they exist
DROP TABLE IF EXISTS purchase_product;
DROP TABLE IF EXISTS purchase;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS wishlist_product;
DROP TABLE IF EXISTS wishlist;
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
                     email VARCHAR(100) DEFAULT NULL,
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

CREATE TABLE `address` (
                   `id` bigint NOT NULL AUTO_INCREMENT,
                   `city` varchar(255) DEFAULT NULL,
                   `country` varchar(255) DEFAULT NULL,
                   `state` varchar(255) DEFAULT NULL,
                   `street` varchar(255) DEFAULT NULL,
                   `zip_code` varchar(255) DEFAULT NULL,
                   PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `artist` (
                  `id` bigint NOT NULL AUTO_INCREMENT,
                  `name` varchar(255) DEFAULT NULL,
                  `nationality` varchar(255) DEFAULT NULL,
                  `record_label` varchar(255) DEFAULT NULL,
                  `website` varchar(255) DEFAULT NULL,
                  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `wishlist` (
                            `id` bigint NOT NULL AUTO_INCREMENT,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB ;

CREATE TABLE `customer` (
                `id` bigint NOT NULL AUTO_INCREMENT,
                `email` varchar(255) DEFAULT NULL,
                `first_name` varchar(255) DEFAULT NULL,
                `last_name` varchar(255) DEFAULT NULL,
                `password` varchar(255) DEFAULT NULL,
                `username` varchar(255) DEFAULT NULL,
                `user_id` bigint DEFAULT NULL,
                `wishlist_id` bigint DEFAULT NULL,
                `address_id` bigint DEFAULT NULL,
                PRIMARY KEY (`id`),
                UNIQUE KEY `UK_customer_address` (`address_id`),
                UNIQUE KEY `UK_customer_user` (`user_id`),
                UNIQUE KEY `UK_customer_wishlist` (`wishlist_id`),
                CONSTRAINT `FK_customer_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
                CONSTRAINT `FK_customer_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
                CONSTRAINT `FK_customer_wishlist` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`id`)
) ENGINE=InnoDB ;

CREATE TABLE `product` (
               `id` bigint NOT NULL AUTO_INCREMENT,
               `price` double NOT NULL,
               `quantity` int NOT NULL,
               `artist_id` bigint DEFAULT NULL,
               `description` varchar(255) DEFAULT NULL,
               `format` varchar(255) DEFAULT NULL,
               `name` varchar(255) DEFAULT NULL,
               `release_date` varchar(255) DEFAULT NULL,
               `genre` enum('ALTROCK','EDM','HIPHOP','METAL','ROCK','POP') DEFAULT NULL,
               PRIMARY KEY (`id`),
               KEY `FK_product_artist` (`artist_id`),
               CONSTRAINT `FK_product_artist` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`)
) ENGINE=InnoDB ;

CREATE TABLE `purchase` (
                `id` bigint NOT NULL AUTO_INCREMENT,
                `customer_id` bigint DEFAULT NULL,
                `purchase_date` datetime(6) DEFAULT NULL,
                PRIMARY KEY (`id`),
                KEY `FK_purchase_customer` (`customer_id`),
                CONSTRAINT `FK_purchase_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB ;

CREATE TABLE `purchase_product` (
                `product_id` bigint NOT NULL,
                `purchase_id` bigint NOT NULL,
                KEY `FK_purchase_product_product` (`product_id`),
                KEY `FK_purchase_product_purchase` (`purchase_id`),
                CONSTRAINT `FK_purchase_product_purchase` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`id`),
                CONSTRAINT `FK_purchase_product_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB ;


CREATE TABLE `wishlist_product` (
            `wishlist_id` bigint NOT NULL,
            `product_id` bigint NOT NULL,
            KEY `FK_wishlist_product_product` (`product_id`),
            KEY `FK_wishlist_product_wishlist` (`wishlist_id`),
            CONSTRAINT `FK_wishlist_product_wishlist` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`id`),
            CONSTRAINT `FK_wishlist_product_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB ;

