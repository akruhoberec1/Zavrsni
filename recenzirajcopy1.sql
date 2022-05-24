# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8  < E:\tecaj\Zavrsni\recenziraj.sql 

drop database if exists recenziraj;
create database recenziraj DEFAULT CHARACTER SET utf8mb4;
use recenziraj;



create table USER(
id int not null primary key auto_increment,
username varchar(18) not null,
password varchar(20) not null,
# 'dodati check na password'
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
slika varchar(100)
);


create table kategorija(
id int not null primary key auto_increment,
naziv varchar(40),
podkategorija int not NULL
);

create table podkategorija(
id int not null primary key auto_increment,
naziv varchar(40)
);

create table spoj(
id int not null primary key auto_increment,
proizvod int not null,
podkategorija int not NULL
);

alter table proizvod add foreign key (marka) references marka(id);

alter table spoj add foreign key (proizvod) references proizvod(id);
alter table spoj add foreign key (podkategorija) references podkategorija(id);

alter table kategorija add foreign key (podkategorija) references podkategorija(id);

create table osvrt(
id int not null primary key auto_increment,
proizvod int not null,
USER int not null,
osvrt text(1000)
);


