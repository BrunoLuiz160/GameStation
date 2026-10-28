
USE GameStation;

INSERT INTO Desenvolvedora (nome, pais)
VALUES
('Mojang Studios', 'Suecia'),
('CD Projekt Red', 'Polonia'),
('ConcernedApe', 'Estados Unidos'),
('FromSoftware', 'Japao'),
('Capcom', 'Japao'),
('Rockstar Games', 'Estados Unidos'),
('Re-Logic', 'Estados Unidos'),
('Team Cherry', 'Australia'),
('Santa Monica Studio', 'Estados Unidos'),
('Supergiant Games', 'Estados Unidos'),
('Playground Games', 'Reino Unido'),
('Maxis', 'Estados Unidos'),
('Pocketpair', 'Japao'),
('Larian Studios', 'Belgica'),
('Studio MDHR', 'Canada'),
('Behaviour Interactive', 'Canada'),
('Hello Games', 'Reino Unido');

----------------------------------------------------------------------------
INSERT INTO Jogo
(titulo, preco, descricao, id_desenvolvedora)
VALUES
('Minecraft', 99.90, 'Construcao e sobrevivencia', 1),
('The Witcher 3: Wild Hunt', 79.90, 'RPG de fantasia medieval', 2),
('Stardew Valley', 24.99, 'Simulacao de fazenda', 3),
('Elden Ring', 229.90, 'RPG de acao e fantasia', 4),
('Resident Evil 4', 169.90, 'Terror e sobrevivencia', 5),
('Cyberpunk 2077', 149.90, 'RPG futurista de mundo aberto', 6),
('Red Dead Redemption 2', 199.90, 'Acao no Velho Oeste', 7),
('GTA V', 99.90, 'Acao em mundo aberto', 8),
('Terraria', 19.90, 'Aventura e construcao em 2D', 9),
('Hollow Knight', 46.99, 'Metroidvania de aventura', 10),
('God of War', 199.90, 'Acao e mitologia', 11),
('Hades', 73.99, 'Roguelike de acao', 12),
('Dark Souls III', 159.90, 'RPG de acao desafiador', 13),
('Forza Horizon 5', 249.90, 'Corrida em mundo aberto', 14),
('The Sims 4', 0.00, 'Simulacao de vida', 15),
('Palworld', 88.90, 'Sobrevivencia e criaturas', 16),
('Baldurs Gate 3', 199.90, 'RPG de fantasia', 17),
('Cuphead', 36.99, 'Plataforma e desenho animado', 18),
('Dead by Daylight', 59.90, 'Terror multijogador', 19),
('No Mans Sky', 129.90, 'Exploracao espacial', 20);





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
