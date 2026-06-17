/* Exercício 1 - Você é responsável por controlar os dados de clientes e de produtos da sua empresa
O que você precisará fazer é confirmar se:
a. Existem 2.517 produtos cadastrados na base e, se não tiver, você deverá reportar ao seu
gestor para saber se existe alguma defasagem no controle dos produtos. */
select
	* 
from 
	DimProduct

/*RESPOSTA
Nessa tabela, cada linha representa um produto diferente. 
Ao fazer a consulta, verificamos no canto inferior direito da tabela que a quantidade de linhas é 2517.
Isso significa que foram cadastrados 2517 produtos. */

/* 
b. Até o mês passado, a empresa tinha um total de 19.500 clientes na base de controle.
Verifique se esse número aumentou ou reduziu. */
SELECT
	*
FROM 
	DimCustomer      

/*RESPOSTA
Nessa tabela, cada linha representa um cliente diferente. 
Ao fazer a consulta, verificamos no canto inferior direito da tabela que a quantidade de linhas é 18869.
Isso significa que existem 18869 clientes na base. Indicando diminuição */

/*
Exercício 2. Você trabalha no setor de marketing da empresa Contoso e acaba de ter uma ideia de oferecer
descontos especiais para os clientes no dia de seus aniversários. Para isso, você vai precisar
listar todos os clientes e as suas respectivas datas de nascimento, além de um contato.
a) Selecione as colunas: CustomerKey, FirstName, EmailAddress, BirthDate da tabela
dimCustomer. */

select
	CustomerKey,
	FirstName,
	EmailAddress,
	BirthDate
from
	DimCustomer



--b) Renomeie as colunas dessa tabela usando o alias (comando AS).

select
	CustomerKey as 'Chave do cliente',
	FirstName as 'Primeiro Nome',
	EmailAddress as 'Email',
	BirthDate as 'Data de Nascimento'
from
	DimCustomer


/* 
Exercício 3. A Contoso está comemorando aniversário de inauguração de 10 anos e pretende fazer uma
ação de premiação para os clientes. A empresa quer presentear os primeiros clientes desde
a inauguração.
Você foi alocado para levar adiante essa ação. Para isso, você terá que fazer o seguinte:
a) A Contoso decidiu presentear os primeiros 100 clientes da história com um vale compras
de R$ 10.000. Utilize um comando em SQL para retornar uma tabela com os primeiros
100 primeiros clientes da tabela dimCustomer (selecione todas as colunas). */

SELECT 
	TOP (100) *
FROM
	DimCustomer


/*
b) A Contoso decidiu presentear os primeiros 20% de clientes da história com um vale compras de R$ 2.000. Utilize um comando em SQL para retornar 10% das linhas da sua
tabela dimCustomer (selecione todas as colunas).*/

SELECT 
	TOP (20) PERCENT *
FROM
	DimCustomer


/*
c) Adapte o código do item a) para retornar apenas as 100 primeiras linhas, mas apenas as colunas FirstName, EmailAddress, BirthDate.*/

SELECT 
	TOP (100) 
	FirstName,
	EmailAddress,
	BirthDate
FROM
	DimCustomer


-- d) Renomeie as colunas anteriores para nomes em português. 

SELECT 
	TOP (100) 
	FirstName as 'Primeiro Nome',
	EmailAddress as 'Email',
	BirthDate as 'Data de Nascimento'
FROM
	DimCustomer


/* 4. A empresa Contoso precisa fazer contato com os fornecedores de produtos para repor o estoque. Você é da área de compras e precisa descobrir quem são esses fornecedores. Utilize um comando em SQL para retornar apenas os nomes dos fornecedores na tabela dimProduct e renomeie essa nova coluna da tabela. */
SELECT DISTINCT
	Manufacturer as 'Fabricante'
FROM 
	DimProduct



