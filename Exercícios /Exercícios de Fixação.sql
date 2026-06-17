/*1. O Top 10 das Cores
Na tabela DimProduct, use o DISTINCT para listar todas as cores exclusivas de produtos disponíveis. Renomeie a coluna de retorno para Cores_Disponiveis. */

select
	distinct ColorName as 'Cores Disponíveis'
from 
	DimProduct

/*2. Limitação por Porcentagem (PERCENT)
Selecione os primeiros 10% de todas as linhas da tabela DimCustomer. Ordene o resultado pelo sobrenome (LastName) em ordem alfabética. */
select
	top (10) percent *
from
	DimCustomer
Order by
	LastName

/*3. Múltiplos Filtros com Renomeação
Na tabela DimStore, selecione o nome da loja (StoreName que deve ser renomeada para Nome_Loja), a quantidade de funcionários (EmployeeCount como Qtd_Funcionarios) e o tipo de loja (StoreType). Filtre apenas as lojas que tenham mais de 20 funcionários AND sejam do tipo 'Store'. */
select
	StoreName as 'Nome da Loja',
	EmployeeCount as 'Qtd. Funcionários',
	StoreType as 'Tipo de Loja'
from	
	DimStore
where
	EmployeeCount > 20 
	and
	StoreType = 'Store'


/*4. Agregação Direta
Olhando para a tabela FactSales, descubra e exiba em uma única linha: */

-- a) O valor total vendido (SalesAmount) com o nome de Faturamento_Total.
select 
	sum(SalesAmount) as 'Faturamento Total'
from 
	FactSales

-- b) A quantidade total de itens vendidos (SalesQuantity) com o nome de Volume_Total_Itens.
select
	count(SalesQuantity) as 'Volume total de Itens vendidos'
from
	FactSales

/*5. Ordenação Reversa de Preços
Selecione o nome do produto, a marca e o preço unitário da tabela DimProduct. Filtre apenas os produtos que custam entre $100 e $500. Ordene o resultado do produto mais caro para o mais barato. */
select
	ProductName as 'Nome do Poduto',
	BrandName as 'Marca',
	UnitPrice as 'Preço unitário'
from
	DimProduct
where 
	UnitPrice between 100 and 500
order by
	[Preço unitário] desc

/* 6. Contagem por Categoria
Agrupe a tabela DimProduct pela coluna BrandName (Marca). Mostre o nome da marca e a quantidade total de produtos que cada marca possui. Renomeie a contagem para Total_Produtos_Marca e ordene o resultado do maior volume de produtos para o menor. */
select
	BrandName as 'Marca',
	count(ProductName) as 'Total de produtos por marca'
from
	DimProduct
group by
	BrandName
order by
	[Total de produtos por marca] desc

/* 7. Média de Salário por Cargo
Na tabela DimEmployee, agrupe os funcionários pelo cargo (Title). Retorne o cargo (renomeado para Funcao) e a média do salário base (BaseRate renomeada para Media_Salarial). Filtre os resultados para desconsiderar funcionários que já saíram da empresa.*/ 
select * from DimEmployee

/* 8. O Top 5 Faturamento de Lojas
Agrupe as vendas da tabela FactSales por código de loja (StoreKey). Calcule o faturamento total (SalesAmount) de cada uma. Retorne apenas as 5 lojas que mais faturaram, exibindo o ID da loja e o faturamento total*/
select top(5)
	StoreKey as 'Código da Loja',
	sum(SalesAmount) as 'Faturamento Total'
from
	FactSales
group by
	StoreKey
order by
	[Faturamento Total] desc


/* 9. Filtros Booleanos Avançados
Na tabela DimProduct, selecione o nome do produto, a marca e a cor. Queremos listar produtos que pertençam às marcas 'Contoso' OR 'Fabrikam', mas que obrigatoriamente tenham a cor 'Silver' OR 'Black'. Atenção ao uso correto dos parênteses para não avacalhar a lógica!*/

