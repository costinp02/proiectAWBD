

CREATE TABLE `address` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `city` varchar(255) DEFAULT NULL,
                           `country` varchar(255) DEFAULT NULL,
                           `state` varchar(255) DEFAULT NULL,
                           `street` varchar(255) DEFAULT NULL,
                           `zip` varchar(255) DEFAULT NULL,
                           PRIMARY KEY (`id`)
);

CREATE TABLE `customer` (
                            `address_id` int DEFAULT NULL,
                            `id` bigint NOT NULL AUTO_INCREMENT,
                            `email` varchar(255) DEFAULT NULL,
                            `first_name` varchar(255) DEFAULT NULL,
                            `last_name` varchar(255) DEFAULT NULL,
                            `password` varchar(255) DEFAULT NULL,
                            `username` varchar(255) DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `UK_customer_address_id` (`address_id`),
                            CONSTRAINT `FK_customer_address_id` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
);

CREATE TABLE `artist` (
                          `id` int NOT NULL AUTO_INCREMENT,
                          `name` varchar(255) DEFAULT NULL,
                          `nationality` varchar(255) DEFAULT NULL,
                          `record_label` varchar(255) DEFAULT NULL,
                          `website` varchar(255) DEFAULT NULL,
                          PRIMARY KEY (`id`)
);

CREATE TABLE `product` (
                           `artist_id` int DEFAULT NULL,
                           `id` int NOT NULL AUTO_INCREMENT,
                           `price` double NOT NULL,
                           `quantity` int NOT NULL,
                           `description` varchar(255) DEFAULT NULL,
                           `format` varchar(255) DEFAULT NULL,
                           `name` varchar(255) DEFAULT NULL,
                           `release_date` varchar(255) DEFAULT NULL,
                           `genre` enum('ALTROCK','EDM','HIPHOP','METAL','ROCK') DEFAULT NULL,
                           PRIMARY KEY (`id`),
                           CONSTRAINT `FK_product_artist_id` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`)
);

CREATE TABLE `purchase` (
                            `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
                            `customer_id` bigint DEFAULT NULL,
                            `purchase_date` datetime(6) DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            CONSTRAINT `FK_purchase_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
);

CREATE TABLE `purchase_product` (
                                    `product_id` int NOT NULL,
                                    `purchase_id` int NOT NULL,
                                    CONSTRAINT `FK_purchase_product_purchase_id` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`id`),
                                    CONSTRAINT `purchase_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
)