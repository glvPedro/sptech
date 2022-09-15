create database sprint2;
use sprint2;

-- exercício 1 -- 

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

select * from pet where tipo_animal = 'gato';

select nome,dt_nascimento from pet;

select * from pet order by nome asc;

select * from cliente order by endereco desc;

select * from pet where nome like 'p%';

alter table cliente add column sobrenome varchar(45);
update cliente set sobrenome = 'gonçalves' where id_cliente = 1;
update cliente set sobrenome = 'gonçalves' where id_cliente = 3;
select * from cliente where sobrenome = 'gonçalves';

update cliente set tel_celular = '130998-4682' where id_cliente=1;

select * from cliente;

select * from cliente join pet on pet.fk_cliente = cliente.id_cliente;

select * from cliente join pet on pet.fk_cliente = cliente.id_cliente where id_cliente = 1;

delete from pet where id_pet=101;

select * from pet;

drop tables cliente,pet;

-- exercício 2 --

create table pessoa(
id_pessoa int primary key auto_increment,
nome varchar(45),
dt_nascimento date,
profissao varchar(45)
);

insert into pessoa (nome,dt_nascimento,profissao) values ('pedro','2003-03-12','estudante'),
														 ('vivian','2003-03-12','professora'),
                                                         ('paulo','2003-03-12','assistente'),
                                                         ('caramico','2003-03-12','desempregada');

create table gasto(
id_gasto int primary key auto_increment,
dt_gasto date,
valor double,
descricao varchar(45),
fk_pessoa int,
foreign key (fk_pessoa) references pessoa(id_pessoa)
);

insert into gasto (dt_gasto,valor,descricao,fk_pessoa) values ('2022-09-20','85727.00','emprestimo itaú',1),
                                                              ('2022-09-29','97356.54','água',2),
                                                              ('2021-09-09','279.32','gás',4),
                                                              ('2020-09-07','143.65','internet',3);
                                                              
select * from pessoa;
select * from gasto;

select * from pessoa where profissao = 'estudante';
select * from gasto where descricao = 'energia';

select * from pessoa as p join gasto as g on p.id_pessoa = g.id_gasto;

select * from pessoa as p join gasto as g on p.id_pessoa = g.id_gasto where p.id_pessoa = 1;

update gasto set valor = '9999.99' where fk_pessoa= 2;

delete from gasto where fk_pessoa = 4;