select 
	ProductName as 'Nome do Produto',
	BrandName as 'Marca',
	ColorName as 'Cor'
from
	DimProduct

/* 10. Faturamento Percentual da Tabela de Fatos
Traga os 2% de registros com os maiores valores de devolução (ReturnAmount) na tabela FactSales. Ordene de forma decrescente para que o maior prejuízo apareça no topo.*/
select
	top 2 percent *
from 
	FactSales
order by
	ReturnAmount Desc


/*11. Filtro Pós-Agrupamento (HAVING)
Agrupe as vendas da tabela FactSales por código de produto (ProductKey). Calcule a quantidade total de itens vendidos para cada produto. No entanto, exiba no resultado final apenas os produtos que tiveram mais de 50.000 unidades vendidas no total. Ordene do mais vendido para o menos vendido. */

select
	ProductKey as 'Id do produto',
	sum(SalesQuantity) as 'Qtd de vendas'
from 
	FactSales
group by
	ProductKey
having 
	sum(SalesQuantity) > 50000
order by
	[Qtd de vendas] desc

/* 12. O "Inverso do TOP PERCENT"
Imagine que a diretoria quer auditar as lojas físicas menos produtivas. Selecione o código da loja (StoreKey) e a soma da quantidade de vendas na tabela FactSales. Retorne os 10% das lojas com menor volume de vendas, ordenando do menor volume para o maior. */
select top 10 percent
	StoreKey as 'Id da loja',
	sum(SalesQuantity) as 'Qtd de vendas'
from
	FactSales
group by
	StoreKey
order by
	[Qtd de vendas]


/* 13. Agrupamento Multi-Coluna com Filtro de Data
Na tabela FactSales, agrupe os dados combinando duas colunas: StoreKey e ChannelKey (Canal de Venda). Calcule o valor total de desconto dado (DiscountAmount como Total_Descontos). Filtre a consulta inteira para considerar apenas as vendas realizadas no ano de 2008. Ordene o resultado pelo maior desconto concedido. */
select
	StoreKey as 'Id da Loja',
	channelKey as 'Id Canal de Vendas',
	sum(DiscountAmount) as 'Total de Descontos'
from	
	FactSales
where 
	DateKey between '20080101' and '20081231'
group by
	StoreKey, channelKey
order by
	[Total de Descontos] desc

/* 14. Análise de Clientes e Faturamento
Utilizando a tabela FactSales, agrupe o faturamento por ProductKey. Retorne o ID do produto, o faturamento total e a média gasta por compra. Filtre para exibir apenas os produtos que geraram um faturamento total entre $5.000 e $20.000, ordenando pela maior média de gasto. */
select top (5) * from FactSales
select
	ProductKey as 'Id do Produto',
	sum(SalesAmount) as 'Faturamento Total',
	avg(SalesAmount) as 'Média Gasta'
from	
	FactSales
group by
	ProductKey
having
	sum(SalesAmount) between 5000 and 20000
order by
	[Média Gasta] desc

/* 15. O Desafio Supremo de Sintaxe
Escreva uma única query na tabela DimProduct que faça o seguinte: 
-> Selecione as colunas BrandName (como Marca) e ClassName (como Classe), além da média do preço unitário (UnitPrice como Preco_Medio).

-> Filtre as linhas para incluir apenas produtos das cores 'White', 'Black' ou 'Grey'.

-> Agrupe por Marca e Classe.

-> Filtre o agrupamento para exibir apenas os grupos onde o preço médio seja superior a $150.

-> Ordene o resultado final pela Marca em ordem alfabética e, em caso de empate, pela Classe de forma decrescente. */
select
	BrandName as 'Marca',
	ClassName as 'Classe',
	avg(UnitPrice) as 'Preço Médio'
from	
	DimProduct
where
	ColorName in('White', 'Black', 'Grey')
group by
	BrandName, ClassName
having
	avg(UnitPrice) > 150
order by
	Marca,
	Classe desc
