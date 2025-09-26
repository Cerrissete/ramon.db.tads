    -- EXERCICIO A
    -- Liste todos os produtos vendidos por “Ana”, ordenados por data.
    select produto, vendedor, data_venda from vendas where vendedor = 'Ana' order by data_venda;

    -- EXERCICIO B
    -- Mostre o valor total vendido na categoria “Eletrônicos”.
     select sum(valor) as total_eletronicos from vendas where categoria = 'Eletrônicos';

    -- EXERCICIO C
    -- Quais produtos custam entre R$200 e R$1000? Mostre nome e valor.
     select produto, valor from vendas where valor between 200 and 1000;

     -- EXERCICIO D
     -- Mostre quantas vendas cada vendedor realizou e o valor total vendido por ele, ordenado do maior para o menor faturamento.
      select vendedor, count(*) as vendas_total, sum(valor) as valor_total from vendas GROUP BY vendedor ORDER BY valor_total DESC;