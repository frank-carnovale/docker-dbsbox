
alter  user postgres  with password 'x';
create user test_user with password 'x';
create database test_db;
grant all privileges on database test_db to test_user;

