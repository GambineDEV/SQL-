-- 1. Crie um código que retorna as 10 primeiras linhas da tabela de produtos
Select Top (10) *
From DimProduct

-- 2. Retorne as 10% primeiras linhas da tabela clientes
select top (10) percent * from DimCustomer


select top (1000) * from FactSales
