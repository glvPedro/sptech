use sprint2;

-- ex1 -- 

create table cliente(
id_cliente int primary key auto_increment,
nome varchar(45),
tel_fixo varchar(45),
tel_celular varchar(45),
endereco varchar(45)
)auto_increment = 1;

insert into cliente (nome,tel_fixo,tel_celular,endereco) values ('pedro','2554-7867','11958414286','rua noventa e cinco'),
																('vivian','7867-2554','11914286584','rua madalena'),
                                                                ('paulo','4774-6832','11959278462','rua silvestre');

create table pet(
id_pet int primary key auto_increment,
tipo_animal varchar(45),
nome varchar(45),
raca varchar(45),
dt_nascimento date,
fk_cliente int,
foreign key (fk_cliente) references cliente(id_cliente)
)auto_increment = 101;

insert into pet(tipo_animal,nome,raca,dt_nascimento,fk_cliente) values ('gato','joaquim','persa','2020-03-23',1),
																	   ('cachorro','paulisto','viralata','2003-03-22',2),
                                                                       ('gato','pietr','harmani','2020-07-20',3),
                                                                       ('cachorro','harmani','pedigri','2020-04-27',2),
                                                                       ('gato','patricio','laranja','1100-06-09',1),
                                                                       ('papagaio','haylander','persa','2000-11-01',3);

select * from cliente;
select * from pet;

alter table cliente modify column nome varchar(80);