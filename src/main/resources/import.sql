INSERT INTO businesses (name, website, latitude, longitude, is_approved, is_featured, street, city, state, zip_code) VALUES ('Paradise Poke Hawaii', 'https://www.paradisepokenuuanu.com', 21.316530, -157.855250, true, true, '1613 Nuuanu Ave Ste A12', 'Honolulu', 'HI', '96817');
INSERT INTO businesses (name, website, latitude, longitude, is_approved, is_featured, street, city, state, zip_code) VALUES ('Seapot Hot Pot', 'https://www.seapotusa.com', 37.357890, -122.021380, true, true, '740 E El Camino Real', 'Sunnyvale', 'CA', '94087');
INSERT INTO businesses (name, website, latitude, longitude, is_approved, is_featured, street, city, state, zip_code) VALUES ('HiroNori Craft Ramen', 'https://www.hironori.com', 37.329628, -122.039803, true, false, '10815 N Wolfe Rd Unit 104', 'Cupertino', 'CA', '95014');
INSERT INTO businesses (name, website, latitude, longitude, is_approved, is_featured, street, city, state, zip_code) VALUES ('Saigon Alley Kitchen + Bar', 'https://www.saigonalley.com', 38.575430, -121.482670, true, true, '1801 L St Ste 50', 'Sacramento', 'CA', '95811');


INSERT INTO photos (file_name, file_path, created_at, business_id) VALUES ('ParadisePoke.jpg', '/images/ParadisePoke.jpg', '2023-07-04', 1);
INSERT INTO photos (file_name, file_path, created_at, business_id) VALUES ('ParadisePoke2.jpg', '/images/ParadisePoke2.jpg', '2023-07-04', 1);
INSERT INTO photos (file_name, file_path, created_at, business_id) VALUES ('Seapot.jpg', '/images/Seapot.jpg', '2023-07-04', 2);
INSERT INTO photos (file_name, file_path, created_at, business_id) VALUES ('Seapot2.jpg', '/images/Seapot2.jpg', '2023-07-04', 2);
INSERT INTO photos (file_name, file_path, created_at, business_id) VALUES ('Seapot3.jpg', '/images/Seapot3.jpg', '2023-07-04', 2);
INSERT INTO photos (file_name, file_path, created_at, business_id) VALUES ('hiroNori.jpg', '/images/hiroNori.jpg', '2023-06-04', 3);
INSERT INTO photos (file_name, file_path, created_at, business_id) VALUES ('hiroNori2.jpg', '/images/hiroNori2.jpg', '2023-06-04', 3);
INSERT INTO photos (file_name, file_path, created_at, business_id) VALUES ('SaigonAlley.jpg', '/images/SaigonAlley.jpg', '2023-06-04', 4);
INSERT INTO photos (file_name, file_path, created_at, business_id) VALUES ('SaigonAlley2.jpg', '/images/SaigonAlley2.jpg', '2023-06-04', 4);


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
