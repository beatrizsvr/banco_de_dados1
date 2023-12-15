-- lista 3

-- 1

update telefone
set nr_telefone = '91234545'
where cd_cliente = (select cd_cliente from cliente where nm_cliente = 'João da Silva');

update telefone 
set nr_telefone = ‘91234545’ 
where cd_cliente in (select cd_cliente from cliente where nm_cliente=’João da Silva’; 

-- 2
					 
update pedido_produto
set qtd_pedida = '3'
where nr_pedido = 1000 and cd_produto = (select produto.cd_produto from produto where produto.cd_produto = pedido_produto.cd_produto and produto.nm_produto ilike 'Lápis');

-- ou

update pedido_produto 
set qtd_pedida=3 
where nr_pedido=1000 and cd_produto in (select cd_produto from produto where nm_produto=’Lápis’;
										
-- 3

update vendedor 
set salario=salario+200 
where cd_vendedor in (select cd_vendedor from pedido where dt_pedido between '2016-07-01' and '2016-07-31');

-- 4
										
delete from telefone
where cd_cliente = (select cd_cliente from cliente where cliente.nm_cliente = 'Paula Domingues' );

-- 5

delete from pedido_produto 
where nr_pedido in (select nr_pedido from pedido, vendedor where vendedor.cd_vendedor=pedido.cd_vendedor and 
nm_vendedor='Batista' and dt_pedido between '2016-07-01' and '2016-07-31');
									

-- 6
			
delete from clientes 
where cd_cliente not in (select cd_cliente from telefone);	
										
-- 7
	
select nm_vendedor 
from vendedor 
order by nm_vendedor asc;
										
-- 8
									
-- join
select upper(c.nm_cliente) as "Nome do cliente", upper(cep.nm_cidade) as "Cidade"
from
    cliente c
    join cep
    on cep.cep=c.cep;

--
select upper (nm_cliente) as “Nome do cliente”, upper(nm_cidade) as Cidade 
from cliente, cep 
where cep.cep=cliente.cep; 
										
-- 9
									
select nm_cliente 
from cliente 
where cd_cliente in (select cd_cliente from pedido where tot_pedido not in (select tot_pedido from pedido where tot_pedido > any (select tot_pedido from pedido)));										
										
-- 10
									
-- join
select c.nm_cliente, cep.nm_rua, c.nr_residencia, cep.nm_cidade, cep.cep
from cliente c
    inner join cep
    on c.cep = cep.cep
where complemento is null;

--
select nm_cliente, nm_rua, nr_residencia, nm_cidade, cep.cep 
from cliente, cep 
where cliente.cep=cep.cep and complemento is null;
										
-- 11
										
select nm_cliente 
from cliente 
where upper(nm_cliente) like ’P%’;
										
-- 12
		
-- join
select c.nm_cliente, t.nr_telefone
from
    cliente c
    inner join telefone t
    on c.cd_cliente = t.cd_cliente
    inner join pedido p
    on c.cd_cliente = p.cd_cliente
    join vendedor v
    on v.cd_vendedor = p.cd_vendedor
where v.nm_vendedor like 'Batista';

--
select nm_cliente, nr_telefone
from telefone, cliente, pedido, vendedor
where cliente.cd_cliente=telefone.cd_cliente 
and cliente.cd_cliente = pedido.cd_cliente
and pedido.cd_vendedor=vendedor.cd_vendedor 
and nm_vendedor='Batista';

										
										