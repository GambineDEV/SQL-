-- Join

-- Left (Outer) Join: Trás os dados da tabela B + a interseção com a tabela A
select * from DimProduct
select * from DimProductSubcategory
select
	ProductKey as 'Id do Produto',
	ProductName 'Nome do Produto',
	DimProduct.ProductSubcategoryKey 'Id da Subcategoria',
	ProductSubcategoryName as 'Nome da Subcategoria'
from
	DimProduct
left join DimProductSubcategory
	on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey


-- Right (Outer) Join: Trás os dados da tabela A + a interseção com a tabela B
select * from DimProduct
select * from DimProductSubcategory
select
	ProductKey as 'Id do Produto',
	ProductName 'Nome do Produto',
	DimProduct.ProductSubcategoryKey 'Id da Subcategoria',
	ProductSubcategoryName as 'Nome da Subcategoria'
from
	DimProduct
right join DimProductSubcategory
	on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey


-- Inner Join: Trás a interseção entre as duas tabelas
select
	ProductKey as 'Id do Produto',
	ProductName 'Nome do Produto',
	DimProduct.ProductSubcategoryKey 'Id da Subcategoria',
	ProductSubcategoryName as 'Nome da Subcategoria'
from
	DimProduct
inner join DimProductSubcategory
	on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey	

-- Full outer Join: Trás a união entre as duas tabelas
select
	ProductKey as 'Id do Produto',
	ProductName 'Nome do Produto',
	DimProductSubcategory.ProductSubcategoryKey 'Id da Subcategoria',
	ProductSubcategoryName as 'Nome da Subcategoria'
from
	DimProduct
full join DimProductSubcategory
	on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey	

-- Left anti Join: Trás exclusivamente o que aparece na Tabela A
select
	ProductKey as 'Id do Produto',
	ProductName 'Nome do Produto',
	DimProduct.ProductSubcategoryKey 'Id da Subcategoria',
	ProductSubcategoryName as 'Nome da Subcategoria'
from
	DimProduct
left join DimProductSubcategory
	on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey	
where
	ProductSubcategoryName is null

-- Right anti Join: Trás exclusivamente o que aparece na Tabela B
select
	ProductKey as 'Id do Produto',
	ProductName 'Nome do Produto',
	DimProduct.ProductSubcategoryKey 'Id da Subcategoria',
	ProductSubcategoryName as 'Nome da Subcategoria'
from
	DimProduct
Right join DimProductSubcategory
	on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey	
where
	ProductKey is null

-- Full Anti Join - Trás o que está exclusivamente na tabela A e na tabela B. Excluindo a interseção entre elas
select
	ProductKey as 'Id do Produto',
	ProductName 'Nome do Produto',
	DimProduct.ProductSubcategoryKey 'Id da Subcategoria',
	ProductSubcategoryName as 'Nome da Subcategoria'
from
	DimProduct
full join DimProductSubcategory
	on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey	
where
	ProductSubcategoryDescription is null
	or
	ProductName is null


-- Cross Join
select * from DimProduct
select * from DimProductSubcategory
select 
	ProductName,
	ProductSubcategoryName
from
	DimProduct cross join DimProductSubcategory

-- Múltiplos JOINS
select top(1) ProductKey, ProductName, ProductSubcategoryKey from DimProduct
select top (1) ProductSubcategoryKey, ProductSubcategoryName, ProductCategoryKey from DimProductSubcategory
select top(1) ProductCategoryKey, ProductCategoryName from DimProductCategory

select
	ProductKey as 'Produto ID',
	ProductName as 'Nome',
	DimProductCategory.ProductCategoryKey as 'Id da Categoria',
	ProductCategoryName as 'Nome da Categoria',
	DimProduct.ProductSubcategoryKey 'Id Subcategoria',
	ProductSubcategoryName as 'Nome da Subcategoria'

from
	DimProduct
inner join DimProductSubcategory 
	on Dimproduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
		inner join DimProductCategory
			on DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey 
			
-- UNION - Junta as tabelas e remove as duplicadas
select
	*
FROM DimCustomer
where gender = 'F'
union
select
	*
from
DimCustomer
where gender = 'M'


-- Union All - Junta as tabelas e mantém os duplicados
select
	FirstName,
	BirthDate
from
	DimCustomer
where gender = 'F'
union all
select
	FirstName,
	BirthDate
from
	DimCustomer
where gender = 'M'
	
	
