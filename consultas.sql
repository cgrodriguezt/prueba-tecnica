--1.2.Cuantos alquileres ha tenido un carro específico desde una fecha específica
select count(id) from alquiler where fecha between '2023-01-01' and '2023-04-04'

--1.3.El total de saldo en un día específico
select sum(saldo) as saldo from alquiler where fecha between '2023-04-29 00:00:00' and '2023-04-29 23:59:59'

--1.4.Realice una consulta así
select c.cedula, c.nombre, a.fecha, a.tiempo, a.saldo, c2.placa, c2.marca
from alquiler a
inner join cliente c on c.id = a.cliente_id
inner join carro c2 on c2.id = a.carro_id

--1.5.Los clientes que no han alquilado en un periodo específico
select c.id, c.cedula, c.nombre
from cliente c
left join alquiler a  on c.id = a.cliente_id and (a.fecha between '2023-04-01' and '2023-04-29')
where a.id is null;

--1.6.Realice la siguiente consulta desde una fecha específica.
select a.fecha, count(p.alquiler_id) as cuantos_pagos, sum(p.valor) as total, max(p.valor) as 'max valor'
from pagos p
inner join alquiler a on a.id = p.alquiler_id
group by a.fecha

--1.7.una consulta así: consolidado por carros en un periodo específico
select c.id, c.modelo, c.marca, c.costo, count(a.id), sum(a.valor_total) 
from carro c
inner join alquiler a on a.carro_id = c.id
group by c.id

--1.8.El primer alquiler de un cliente
select min(a.fecha), c.nombre, c.cedula  
from alquiler a 
inner join cliente c on c.id = a.cliente_id 
where c.cedula = '515-89-0343'
group by c.id 