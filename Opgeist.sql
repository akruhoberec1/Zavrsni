drop database if exists opgeist;
create database opgeist DEFAULT CHARACTER SET utf8mb4;
use opgeist;

create table opg(
id int not null primary key auto_increment,
naziv varchar(120) not null,
vlasnik varchar(120) not null,
email varchar(150) not null,
tel int(9),
djelatnost int not null,
proizvod int not null,
student int not null
);

create table djelatnost(
id int not null primary key auto_increment,
naziv varchar(120)
);

create table proizvod(
id int not null primary key auto_increment,
naziv varchar(120),
kolicina decimal(18,2),
djelatnost int not null
);

create table student(
id int not null primary key auto_increment,
imeprezime varchar(120),
email varchar(150) not null,
tel int(9),
polje int not null
);

create table polje(
id int not null primary key auto_increment,
naziv varchar(120)
);

alter table opg add foreign key (djelatnost) references djelatnost(id);
alter table opg add foreign key (student) references student(id);
alter table opg add foreign key (proizvod) references proizvod(id);

alter table proizvod add foreign key (djelatnost) references djelatnost(id);
alter table student add foreign key (polje) references polje(id);
