-- order by
select top (100) * from DimStore 
order by EmployeeCount desc 

-- ordena de forma decrescente a coluna EmployeeCount da tabela DimStore

select top (10) 
	ProductName as 'Nome do Produto',
	UnitCost 'Preço Unitário',
	weight as 'peso'
from 
	DimProduct
order by 
	[Preço Unitário] desc, --ordena as linha em ordem decrescente de preço
	peso desc -- e ao mesmo tempo ordena as linhas em ordem decrescente de peso


select 
	* 
from 
	DimCustomer

where 
	BirthDate >= '1970-12-31' -- Para filtrar datas é necessário seguir o formato 'yyyy-mm-dd'
order by 
	BirthDate -- Filtra as datas de nascimento de forma crescente


--where
select
	ProductName as 'Produto',
	UnitPrice as 'Preço'
from
	DimProduct
where 
	UnitPrice >=1000 -- Seleciona as linhas onde o Preço é maior ou igual a $1000,00


select
	*
from 
	DimProduct
where 
	BrandName = 'Fabrikam' -- Seleciona somente as linhas onde BrandName é Fabrikam

select 
	*
from 
	DimProduct
where 
	ColorName = 'Black' -- Seleciona somente as linhas onde a Cor é Black


-- where ... or/and
select
	*
from 
	DimProduct
where
	BrandName = 'Contoso'
	and
	ColorName = 'Silver'  -- Seleciona as linhas onde BrandName =  Contoso e AO MESMO TEMPO ColorName = Silver (Operador AND)

select 
	*
from
	DimProduct
where
	ColorName = 'Blue'
	or
	ColorName = 'Black' -- Seleciona as linhas onde ColorName = Blue OU Black (Operador OR)


select
	ProductName,
	ColorName
from 
	DimProduct
where not 
	ColorName = 'Blue' -- Seleciona todas linhas da tabela em que a cor NÃO é blue
	and not 
	ColorName = 'Black' -- Seleciona as linhas em que TAMBÉM NÃo é black
order by
	ColorName


-- where ... in
select *
from 
	DimProduct
where
	 ColorName in ('Silver', 'Blue', 'White', 'Red', 'Black') -- Substitui o operador OR encadeado


select *
from 
	DimEmployee
where 
	DepartmentName in ('Production', 'Marketing', 'Engineering')

--where ... like
select* from DimProduct
where
	ProductName like '%MP3 Player%' -- Verifica se dentro da celula está contida a expressão 'MP3 Player'.

select *from DimProduct
where
	ProductDescription like 'Type%' -- Verifica se a celula COMEÇA com 'Type'
-- O caracter '%' indica alguma coisa escrita. Antes ou depois da expressão desejadax

-- where ... (not) between e
select * from DimProduct
where 
	UnitPrice between 50 and 100
order by
	UnitPrice

select * from DimProduct
where 
	UnitPrice not between 50 and 100

select * from DimEmployee
where
	HireDate between '2000-01-01' and '2000-12-31'


-- where is (not) null
select * from DimCustomer
where 
	CompanyName is not null --Mostra só clientes que são empresas

select * from DimCustomer
where 
	CompanyName is null --Mostra só clientes que são pessoas
