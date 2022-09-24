create database sprint2;
use sprint2;

-- exercício1 --

create table professor(
id_professor int primary key auto_increment,
nome varchar(50),
sobrenome varchar(30),
especialidade1 varchar(40),
especialidade2 varchar(40)
);

insert into professor(nome,sobrenome,especialidade1,especialidade2) values ('vivian','souza','banco de dados','socioemocional'),
																		   ('fernanda','caramico','pesquisa e inovação','algorítmos'),
                                                                           ('fernando','brandão','pesquisa e inovação','socioemocional'),
                                                                           ('paulo','souza','banco de dados','algorítmos'),
                                                                           ('kaline','barreira','socioemocional','coordenação'),
                                                                           ('thiago','gomes','socioemocional','coordenação');

create table disciplina(
id_disciplina int primary key auto_increment,
nome_disciplina varchar(45),
fk_professor int
);

insert into disciplina(nome_disciplina,fk_professor) values ('socioemocional',6),
															('pesquisa e iovação',2),
                                                            ('banco de dados',1),
                                                            ('algorítmos',4);

select * from professor;
select * from disciplina;

select * from professor join disciplina on disciplina.fk_professor = professor.id_professor;

select nome_disciplina,nome as nome_professor from disciplina join professor on disciplina.fk_professor = professor.id_professor;

select * from professor join disciplina on disciplina.fk_professor = professor.id_professor where sobrenome like 'souza';

select especialidade1,nome_disciplina from professor join disciplina on disciplina.fk_professor = professor.id_professor where id_professor=2 order by especialidade1;

-- exercício2 --

create table curso(
id_curso int primary key auto_increment,
nome_curso varchar(50),
sigla char(3),
coordenador varchar(45)
);

insert into curso (nome_curso,sigla,coordenador) values ('análise e desenvolvimento de sistemas','ads','leo'),
														('ciência da computação','cco','vivian'),
                                                        ('sistemas da informação','sii','thiago');

create table registro(
id_registro int primary key auto_increment,
dt_criacaocurso date,
fk_curso int
);

insert into registro (dt_criacaocurso,fk_curso) values ('2017-04-22',1),
												       ('2019-08-16',2),
                                                       ('2022-02-12',3);

select * from curso;
select * from registro;

select * from registro join curso on registro.fk_curso = curso.id_curso;

select * from registro join curso on registro.fk_curso = curso.id_curso where curso.sigla = 'ads';

alter table curso add constraint chk_sigla check (sigla in('ads','cco','sii'));


