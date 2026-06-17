-- count
select
	count(*) as 'Total de produtos' -- Conta as linhas da tabela inteira
from 
	DimProduct

select 
	count (ProductName) as 'Qtd Produtos'-- Conta as linhas de uma coluna específica
from DimProduct

select 
	count(Size) as ' Tamanho'-- Quando alguma linha da coluna é NULL, não entra na contagem final
from
	DimProduct

--count + distinct
select
	count(distinct BrandName) as 'Marcas diferentes'

from
	DimProduct

-- sum
select
	sum(SalesQuantity) as 'Total de produtos vendidos',
	sum (ReturnQuantity) as 'Total devolvido'
from 
	FactSales

-- min e max
select 
	max (UnitPrice) -- Valor Máximo
from
	DimProduct

select 
	min (UnitPrice) -- Valor Mínimo
from
	DimProduct

select
	max (UnitCost) as 'Custo Máximo',
	min (UnitCost) as 'Custo Mínimo' -- Máximo e Mínimo na mesma consulta
from 
	DimProduct

-- avg
select
	avg (YearlyIncome) as 'Renda média anual'
from 
	DimCustomer
