-- lista 4

-- 1

alter table vendedor
add column salario int not null;

-- 2

update vendedor
set salario = 1500;

-- 3

-- join
select v.nm_vendedor
from
    vendedor v
    left join pedido p
    on v.cd_vendedor = p.cd_vendedor
where p.dt_pedido not between '2016-07-01' and '2016-07-31';

--
select vendedor.nm_vendedor
from vendedor, pedido
where vendedor.cd_vendedor = pedido.cd_vendedor
and pedido.dt_pedido not between '2016-07-01' and '2016-07-31';

-- 4

-- join
select v.nm_vendedor
from
    vendedor v
    left join pedido p
    on v.cd_vendedor = p.cd_vendedor
where p.dt_pedido not between '2016-07-01' and '2016-07-31';

--
select vendedor.nm_vendedor
from vendedor, pedido
where vendedor.cd_vendedor = pedido.cd_vendedor
and pedido.dt_pedido not between '2016-07-01' and '2016-07-31';


-- 5

-- join
select v.nm_vendedor
from
    vendedor v
    join pedido p
    on v.cd_vendedor = p.cd_vendedor
where p.dt_pedido between '2016-04-01' and '2016-04-30'
order by nm_vendedor asc;

--
select vendedor.nm_vendedor
from vendedor, pedido
where vendedor.cd_vendedor = pedido.cd_vendedor
and pedido.dt_pedido between '2016-04-01' and '2016-07-30'
order by nm_vendedor asc;

-- 6

select nm_cliente
from cliente;

-- 7

-- join
select c.nm_cliente
from
    cliente c
    left join telefone t
    on c.cd_cliente = t.cd_cliente
where t.nr_telefone is null;

--
select clientes.nm_cliente
from clientes
where clientes.cd_cliente = (select telefone.cd_cliente from telefone);

-- 8

--join
select c.nm_cliente
from
    cliente c
    left join telefone t
    on c.cd_cliente = t.cd_cliente
where t.nr_telefone is not null;

--
select cliente.nm_cliente
from cliente
where cliente.cd_cliente in (select telefone.cd_cliente from telefone);

-- 9

-- join
select c.nm_cliente, cep.nm_rua, cep.nm_cidade, c.nr_residencia, c.complemento, c.cep
from
    cliente c
    join cep cep
    on c.cep = cep.cep
where c.cep = cep.cep;

--
select cliente.nm_cliente, cep.nm_rua, cep.nm_cidade, cliente.nr_residencia, cliente.complemento, cliente.cep
from cliente, cep
where cep.cep = cliente.cep;

-- 10

-- join
select c.nm_cliente
from
    cliente c
    join pedido p
    on c.cd_cliente = p.cd_cliente;

--
select cliente.nm_cliente
from cliente, pedido
where cliente.cd_cliente = pedido.cd_cliente;

-- 11

-- join
select p.nm_produto
from produto p
    inner join pedido_produto pp
    on p.cd_produto = pp.cd_produto
    inner join pedido pd
    on pd.nr_pedido = pp.nr_pedido
    inner join cliente c
    on c.cd_cliente = pd.cd_cliente
where c.nm_cliente = 'Afonso Mendes';

--   
select produto.nm_produto
from cliente, pedido,pedido_produto, produto
where cliente.cd_cliente = pedido.cd_cliente
and pedido.nr_pedido = pedido_produto.nr_pedido
and pedido_produto.cd_produto = produto.cd_produto
and upper(cliente.nm_cliente) like '%AFONSO MENDES%';

-- 12

begin;

insert into pedido (nr_pedido, dt_pedido, tot_pedido, cd_cliente, cd_vendedor) values (1010, ‘2016-08-01’, null, 10, 300);
insert into pedido_produto (tot_produto, qtde_pedida, cd_produto, nr_pedido) values (2.30, 2, 2, 1010);

update produto set produto = produto – 2 where cd_produto = 2;
update pedido set tot_pedido = 2.30 where nr_pedido=1010;

commit;

-- 13

-- join
select distinct pdt.nm_produto
from
    produto pdt
    join pedido_produto pp
    on pdt.cd_produto = pp.cd_produto
    join pedido p
    on pp.nr_pedido = p.nr_pedido;
    
--
select produto.nm_produto
from  pedido_produto, produto
where pedido_produto.cd_produto = produto.cd_produto;

-- 14

-- join
select nm_produto
from produto p
    join pedido_produto pp
    on p.cd_produto = pp.cd_produto
where p.nm_produto ilike 'c%';

--
select produto.nm_produto
from produto, pedido_produto
where produto.cd_produto = pedido_produto.cd_produto
and  produto.nm_produto ilike 'c%';

-- 15

select produto.nm_produto
from  produto
where produto.vl_unitario = (select max(produto.vl_unitario) from produto);

-- 16

select nm_produto
from produto
where vl_unitario = (select min(vl_unitario) from produto)
limit 1;

-- 17

select nr_pedido
from pedido, vendedor
where vendedor.nm_vendedor like 'Batista%' and tot_pedido = (select min(tot_pedido) from pedido);

-- 18

create view pedidoview as (
    select nr_pedido, dt_pedido
    from pedido
);

select * from pedidoview;


