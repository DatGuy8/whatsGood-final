INSERT INTO businesses (name, address, website, latitude, longitude, is_approved,created_at,updated_at) VALUES ('Sushi II', '321 Kalihi Street','www.sushiII.com',10.3,10.5, true,NULL,NULL);
INSERT INTO businesses (name, address, website, latitude, longitude, is_approved,created_at,updated_at) VALUES ('Cafe Bagel', '123 Blair Ave', 'www.CafeBagel.com', 12.3,14.5, false, NULL, NULL);
INSERT INTO photos (file_name, file_path, created_at, business_id) VALUES ('stockDishPhoto.jpg', '/uploadedImages/stockDishPhoto.jpg', '2023-06-04', 1);
INSERT INTO photos (file_name, file_path, created_at, business_id) VALUES ('rest2.jpg', '/uploadedImages/rest2.jpg', '2023-06-04', 2);
INSERT INTO roles (name) VALUES ('ROLE_USER');
INSERT INTO roles (name) VALUES ('ROLE_ADMIN');