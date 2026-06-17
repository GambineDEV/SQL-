-- Comando SELECT DISTINCT: Retorna os valores distintos de uma tabela

-- Retorne todas as linhas da tabela de produtos
select * from DimProduct

-- Retorne os valores distintos da coluna ColorName da tabela de produtos
select distinct ColorName from DimProduct

-- Retorne todas as linhas da tabela funcionarios
select * from DimEmployee

--Retorne os valores distintos da coluna Departamento da tabela funcionários

SELECT
	DISTINCT DepartmentName
FROM
	DimEmployee
