-- Group BY
select * from DimProduct

select
	BrandName as 'Marca',
	count(*) 'Quantidade'
from 
	DimProduct
group by
	BrandName 

select * from DimStore

select
	StoreType as 'Tipo de loja',
	sum(EmployeeCount) as 'Quantidade de funcionários'
from
	DimStore
group by
	StoreType

select * from DimProduct

select
	BrandName as 'Marca',
	avg(UnitCost) as 'Média Custo Unitário'
from 
	DimProduct
group by
	BrandName

select * from DimProduct

select
	ClassName as 'Nome da Classe',
	max(UnitPrice) as 'Máximo de preço'
from
	DimProduct
group by 
	ClassName

-- Group By + Order By
select * from dimStore

select
	StoreType as 'Tipo de loja',
	sum (EmployeeCount) as 'Qtd de funcionários'
from
	DimStore
group by 
	StoreType
order by 
	[Qtd de funcionários] desc
-- Group By + Where
select * from DimProduct
select
	ColorName as 'Cor do Produto',
	count(*) as 'Total de Produtos'
from 
	DimProduct
where
	BrandName = 'Contoso' 
group by 
	ColorName

-- Having
select * from DimProduct
select
	BrandName as 'Marca',
	Count (BrandName) as 'Total por marca'
from 
	DimProduct
group by
	BrandName
having --Permite fazer um filtro DEPOIS do agrupamento
	Count (BrandName) >= 200
order by
	[Total por marca]
