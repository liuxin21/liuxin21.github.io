create database king;
use king;
create table user(
    id int unsigned auto_increment key,
    username varchar(20) not null unique,
    age tinyint unsigned default 18
)