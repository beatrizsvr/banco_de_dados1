-- lista 2

-- 1

-- join
select v.nm_vendedor
from
    vendedor v
    inner join pedido p
    on v.cd_vendedor = p.cd_vendedor
where p.nr_pedido = 1001;
    
-- where
select nm_vendedor 
from vendedor, pedido
where vendedor.cd_vendedor = pedido.cd_vendedor and pedido.nr_pedido = 1001;

-- 2

select nr_pedido
from pedido
where cd_vendedor = (select cd_vendedor from vendedor where nm_vendedor like 'Batista');

-- ou

select pedido.*
from vendedor, pedido
where vendedor.cd_vendedor = pedido.cd_vendedor and vendedor.nm_vendedor='Batista';


-- 3

update produto
set vl_unitario = vl_unitario * 1.15
where nm_produto ilike 'lápis';

-- 4

create view previsao as (
    select nm_produto, vl_unitario * 1.15
    from produto
);

select * from previsao;

-- 5

-- join
select t.nr_telefone
from
    telefone t
    inner join cliente c
    on t.cd_cliente = c.cd_cliente
    inner join cep
    on c.cep = cep.cep
where nm_cidade like 'Pelotas';

-- where
select nm_cliente, nr_telefone from cliente, telefone, cep
where cliente.cd_cliente=telefone.cd_cliente and cliente.cep=cep.cep
and nm_cidade='Pelotas';

-- 6

select nm_produto
from produto
where nm_produto ilike 'C%';

-- ou

select nm_produto from produto
where upper (produto.nm_produto) like 'C%';


-- 7

-- join
select c.nm_cliente
from
    cliente c
    inner join telefone t
    on t.cd_cliente = c.cd_cliente
where nr_telefone like '91%';

-- where
select nm_cliente, nr_telefone from telefone, cliente
where cliente.cd_cliente=telefone.cd_cliente and nr_telefone like '91%';

-- 8

select nm_cliente from cliente
where complemento is not null;