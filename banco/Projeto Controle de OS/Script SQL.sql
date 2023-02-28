create database dbinfox;

use dbinfox;

create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);

describe tbusuarios;

insert into tbusuarios(iduser, usuario, fone, login, senha)
values (1, 'Rodrigo Freitas', '16991925677', 'rod.s.f', '12345678');

select * from tbusuarios;

insert into tbusuarios(iduser, usuario, fone, login, senha)
values 	(2, 'Administrador', '16981115877', 'admin', 'admin'),
		(3, 'Viviane', '18991972356', 'viviane', '12345678'); 
        
update tbusuarios set usuario = 'Viviane Freitas' where iduser = 3;

create table tbclientes(
idclientes int primary key auto_increment,
nomecliente varchar (50) not null,
enderecocliente varchar (100),
fonecliente varchar(50) not null,
emailcliente varchar (50)
);        

insert into tbclientes(nomecliente, enderecocliente, fonecliente, emailcliente)
values ('Leandro Silva', 'Rua José Bernardo, 1123', '17991880999', 'leandro.23@hotmail.com'); 

create table tbos(
os int primary key auto_increment,
dataos timestamp default current_timestamp,
equipamento varchar (150) not null,
defeito varchar (150) not null,
servico varchar (150),
tecnico varchar(30),
valor decimal (10,2),
idclientes int not null,
foreign key (idclientes) references tbclientes(idclientes)
);
describe tbos;

insert into tbos (equipamento, defeito, servico, 
tecnico, valor , idclientes)
values ('Notebook' , 'não liga', 'Troca de Fonte', 'Zé', 87.50, 1); 
select * from tbos;

select
O.os, equipamento, defeito, servico, valor,
C.nomecliente, fonecliente
from tbos as O
inner join tbclientes as C
on (O.idclientes = C.idclientes);

select * from tbusuarios;

alter table tbusuarios add column perfil varchar(20) not null;

update tbusuarios set perfil = 'admin' where iduser = 2;
update tbusuarios set perfil = 'user' where iduser = 1;

