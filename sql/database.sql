CREATE DATABASE testapp2;
CREATE USER 'testapp2'@'localhost'  IDENTIFIED WITH mysql_native_password BY 'qwerty';
GRANT all privileges on testapp2.* TO 'testapp2'@'localhost';