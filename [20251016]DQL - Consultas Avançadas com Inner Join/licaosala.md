/* A-) Liste o nome do cliente e o produto de cada venda, mostrando também a cidade. */

SELECT
    c.nome AS cliente,
    v.produto,
    c.cidade
FROM VENDAS v
INNER JOIN CLIENTES c
    ON v.id_cliente = c.id_cliente;

/* B-) Mostre o total de vendas por estado. */

SELECT
    c.estado,
    SUM(v.valor) AS total_vendas
FROM VENDAS v
INNER JOIN CLIENTES c
    ON v.id_cliente = c.id_cliente
GROUP BY c.estado;

/* C-) Quais cidades tiveram mais de R$ 2.000,00 em vendas no total? */

SELECT
    c.cidade,
    SUM(v.valor) AS total
FROM VENDAS v
INNER JOIN CLIENTES c
    ON v.id_cliente = c.id_cliente
GROUP BY c.cidade
HAVING SUM(v.valor) > 2000;

/* D-) Exiba, para cada cliente, a categoria em que ele mais comprou (por valor total). */

SELECT
    c.nome AS cliente,
    v.categoria,
    SUM(v.valor) AS total_categoria
FROM VENDAS v
INNER JOIN CLIENTES c
    ON v.id_cliente = c.id_cliente
GROUP BY c.nome, v.categoria
HAVING SUM(v.valor) = (
    SELECT MAX(SUM(v2.valor))
    FROM VENDAS v2
    WHERE v2.id_cliente = c.id_cliente
    GROUP BY v2.categoria
);
