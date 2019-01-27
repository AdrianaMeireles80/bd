USE GELATUM;
-- vai retornar uma view com todos os gelados disponiveis
CREATE VIEW Gelados_Disponiveis AS 
	SELECT id_gelado, nome_gelado, preco_gelado
	FROM Gelado_Base;
-- SELECT * FROM Gelados_Disponiveis;

-- vai retornar uma view com todos os extras disponiveis
CREATE VIEW Extras_Disponiveis AS 
	SELECT id_extra, nome_extra, preco_extra
	FROM Extra;
-- SELECT * FROM Extras_Disponiveis;

/*Tabela que, dos pedidos, mostra o funcionário que atendeu determinado cliente*/
 CREATE VIEW Funcionario_Cliente AS
	SELECT C.nif, C.nome_cliente, F.nome_funcionario
    FROM CLIENTE AS C
		INNER JOIN Pedido AS P
        ON C.nif = P.nif
			INNER JOIN Funcionario AS F
			ON P.id_funcionario = F.id_funcionario;
-- SELECT * FROM Funcionario_Cliente;

/*Tabela que mostra todas as criações com o nome do gelado e dos extras (com as respetiva quantidades) que contém*/
CREATE VIEW Criacao_Discriminada AS
	SELECT CG.id_criacao, GB.nome_gelado, GROUP_CONCAT(CONCAT(E.nome_extra,'(', CGE.quantidade_extra, ')') 
											SEPARATOR ', ')	AS nome_todos_extras, CG.valor_criacao
    FROM Gelado_Base AS GB
		INNER JOIN Criacao_Gelado AS CG
        ON GB.id_gelado = CG.id_gelado 
			INNER JOIN Criacao_Gelado__Extra AS CGE
            ON CG.id_criacao = CGE.id_criacao
				INNER JOIN Extra AS E 
                ON CGE.id_extra = E.id_extra
                GROUP BY CG.id_gelado, CGE.id_criacao;
-- SELECT * FROM Criacao_Discriminada;
-- DROP VIEW Criacao_Discriminada;