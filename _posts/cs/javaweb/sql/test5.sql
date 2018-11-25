create database jdbctest;
use jdbctest;
create table user(
    uid int key auto_increment,
    username varchar(20),
    password varchar(20),
    name varchar(20)
);
insert int user values(null, "aaa", "111", "张三");
insert int user values(null, "bbb", "222", "李四");
insert int user values(null, "ccc", "333", "王五");