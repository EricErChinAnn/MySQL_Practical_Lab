-- set up the  SQL
mysql -u root

create database swimming_coach

use swimming_coach

-- show all databases
show databases;


-- Show tables 
show tables;
-- check table data types of table
describe "table name"
-- Show data in the table
select * from locations

    
-- Create tables
create table parents(
    parents_id integer unsigned primary key auto_increment,
    first_name varchar(45) not null,
    last_name varchar(45) not null
) engine = innodb;

insert into parents (first_name, last_name) 
values ("Johnny","Himbo");

--default "" -->  set to an empty string
create table locations(
    locations_id integer unsigned primary key auto_increment,
    name varchar(255) not null default"",  
    address varchar(255) not null
) engine = innodb;


-- to set foreign key
create table students(
    students_id integer unsigned primary key auto_increment,
    parents_id integer unsigned not null,
    first_name varchar(45) not null,  
    last_name varchar(45) ,
    swimming_level tinyint unsigned not null,
    dob datetime not null
) engine = innodb;


alter table students add constraint fk_students_parents
foreign key (parents_id) references parents(parents_id)


-- Removing Column
alter table students drop column swimming_level ;

-- add column
alter table students add column swimming_level tinyint unsigned not null;

--modify column
alter table students modify column swimming_level tinyint unsigned default 0;

--rename column 
alter table students change swimming_level swimming_grade tinyint unsigned default 0;



-- insert a new data
insert into students (parents_id,first_name, last_name,swimming_level,dob) 
values (1,"Jim","Himbo",3,"2000-01-01");

-- insert multi data
insert into students (parents_id,first_name, last_name,swimming_grade,dob) 
values (1,"Tim","Tom",1,"2000-01-02"),
        (2,"John","Hildr",5,"2000-10-02");


insert into locations(name,address)
values ("Yishun Swimming Complex","351 Yishun ave 3"),
        ("Jurong West Swimming Complex","21 Jurong West Street 93"),
        ("Tampines Swimming Complex", "1 Tampines Walk"),
        ("Choa Chu Kang Swimming Complex", "1 Choa Chu Kang Street 53");

-- Delete a Row
delete from locations where locations_id=1;

--Edit a data
update locations set name = "CCK Swimming Complex" where locations_id=5;