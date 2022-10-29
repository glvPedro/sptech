create database venda;
use venda;

create table cliente(
id_cliente int primary key auto_increment,
nome varchar(45),
email varchar(45),
fk_indicacao int,
foreign key (fk_indicacao) references cliente (id_cliente)
);

insert into cliente (nome,email,fk_indicacao) values ('pedro','pedro@hotmail.com',null),
														  ('joão','joao@outlook.com',1),
                                                          ('vivian','vivi@gmail.com',1),
                                                          ('lethicia','leth@hotmail.com',2),
                                                          ('joaquim','joaquim@gmail.com',3),
                                                          ('arnaldo','arnaldo@hotmail.com',2);

create table endereco(
id_endereco int primary key auto_increment,
rua varchar(45),
logradouro varchar(45),
cep varchar(45),
n° varchar(45)
);

insert into endereco (rua,logradouro,cep,n°) values ('r. noventa e cinco','AV.recanto','08466003','19A'),
													('jardim recanto das rosas','jardins','93847465','22'),
                                                    ('vila madalena','guaiansaes','93847364','123'),
                                                    ('r. evaldo calabrez','AV.robru','20293847','321'),
                                                    ('vila romena','brandvi','99483734','175B');

create table clientes_enderecos(
id_registro int,
fk_endereco int,
fk_cliente int,
primary key(id_registro,fk_endereco,fk_cliente)
);

insert into clientes_enderecos values (1,2,1),
									  (2,1,2),
                                      (3,4,1),
                                      (4,3,4),
                                      (5,2,3),
                                      (6,2,5),
                                      (7,2,4);

create table venda(
id_venda int primary key auto_increment,
total_vendas int,
data_compra date,
fk_cliente int,
foreign key (fk_cliente) references cliente (id_cliente)
);

insert into venda (total_vendas,data_compra,fk_cliente) values (7,'2022-02-24',2),
															   (2,'2020-10-04',1),
															   (4,'2022-09-20',2),
														  	   (7,'2022-07-17',4),
														  	   (4,'2022-05-02',5),
														  	   (1,'2022-04-20',4);

create table produto(
id_produto int primary key auto_increment,
nome varchar(45),
descricao varchar(45),
preco decimal(6,2)
);

insert into produto (nome,descricao,preco) values ('camiseta','camiseta estampada de flamingo - M',0080.00),
												  ('calça','calça jogger - GG',0180.52),
                                                  ('pulseira','pulseira caveira sem feixe',9384.36),
                                                  ('cachecol','aveludado anti coceira',9384.63),
                                                  ('pulseira','medalhao de cruz na ponta',2837.46),
                                                  ('sapato','social lite unisex',0129.54);

create table vendas_produtos(
id_registro int,
fk_venda int,
fk_produto int,
primary key (id_registro,fk_venda,fk_produto)
);

insert into vendas_produtos values (1,2,1),
								   (2,1,2),
                                   (3,3,1),
                                   (4,1,3),
                                   (5,2,6),
                                   (6,4,1),
                                   (7,5,4);
                                   
select * from cliente;
select * from endereco;
select * from clientes_enderecos;
select * from produto;
select * from venda;
select * from vendas_produtos;

select * from cliente c join venda v on c.id_cliente = v.fk_cliente;

select c.nome, v.* from cliente c join venda v on c.id_cliente = v.fk_cliente;

select * from cliente join cliente indicacao on cliente.id_cliente = indicacao.fk_indicacao;

select cliente.nome, indicacao.* from cliente join cliente indicacao on cliente.id_cliente = indicacao.fk_indicacao where cliente.id_cliente = 2;

select * from cliente join cliente indicacao on cliente.id_cliente = indicacao.fk_indicacao
					  join venda v on cliente.id_cliente = v.fk_cliente
                      join vendas_produtos vp on v.id_venda = vp.fk_venda
                      join produto p on p.id_produto = vp.fk_produto;

select v.data_compra, p.nome, v.total_vendas from venda v join vendas_produtos vp on v.id_venda = vp.fk_venda
														  join produto p on p.id_produto = vp.fk_produto;
                                                          
select p.nome, p.preco, sum(v.total_vendas) from produto p join vendas_produtos vp on p.id_produto = vp.fk_produto
														   join venda v on v.id_venda = vp.fk_venda group by p.nome;

insert into cliente (nome,email,fk_indicacao) value ('proxy','proxy@hotmail.com',null);
select * from cliente c left join venda v on v.fk_cliente = c.id_cliente;

select min(p.preco), max(p.preco) from produto p;

select sum(p.preco) soma, avg(p.preco) média from produto p;

select count(p.preco) from produto p where p.preco > (select avg(p.preco) from produto as p);

select sum(p.preco) from produto p where (select distinct(p.id_produto));

select vp.id_registro id_venda, sum(p.preco) soma_preco from produto p join vendas_produtos vp on p.id_produto = vp.fk_produto
								   join venda v on v.id_venda = vp.fk_venda group by v.id_venda = 6;