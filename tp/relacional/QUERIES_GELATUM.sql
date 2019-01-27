USE gelataria;

-- exibir o nif e o nome do cliente mais velho que efetuou um pedido
SELECT C.nif,C.nome_cliente
FROM  Pedido P
INNER JOIN Cliente C
ON C.nif = P.nif
ORDER BY C.data_nascimento ASC
LIMIT 1;

SELECT *
FROM Pedido;
-- Exibir nomes de todos os funcionários que processaram pedidos com 
-- gelados de morango por ordem decrescente de vendas
SELECT F.id_funcionario,F.nome_funcionario,SUM(PCG.quantidade_criacao)
FROM Funcionario AS F
	INNER JOIN Pedido P
	ON F.id_funcionario = P.id_funcionario
		INNER JOIN Pedido__Criacao_Gelado AS PCG
		ON P.id_pedido = PCG.id_pedido
			INNER JOIN Criacao_Gelado AS CG
            ON PCG.id_criacao = CG.id_criacao
				INNER JOIN Gelado_Base AS GB
                ON CG.id_gelado = GB.id_gelado
                WHERE (GB.id_gelado = 1 )
                GROUP BY F.id_funcionario
				ORDER BY (PCG.quantidade_criacao) DESC;

-- Os nomes dos 3 gelados base mais vendidos em junho de 2015 
SELECT gb.id_gelado, gb.nome_gelado, SUM(PCG.quantidade_criacao) AS soma_quantidade
FROM Gelado_Base AS GB
	INNER JOIN Criacao_Gelado AS CG
	ON GB.id_gelado = CG.id_gelado
		INNER JOIN Pedido__Criacao_Gelado AS PCG
		ON CG.id_criacao = PCG.id_criacao  
			INNER JOIN Pedido AS P
			ON PCG.id_pedido = P.id_pedido
			WHERE (P.dataP between '2015-06-01 00:00:00' AND '2015-07-01 00:00:00')
			GROUP BY id_gelado
            ORDER BY (soma_quantidade) DESC
			limit 3; -- É para fazer o top3




