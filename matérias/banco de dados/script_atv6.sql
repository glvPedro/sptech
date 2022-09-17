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


-- exercício 3 --

create database praticaFuncionario;
use praticaFuncionario;

create table setor(
id_setor int primary key auto_increment,
nome varchar(45),
num_andarpredio int
);

insert into setor (nome,num_andarpredio) values ('administrativo',1),
												('executivo',2),
                                                ('recursos humanos',3),
                                                ('liderança',4);

create table funcionario(
id_funcionario int primary key auto_increment,
nome varchar(45),
telefone varchar(45),
salario double,
fk_setor int,
foreign key (fk_setor) references setor(id_setor)
);

insert into funcionario (nome,telefone,salario,fk_setor) values ('pedro','11958414286','3685.94',2),
																('vivian','11942865841','9384.42',1),
																('viviane','11994837461','4867.55',2),
																('paulo','11990847235','7712.75',3),
																('andrade','11912345231','0284.35',3),
																('thiago','11912345678','1938.54',4);

create table acompanhante(
id_acompanhante int primary key auto_increment,
nome varchar(45),
tipo_relacao varchar(45),
dt_nascimento date,
fk_funcionario int,
foreign key (fk_funcionario) references funcionario(id_funcionario)
);

insert into acompanhante (nome,tipo_relacao,dt_nascimento,fk_funcionario) values ('josé','irmão','2003-03-12',1),
																				 ('carlinhos','irmã','2000-09-22',null),
																				 ('tacito','pai','1999-12-10',1),
																				 ('ana','mãe','1987-08-19',3),
																				 ('maria','tio','1789-11-23',null),
																				 ('braga','avó','1678-03-11',1);

select * from setor;
select * from funcionario;
select * from acompanhante;

select * from setor as s join funcionario as f on s.id_setor = f.fk_setor;

select * from setor as s join funcionario as f on s.id_setor = f.fk_setor where s.nome = 'executivo';

select * from funcionario as f join acompanhante as a on f.id_funcionario = a.fk_funcionario;

select * from funcionario as f join acompanhante as a on f.id_funcionario = a.fk_funcionario where f.nome = 'viviane';

select * from setor as s join funcionario as f on s.id_setor = f.fk_setor join acompanhante as a on f.id_funcionario = a.fk_funcionario;


-- exercício 4 --

create table treinador(
id_treinador int primary key auto_increment,
nome varchar(45),
telefone varchar(45),
email varchar(45),
fk_orientador int,
foreign key (fk_orientador) references treinador(id_treinador)
)auto_increment = 10;

insert into treinador(nome,telefone,email,fk_orientador) values ('pedro','11958414286','pedro.henriquesilva@hotmail.com',10),
															    ('paula','11942865841','paularibeiro@hotmail.com',null),
															    ('joão','11912345678','joaomonocchio@hotmail.com',10),
                                                                ('joaquim','11912345678','joaomonocchio@hotmail.com',11),
                                                                ('santana','119849384658','santana@hotmail.com',12),
                                                                ('ferrari','1199384756394','ferrari66@hotmail.com',13),
                                                                ('mercedez','11990984957','mercedezbenz@hotmail.com',12);

create table nadador(
id_nadador int primary key auto_increment,
nome varchar(45),
estado_origem varchar(45),
dt_nascimento date,
fk_treinador int,
foreign key (fk_treinador) references treinador(id_treinador)
)auto_increment = 100;

insert into nadador (nome,estado_origem,dt_nascimento,fk_treinador) values ('vivian','mato grosso do sul','1287-03-12',10),
																		   ('joaquim','ribeirão preto','2983-04-22',12),
                                                                           ('harmani','são paulo','1989-02-11',11),
                                                                           ('prada','rio de janeiro','2000-07-10',16),
                                                                           ('gucci','canoas','2010-07-16',15),
                                                                           ('silva','caxias','2001-07-17',14),
                                                                           ('gonçalves','rio de janeiro','2002-03-13',16),
                                                                           ('medeiros','são paulo','1983-10-23',12);

select * from treinador;
select * from nadador;

select * from treinador as t join nadador as n on t.id_treinador = n.fk_treinador;

select * from treinador as t join nadador as n on t.id_treinador = n.fk_treinador where t.nome = 'joão';

select * from treinador as t join treinador as orientador on t.id_treinador = orientador.fk_orientador;

select * from treinador as t join treinador as orientador on t.id_treinador = orientador.fk_orientador where t.nome = 'pedro';

select * from treinador as t join nadador as n on t.id_treinador = n.fk_treinador join treinador as orientador on t.id_treinador = orientador.fk_orientador;

select * from treinador as t join nadador as n on t.id_treinador = n.fk_treinador join treinador as orientador on t.id_treinador = orientador.fk_orientador where t.id_treinador = 10;


-- exercício 5 --

create table medico(
crm int primary key auto_increment,
nome varchar(45),
especialidade varchar(45),
telefone varchar(45)
);

insert into medico (nome,especialidade,telefone) values ('andrade','cirurgião pediátrico','11958414286'),
														('silva','cirurgião abstratico','119948573645'),
                                                        ('silvester','hormonologia','11912345678'),
                                                        ('harmani','dermatologia','11987654321'),
                                                        ('padiore','colunista','11912873465'),
                                                        ('medicroy','endocrinologista','11993847562');

create table paciente(
id_paciente int primary key auto_increment,
telefone varchar(45),
endereco varchar(45)
);

insert into paciente (telefone,endereco) values ('giovanna','serra do mar'),
												('miniguicthi','r. noventa e cinco'),
                                                ('ryann','jardim recanto das rosas'),
                                                ('alissa','jardim são paulo');

create table registro(
id_registro int primary key auto_increment,
fk_paciente int,
foreign key (fk_paciente) references paciente(id_paciente),
fk_medico int,
foreign key (fk_medico) references medico(crm),
dt_registro datetime
);

insert into registro (fk_paciente,fk_medico,dt_registro) values (4,6,'2022-09-19 16:30:59'),
																(1,2,'2022-09-19 22:20:20'),
                                                                (4,1,'2022-09-19 19:00:03'),
                                                                (2,2,'2022-09-19 13:50:21'),
                                                                (1,3,'2022-09-19 09:15:49'),
                                                                (2,1,'2022-09-19 02:42:56'),
                                                                (3,4,'2022-09-19 10:00:00');

select * from medico;
select * from paciente;
select * from registro;

select * from medico as m join registro as r on m.crm = r.fk_medico join paciente as p on r.fk_paciente = p.id_paciente;