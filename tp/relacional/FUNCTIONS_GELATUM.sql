SET SQL_SAFE_UPDATES =0;
SET GLOBAL log_bin_trust_function_creators = 1;

-- vai buscar o extra pretendido (caso o deseje)
DELIMITER $$
CREATE FUNCTION Gelatum.escolheExtra(nomeE VARCHAR(30)) RETURNS VARCHAR(50) NOT DETERMINISTIC
	BEGIN
		DECLARE resultado VARCHAR(50);
        
        SELECT nome_extra INTO resultado
		FROM Extra
		WHERE nome_extra REGEXP nomeE;
        
        RETURN resultado;
END $$

-- vai buscar o preco de um extra atraves do nome
DELIMITER $$
CREATE FUNCTION Gelatum.precoExtra(nomeE VARCHAR(20)) RETURNS VARCHAR(30) NOT DETERMINISTIC
	BEGIN
		DECLARE resultado VARCHAR(50);
        
        SELECT preco_extra INTO resultado
		FROM Extra
		WHERE nome_extra REGEXP nomeE;
        
        RETURN resultado;
END $$


-- vai buscar o gelado escolhido
DELIMITER $$
CREATE FUNCTION Gelatum.escolheGelado(nomeG VARCHAR(30)) RETURNS VARCHAR(50) NOT DETERMINISTIC
	BEGIN
		DECLARE resultado VARCHAR(50);
	
		SELECT nome_gelado into resultado
		FROM Gelado_Base
		WHERE nome_gelado LIKE CONCAT('Gelado',' ', nomeG);
        
        RETURN resultado;
END $$

-- vai buscar o preco de um gelado com um dado nome
DELIMITER $$
CREATE FUNCTION Gelatum.getPrecoG(nomeG VARCHAR(20)) RETURNS INT NOT DETERMINISTIC
	BEGIN
		DECLARE resultado INT;
        
		SELECT preco_gelado into resultado
		FROM Gelado_Base
		WHERE nome_gelado LIKE CONCAT('Gelado',' ', nomeG);
        
        RETURN resultado;
        
END $$

DELIMITER $$
-- vai retornar um tempo aleatorio
CREATE FUNCTION calcTempo() RETURNS INT NOT DETERMINISTIC
	BEGIN
		DECLARE tempo INT DEFAULT FLOOR(RAND() * 10) + 1;
        
        RETURN tempo;
END $$

