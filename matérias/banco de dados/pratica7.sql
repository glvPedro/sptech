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

select * from aluno as novato right join aluno as experiente on novato.ra = experiente.fk_representante;


select a.nome as nomealuno, a.telefone, p.nome as nomeprojeto, p.descricao from aluno as a join projeto as p on a.ra = p.fk_aluno where ra=1;

select * from aluno as al right join projeto as p on al.ra = p.fk_aluno join acompanhante as ac on ac.fk_aluno = al.ra;


-- exercício 2 --

create database campanha;
use campanha;

create table organizador(
id_organizador int primary key auto_increment,
nome varchar(45),
rua varchar(45),
bairro varchar(45),
email varchar(45),
organizador_exp int,
foreign key (organizador_exp) references organizador(id_organizador)
) auto_increment=30;

insert into organizador(nome,rua,bairro,email,organizador_exp) values ('rojério','rua noventa e cinco','jardim SP','rigerio@hotmail.com',30),
																	  ('diego','recanto das rosas','guaianases','dieguinho@hotmail.com',30),
                                                                      ('amaduk','rua serra do mar','jardim simone','amaduk@hotmail.com',31);

create table campanha(
id_campanha int primary key auto_increment,
categoria varchar(45),
inst_areceber varchar(45),
dt_finalcampanha date,
fk_organizador int,
foreign key (fk_organizador) references organizador(id_organizador)
)auto_increment=500;

insert into campanha(categoria,inst_areceber,dt_finalcampanha,fk_organizador) values ('beneficente','tivit','2023-03-12',30),
																				     ('cancer','dramon','2028-05-17',31),
                                                                                     ('doação','sptech','2025-09-22',30);

select * from organizador;
select * from campanha;

select * from organizador as o join campanha as c on c.fk_organizador = o.id_organizador;

select * from organizador as o join campanha as c on c.fk_organizador = o.id_organizador where o.nome = 'rojério';

select * from organizador as experiente join organizador as novato on novato.organizador_exp = experiente.id_organizador; 

select * from organizador as experiente right join organizador as novato on novato.organizador_exp = experiente.id_organizador 
										where experiente.nome = 'rojério';

select * from organizador as org_novato right join campanha as c on c.fk_organizador = org_novato.id_organizador 
										right join organizador as org_experiente on c.fk_organizador = org_experiente.id_organizador;

select * from organizador as org_novato left join campanha as c on c.fk_organizador = org_novato.id_organizador 
										left join organizador as org_experiente on c.fk_organizador = org_experiente.id_organizador where org_novato.organizador_exp = 30;