/*
5. O seu trabalho de investigação não para. Você precisa descobrir se existe algum produto registrado na base de produtos que ainda não tenha sido vendido. Tente chegar nessa informação.
Obs: caso tenha algum produto que ainda não tenha sido vendido, você não precisa descobrir qual é, é suficiente saber se teve ou não algum produto que ainda não foi vendido.*/

-- Para achar essa resposta precisamos fazer 2 consultas diferentes

-- A primeira consulta mostra quantos produtos diferentes existem na tabela Produtos.
-- O resultado aponta para 2517 produtos diferentes cadastrados no BD.
SELECT 
	DISTINCT 
	ProductKey
FROM
	DimProduct

-- A segunda consulta mostra quantos ids diferentes de produtos estão registradas na tabela de vendas.
-- A consulta retorna  2516 produtos diferentes vendidos
-- Isso quer dizer que 1 dos produtos registrados nunca foi vendido.
SELECT 
	DISTINCT
	ProductKey
FROM 
	FactSales

-- Aula 11 de 27: Exercícios de Fixação - Where mais And, Or e Not

-- Podemos filtrar os dados nas nossas tabelas utilizando o comando WHERE

-- 1. Selecione todas as linhas da tabela DimEmployee de funcionários do sexo feminino E do departamento de finanças.
select 
	* 
from 
	DimEmployee
where 
	Gender = 'F'
	and 
	DepartmentName = 'Finance'


-- 2. Selecione todas as linhas da tabela DimProduct de produtos Contoso E da cor vermelha E que tenham um UnitPrice maior ou igual a $100.
select * from DimProduct

select
	*
from 
	DimProduct
where
	BrandName = 'Contoso'
	and
	ColorName = 'Red'
	and 
	UnitPrice >= 100


-- 3. Selecione todas as linhas da tabela DimProduct com produtos da marca Litware OU da marca Fabrikam OU da cor Preta.
select * from DimProduct

select 
	*
from 
	DimProduct
where
	BrandName = 'Litware'
	or
	BrandName = 'Fabrikam'
	or 
	ColorName = 'Black'



-- 4. Selecione todas as linhas da tabela DimSalesTerritory onde o continente é a Europa mas o país NÃO é a Itália.
select * from DimSalesTerritory

select 
	*
from 
	DimSalesTerritory
where
	SalesTerritoryGroup = 'Europe'
	and not
	SalesTerritoryCountry = 'Italy'



-- MÓDULO 4: EXERCÍCIOS

/*1. Você é o gerente da área de compras e precisa criar um relatório com as TOP 100 vendas, de
acordo com a quantidade vendida. Você precisa fazer isso em 10min pois o diretor de compras
solicitou essa informação para apresentar em uma reunião.
Utilize seu conhecimento em SQL para buscar essas TOP 100 vendas, de acordo com o total
vendido (SalesAmount). */
select top(100) * from FactSales
order by
	SalesAmount desc



/*2. Os TOP 10 produtos com maior UnitPrice possuem exatamente o mesmo preço. Porém, a
empresa quer diferenciar esses preços de acordo com o peso (Weight) de cada um.
O que você precisará fazer é ordenar esses top 10 produtos, de acordo com a coluna de
UnitPrice e, além disso, estabelecer um critério de desempate, para que seja mostrado na
ordem, do maior para o menor.
Caso ainda assim haja um empate entre 2 ou mais produtos, pense em uma forma de criar
um segundo critério de desempate (além do peso). */
select top (10)
	ProductName,
	UnitPrice,
	Weight,
	Size
from DimProduct
order by
	UnitPrice desc,	
	weight desc,
	Size desc -- Seguindo a linha de raciocínio da empresa. O segndo critério de desempate escolhido é o tamanho do produto


