-- lista 1

-- 1

insert into telefone values (91127584, 30);

-- 2

-- join
select c.nm_cliente, t.nr_telefone
from
    cliente c
    join telefone t
    on c.cd_cliente = t.cd_cliente
order by c.nm_cliente;

-- where
select nm_cliente,nr_telefone 
from cliente, telefone
where cliente.cd_cliente=telefone.cd_cliente order by nm_cliente;


-- 3

-- join
select v.nm_vendedor, p.nr_pedido
from vendedor v
    join pedido p
    on v.cd_vendedor = p.cd_vendedor;

-- where
select nm_vendedor, nr_pedido 
from vendedor, pedido
where vendedor.cd_vendedor=pedido.cd_vendedor;

-- 4

select * from pedido
order by tot_pedido desc;

-- 5

--join
select p.nm_produto
from
    produto p
    inner join pedido_produto pp
	on p.cd_produto = pp.cd_produto
  	inner join pedido pe
    on pe.nr_pedido = pp.nr_pedido
    inner join cliente c
    on c.cd_cliente = pe.cd_cliente
where nm_cliente = 'Ana Clara Barroso';

-- where
select nm_produto
from cliente c, pedido p, pedido_produto pp, produto pr 
where c.cd_cliente=p.cd_cliente and
p.nr_pedido=pp.nr_pedido and pp.cd_produto=pr.cd_produto and nm_cliente='Ana Clara Barroso';

-- 6

update cliente 
set cep='96015360' 
where nm_cliente='Ana Clara Barroso';

-- 7

alter table cliente 
alter nm_cliente type varchar(45);

-- 8

-- join
select c.nm_cliente, cep.nm_rua, c.nr_residencia, c.complemento,
t.nr_telefone, cep.nm_cidade, cep.cep, p.nr_pedido, v.nm_vendedor
from
    cliente c
    inner join cep
    on c.cep = cep.cep
    inner join telefone t
    on c.cd_cliente = t.cd_cliente
    inner join pedido p
    on c.cd_cliente = p.cd_cliente
    inner join vendedor v
    on v.cd_vendedor = p.cd_vendedor;

-- where
select nm_cliente, nm_rua, nr_residencia, complemento, nr_telefone, nm_cidade, c.cep, p.nr_pedido, nm_vendedor 
from cliente c, telefone t, pedido p, vendedor v, cep 
where c.cd_cliente=p.cd_cliente and
c.cd_cliente=t.cd_cliente and c.cep=cep.cep and p.cd_vendedor=v.cd_vendedor;

-- 9

delete from telefone
where cd_cliente = (select cd_cliente from cliente where nm_cliente like 'Ana Clara%');

-- 10

-- join
select v.nm_vendedor
from vendedor v
    inner join pedido p
    on v.cd_vendedor = p.cd_vendedor
where p.dt_pedido between '2016-05-01' and '2016-05-31';

-- where
select nm_vendedor 
from pedido, vendedor
where pedido.cd_vendedor=vendedor.cd_vendedor and pedido.dt_pedido between '2016-05-01' and '2016-05-31';


-- 11

select cd_produto
from pedido_produto
order by nr_pedido;



