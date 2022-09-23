create database sprint2;
use sprint2;

-- exercício 1 --
create table aluno(
ra int primary key,
nome varchar(45),
telefone varchar(45),
fk_representante int,
foreign key (fk_representante) references aluno(ra)
);

insert into aluno values (1,'pedro','11958414286',1),
						 (2,'vivian','11942865841',null),
                         (3,'paulo','11940028922',2);

create table projeto(
id_projeto int primary key,
nome varchar(45),
descricao varchar(45),
fk_aluno int,
foreign key (fk_aluno) references aluno(ra)
);

insert into projeto values (1,'grand vinum','armazenamento em vinícolas',2),
						   (2,'estacioney','controle de vagas em estacionamentos',3),
                           (3,'moraguinho','controle de temp/humi nas plantanções',1);

create table acompanhante(
id_acompanhante int primary key,
nome varchar(45),
tipo_relacao varchar(45),
fk_aluno int,
foreign key(fk_aluno) references aluno(ra)
);

insert into acompanhante values (1,'lili','esposa',3),
								(2,'joaquim','marido',2);

select * from aluno;
select * from projeto;
select * from acompanhante;

select * from aluno as a join projeto as p on a.ra = p.fk_aluno;

select * from aluno as al join acompanhante as ac on al.ra = ac.fk_aluno;

select * from aluno as novato join aluno as experiente on novato.ra = experiente.fk_representante;


select a.nome as nomealuno, a.telefone, p.nome as nomeprojeto, p.descricao from aluno as a join projeto as p on a.ra = p.fk_aluno where ra=1;

select * from aluno as al join projeto as p on al.ra = p.fk_aluno join acompanhante as ac on ac.fk_aluno = al.ra;


-- exercício 1 --
create table organizador(
id_organizador int primary key auto_increment,
nome varchar(45),
rua varchar(45),
bairro varchar(45),
email varchar(45),
organizador_exp int,
foreign key (organizador) references organizador(id_organizador)
) auto_increment=30;

insert into organizador (nome,rua,bairro,email,organizador_exp) values ('rojério','rua noventa e cinco','jardim SP','rogeriosenna@hotmail.com',null),
																	   ('silvester','r. recanto das rosas','guaianases','silvester@hotmail.com',1),
                                                                       ('amaduk','rua serra do mar','jardim simone','amaduk@hotmail.com',3);

create table campanha(
id_campanha int primary key auto_increment,
categoria varchar(45),
inst_areceber varchar(45),
dt_finalcampanha date,
fk_organizador int,
foreign key (fk_organizador) references organizador(id_organizador)
)auto_increment=500;