-- modelagem 

create table cep
(cep char(8) primary key,
 nm_rua varchar(50) not null,
 nm_cidade varchar(30) not null
);

create table cliente
(cd_cliente int primary key,
 nm_cliente varchar(30) not null,
 nr_residencia varchar(6) not null,
 complemento varchar(6),
 sexo char(1) check(sexo='F' or sexo='M'),
 cpf char(11) unique not null,
 cep char(8),
 profissao varchar(30) not null,
 foreign key(cep) references cep(cep)
);

create table telefone 
(nr_telefone char(8) primary key,
 cd_cliente int not null,
 foreign key(cd_cliente) references cliente(cd_cliente)
);

create table vendedor
(cd_vendedor int primary key,
 nm_vendedor varchar(30) not null
);

create table produto
(cd_produto int primary key,
 nm_produto varchar(30) not null,
 vl_unitario numeric(7,2) not null,
 qtd_estoque int not null
);

create table pedido
(nr_pedido int primary key,
 dt_pedido date not null,
 tot_pedido numeric(7,2) not null,
 cd_cliente int not null,
 cd_vendedor int not null,
 foreign key (cd_cliente) references cliente(cd_cliente),
 foreign key (cd_vendedor) references vendedor(cd_vendedor)
);

create table pedido_produto
(nr_pedido int not null references pedido(nr_pedido),
 cd_produto int not null references produto(cd_produto),
 tot_produto int not null,
 qtd_pedida int not null,
 constraint pkpedido_produto primary key (nr_pedido, cd_produto)
);