-- Inserting into address table
INSERT INTO `address` (`city`, `country`, `state`, `street`, `zip_code`)
VALUES ('New York', 'USA', 'NY', '123 Main St', '10001'),
       ('Los Angeles', 'USA', 'CA', '456 Hollywood Blvd', '90001'),
       ('Chicago', 'USA', 'IL', '789 Windy Ave', '60601');

-- Inserting into artist table
INSERT INTO `artist` (`name`, `nationality`, `record_label`, `website`)
VALUES ('Kanye West', 'American', 'GOOD Music', 'https://yeezy.com'),
       ('The Weeknd', 'Canadian', 'XO', 'https://theweeknd.com'),
       ('Kendrick Lamar', 'American', 'pgLang', 'https://pg-lang.com'),
       ('Yves Tumor', 'American', 'Warped', 'https://yvestumor.com');

-- Inserting into wishlist table
INSERT INTO `wishlist` (`id`)
VALUES (1),
       (2);

-- Inserting into customer table
INSERT INTO `customer` (`email`, `first_name`, `last_name`, `password`, `username`, `user_id`, `wishlist_id`, `address_id`)
VALUES ('john@example.com', 'John', 'Doe', 'password123', 'john_doe', null, 1, 1);

-- Inserting into product table
INSERT INTO `product` (`price`, `quantity`, `artist_id`, `description`, `format`, `name`, `release_date`, `genre`)
VALUES (29.99, 100, 1, '', 'CD', '808s & Heartbreak', '2008-11-23', 'HIPHOP'),
       (19.99, 150, 2, '', 'Vinyl', 'After Hours', '2020-03-20', 'POP'),
       (15.99, 200, 4, '', 'Vinyl 7"', 'Heaven To A Tortured Mind', '2020-04-03', 'ALTROCK'),
       (15.99, 200, 3, '', 'Vinyl', 'Mr. Morale & the Big Steppers', '2022-05-13', 'HIPHOP');

-- Inserting into purchase table
INSERT INTO `purchase` (`customer_id`, `purchase_date`)
VALUES (1, '2023-09-01 10:30:00');

-- Inserting into purchase_product table
INSERT INTO `purchase_product` (`product_id`, `purchase_id`)
VALUES (1, 1),
       (3, 1);

-- Inserting into wishlist_product table
INSERT INTO `wishlist_product` (`wishlist_id`, `product_id`)
VALUES (1, 1),
       (1, 2);
