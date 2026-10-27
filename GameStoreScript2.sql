-- script 1

USE GameStation;

SELECT
    J.id_jogo,
    J.titulo AS jogo,
    D.nome AS desenvolvedora,
    J.preco
    
    
FROM Jogo J
INNER JOIN Desenvolvedora D
    ON J.id_desenvolvedora = D.id_desenvolvedora
ORDER BY J.titulo;

-- script 2

USE GameStation;

SELECT
    J.titulo AS jogo,
    C.nome AS categoria
FROM JogoCategoria JC
INNER JOIN Jogo J
    ON JC.id_jogo = J.id_jogo
INNER JOIN Categoria C
    ON JC.id_categoria = C.id_categoria
ORDER BY C.nome, J.titulo;

-- script 3 

USE GameStation;

SELECT
    J.titulo AS jogo,
    D.nome AS desenvolvedora,
    C.nome AS categoria,
    J.preco
FROM Jogo J
INNER JOIN Desenvolvedora D
    ON J.id_desenvolvedora = D.id_desenvolvedora
INNER JOIN JogoCategoria JC
    ON J.id_jogo = JC.id_jogo
INNER JOIN Categoria C
    ON JC.id_categoria = C.id_categoria
ORDER BY J.titulo, C.nome;

-- script 4

USE GameStation;

SELECT
    C.nome AS categoria,
    COUNT(JC.id_jogo) AS quantidade_jogos
FROM Categoria C
LEFT JOIN JogoCategoria JC
    ON C.id_categoria = JC.id_categoria
GROUP BY C.id_categoria, C.nome
ORDER BY quantidade_jogos DESC, C.nome;

-- script 5

USE GameStation;

SELECT
    D.nome AS desenvolvedora,
    COUNT(J.id_jogo) AS quantidade_jogos,
    ROUND(AVG(J.preco), 2) AS preco_medio
FROM Desenvolvedora D
INNER JOIN Jogo J
    ON D.id_desenvolvedora = J.id_desenvolvedora
GROUP BY D.id_desenvolvedora, D.nome
HAVING COUNT(J.id_jogo) >= 1
ORDER BY preco_medio DESC;

-- script 6

USE GameStation;

SELECT titulo, preco
FROM Jogo
WHERE preco BETWEEN 50.00 AND 200.00
ORDER BY preco ASC;

SELECT titulo, preco
FROM Jogo
WHERE titulo LIKE '%The%'
ORDER BY titulo;

-- script 7
USE GameStation;

SELECT titulo, preco
FROM Jogo
WHERE titulo = 'Stardew Valley';

UPDATE Jogo
SET preco = 29.99
WHERE titulo = 'Stardew Valley';

SELECT titulo, preco
FROM Jogo
WHERE titulo = 'Stardew Valley';

-- Script 8
USE GameStation;

SELECT
    J.titulo AS jogo,
    C.nome AS categoria
FROM JogoCategoria JC
INNER JOIN Jogo J
    ON JC.id_jogo = J.id_jogo
INNER JOIN Categoria C
    ON JC.id_categoria = C.id_categoria
WHERE J.titulo = 'Minecraft';

DELETE JC
FROM JogoCategoria JC
INNER JOIN Jogo J
    ON JC.id_jogo = J.id_jogo
INNER JOIN Categoria C
    ON JC.id_categoria = C.id_categoria
WHERE J.titulo = 'Minecraft'
  AND C.nome = 'Construcao';

SELECT
    J.titulo AS jogo,
    C.nome AS categoria
FROM JogoCategoria JC
INNER JOIN Jogo J
    ON JC.id_jogo = J.id_jogo
INNER JOIN Categoria C
    ON JC.id_categoria = C.id_categoria
WHERE J.titulo = 'Minecraft';

-- script 9 

USE GameStation;

CREATE OR REPLACE VIEW vw_painel_executivo AS
SELECT
    (SELECT COUNT(*) FROM Jogo)
        AS total_jogos,

    (SELECT COUNT(*) FROM Desenvolvedora)
        AS total_desenvolvedoras,

    (SELECT COUNT(*) FROM Categoria)
        AS total_categorias,

    (SELECT COUNT(*) FROM Usuario)
        AS total_usuarios,

    (SELECT COUNT(*) FROM Pedido)
        AS total_pedidos,

    (SELECT ROUND(AVG(preco), 2) FROM Jogo)
        AS preco_medio_jogos,

    (SELECT COALESCE(SUM(valor_total), 0) FROM Pedido)
        AS valor_total_pedidos;
        
        
-- script 10

USE GameStation;

SELECT *
FROM vw_painel_executivo;