create database sprint1;
use sprint1;

-- EXERCÍCIO 1 --
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

update atleta set qtd_medalha= 2 where id_atleta= 1;

update atleta set qtd_medalha= 3 where id_atleta=2 or id_atleta=3;

update atleta set nome= 'frances' where id_atleta= 1;

alter table atleta add column dt_nascimento date;

update atleta set dt_nascimento= '2003-03-12' where id_atleta=1;
update atleta set dt_nascimento= '2013-11-02' where id_atleta=2;
update atleta set dt_nascimento= '2004-10-10' where id_atleta=3;
update atleta set dt_nascimento= '2020-09-12' where id_atleta=4;
update atleta set dt_nascimento= '1997-08-09' where id_atleta=5;
update atleta set dt_nascimento= '2000-02-01' where id_atleta=6;

delete from atleta where id_atleta=5;

select * from atleta where modalidade <> 'natacao';

select * from atleta where qtd_medalha >= 3;

alter table atleta modify column modalidade varchar(60);

desc atleta;

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

alter table musica add column curtidas int;

update musica set curtidas= 2023 where id_musica=1;
update musica set curtidas= 34 where id_musica=2;
update musica set curtidas= 654 where id_musica=3;
update musica set curtidas= 12 where id_musica=4;
update musica set curtidas= 43 where id_musica=5;
update musica set curtidas= 87 where id_musica=6;
update musica set curtidas= 45 where id_musica=7;
update musica set curtidas= 842 where id_musica=8;

alter table musica modify column artista varchar(80);

update musica set curtidas=555 where id_musica=1;

update musica set curtidas=6 where id_musica=2 or id_musica=3;

update musica set titulo= 'la bele de jour' where id_musica=5;

delete from musica where id_musica='4';

select * from musica where genero <> 'funk';

select * from musica where curtidas >=20;

desc musica;

truncate musica;

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

alter table filme add column protagonista varchar(50);

update filme set protagonista= 'john wick' where id_filme=1;
update filme set protagonista= 'matheus' where id_filme=2;
update filme set protagonista= 'puredo' where id_filme=3;
update filme set protagonista= 'santhiago' where id_filme=4;
update filme set protagonista= 'sandman' where id_filme=5;
update filme set protagonista= 'constantine' where id_filme=6;
update filme set protagonista= 'dante' where id_filme=7;
update filme set protagonista= 'calica' where id_filme=8;

alter table filme modify column diretor varchar(150);

update filme set diretor='raul jiul' where id_filme=5;

update filme set diretor= 'esqueceescedor'where id_filme=2 or id_filme=7;

update filme set titulo= 'gigantes do samba' where id_filme=6;

delete from filme where id_filme=3;

select * from filme where genero <> 'drama';

select * from filme where genero= 'suspense';

desc filme;

truncate filme;

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

alter table professor add column funcao varchar(50),
add constraint chk_funcao check (funcao in ('monitor' , 'assistente' , 'titular'));

update professor set funcao= 'assistente' where id_professor= 1;
update professor set funcao= 'monitor' where id_professor= 2;
update professor set funcao= 'assistente' where id_professor= 3;
update professor set funcao= 'titular' where id_professor= 4;
update professor set funcao= 'titular' where id_professor= 5;
update professor set funcao= 'titular' where id_professor= 6;

insert into professor (nome) value ('josoandre');

delete from professor where id_professor=5;

select * from professor where funcao= 'titular';

select especialidade,data_nasc from professor where funcao= 'monitor';

update professor set data_nasc = '1898-03-03' where id_professor = 3;

truncate professor;

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

select * from curso where sigla='ads';

select * from curso order by nome;

select * from curso order by coordenador desc;

select * from curso where nome like'a%';

select * from curso where nome like'%s';

select * from curso where nome like'_n%';

select * from curso where nome like'%a_';

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
                                 
select * from revista;

update revista set categoria='moda' where id_revista=1;
update revista set categoria='noticia' where id_revista=2;
update revista set categoria='moda' where id_revista=3;
update revista set categoria='noticia' where id_revista=4;

select * from revista;

insert into revista (nome,categoria) values ('alcapao','diario'),
											('matriz','moda'),
                                            ('planeta diario','noticia');
                                            
select * from revista;

desc revista;

alter table revista modify column categoria varchar(40);

desc revista;

alter table revista add column periodicidade varchar(15);

truncate revista;

alter table revista drop periodicidade;