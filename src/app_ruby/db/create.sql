drop database if exists fsquiz_development;
create database fsquiz_development;
drop database if exists fsquiz_test;
create database fsquiz_test;
drop database if exists fsquiz_production;
create database fsquiz_production;
GRANT ALL PRIVILEGES ON fsquiz_development.* TO 'fsquiz'@'localhost'
  IDENTIFIED BY 'fsquiz' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON fsquiz_test.* TO 'fsquiz'@'localhost'
  IDENTIFIED BY 'fsquiz' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON fsquiz_production.* TO 'fsquiz'@'localhost'
  IDENTIFIED BY 'fsquiz' WITH GRANT OPTION;