/*3. Você é responsável pelo setor de logística da empresa Contoso e precisa dimensionar o
transporte de todos os produtos em categorias, de acordo com o peso.
Os produtos da categoria A, com peso acima de 100kg, deverão ser transportados na primeira
leva.
Faça uma consulta no banco de dados para descobrir quais são estes produtos que estão na
categoria A.*/
--a) Você deverá retornar apenas 2 colunas nessa consulta: Nome do Produto e Peso.
select 
	ProductName,
	Weight
from 
	DimProduct
where 
	Weight > 100


--b) Renomeie essas colunas com nomes mais intuitivos.
select 
	ProductName as 'Nome do Produto',
	Weight as 'Peso'
from 
	DimProduct
where 
	Weight > 100


--c) Ordene esses produtos do mais pesado para o mais leve.
select 
	ProductName,
	Weight
from 
	DimProduct
where 
	Weight > 100
order by
	Weight desc



--4. Você foi alocado para criar um relatório das lojas registradas atualmente na Contoso.
--a) Descubra quantas lojas a empresa tem no total. Na consulta que você deverá fazer à tabela
--DimStore, retorne as seguintes informações: StoreName, OpenDate, EmployeeCount 
select
	StoreName,
	OpenDate,
	EmployeeCount
from 
	DimStore
-- a consulta retorna 306 lojas cadstradas no total


--b) Renomeeie as colunas anteriores para deixar a sua consulta mais intuitiva.
select
	StoreName as 'Nome da Loja',
	OpenDate 'Data de inauguração',
	EmployeeCount 'Quantidade de Funcionários'
from 
	DimStore


--c) Dessas lojas, descubra quantas (e quais) lojas ainda estão ativas.
select
	StoreName as 'Nome da Loja',
	OpenDate 'Data de inauguração',
	EmployeeCount 'Quantidade de Funcionários'
from 
	DimStore
where
	status = 'On' -- 294 lojas ativas



/*5. O gerente da área de controle de qualidade notificou à Contoso que todos os produtos Home
Theater da marca Litware, disponibilizados para venda no dia 15 de março de 2009, foram
identificados com defeitos de fábrica.
O que você deverá fazer é identificar os ID’s desses produtos e repassar ao gerente para que ele
possa notificar as lojas e consequentemente solicitar a suspensão das vendas desses produtos.*/
select * from DimProduct

select
	ProductKey,
	ProductLabel,
	ProductName,
	AvailableForSaleDate
from 
	DimProduct
where
	ProductName like '%Home Theater%'
	and
	BrandName = 'Litware'
	and
	AvailableForSaleDate = '20090315'


/*6. Imagine que você precise extrair um relatório da tabela DimStore, com informações de lojas.
Mas você precisa apenas das lojas que não estão mais funcionando atualmente.*/
--a) Utilize a coluna de Status para filtrar a tabela e trazer apenas as lojas que não estão mais
--funcionando.
select 
	* 
from 
	DimStore
where
	status = 'Off'


--b) Agora imagine que essa coluna de Status não existe na sua tabela. Qual seria a outra forma
--que você teria de descobrir quais são as lojas que não estão mais funcionando?
select 
	*
from 
	DimStore
where
	CloseDate is not null

/*7. De acordo com a quantidade de funcionários, cada loja receberá uma determinada quantidade
de máquinas de café. As lojas serão divididas em 3 categorias:
CATEGORIA 1: De 1 a 20 funcionários -> 1 máquina de café
CATEGORIA 2: De 21 a 50 funcionários -> 2 máquinas de café
CATEGORIA 3: Acima de 51 funcionários -> 3 máquinas de café
Identifique, para cada caso, quais são as lojas de cada uma das 3 categorias acima (basta fazer
uma verificação). */

--Lojas Categoria 1
select 
	StoreName as 'Nome da Loja',
	StoreDescription as 'Descrição da Loja',
	zipcode,
	ZipCodeExtension as 'CEP extensão',
	StorePhone as 'Telefone',
	AddressLine1 as 'Endereço linha 1',
	AddressLine2 as 'Endereço linha 2',
	EmployeeCount as 'Quantidade de Funcionários'
