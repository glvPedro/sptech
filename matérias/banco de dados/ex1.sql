-- EXERCÍCIO 1 --

create database sprint1;
use sprint1;

create table atleta(
id_atleta int primary key auto_increment,
nome varchar(40),
modalidade varchar(40),
qtd_medalha int
);

insert into atleta (nome,modalidade,qtd_medalha) values ('pedro','100 metros rasos',4),
													    ('joão','natação',2),
                                                        ('matheus','basquete',1),
                                                        ('carla','100 metros rasos',2),
                                                        ('marina','natação',4),
                                                        ('joaquim','baisebol',6);

select * from atleta;

select nome,qtd_medalha from atleta;

select * from atleta where modalidade = 'natação';

select * from atleta order by modalidade;

select * from atleta order by qtd_medalha desc;

select * from atleta where nome like '%s%';

select * from atleta where nome like 'j%';

select * from atleta where nome like '%o';

select * from atleta where nome like '%r_';

drop table atleta;

-- EXERCÍCIO 2 --

create table musica(
id_musica int primary key auto_increment,
titulo varchar(40),
artista varchar(40),
genero varchar(40)
);

insert into musica(titulo,artista,genero) values ('set it free','stella','pop'),
												 ('desde quando era pequeno','sagaz','hiphop'),
                                                 ('lie','NF','sadsong'),
                                                 ('11 andar','sagaz','hiphop'),
                                                 ('el dourado','stella','pop'),
                                                 ('time','NF','sadsong'),
                                                 ('godzilla','eminem','rock'),
                                                 ('tarde demais','gigantes do samba','pagode');

select * from musica;

select titulo,artista from musica;

select * from musica where genero = 'hiphop';

select * from musica where artista = 'NF';

select * from musica order by titulo;

select * from musica order by artista desc;

select * from musica where titulo like 't%';

select * from musica where artista like '%z';

select * from musica where genero like '_i%';

select * from musica where titulo like '%n_';

drop table musica;

-- EXERCÍCIO 3 --

create table filme(
id_filme int primary key auto_increment,
titulo varchar(50),
genero varchar(40),
diretor varchar(40)
);

insert into filme(titulo,genero,diretor) values ('50 tons de cinza','romance','Sam Taylor Johnson'),
												('wall-e','animação','Andrew Stanton'),
												('bastardos inglórios','guerra','Quentin Tarantino'),
												('50 tons mais escuros','romance','Sam Taylor Johnson'),
												('corações de ferro','guerra','Quentin Tarantino'),
												('procurando nemo','animação','Andrew Stanton'),
												('era uma vez em hollywood','ficção','Quentin Tarantino'),
												('os incríveis','animação','Andrew Stanton');

select * from filme;

select titulo,diretor from filme;

select * from filme where genero = 'guerra';

select * from filme where diretor = 'quentin tarantino';

select * from filme order by titulo;

select * from filme order by diretor desc;

select * from filme where titulo like 'o%';

select * from filme where diretor like '%o';

select * from filme where genero like '_u%';

select * from filme where titulo like '%o_';

drop table filme;

-- EXERCÍCIO 4 --

create table professor(
id_professor int primary key auto_increment,
nome varchar(50),
especialidade varchar(40),
data_nasc date
);

insert into professor (nome,especialidade,data_nasc) values ('vivian','banco de dados','1983-10-13'),
															('brandão','pesquisa e inovacao','1973-11-12'),
															('yoshi','algoritmos','1980-06-09'),
															('fernanda','pesquisa e inovacao','1990-12-23'),
															('chola','arquitetura computacional','1989-03-18'),
															('petry','marketing e administracao','1988-06-16');

select * from professor;

select especialidade from professor;

select * from professor where especialidade = 'pesquisa e inovacao';

select * from professor order by nome;

select * from professor order by data_nasc desc;

select * from professor where nome like 'v%';

select * from professor where nome like '%a';

select * from professor where nome like '_e%';

select * from professor where nome like '%a_';

drop table professor;

-- EXERCÍCIO 5 --

create table curso(
id_curso int primary key auto_increment,
nome varchar(50),
sigla char(3),
coordenador varchar(40)
);

insert into curso(nome,sigla,coordenador) values ('analise e desenvolvimento de sistemas','ads','leo'),
												('sistemas da informação','si','kaline'),
                                                ('ciência da computação','cco','eduardo');

select * from curso;

select coordenador from curso;

select * from curso where sigla= 'cco';

select * from curso order by nome;

select * from curso order by coordenador desc;

select * from curso where nome like 'a%';

select * from curso where nome like '%o';

select * from curso where nome like '_n%';

select * from curso where nome like '%a_';

drop table curso;

-- EXERCÍCIO 6 --

create table revista(
id_revista int primary key auto_increment,
nome varchar(40),
categoria varchar(30) null
)auto_increment=1;

insert into revista(nome) values ('veja'),
								 ('istoé'),
								 ('epoca'),
								 ('vogue');
                                 
desc revista;

select * from revista;

update revista set nome = 'a sentilena' where id_revista= 1;
update revista set nome = 'despertai!' where id_revista= 2;
update revista set nome = 'rebel!' where id_revista= 3;

select * from revista;

insert into revista(nome,categoria) values ('AARP The Magazin',null),
										   ('AARP Bulletin',null),
										   ('AARP Bulletin',null);

select * from revista;

desc revista;

alter table revista modify categoria varchar(40);

desc revista;

alter table revista add column periodicidade varchar(15);

select * from revista;

drop table revista;

drop database sprint1;