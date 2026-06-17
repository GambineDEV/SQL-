-- Comando AS: Renomeando colunas (aliasing)

-- Selecione as 3 colunas da tabela Produto: Produto Nome, Marca Nome, Cor Nome
SELECT
	ProductName as 'Nome do Produto',
	BrandName as Marca,
	ColorName as Cor
	
FROM
	DimProduct