from 
	DimStore
where
	EmployeeCount between 1 and 20
	and
	status = 'On'
order by
	[Quantidade de Funcionários] asc


-- Lojas categoria 2
select 
	StoreName as 'Nome da Loja',
	StoreDescription as 'Descrição da Loja',
	zipcode,
	ZipCodeExtension as 'ZipCode extensão',
	StorePhone as 'Telefone',
	AddressLine1 as 'Endereço linha 1',
	AddressLine2 'Endereço linha 2',
	EmployeeCount as 'Quantidade de Funcionários'
from 
	DimStore
where
	EmployeeCount between 21 and 50
	and
	status = 'On'
order by
	[Quantidade de Funcionários] asc


--Lojas Categoria 3
select 
	StoreName as 'Nome da Loja',
	StoreDescription as 'Descrição da Loja',
	zipcode,
	ZipCodeExtension as 'ZipCode extensão',
	StorePhone as 'Telefone',
	AddressLine1 as 'Endereço linha 1',
	AddressLine2 'Endereço linha 2',
	EmployeeCount as 'Quantidade de Funcionários'
from 
	DimStore
where
	EmployeeCount > 50
	and
	status = 'On'
order by
	[Quantidade de Funcionários] asc


/*8. A empresa decidiu que todas as televisões de LCD receberão um super desconto no próximo
mês. O seu trabalho é fazer uma consulta à tabela DimProduct e retornar os ID’s, Nomes e
Preços de todos os produtos LCD existentes.*/ 
select
	ProductKey,
	ProductName,
	UnitPrice
from
	DimProduct
where 
	ProductName like '%LCD%TV%'

/*9. Faça uma lista com todos os produtos das cores: Green, Orange, Black, Silver e Pink. Estes
produtos devem ser exclusivamente das marcas: Contoso, Litware e Fabrikam.*/
select
	*
from 
	DimProduct
where 
	ColorName in ('Green', 'Orange', 'Black', 'Silver', ' Pink')
	and
	BrandName in ('Contoso', 'Litware', 'Fabrikam')


/*10. A empresa possui 16 produtos da marca Contoso, da cor Silver e com um UnitPrice entre 10 e
30. Descubra quais são esses produtos e ordene o resultado em ordem decrescente de acordo
com o preço (UnitPrice). */

select
	*
from 
	DimProduct
where
	BrandName = 'Contoso'
	and 
	ColorName = 'Silver'
	and
	UnitPrice between 10 and 30


/*MÓDULO 5: EXERCÍCIOS
1. O gerente comercial pediu a você uma análise da Quantidade Vendida e Quantidade
Devolvida para o canal de venda mais importante da empresa: Store.
Utilize uma função SQL para fazer essas consultas no seu banco de dados. Obs: Faça essa
análise considerando a tabela FactSales. */
select * from DimChannel

select
	sum(SalesQuantity) as 'Quantidade de vendas',
	sum(ReturnQuantity) as 'Quantidade devolvida'
from 
	FactSales
where 
	channelKey = 1


/*2. Uma nova ação no setor de Marketing precisará avaliar a média salarial de todos os clientes
da empresa, mas apenas de ocupação Professional. Utilize um comando SQL para atingir esse
resultado. */
select * from DimCustomer

select
	avg (YearlyIncome) as 'Média salarial (anual)'
from
	DimCustomer
where
	Occupation = 'Professional'

/*3. Você precisará fazer uma análise da quantidade de funcionários das lojas registradas na
empresa. O seu gerente te pediu os seguintes números e informações: */
-- a) Quantos funcionários tem a loja com mais funcionários?
select * from DimStore

select
	max(EmployeeCount) as 'Quantidade de Funcionários'
from DimStore

-- b) Qual é o nome dessa loja?
select 
	top(1) *
from
	DimStore
order by
	EmployeeCount desc
	

