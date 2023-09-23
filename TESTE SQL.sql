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

-- Crie uma única consulta que traga o código
-- da loja, a descrição da loja, o código do produto, a descrição do produto, 
-- o preço e a quantidade em estoque dos produtos da loja 1.
SELECT L.codigo_loja, L.descricao_loja, P.codigo_produto, P.descricao_produto, P.preco, E.quantidade_estoque
FROM Lojas L
INNER JOIN Produtos P ON L.codigo_loja = P.codigo_loja
LEFT JOIN Estoque E ON P.codigo_produto = E.codigo_produto AND L.codigo_loja = E.codigo_loja
WHERE L.codigo_loja = 1;


-- Encontre todos os produtos que estão na tabela 
-- de produtos, mas não estão na tabela de estoque.
SELECT P.*
FROM Produtos P
LEFT JOIN Estoque E ON P.codigo_produto = E.codigo_produto
WHERE E.codigo_produto IS NULL;

 -- Descubra todos os produtos que estão na tabela de
 -- estoque, mas não estão na tabela de produtos.
SELECT E.*
FROM Estoque E
LEFT JOIN Produtos P ON E.codigo_produto = P.codigo_produto
WHERE P.codigo_produto IS NULL;