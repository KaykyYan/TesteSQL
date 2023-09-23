-- Inserir um registro: --
INSERT INTO produtos (cod_prod, loj_prod, desc_prod, dt_inclu_prod, preco_prod)
VALUES (170, 2, 'LEITE CONDENSADO MOÇOCA', '2010-12-30', 45.4);





-- Alterar o preço de um produto: --
UPDATE produtos
SET preco_prod = 95.4
WHERE cod_prod = 170 AND loj_prod = 2;


-- Selecionar todos os registros das lojas 1 e 2: --
SELECT *
FROM produtos
WHERE loj_prod IN (1, 2);

-- Selecionar a maior e a menor data de inclusão de produtos: --
SELECT MAX(dt_inclu_prod) AS maior_data, MIN(dt_inclu_prod) AS menor_data
FROM produtos;

-- Contar a quantidade total de registros na tabela: --
SELECT COUNT(*) AS total_registros
FROM produtos;


-- Selecionar produtos que começam com a letra "L": --
SELECT *
FROM produtos
WHERE LEFT(desc_prod, 1) = 'L';


-- Soma de preços de produtos totalizados por loja: --
SELECT loj_prod, SUM(preco_prod) AS total_preco
FROM produtos
GROUP BY loj_prod;

-- Soma de preços de produtos totalizados por loja com valor maior que R$100.000: --
SELECT loj_prod, SUM(preco_prod) AS total_preco
FROM produtos
GROUP BY loj_prod
HAVING SUM (preco_prod) > 100000;