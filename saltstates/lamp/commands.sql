CREATE USER 'minion_lamp'@'localhost' IDENTIFIED BY '34iwacsn';
CREATE DATABASE lamp_database;
GRANT ALL ON lamp_database.* TO 'minion_lamp' IDENTIFIED BY '34iwacsn';