-- c) Quantos funcionários tem a loja com menos funcionários?
select
	min (EmployeeCount) as 'Quantidade de Funcionários'
from DimStore

-- d) Qual é o nome dessa loja? 
select 
	top(1) *
from
	DimStore
where 
	(EmployeeCount) is not null 
order by
	EmployeeCount 


/*4. A área de RH está com uma nova ação para a empresa, e para isso precisa saber a quantidade
total de funcionários do sexo Masculino e do sexo Feminino. */

-- a) Descubra essas duas informações utilizando o SQL.
select * from DimEmployee

select 
	count (Gender) as 'Quantidade sexo M'
from 
	DimEmployee
where 
	Gender = 'M'

select 
	count (Gender) as 'Quantidade sexo F'
from 
	DimEmployee
where 
	Gender = 'F'


-- b) O funcionário e a funcionária mais antigos receberão uma homenagem. Descubra as
-- seguintes informações de cada um deles: Nome, E-mail, Data de Contratação.
select * from DimEmployee

select
	top(1)
	FirstName,
	LastName,
	EmailAddress,
	HireDate,
	Gender
from
	DimEmployee
where 
	Gender = 'M'
order by
	HireDate
-- Funcionário mais antigo

select
	top(1)
	FirstName,
	LastName,
	EmailAddress,
	HireDate,
	Gender
from
	DimEmployee
where 
	Gender = 'F'
order by
	HireDate
-- Funcionária mais antiga

/*5. Agora você precisa fazer uma análise dos produtos. Será necessário descobrir as seguintes
informações:*/
-- a) Quantidade distinta de cores de produtos.
select * from DimProduct

select 
	count(distinct(ColorName)) as 'Cores distintas'
from
	DimProduct

-- b) Quantidade distinta de marcas
select * from DimProduct

select 
	count(distinct(BrandName)) as 'Marcas distintas'
from
	DimProduct

-- c) Quantidade distinta de classes de produto.
select * from DimProduct

select 
	count(distinct(ClassName)) as 'Classes distintas'
from
	DimProduct

-- Consultando com apenas um select
select
	count(distinct(ColorName)) as 'Cores Distintas',
	count(distinct(BrandName)) as 'Marcas Distintas',
	count(distinct(ClassName)) as 'Classes Distintas'
from DimProduct

/* MÓDULO 6: EXERCÍCIOS
Os exercícios abaixo estão divididos de acordo com uma determinada tabela do Banco de Dados.
FACTSALES */
-- 1. a) Faça um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas(channelkey).
select top(100) * from FactSales
select
	channelKey as 'Canal',
	sum(SalesQuantity) as 'Quantidade de vendas'
from
	FactSales
group by
	channelKey



--b) Faça um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade
-- total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey).
select 
	StoreKey as 'Id da Loja',
	sum(SalesQuantity) as 'Total de vendas',
	sum(ReturnQuantity) as 'Total devolvido'
from	
	FactSales
group by
	StoreKey
order by
	[Id da Loja] desc


-- c) Faça um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas
-- para o ano de 2007.
select top (10) * from FactSales
select
	channelKey as 'Canal de Venda',
	sum(SalesAmount) as 'Faturamento em 2007'
from 
	FactSales
where
	DateKey between '20070101' and '20071231'
group by
	channelKey

/* 2. Você precisa fazer uma análise de vendas por produtos. O objetivo final é descobrir o valor
total vendido (SalesAmount) por produto (ProductKey). */

/* a) A tabela final deverá estar ordenada de acordo com a quantidade vendida e, além disso,
mostrar apenas os produtos que tiveram um resultado final de vendas maior do que
$5.000.000. */
select 
	ProductKey as 'Chave do Produto',
	sum(SalesAmount) as 'Faturamento por produto'	
from	
	FactSales
group by
	ProductKey
having
	sum(SalesAmount) >= 5000000
