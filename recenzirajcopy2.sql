# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8  < E:\tecaj\Zavrsni\recenziraj.sql 

drop database if exists recenziraj;
create database recenziraj DEFAULT CHARACTER SET utf8mb4;
use recenziraj;





create table USER(
id int not null primary key auto_increment,
username varchar(18) not null,
password varchar(20) not null,
# 'dodati check na password, mail'
email varchar(120) not null,
ime varchar(25) not null,
prezime varchar(45) not null
);

create table admin(
user int not NULL,
potpis varchar(10)
);

create table korisnik(
user int not null
);

alter table admin add foreign key (user) references user(id);
alter table korisnik add foreign key (user) references user(id);




create table proizvod(
id int not null primary key auto_increment,
model varchar(120) not NULL,
slika varchar(100) not NULL,
kategorija int not NULL
);

create table kategorija(
id int not null primary key auto_increment,
naziv varchar(120)
);

create table recenzija(
recenzija_id int not null primary key auto_increment,
proizvod int not null,
USER int not null,
recenzija_text text(1000)
);

alter table proizvod add foreign key (kategorija) references kategorija(id);




#'tag'
create table tag(
tag_name varchar(15) not null primary key
);

create table recenzija_tag(
recenzija_id int not NULL,
tag_name int not null,
user_id int not NULL
);

alter table recenzija_tag add foreign key (user_id) references user(id);
alter table recenzija_tag add foreign key (recenzija_id) references recenzija(recenzija_id);
alter table recenzija_tag add foreign key (tag_name) references tag(tag_name);

#'komentari'
create table recenzija_komentar(
komentar_id int not null primary key auto_increment;
recenzija_id int not null,
user_id int not NULL,
komentar text(200)
);

alter table recenzija_komentar add foreign key (recenzija_id) references recenzija(recenzija_id);
alter table recenzija_komentar add foreign key (user_id) references user(id);


