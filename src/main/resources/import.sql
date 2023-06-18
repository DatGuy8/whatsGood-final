INSERT INTO businesses (name, address, website, latitude, longitude, is_approved,created_at,updated_at) VALUES ('John Doe', 'john@example.com','www.website.com',10.3,10.5, false,NULL,NULL);
INSERT INTO businesses (name, address, website, latitude, longitude, is_approved,created_at,updated_at) VALUES ('Business', '123 boom', 'www.bang.com', 12.3,14.5, false, NULL, NULL);
INSERT INTO photos (file_name, file_path, file_type, file_size, upload_date, business_id) VALUES ('pic.jpg', 'business/photo', 'JPEG', 123, '2023-05-04', 1);
INSERT INTO roles (name) VALUES ('ROLE_USER');
INSERT INTO roles (name) VALUES ('ROLE_ADMIN');