order by
	[Faturamento por produto] desc


/* b) Faça uma adaptação no exercício anterior e mostre os Top 10 produtos com mais vendas.
Desconsidere o filtro de $5.000.000 aplicado.
FACTONLINESALES */
select top (10)
	ProductKey as 'Chave do Produto',
	sum(SalesAmount) as 'Faturamento por produto'
from
	FactSales
group by
	ProductKey
order by
	[Faturamento por produto] desc


/* 3. a) Você deve fazer uma consulta à tabela FactOnlineSales e descobrir qual é o ID
(CustomerKey) do cliente que mais realizou compras online (de acordo com a coluna
SalesQuantity). */ 
select top(1)
	CustomerKey as 'Id do Cliente',
	sum(SalesQuantity) as 'Quantidade de Compras'
from	
	FactOnlineSales
group by
	CustomerKey
order by
	[Quantidade de Compras] desc

/* b) Feito isso, faça um agrupamento de total vendido (SalesQuantity) por ID do produto
e descubra quais foram os top 3 produtos mais comprados pelo cliente da letra a).
DIMPRODUCT */
select top (10) * from FactOnlineSales
select top(3)
	--CustomerKey as 'Id do Cliente',
	ProductKey as 'Id do Produto',
	sum(SalesQuantity) as 'Quantidade de Compras'
from	
	FactOnlineSales
where
	CustomerKey = 19037
group by
	ProductKey
order by
	[Quantidade de Compras] desc


-- 4. a) Faça um agrupamento e descubra a quantidade total de produtos por marca.

select
	BrandName as 'Marca',
	count(ProductKey) as'Id do Produto'
from 
	DimProduct
group by 
	BrandName

-- b) Determine a média do preço unitário (UnitPrice) para cada ClassName.
select
	ClassName as 'Classe',
	avg(UnitPrice) as 'Média de Preço'
from
	DimProduct
group by
	ClassName

-- c) Faça um agrupamento de cores e descubra o peso total que cada cor de produto possui.
select
	ColorName as 'Cor',
	sum(Weight) as 'Peso'
from 
	DimProduct
group by
	ColorName


/* 5. Você deverá descobrir o peso total para cada tipo de produto (StockTypeName).
A tabela final deve considerar apenas a marca ‘Contoso’ e ter os seus valores classificados em
ordem decrescente. */
select * from DimProduct
select
	StockTypeName as 'Tipo de estoque',
	sum(Weight) as 'Peso Total'
from	
	DimProduct
where
	BrandName = 'Contoso'
group by
	StockTypeName
order by
	[Peso Total] desc


/* 6. Você seria capaz de confirmar se todas as marcas dos produtos possuem à disposição todas as
16 opções de cores? DIMCUSTOMER */
select 
	BrandName as 'Marca',
	 count (distinct ColorName) as 'Quantidade de cores'
from
	DimProduct
group by
	BrandName


/* 7. Faça um agrupamento para saber o total de clientes de acordo com o Sexo e também a média
salarial de acordo com o Sexo. Corrija qualquer resultado “inesperado” com os seus
conhecimentos em SQL. */

select 
	Gender as 'Gênero',
	count(CustomerKey) as 'Total de Clientes',
	avg(YearlyIncome) as 'Média Salarial'
from

	DimCustomer
group by
	Gender
having
	gender is not null


/* 8. Faça um agrupamento para descobrir a quantidade total de clientes e a média salarial de
acordo com o seu nível escolar. Utilize a coluna Education da tabela DimCustomer para fazer
esse agrupamento.*/ 
select * from DimCustomer
select
	Education as 'Formação',
	count(CustomerKey) as 'Quantidade total',
	avg(YearlyIncome) as 'Média Salária'
from	
	DimCustomer
group by
	Education
having
	education is not null


