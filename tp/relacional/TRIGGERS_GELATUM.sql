 USE GELATUM;

-- Atualiza o stock dos gelados após serem comprados
 DELIMITER $$
 CREATE TRIGGER atualizaStockGelado
 AFTER INSERT ON Pedido__Criacao_Gelado
 FOR EACH ROW 
 BEGIN 
 
 
	SELECT DISTINCT CG.id_gelado  
    INTO @id_gelado1
    FROM Pedido__Criacao_Gelado AS PCG 
		INNER JOIN Criacao_Gelado AS CG
        ON PCG.id_criacao = CG.id_criacao
		WHERE (NEW.id_criacao = CG.id_criacao);
			
            UPDATE Gelado_Base AS GB
            SET GB.stock_gelado = GB.stock_gelado - NEW.quantidade_criacao
			WHERE GB.id_gelado = @id_gelado1;
 END $$
 -- DROP TRIGGER atualizaStockGelado;
 

        
SELECT *
FROM Gelado_Base; 

/*
-- Atualiza o stock dos extras após serem comprados
DELIMITER $$
CREATE TRIGGER atualizaStockExtra
AFTER INSERT ON Pedido__Criacao_Gelado
FOR EACH ROW
BEGIN
	
    SELECT CGE.id_criacao,CGE.id_extra,CGE.quantidade_extra
    FROM Pedido__Criacao_Gelado AS PCG
		INNER JOIN Criacao_Gelado AS CG
        ON PCG.id_criacao = CG.id_criacao
			INNER JOIN Criacao_Gelado__Extra AS CGE
            ON PCG.id_criacao = CGE.id_criacao
            WHERE (CGE.id_criacao = NEW.id_criacao)
            limit 1;
END$$
-- DROP TRIGGER atualizaStockExtra;*/
-- SELECT * FROM EXTRA;

-- Atualiza o valor total do pedido
DELIMITER $$
CREATE TRIGGER atualizaValorTotal
AFTER INSERT ON Pedido__Criacao_Gelado
FOR EACH ROW 
BEGIN


	SELECT DISTINCT CG.valor_criacao
    INTO @valor_criacao1
	FROM Pedido__Criacao_Gelado AS PCG
		INNER JOIN Criacao_Gelado AS CG
        ON PCG.id_criacao = CG.id_criacao
		WHERE (CG.id_criacao = NEW.id_criacao);
        
	UPDATE Pedido AS P
    SET P.valor_total = P.valor_total + @valor_criacao1 * NEW.quantidade_criacao
    WHERE(P.id_pedido = NEW.id_pedido);
    
END $$
-- DROP TRIGGER atualizaValorTotal;
-- SELECT * FROM Pedido;


/* TESTE DOs TRIGGERS ACIMA
INSERT INTO Pedido
(id_pedido,dataP,valor_total,tempo,pago,recolhido,desconto,id_funcionario,nif)
VALUES
	(111,'1999-12-03 00:00:00',3.4,5,1,1,1,2,8507);
-- DELETE FROM Pedido WHERE id_pedido = 111;
        
INSERT INTO Pedido__Criacao_Gelado
(id_pedido,id_criacao,quantidade_criacao)
VALUES
	(111,7,2);
-- DELETE FROM Pedido__Criacao_Gelado WHERE id_pedido = 111;*/
  
  
  -- Verifica se o cliente faz anos no dia/mes que realiza o pedido
  DELIMITER $$
CREATE TRIGGER verificaAniversario BEFORE INSERT ON GELATUM.PEDIDO
FOR EACH ROW 
BEGIN 
	DECLARE dataN DATE;
    SET dataN = (SELECT data_nascimento FROM Gelatum.Cliente WHERE nif=NEW.nif);
    
    IF(dayofmonth(new.dataP)=dayofmonth(dataN) AND month(new.dataP)=month(dataN))
    THEN 
		SET new.valor_total=0;
        SET new.desconto=1.0;
	END IF;
END $$
