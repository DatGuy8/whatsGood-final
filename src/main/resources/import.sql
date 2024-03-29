INSERT INTO businesses (name, website, latitude, longitude, is_approved, is_featured, street, city, state, zip_code) VALUES ('Paradise Poke Hawaii', 'https://www.paradisepokenuuanu.com', 21.316530, -157.855250, true, true, '1613 Nuuanu Ave Ste A12', 'Honolulu', 'HI', '96817');
INSERT INTO businesses (name, website, latitude, longitude, is_approved, is_featured, street, city, state, zip_code) VALUES ('Seapot Hot Pot', 'https://www.seapotusa.com', 37.357890, -122.021380, true, true, '740 E El Camino Real', 'Sunnyvale', 'CA', '94087');
INSERT INTO businesses (name, website, latitude, longitude, is_approved, is_featured, street, city, state, zip_code) VALUES ('HiroNori Craft Ramen', 'https://www.hironori.com', 37.329628, -122.039803, true, false, '10815 N Wolfe Rd Unit 104', 'Cupertino', 'CA', '95014');
INSERT INTO businesses (name, website, latitude, longitude, is_approved, is_featured, street, city, state, zip_code) VALUES ('Saigon Alley Kitchen + Bar', 'https://www.saigonalley.com', 38.575430, -121.482670, true, true, '1801 L St Ste 50', 'Sacramento', 'CA', '95811');


INSERT INTO photos (file_name, file_path, created_at, business_id) VALUES ('ParadisePoke.jpg', '/images/default/ParadisePoke.jpg', '2023-07-04', 1);
INSERT INTO photos (file_name, file_path, created_at, business_id) VALUES ('ParadisePoke2.jpg', '/images/default/ParadisePoke2.jpg', '2023-07-04', 1);
INSERT INTO photos (file_name, file_path, created_at, business_id) VALUES ('Seapot.jpg', '/images/default/Seapot.jpg', '2023-07-04', 2);
INSERT INTO photos (file_name, file_path, created_at, business_id) VALUES ('Seapot2.jpg', '/images/default/Seapot2.jpg', '2023-07-04', 2);
INSERT INTO photos (file_name, file_path, created_at, business_id) VALUES ('Seapot3.jpg', '/images/default/Seapot3.jpg', '2023-07-04', 2);
INSERT INTO photos (file_name, file_path, created_at, business_id) VALUES ('hiroNori.jpg', '/images/default/hiroNori.jpg', '2023-06-04', 3);
INSERT INTO photos (file_name, file_path, created_at, business_id) VALUES ('hiroNori2.jpg', '/images/default/hiroNori2.jpg', '2023-06-04', 3);
INSERT INTO photos (file_name, file_path, created_at, business_id) VALUES ('SaigonAlley.jpg', '/images/default/SaigonAlley.jpg', '2023-06-04', 4);
INSERT INTO photos (file_name, file_path, created_at, business_id) VALUES ('SaigonAlley2.jpg', '/images/default/SaigonAlley2.jpg', '2023-06-04', 4);

INSERT INTO items (name, description, price, is_featured, business_id, created_at, updated_at) VALUES ('Chirashi Bowl', 'Assorted Sashimi over sushi rice', 19.99, false, 1, NOW(), NOW());
INSERT INTO items (name, description, price, is_featured, business_id, created_at, updated_at) VALUES ('Garlic Shrimp', 'Garlic Shrimp with rice and mac salad', 18.99, false, 1, NOW(), NOW());
INSERT INTO items (name, description, price, is_featured, business_id, created_at, updated_at) VALUES ('Ahi Shoyu Poke Bowl', 'Shoyu ahi poke over rice', 17.00, false, 1, NOW(), NOW());
INSERT INTO items (name, description, price, is_featured, business_id, created_at, updated_at) VALUES ('Spam Musubi', 'Spam, rice, and seaweed', 3.50, false, 1, NOW(), NOW());
INSERT INTO items (name, description, price, is_featured, business_id, created_at, updated_at) VALUES ('Short Ribs Plate', 'Short Ribs and rice and scallions', 3.50, false, 1, NOW(), NOW());
INSERT INTO items (name, description, price, is_featured, business_id, created_at, updated_at) VALUES ('Baked Salmon Plate', 'Baked Salmon with siracha aiole sauce', 18.50, false, 1, NOW(), NOW());

INSERT INTO photos (file_name, file_path, created_at, item_id) VALUES ('charahi.jpg', '/images/default/items/chirashi.jpg', '2023-07-04', 1);
INSERT INTO photos (file_name, file_path, created_at, item_id) VALUES ('GarlicShrimp.jpg', '/images/default/items/GarlicShrimp.jpg', '2023-07-04', 2);
INSERT INTO photos (file_name, file_path, created_at, item_id) VALUES ('GarlicShrimp2.jpg', '/images/default/items/GarlicShrimp2.jpg', '2023-07-04', 2);
INSERT INTO photos (file_name, file_path, created_at, item_id) VALUES ('pokebowl.jpg', '/images/default/items/pokebowl.jpg', '2023-07-04', 3);
INSERT INTO photos (file_name, file_path, created_at, item_id) VALUES ('pokebowl2.jpg', '/images/default/items/pokebowl2.jpg', '2023-07-04', 3);
INSERT INTO photos (file_name, file_path, created_at, item_id) VALUES ('spam.jpg', '/images/default/items/spam.jpg', '2023-07-04', 4);
INSERT INTO photos (file_name, file_path, created_at, item_id) VALUES ('shortrib.jpg', '/images/default/items/shortrib.jpg', '2023-07-04', 5);
INSERT INTO photos (file_name, file_path, created_at, item_id) VALUES ('shortrib2.jpg', '/images/default/items/shortrib2.jpg', '2023-07-04', 5);
INSERT INTO photos (file_name, file_path, created_at, item_id) VALUES ('bakedsalmon.jpg', '/images/default/items/bakedsalmon.jpg', '2023-07-04', 6);
INSERT INTO photos (file_name, file_path, created_at, item_id) VALUES ('bakedsalmon2.jpg', '/images/default/items/bakedsalmon2.jpg', '2023-07-04', 6);

INSERT INTO roles (name) VALUES ('ROLE_USER');
INSERT INTO roles (name) VALUES ('ROLE_ADMIN');

INSERT INTO categories (name) VALUES ('American');
INSERT INTO categories (name) VALUES ('Mexican');
INSERT INTO categories (name) VALUES ('Japanese');
INSERT INTO categories (name) VALUES ('Indian');
INSERT INTO categories (name) VALUES ('Indian');
INSERT INTO categories (name) VALUES ('Greek');
INSERT INTO categories (name) VALUES ('Thai');
INSERT INTO categories (name) VALUES ('BBQ/Grill');
INSERT INTO categories (name) VALUES ('Seafood');
INSERT INTO categories (name) VALUES ('Vegan');
INSERT INTO categories (name) VALUES ('Pizza');
INSERT INTO categories (name) VALUES ('Desserts');
INSERT INTO categories (name) VALUES ('Sandwiches');
INSERT INTO categories (name) VALUES ('Fine Dining');
INSERT INTO categories (name) VALUES ('Other');
