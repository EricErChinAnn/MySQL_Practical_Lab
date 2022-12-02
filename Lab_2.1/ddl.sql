mysql -u root

create database library;

use library;


-- No Fk tables

create table users (
    user_id  integer unsigned not null primary key auto_increment,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    dob date not null,
    email varchar(320) not null
)engine=innodb;

create table authors (
    author_id  integer unsigned not null primary key auto_increment,
    first_name varchar(100) not null,
    last_name varchar(100) not null
)engine=innodb;

create table publishers (
    publisher_id  integer unsigned not null primary key auto_increment,
    name varchar(1000) not null
)engine=innodb;

insert into users (first_name, last_name, dob, email)
values ("Roasted","Bits","2022-12-01","Apple@gmail.com");

insert into authors (first_name, last_name)
values ("Yu","Tian");

insert into publishers( name )
values("001.XXI")



--SINGLE FK Table

create table addresses (
    address_id  integer unsigned not null primary key auto_increment,
    street_name varchar(200) not null ,
    user_id integer unsigned not null,
    foreign key (user_id) references users(user_id),
    building_name varchar (200),
    postal_code varchar(10) not null,
    floor_num varchar(3) not null,
    unit_num varchar(6) not null
)engine=innodb;

insert into addresses (street_name, user_id, building_name, postal_code, floor_num, unit_num)
values ("Hell",2,"DDI Shopping Mall","006600","06","666");


create table books(
    book_id  integer unsigned not null primary key auto_increment,
    title varchar(1000) not null ,
    publisher_id integer unsigned not null,
    foreign key (publisher_id ) references publishers(publisher_id),
    synopsis text not null,
    isbn varchar(13) not null
)engine=innodb;

insert into books(title,publisher_id,synopsis,isbn)
values ("HxH",2,"The fall of the MorningStar","85dp12ajf369w")



-- Double FK table

create table writingCredits(
    writingCredits_id integer unsigned not null auto_increment primary key,
    author_id integer unsigned not null,
    foreign key (author_id) references authors(author_id),
    book_id integer unsigned not null,
    foreign key (book_id) references books(book_id)
)engine=innodb;

insert into writingCredits(author_id,book_id)
values (1,1);

create table bookUsers(
    book_user_id integer unsigned not null auto_increment primary key,
    user_id integer unsigned not null,
    foreign key (user_id) references users(user_id),
    book_id integer unsigned not null,
    foreign key (book_id) references books(book_id)
)engine=innodb;

insert into bookUsers(user_id,book_id)
values (2,2);