-- vai buscar o gelado pretendido(junção do nome do gelado base e extra
DELIMITER $$
CREATE FUNCTION Gelatum.geladoFinal(nomeG VARCHAR(30), nomeE1 VARCHAR(30), nomeE2 VARCHAR(30), nomeE3 VARCHAR(30)) RETURNS VARCHAR(100) NOT DETERMINISTIC
	BEGIN
		DECLARE extra VARCHAR(35) DEFAULT ' ';
        DECLARE quer INT DEFAULT 1;
		DECLARE geladoCompleto VARCHAR(100);
        
			IF (quer AND nomeE1=extra AND nomeE2=extra AND nomeE3=extra) -- quer um gelado sem extras
				THEN SELECT Gelatum.escolheGelado(nomeG) INTO geladoCompleto; -- vai buscar o nome do gelado
					
                    ELSE IF (quer AND nomeE1!=extra AND nomeE2!=extra AND nomeE3!=extra AND nomeE2!=nomeE3 AND nomeE1!=nomeE3 AND nomeE1!=nomeE2) -- quer um gelado com 3 extras diferentes
						THEN SELECT CONCAT(Gelatum.escolheGelado(nomeG), ' com ',Gelatum.escolheExtra(nomeE1), ', ', Gelatum.escolheExtra(nomeE2), ' e ',Gelatum.escolheExtra(nomeE3)) INTO geladoCompleto;
					
							ELSE IF (quer AND nomeE1=nomeE2 AND nomeE2=nomeE3 AND nomeE1!=extra) -- quer um gelado com 3 extras iguais
								THEN SELECT CONCAT(Gelatum.escolheGelado(nomeG), ' com ',Gelatum.escolheExtra(nomeE1)) INTO geladoCompleto;
                    
									ELSE IF (quer AND nomeE1!=extra AND nomeE2=extra AND nomeE3=extra) -- quer um gelado com 1 extra
										THEN SELECT CONCAT(Gelatum.escolheGelado(nomeG), ' com ',Gelatum.escolheExtra(nomeE1)) INTO geladoCompleto;
							
											ELSE IF (quer AND nomeE1=extra AND nomeE2!=extra AND nomeE3=extra) -- quer um gelado com 1 extra
												THEN SELECT CONCAT(Gelatum.escolheGelado(nomeG), ' com ',Gelatum.escolheExtra(nomeE2)) INTO geladoCompleto;
								
													ELSE IF (quer AND nomeE1=extra AND nomeE2=extra AND nomeE3!=extra) -- quer um gelado com 1 extra
														THEN SELECT CONCAT(Gelatum.escolheGelado(nomeG), ' com ',Gelatum.escolheExtra(nomeE3)) INTO geladoCompleto;
                                                        
															ELSE IF (quer AND nomeE3=extra AND nomeE2!=extra AND nomeE1!=extra AND nomeE1!=nomeE2) -- quer um gelado com 2 extra diferentes
																THEN SELECT CONCAT(Gelatum.escolheGelado(nomeG), ' com ',Gelatum.escolheExtra(nomeE1), ' e ', Gelatum.escolheExtra(nomeE2)) INTO geladoCompleto;
                                                        
																	ELSE IF (quer AND nomeE2=extra AND nomeE3!=extra AND nomeE1!=extra AND nomeE1!=nomeE3) -- quer um gelado com 2 extra diferentes
																		THEN SELECT CONCAT(Gelatum.escolheGelado(nomeG), ' com ',Gelatum.escolheExtra(nomeE1), ' e ', Gelatum.escolheExtra(nomeE3)) INTO geladoCompleto;
                                                        
																			ELSE IF (quer AND nomeE1=extra AND nomeE2!=extra AND nomeE3!=extra AND nomeE3!=nomeE2) -- quer um gelado com 2 extra diferentes
																				THEN SELECT CONCAT(Gelatum.escolheGelado(nomeG), ' com ',Gelatum.escolheExtra(nomeE2), ' e ', Gelatum.escolheExtra(nomeE3)) INTO geladoCompleto;
                                                        
																					ELSE IF (quer AND nomeE1=nomeE2 AND nomeE3=extra AND nomeE1!=extra) -- quer um gelado com 2 extra iguais
																						THEN SELECT CONCAT(Gelatum.escolheGelado(nomeG), ' com ',Gelatum.escolheExtra(nomeE1)) INTO geladoCompleto;
                                                        
																							ELSE IF (quer AND nomeE1=nomeE2 AND nomeE3!=extra AND nomeE1!=extra) -- quer um gelado com 2 extra iguais
																								THEN SELECT CONCAT(Gelatum.escolheGelado(nomeG), ' com ',Gelatum.escolheExtra(nomeE1)) INTO geladoCompleto;
																							
																									ELSE IF (quer AND nomeE1=extra AND nomeE2=nomeE3 AND nomeE2!=extra) -- quer um gelado com 2 extra iguais
																										THEN SELECT CONCAT(Gelatum.escolheGelado(nomeG), ' com ',Gelatum.escolheExtra(nomeE2)) INTO geladoCompleto;																	
																									END IF;
																							END IF;
																					END IF;
																			END IF;
																	END IF;
															END IF;
													END IF;
											END IF;
									END IF;
							END IF;
					END IF;
			END IF;
                                                                                                                      
        RETURN geladoCompleto;
 END $$ 


 -- vai retornar um bool indicando se o pedido foi pago ou nao
DELIMITER $$
CREATE FUNCTION setPago() RETURNS BOOL NOT DETERMINISTIC
	BEGIN
		DECLARE num INT DEFAULT FLOOR(RAND() * 2);
        DECLARE pago BOOL;
        
        IF num=1
			THEN SET pago=TRUE;
			ELSE SET pago=FALSE;
        END IF;
        
        RETURN pago;
END $$        

SELECT setPago();

-- vai retornar um bool indicando se o pedido foi recolhido

DELIMITER $$
CREATE FUNCTION setRecolhido() RETURNS BOOL NOT DETERMINISTIC
	BEGIN
		DECLARE num INT DEFAULT FLOOR(RAND() * 2);
        DECLARE rec BOOL;
        
        IF (setPago() AND num=1)
			THEN SET rec=TRUE;
			ELSE IF (setPago() AND num=0)
				THEN SET rec=FALSE;
			ELSE 
				SET rec=FALSE;
            END IF;
        END IF;
	
    RETURN rec;
END $$


DELIMITER $$
CREATE FUNCTION valorTot(id_pedido INT) RETURNS DECIMAL(5,2) NOT DETERMINISTIC
BEGIN 
	DECLARE resultado DECIMAL(5,2);

    SELECT SUM((PCG.quantidade_criacao * CG.valor_criacao) * (1 - P.desconto)) 
    INTO resultado
    FROM  Pedido AS P
    INNER JOIN Pedido__Criacao_Gelado AS PCG 
    ON P.id_pedido = PCG.id_pedido
		INNER JOIN Criacao_Gelado AS CG
		ON PCG.id_criacao = CG.id_criacao
		WHERE (id_pedido = PCG.id_pedido);
        
	RETURN resultado;
END $$

/*
-- DROP FUNCTION valorTot;

INSERT INTO Pedido
	(id_pedido, dataP , valor_total , tempo ,pago,recolhido , desconto,  id_funcionario, nif )
VALUES
    (87, '1993-01-01 00:00:00', valorTot(88), 5, 1, 1, 0.2 , 1 , 2320);
    
INSERT INTO Pedido__Criacao_Gelado
	(id_pedido, id_criacao, quantidade_criacao)
VALUES
    (1101, 3, 2);
    
SELECT * FROM Pedido;*/
                            

   