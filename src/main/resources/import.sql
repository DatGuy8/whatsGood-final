INSERT INTO businesses (name, website, latitude, longitude, is_approved, is_featured, street, city, state, zip_code) VALUES ('Sushi Jin', 'https://www.sushijinmtv.com', 37.386052, -122.083851, true, true, '580 N Rengstorff Ave J', 'Mountain View', 'CA', '94043');
INSERT INTO businesses (name, website, latitude, longitude, is_approved, is_featured, street, city, state, zip_code) VALUES ('HiroNori Craft Ramen', 'https://www.hironori.com', 37.329628, -122.039803, true, true, '10815 N Wolfe Rd Unit 104', 'Cupertino', 'CA', '95014');

INSERT INTO photos (file_name, file_path, created_at, business_id) VALUES ('SushiJin.jpg', '/images/stockDishPhoto.jpg', '2023-06-04', 1);
INSERT INTO photos (file_name, file_path, created_at, business_id) VALUES ('hiroNori.jpg', '/images/rest2.jpg', '2023-06-04', 2);

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
