-- lista

-- 1

select r.meso, sum(massasalarial)
from public.empregosti e
join public.regioesrs r on e.local = r.micro
where ano = 2019
group by r.meso
order by sum(massasalarial) desc;

-- 2

select r.meso, a.descricaro, e.empregos
from public.empregosti e
join public.regioesrs r on e.local = r.micro
join public.areas a on e.areaid = a.area
where ano = 2021 and empregos > 100 and meso = 'Sudeste Rio-Grandense'
order by e.empregos desc;

-- 3

select c.subclasse, e.empregos
from public.empregosti e
join public.classescnae c on e.areaid = c.id
join public.regioesrs r on e.local = r.micro
where meso = 'Sudeste Rio-Grandense' and ano = 2020
order by e.empregos desc limit 5;

-- 4

select r.micro, c.subclasse, e.ano, e.empregos from public.empregosti e
join public.classescnae c on e.areaid = c.id
join public.regioesrs r on e.local = r.micro
where ano > 2021 + (-5) and empregos > 100 and micro = 'Porto Alegre'
order by e.empregos desc;

-- 5

select r.meso, e.empregos
from public.empregosti e
join public.regioesrs r on e.local = r.micro
where ano between '2012' and '2021'
order by e.empregos desc;

-- 6

select e.areaid, a.descricaro, e.empregos
from public.empregosti e
join public.areas a on e.areaid = a.area
where areaid like 'j61%' or areaid like 'j62%' and ano in ('2010', '2015', '2020')
order by e.empregos desc;

-- 7

select a.area, a.descricaro, sum(e.empregos)
from public.empregosti e
join public.areas a on e.areaid = a.area
group by a.area;
