-- Transação que regista um pedido com UMA criação de um gelado já existente
DELIMITER $$
CREATE PROCEDURE regista_pedido (IN id_pedido INT, IN dataP  DATETIME, IN valor_total DECIMAL(5,2), IN tempo INT, IN pago TINYINT, 
IN recolhido TINYINT, IN desconto DECIMAL(4,2), IN id_funcionario INT, IN nif INT, IN id_criacao INT, 
IN quantidade_criacao INT)

BEGIN
	DECLARE Erro BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET Erro=1;
    START TRANSACTION;

-- inserção do pedido
INSERT INTO Pedido
	(id_pedido, dataP, valor_total, tempo, pago,recolhido, desconto,  id_funcionario, nif)
VALUES
    (id_pedido, dataP, valor_total, tempo, pago, recolhido, desconto, id_funcionario, nif);

-- associação do pedido à criação
INSERT INTO Pedido__Criacao_Gelado
	(id_pedido, id_criacao, quantidade_criacao)
VALUES
	(id_pedido, id_criacao, quantidade_criacao);
    
-- atualização do valor total após inserção do pedido
UPDATE Pedido AS P
SET P.valor_total = valorTot(id_pedido)
WHERE(P.id_pedido = id_pedido);
    
-- alteração do stock fase 1
SELECT DISTINCT CG.id_gelado  
    INTO @id_gelado1
    FROM Pedido__Criacao_Gelado AS PCG 
		INNER JOIN Criacao_Gelado AS CG
        ON PCG.id_criacao = CG.id_criacao
		WHERE (id_criacao = CG.id_criacao);

-- alteração do stock fase 1
UPDATE Gelado_Base AS GB
SET GB.stock_gelado = GB.stock_gelado - quantidade_criacao
WHERE GB.id_gelado = @id_gelado1;
    
IF erro
THEN ROLLBACK;
ELSE COMMIT;
END IF;
END $$

/*
CALL regista_pedido(93, '1993-01-01 00:00:00', 5, 5, 1, 1, 0 , 1 , 2320, 1, 1);

SELECT * FROM Pedido;
SELECT * FROM Pedido__Criacao_Gelado;
SELECT * FROM Gelado_Base;

DROP PROCEDURE regista_pedido;
*/