/* 9. Faça uma tabela resumo mostrando a quantidade total de funcionários de acordo com o
Departamento (DepartmentName). Importante: Você deverá considerar apenas os
funcionários ativos. */
select * from DimEmployee
select distinct status from DimEmployee
select
	DepartmentName as 'Departamento',
	count(EmployeeKey) as 'Funcionários por departamento'
from
	DimEmployee
where 
	Status = 'Current'
group by
	DepartmentName


/* 10. Faça uma tabela resumo mostrando o total de VacationHours para cada cargo (Title). Você
deve considerar apenas as mulheres, dos departamentos de Production, Marketing,
Engineering e Finance, para os funcionários contratados entre os anos de 1999 e 2000 */
select
	title as 'Cargo',
	sum(VacationHours) as 'Horas de Férias'
from
	DimEmployee
where
	DepartmentName in ('Production', 'Marketing', 'Engineering', 'Finance')
	and
	Gender = 'F'
	and
	HireDate between '1999-01-01' and '2000-12-31' 
group by
	Title

/*1. Utilize o INNER JOIN para trazer os nomes das subcategorias dos produtos, da tabela
DimProductSubcategory para a tabela DimProduct. */
select * from DimProduct
select * from DimProductSubcategory
select
	ProductKey as 'ID do Produto',
	ProductName as 'Produto',
	ProductSubcategoryName as 'Subcategoria'
from DimProduct
inner join DimProductSubcategory
	on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey

/*2. Identifique uma coluna em comum entre as tabelas DimProductSubcategory e
DimProductCategory. Utilize essa coluna para complementar informações na tabela
DimProductSubcategory a partir da DimProductCategory. Utilize o LEFT JOIN. */
select top(5) * from DimProductCategory
select top (5) * from DimProductSubcategory

select
	ProductSubcategoryKey as 'Id Subcategoria',
	ProductSubcategoryName as 'Subcategroia',
	DimProductCategory.ProductCategoryKey as 'Id Categoria',
	ProductCategoryName as 'Categoria'
from
	DimProductSubcategory
left join DimProductCategory
	on DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey



/*3. Para cada loja da tabela DimStore, descubra qual o Continente e o Nome do País associados
(de acordo com DimGeography). Seu SELECT final deve conter apenas as seguintes colunas:
StoreKey, StoreName, EmployeeCount, ContinentName e RegionCountryName. Utilize o LEFT
JOIN neste exercício. */
select * from DimStore
select * from DimGeography

select
	StoreKey as 'ID Loja',
	StoreName as 'Loja',
	EmployeeCount as'Qtd Funcionários',
	ContinentName as 'Continente',
	RegionCountryName as 'País'
from 
	DimStore
left join DimGeography
	on DimGeography.GeographyKey = DimStore.GeographyKey
order by
	[ID Loja]


/*4. Complementa a tabela DimProduct com a informação de ProductCategoryDescription. Utilize
o LEFT JOIN e retorne em seu SELECT apenas as 5 colunas que considerar mais relevantes. */
select top(1) * from DimProduct
select top(1) * from DimProductSubcategory
select top(1) * from DimProductCategory

select
	DimProductCategory.ProductCategoryKey as 'Id Categoria',
	DimProductCategory.ProductCategoryDescription as 'Descrição Categoria',
	DimProductSubcategory.ProductSubcategoryKey as 'Id Subcategoria',
	DimProductSubcategory.ProductSubCategoryName as'Categoria',
	ProductName as 'Produto'
from	
	dimProduct
left join DimProductSubcategory
	on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
		left join DimProductCategory
			on DimProductCategory.ProductCategoryKey = DimProductSubcategory.ProductCategoryKey


/*5. A tabela FactStrategyPlan resume o planejamento estratégico da empresa. Cada linha
representa um montante destinado a uma determinada AccountKey. 
a) Faça um SELECT das 100 primeiras linhas de FactStrategyPlan para reconhecer a tabela.*/
select top(100)
	*
