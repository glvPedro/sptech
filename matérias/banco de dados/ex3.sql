create database sprint2;
use sprint2;

create table atleta(
id_atleta int primary key auto_increment,
nome_atleta varchar(40),
modalidade varchar(40),
qtd_medalha int,
fk_pais int,
foreign key atleta(fk_pais) references pais(id_pais)
);

insert into atleta (nome_atleta,modalidade,qtd_medalha) values ('pedro','100m rasos',6),
														('matheus','natação',2),
                                                        ('joaquin','basquete',2),
                                                        ('igor','futebol',4),
                                                        ('tanaka','natação',3);
                                                        
create table pais(
id_pais int primary key auto_increment,
nome_pais varchar(30),
capital varchar(40)
);

insert into pais(nome_pais,capital) values ('brasil','são paulo'),
										  ('argentina','buenos aires'),
										  ('portugal','moscou'),
										  ('japão','tokyo');

update pais set nome_pais='coreia do norte' where id_pais= 1 or id_pais=2 or id_pais=3 or id_pais=4;

select nome_atleta,fk_pais from atleta join pais on atleta.fk_pais = pais.id_pais;

select nome_atleta,nome_pais from atleta join pais on atleta.fk_pais = pais.id_pais;


select * from atleta join pais on atleta.fk_pais = pais.id_pais where pais.capital= 'moscou';

-- EXERCÍCIO 2 --

create table musica(
id_musica int primary key auto_increment,
titulo varchar(40),
artista varchar(40),
genero varchar(40)
);

insert into musica(titulo,artista,genero) values ('set it free','stella','pop'),
												  ('quando era pequeno','sagaz','hiphop'),
                                                  ('decimo primeiro andar','sagaz','hiphop');

create table album(
id_album int primary key auto_increment,
nome varchar(45),
tipo varchar(45) constraint chk_tipo check(tipo in ('digital', 'físico')),
dt_lancamento date
);

insert into album (nome,tipo,dt_lancamento) values ('petricor','digital','2019-03-12'),
												   ('hotel caro','físico','2022-03-22'),
                                                   ('samuray','digital','2020-03-10');

select * from musica;
select * from album;

alter table musica add column fk_album int, add 
foreign key musica (fk_album) references album(id_album);

update musica set fk_album= 1 where id_musica= 1;
update musica set fk_album= 2 where id_musica= 2;
update musica set fk_album= 3 where id_musica= 3;

select * from musica join album on musica.fk_album = album.id_album;

select titulo,nome from musica join album on musica.fk_album = album.id_album;

select * from musica join album on musica.fk_album = album.id_album where tipo = 'digital';