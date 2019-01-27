USE gelatum;

SELECT *
FROM Cliente AS C
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cliente.csv'
FIELDS ENCLOSED BY '"' TERMINATED BY ',' ESCAPED BY ''
LINES TERMINATED BY '\r\n';

SELECT *
FROM Funcionario AS F
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/funcionario.csv'
FIELDS ENCLOSED BY '"' TERMINATED BY ',' ESCAPED BY ''
LINES TERMINATED BY '\r\n';

SELECT *
FROM Extra AS E
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/extra.csv'
FIELDS ENCLOSED BY '"' TERMINATED BY ',' ESCAPED BY ''
LINES TERMINATED BY '\r\n';

SELECT *
FROM Gelado_Base AS GB
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/gelado_base.csv'
FIELDS ENCLOSED BY '"' TERMINATED BY ',' ESCAPED BY ''
LINES TERMINATED BY '\r\n';

SELECT *
FROM Criacao_Gelado__Extra AS CGE
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/criacao_gelado__extra.csv'
FIELDS ENCLOSED BY '"' TERMINATED BY ',' ESCAPED BY ''
LINES TERMINATED BY '\r\n';

SELECT *
FROM Criacao_Gelado AS CG
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/criacao_gelado.csv'
FIELDS ENCLOSED BY '"' TERMINATED BY ',' ESCAPED BY ''
LINES TERMINATED BY '\r\n';

SELECT *
FROM Pedido AS P
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pedido.csv'
FIELDS ENCLOSED BY '"' TERMINATED BY ',' ESCAPED BY ''
LINES TERMINATED BY '\r\n';

SELECT *
FROM Pedido__Criacao_Gelado AS PCG
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pedido__criacao_gelado.csv'
FIELDS ENCLOSED BY '"' TERMINATED BY ',' ESCAPED BY ''
LINES TERMINATED BY '\r\n';

-- SHOW VARIABLES LIKE "secure_file_priv";

