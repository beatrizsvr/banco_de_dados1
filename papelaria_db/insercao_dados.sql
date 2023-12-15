-- inserção de dados

insert into cep (cep, nm_rua, nm_cidade) values ('96015670','Rua Major Cícero','Pelotas');
insert into cep (cep, nm_rua, nm_cidade) values ('96020780','Rua Padre Felício','Pelotas');

insert into cliente (nm_cliente, cd_cliente, sexo, nr_residencia, complemento, cep, cpf, profissao) values ('João da Silva', 10, 'M', 2345, 201, '96020780','64466986020', 'Professor');
insert into cliente (nm_cliente, cd_cliente, sexo, nr_residencia, complemento, cep, cpf, profissao) values ('Pedro Vasconcelos', 20, 'M', 56, null, '96020780','62066456789', 'Empresário');
insert into cliente (nm_cliente, cd_cliente, sexo, nr_residencia, complemento, cep, cpf, profissao) values ('Ana Clara Barroso', 30, 'M', 56, null, '96020780','23456786020', 'Dentista');
insert into cliente (nm_cliente, cd_cliente, sexo, nr_residencia, complemento, cep, cpf, profissao) values ('Paula Silveira',40,'F',25,null,'96020780','62044567820', 'Médica');
insert into cliente (nm_cliente, cd_cliente, sexo, nr_residencia, complemento, cep, cpf, profissao) values ('Afonso Mendes',50,'M',2123, 304, '96020780','62044567822', 'Analista de Sistemas');

insert into telefone (cd_cliente, nr_telefone) values (10, '32256789');
insert into telefone (cd_cliente, nr_telefone) values (20, '34535566');
insert into telefone (cd_cliente, nr_telefone) values (20, '91232132');
insert into telefone (cd_cliente, nr_telefone) values (40, '34225678');
insert into telefone (cd_cliente, nr_telefone) values (50, '99821111');

insert into produto (cd_produto, nm_produto, vl_unitario, qtd_estoque) values (1, 'Lápis', 1.5, 100);
insert into produto (cd_produto, nm_produto, vl_unitario, qtd_estoque) values (2,'Borracha',1.00, 80);
insert into produto (cd_produto, nm_produto, vl_unitario, qtd_estoque) values (3,'Caderno',15.00, 200);
insert into produto (cd_produto, nm_produto, vl_unitario, qtd_estoque) values (4,'Caneta',3.00, 120); 
insert into produto (cd_produto, nm_produto, vl_unitario, qtd_estoque) values (5,'apontador',15.00, 45);
insert into produto (cd_produto, nm_produto, vl_unitario, qtd_estoque) values (6,'régua',2.00, 33);
insert into produto (cd_produto, nm_produto, vl_unitario, qtd_estoque) values (7,'marcador de texto',5.00, 70);
insert into produto (cd_produto, nm_produto, vl_unitario, qtd_estoque) values (8,'clips',6.00, 180);

insert into vendedor (cd_vendedor, nm_vendedor, salario) values (100,'João Silveira',890.00);
insert into vendedor (cd_vendedor, nm_vendedor, salario) values (200,'Paula Maia', 16500.00);
insert into vendedor (cd_vendedor, nm_vendedor, salario) values (300, 'Batista', 1050.00);

insert into pedido (nr_pedido, dt_pedido, tot_pedido, cd_cliente, cd_vendedor) values (1000, '2016-04-12', 4, 10, 300);
insert into pedido (nr_pedido, dt_pedido, tot_pedido, cd_cliente, cd_vendedor) values (1001, '2016-04-03', 1, 20, 200);
insert into pedido (nr_pedido, dt_pedido, tot_pedido, cd_cliente, cd_vendedor) values (1002, '2016-05-30', 5, 30, 300);
insert into pedido (nr_pedido, dt_pedido, tot_pedido, cd_cliente, cd_vendedor) values (1003, '2016-05-25', 30, 40, 100);
insert into pedido (nr_pedido, dt_pedido, tot_pedido, cd_cliente, cd_vendedor) values (1004, '2016-05-25', 30, 50, 100);

insert into pedido_produto (tot_produto, qtd_pedida, cd_produto, nr_pedido) values (3, 2, 1, 1000);
insert into pedido_produto (tot_produto, qtd_pedida, cd_produto, nr_pedido) values (1, 1, 2, 1000);
insert into pedido_produto (tot_produto, qtd_pedida, cd_produto, nr_pedido) values (15, 1, 4, 1001);
insert into pedido_produto (tot_produto, qtd_pedida, cd_produto, nr_pedido) values (5, 1, 7, 1002);
insert into pedido_produto (tot_produto, qtd_pedida, cd_produto, nr_pedido) values (30, 2, 4, 1003);
insert into pedido_produto (tot_produto, qtd_pedida, cd_produto, nr_pedido) values (12, 2, 8, 1004);