from
	FactStrategyPlan

/*b) Faça um INNER JOIN para criar uma tabela contendo o AccountName para cada
AccountKey da tabela FactStrategyPlan. O seu SELECT final deve conter as colunas:
• StrategyPlanKey
• DateKey
• AccountName
• Amount */
select
	StrategyPlanKey as 'ID Estratégia',
	DateKey as 'Data',
	AccountName as 'Nome Conta',
	Amount as 'Total'
from
	DimAccount
inner join FactStrategyPlan
	on DimAccount.AccountKey = FactStrategyPlan.AccountKey
order by 
	[ID Estratégia]

/*6. Vamos continuar analisando a tabela FactStrategyPlan. Além da coluna AccountKey que
identifica o tipo de conta, há também uma outra coluna chamada ScenarioKey. Essa coluna
possui a numeração que identifica o tipo de cenário: Real, Orçado e Previsão.
Faça um INNER JOIN para criar uma tabela contendo o ScenarioName para cada ScenarioKey
da tabela FactStrategyPlan. O seu SELECT final deve conter as colunas:
• StrategyPlanKey
• DateKey
• ScenarioName
• Amount*/
select top (1) * from FactStrategyPlan
select top(1) * from DimScenario

select 
	StrategyPlanKey,
	DateKey,
	ScenarioName,
	Amount
from
	FactStrategyPlan
inner join DimScenario
	on FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey


/*7. Algumas subcategorias não possuem nenhum exemplar de produto. Identifique que
subcategorias são essas.*/
select
	ProductSubcategoryName
from 
	DimProduct
right join
	DimProductSubcategory
	on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey 
where ProductName is null

/*8. Crie um código SQL que traga uma tabela mostrando a combinação entre Marca e Canal de venda, somente para as marcas Contoso, Fabrikam e Litware.  */
select top(1) * from DimProduct
select top(1) * from DimChannel


select
	distinct BrandName as 'Marca',
	ChannelName as'Canal de vendas'
from 
	DimProduct cross join DimChannel
where
	BrandName in ('Contoso', 'Fabrikam', 'Litware')



/*9. Neste exercício, você deverá relacionar as tabelas FactOnlineSales com DimPromotion.
Identifique a coluna que as duas tabelas têm em comum e utilize-a para criar esse
relacionamento.
Retorne uma tabela contendo as seguintes colunas:
• OnlineSalesKey
• DateKey
• PromotionName
• SalesAmount
A sua consulta deve considerar apenas as linhas de vendas referentes a produtos com
desconto (PromotionName <> ‘No Discount’). Além disso, você deverá ordenar essa tabela de
acordo com a coluna DateKey, em ordem crescente. */
select top (1) * from FactOnlineSales
select top (1) * from DimPromotion

select
	OnlineSalesKey as 'ID Vendas Online',
	DateKey as 'Data',
	PromotionName as 'Promoção',
	SalesAmount as 'Quantidade de Vendas'
from
	FactOnlineSales
left join DimPromotion
	on FactOnlineSales.PromotionKey = DimPromotion.PromotionKey
where
	PromotionName = 'No Discount'
order by
	Data


/*10. A tabela abaixo é resultado de um Join entre a tabela FactSales e as tabelas: DimChannel,
DimStore e DimProduct.
Recrie esta consulta e classifique em ordem decrescente de acordo com SalesAmount.*/
select top (1) * from FactSales
select top(1) * from DimChannel
select top (1) * from DimStore
select top (1) * from DimProduct

select 
	SalesKey,
	ChannelName,
	StoreName,
	ProductName,
	SalesAmount
from 
	FactSales
left join DimChannel
	on FactSales.ChannelKey = DimChannel.ChannelKey 
left join DimStore
	on FactSales.StoreKey = DimStore.StoreKey
left join DimProduct
	on FactSales.ProductKey = DimProduct.ProductKey 
order by SalesAmount desc
