-- 1
SELECT cromo.PagCaderneta, Jogador.nome
FROM Cromo, Jogador, Equipa, Posicao
WHERE Cromo.jogador = Jogador.Nr
	AND Jogador.equipa = Equipa.id
    AND Jogador.Posicao = Posicao.Id
    AND Posicao.Designacao = 'Defesa'
    AND (Equipa.Designacao = 'Sporting Clube de Braga'
		OR Equipa.designacao = 'Rio Ave Futebol Clube');
        
-- 2
SELECT Cromo.nr
FROM Cromo, Jogador, Equipa, Posicao
WHERE Cromo.Jogador = Jogador.Nr 
	AND Jogador.equipa = Equipa.id 
    AND (Posicao.Designacao <> 'Médio' OR Posicao.Designacao <> 'Defesa')
    AND Jogador.posicao = Posicao.id
    AND (Equipa.Treinador = 'Jorge Jesus' OR Equipa.Treinador = 'Nuno Espírito Santo');
    
-- 3
CREATE VIEW ListarCromosFalta AS
SELECT Cromo.nr, Jogador.nome, Equipa.designacao
FROM Cromo, Jogador, Equipa
WHERE Cromo.Jogador = Jogador.Nr AND Jogador.equipa = Equipa.id
	AND Cromo.Adquirido = 'N';
    
-- 4
CREATE PROCEDURE ListaCromosEquipa (IN equipaX varchar(45))
SELECT Cromo.*
FROM Cromo,Jogador,Equipa
WHERE Cromo.Jogador = Jogador.Nr AND Jogador.equipa = Equipa.id
				AND Equipa.designacao = equipaX
                ORDER BY Cromo.PagCaderneta, Cromo.nr;

CALL ListaCromosEquipa('Sport Lisboa e Benfica');

-- 5 
CREATE PROCEDURE ListarCardenetaCompleta()
SELECT Cromo.nr, Cromo.Descricao, Jogador.nome, Equipa.designacao, Cromo.adquirido
FROM Cromo LEFT OUTER JOIN Jogador ON Cromo.jogador = Jogador.NR
           LEFT OUTER JOIN Equipa ON Jogador.equipa = Equipa.id
           INNER JOIN Tipocromo ON Cromo.tipo = TipoCromo.Descricao;

-- 6
DELIMITER $$
CREATE FUNCTION RepetidoCromo (numeroCromo int) RETURNS char(1)
NOT deterministic
BEGIN 

DECLARE Adq char(1);

SELECT Cromo.Adquirido into Adq
FROM Cromo
WHERE Cromo.nr = numeroCromo;

RETURN Adq;
END $$ 
DELIMITER ;

SELECT RepetidoCromo(37);

-- 7
DELIMITER $$
CREATE FUNCTION ReturnCromo (numeroCromo int) RETURNS varchar(200)
NOT DETERMINISTIC 

BEGIN

DECLARE tipoCromo varchar(75);
DECLARE nomeJogador varchar(75);
DECLARE nomeEquipa varchar(45);

SELECT TipoCromo.Designacao, Jogador.nome, Equipa.designacao INTO tipoCromo, nomeJogador, nomeEquipa
FROM TipoCromo, Cromo, Jogador, Equipa
WHERE TipoCromo.Nr = Cromo.tipo and Cromo.jogador = Jogador.nr and Jogador.equipa = Equipa.Id
	AND Cromo.Nr = numeroCromoX;
    
RETURN CONCAT (tipoCromo, ',', nomeJogador, ',', nomeEquipa);
END $$
DELIMITER ;
-- 8
CREATE TABLE audCromos (numeroCromo int, date DATETIME);

DELIMITER $$
CREATE TRIGGER after_cromo_update 
AFTER UPDATE ON Cromo
FOR EACH ROW
BEGIN

if (OLD.Adquirido = 'N' and NEW.Adquirido = 'S')
then INSERT INTO audCromos VALUES (NEW.nr, NOW());
end if ;
End $$
DELIMITER ;

UPDATE Cromo SET Adquirido = 'S' WHERE Nr = 37;

-- SET GLOBAL log_bin_trust_function_creators = 1;