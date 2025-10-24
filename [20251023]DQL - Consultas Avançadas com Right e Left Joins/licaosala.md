-- Exercício A: Liste todos os clientes e seus produtos comprados (mesmo que o cliente não tenha feito compras).

SELECT
    c.nome AS cliente,
    v.produto
FROM CLIENTES c
LEFT JOIN VENDAS v
    ON c.id_cliente = v.id_cliente;

-- Exercício B: Mostre os produtos vendidos, exibindo “Sem Cliente” para vendas sem cadastro.

SELECT
    NVL(c.nome, 'Sem Cliente') AS cliente,
    v.produto,
    v.valor
FROM CLIENTES c
RIGHT JOIN VENDAS v
    ON c.id_cliente = v.id_cliente;

-- Exercício C: Liste o nome e a cidade dos clientes sem nenhuma venda registrada.

SELECT
    c.nome,
    c.cidade
FROM CLIENTES c
LEFT JOIN VENDAS v
    ON c.id_cliente = v.id_cliente
WHERE v.id IS NULL;



-- Exercício D: Gere um relatório consolidado com todas as cidades, exibindo a soma das vendas e indicando 0 quando não houve vendas.
SELECT
    c.cidade,
    NVL(SUM(v.valor), 0) AS total_vendas
FROM CLIENTES c
LEFT JOIN VENDAS v
    ON c.id_cliente = v.id_cliente
GROUP BY c.cidade;

