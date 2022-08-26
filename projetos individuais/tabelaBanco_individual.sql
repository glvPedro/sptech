create table arduino(
id int primary key auto_increment,
temperatura double,
humidade double,
dt_registro datetime
);

insert into arduino (temperatura,humidade,dt_registro) values (27.544,13.027,'2022-12-31 23:59:59'),
															  (27.134,12.042,'2022-08-25 23:59:59'),
                                                              (26.334,13.020,'2022-08-25 23:59:59'),
                                                              (23.634,12.022,'2022-08-25 23:59:59'),
                                                              (24.347,15.002,'2022-08-25 23:59:59'),
                                                              (25.354,11.012,'2022-08-25-23:59:59');

create table vinho(
id int primary key auto_increment,
nome varchar(45),
tipo varchar(45),
dt_armazenamento datetime,
temp_restAuge datetime
)auto_increment= 1638;

insert into vinho (nome,tipo,dt_armazenamento,temp_restAuge) values ('Carménère','tinto','2013-05-12 23:59:59','2024-03-04 23:59:59'),
																	('Syrah','rosé','2014-05-12 23:59:59','2025-03-24 23:59:59'),
                                                                    ('Tempranillo','espumante','2016-07-12 23:59:59','2022-03-24 23:59:59'),
                                                                    ('Malbec','rosé','2013-05-12 23:59:59','2030-03-24 23:59:59'),
                                                                    ('Merlot','licorosos','2011-05-12 23:59:59','2022-03-24 23:59:59'),
                                                                    ('Pinot Noir','branco','2009-05-12 23:59:59','2023-03-24 23:59:59');

create table empresa(
id int primary key auto_increment,
nome varchar(45),
tel_contato varchar(45), /*possível char(9) - check -  limitando o contato para o formato exato*/
responsavel varchar(45),
tipo_contrato varchar(45) /*possível check perante os 11 tipos de contrato*/
);

insert into empresa (nome,tel_contato,responsavel,tipo_contrato) values ('stefanninni','(11)95841-4286','fernanda caramico','tempo determinado'),
																		('linX','(11)95441-3947','fernanda caramico','tempo determinado'),
                                                                        ('safra','(11)95841-8766','fernando brandão','prestação de serviços'),
                                                                        ('valimobi','(11)93458-4286','felipe petry','tempo determinado'),
                                                                        ('psycho100','(11)83946-3948','leonardo da nave caramico','prestação de serviços'),
                                                                        ('vinhodeuva','(11)94957-4298','samuel araujo','prestação de serviços');

select * from arduino;
select * from vinho;
select * from empresa;

select * from arduino,vinho,empresa group by arduino.id;

