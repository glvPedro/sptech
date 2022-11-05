create database semestre1;
use semestre1;

create table aluno(
ra char(8) primary key,
nome varchar(45),
email varchar(45)
);

insert into aluno values (01212166,'pedro gonçalves','pedro.gsilva@sptech.school'),
						 (01222263,'estela polvilho','estela.polv@sptech.school'),
                         (01222066,'matheus da silva','matheus.silv@sptech.school'),
                         (01222505,'joão rezende','joao.rez@sptech.school'),
                         (01222646,'joaquim gonçalves','joa.gon@sptech.school'),
                         (01222554,'maria alvares','mari.alva@sptech.school'),
                         (01212116,'pedro muniz','pedro.muniz@sptech.school'),
						 (01222277,'mirela santos','mirela.san@sptech.school'),
                         (01222065,'matheus machado','matheus.mach@sptech.school'),
                         (01222535,'leonardo neve','leo.nev@sptech.school'),
                         (01222622,'marília vitoria','mari.vit@sptech.school'),
                         (01222543,'alvares alcapone','alv.alc@sptech.school');

create table professor(
rp int primary key auto_increment,
nome varchar(45),
disciplina varchar(45)
)auto_increment = 1000;

insert into professor(nome,disciplina) values ('vivian','banco de dados'),
											  ('fernanda','pesquisa e inovação'),
                                              ('thiago','socioemocional'),
                                              ('chola','arquitetura computacional'),
                                              ('yoshi','algoritmos'),
                                              ('monica','tecnologia da informação');

create table grupo(
id_grupo int auto_increment,
nome varchar(45),
descricao varchar(255),
fk_aluno char(8),
foreign key (fk_aluno) references aluno(ra),
fk_professor int,
foreign key (fk_professor) references professor(rp),
primary key (id_grupo,fk_aluno,fk_professor)
)auto_increment = 1;

insert into grupo (nome,descricao,fk_aluno,fk_professor) values ('bright tec','controle de fluxo de pessoas',01212166,1004),
																('plantsouz','monitoramento em platil',01222263,1000),
                                                                ('tec nidht','controle de luminosidade',01222066,1004),
                                                                ('alghotec','controle de qualidade em algodão',01222505,1002),
                                                                ('coffegold','controle de caffe em produção',01222646,1001),
                                                                ('tecbri','sistema gerenciador de petróleo',01222554,1003),
                                                                ('bright tec','controle de fluxo de pessoas',01212116,1002),
																('plantsouz','monitoramento em platil',01222277,1000),
                                                                ('tec nidht','controle de luminosidade',01222065,1000),
                                                                ('alghotec','controle de qualidade em algodão',01222535,1004),
                                                                ('coffegold','controle de caffe em produção',01222622,1004),
                                                                ('tecbri','sistema gerenciador de petróleo',01222543,1002);

create table avaliacao(
id_avaliacao int,
fk_grupo int,
foreign key (fk_grupo) references grupo(id_grupo),
fk_aluno char(8),
foreign key (fk_aluno) references aluno(ra),
fk_professor int,
foreign key (fk_professor) references professor(rp),
nota int,
dt_avaliacao datetime,
primary key (id_avaliacao,fk_grupo,fk_aluno,fk_professor)
);

insert into avaliacao values (1,5,01222646,1002,10,'2022-10-04 14:03:32'),
							 (2,4,01222263,1001,7,'2022-10-04 14:35:32'),
                             (3,4,01222263,1002,6,'2022-10-04 14:54:02'),
                             (4,5,01212166,1005,4,'2022-09-05 11:03:20'),
                             (5,2,01222646,1004,7,'2022-08-04 11:53:55'),
                             (6,3,01222554,1001,10,'2022-10-06 16:34:54'),
                             (7,5,01212166,1000,8,'2022-08-04 11:53:55'),
                             (8,4,01222263,1003,9,'2022-08-04 11:53:55');

select * from aluno;
select * from professor;
select * from grupo;
select * from avaliacao;

select * from grupo g join aluno a on a.ra = g.fk_aluno;

select * from grupo g join aluno a on a.ra = g.fk_aluno where g.nome = 'bright tec';

select avg(a.nota) from avaliacao a;

select min(a.nota),max(a.nota) from avaliacao a;

select sum(a.nota) from avaliacao a;

select p.*,g.*, a.dt_avaliacao from professor p join avaliacao a on p.rp = a.fk_professor
												join grupo g on g.id_grupo = a.fk_grupo;
                                                
select p.*,g.*, a.dt_avaliacao from professor p join avaliacao a on p.rp = a.fk_professor
												join grupo g on g.id_grupo = a.fk_grupo where g.id_grupo = 4;
											
select g.nome,p.* from grupo g join professor p on p.rp = g.fk_professor
							   join avaliacao a on p.rp = a.fk_professor where p.nome = 'yoshi';
                               
select g.*,p.*,al.*,av.dt_avaliacao from professor p join grupo g on p.rp = g.fk_professor
												     join aluno al on al.ra = g.fk_aluno
												     join avaliacao av on g.id_grupo = av.fk_grupo;
                          
select count(av.nota) from avaliacao av where (select distinct(av.nota));

select p.nome, avg(av.nota) média, sum(av.nota) soma from avaliacao av join professor p on p.rp = av.fk_professor group by p.rp;

select g.nome, avg(av.nota) média, sum(av.nota) soma from grupo g join avaliacao av on g.id_grupo = av.fk_grupo group by g.id_grupo;                

select p.nome, min(av.nota) mínimo, max(av.nota) máximo from avaliacao av join professor p on p.rp = av.fk_professor group by p.rp;

select g.nome, min(av.nota) mínimo, max(av.nota) máximo from avaliacao av join grupo g on g.id_grupo = av.fk_grupo group by g.id_grupo;